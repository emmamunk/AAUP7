from xml.dom import minidom
import os
import sys
import optparse
import subprocess
import random
import time
import math
import copy
import re

try:
     tools = os.path.join(os.environ['SUMO_HOME'], "tools")
     sys.path.append(tools)
except:   
     sys.exit("please declare environment variable 'SUMO_HOME'")

from sumolib import checkBinary
import traci
import sumolib
from callStratego import cStratego

class smartTL:
    def __init__(self,tlID,numDetectors,detectors,nrOfSignals,programID,yellowTime,initPhase):
        self.tlID = tlID
        self.numDetectors = numDetectors
        self.detectors = detectors
        self.nrOfSignals = nrOfSignals
        self.programID = programID
        self.yellow = yellowTime
        self.binaryPhases, self.binaryPhasesDecimal, self.binaryPhaseIndices = self.get_phases_for_program()

        #Initial values for important variables
        self.duration = yellowTime
        self.phase = initPhase
        self.inYellow = True
        self.nextPhase = self.phase + 1
        self.strategoRunTime = 4
        self.phaseTimer = self.yellow
        self.strategoTimer = self.phaseTimer - self.strategoRunTime
        self.strategoMaxGreen = 120 #max time in green in one direction
        self.strategoGreenTimer = 0

    def update_tl_state(self,strategoMasterModel,strategoMasterModelGreen,strategoQuery,strategoLearningMet,strategoSuccRuns,strategoMaxRuns,strategoGoodRuns,strategoEvalRuns,strategoMaxIterations,expid,step):
        carsAreal = self.get_det_func(traci.areal.getLastStepVehicleNumber,self.detectors)
        carsJammed = self.get_det_func(traci.areal.getJamLengthVehicle,self.detectors)
        
        if self.strategoTimer == 0:
            if self.inYellow:
                self.nextPhase,_,_ = cStratego(strategoMasterModel,strategoQuery,
                                            strategoLearningMet,strategoSuccRuns,
                                            strategoMaxRuns,strategoGoodRuns,
                                            strategoEvalRuns,strategoMaxIterations,
                                            expid,carsAreal,carsJammed,
                                            self.phase,self.duration,step,self.nrOfSignals,
                                            self.numDetectors,self.binaryPhasesDecimal,self.binaryPhases,self.binaryPhaseIndices,self.tlID,self.yellow)
                self.duration = 10
                self.inYellow = False
                self.strategoGreenTimer = 0
            else:
                self.nextPhase,_,_ =  cStratego(strategoMasterModelGreen,strategoQuery,
                                            strategoLearningMet,strategoSuccRuns,
                                            strategoMaxRuns,strategoGoodRuns,
                                            strategoEvalRuns,strategoMaxIterations,
                                            expid,carsAreal,carsJammed,
                                            self.phase,self.duration,step,self.nrOfSignals,self.numDetectors,
                                            self.binaryPhasesDecimal,self.binaryPhases,self.binaryPhaseIndices,self.tlID,self.yellow,
                                            greenModel=True,
                                            greenTimer=self.strategoGreenTimer)
                if self.nextPhase == self.phase:
                    self.duration = 5
                else:
                    self.nextPhase = self.phase +1 
                    self.duration = self.yellow              
        if self.phaseTimer == 0:
            self.phase = self.nextPhase
            traci.trafficlight.setPhase(self.tlID,self.phase)
            if ("y" in traci.trafficlight.getRedYellowGreenState(self.tlID)):
                self.inYellow = True
            else:
                self.inYellow = False
            if not self.inYellow:
                traci.trafficlight.setPhaseDuration(self.tlID,self.duration)
            self.strategoTimer = self.duration - self.strategoRunTime
            self.phaseTimer = self.duration

        self.strategoGreenTimer = self.strategoGreenTimer + 1   
        self.strategoTimer = self.strategoTimer - 1
        self.phaseTimer = self.phaseTimer - 1

    def get_phases_for_program(self):
        phaseDefiniton = traci.trafficlight.getCompleteRedYellowGreenDefinition(self.tlID)
        phaseDefiniton = str(phaseDefiniton)
        phaseList = []
        connectionsList = []

        #Finding all the relevant phases
        for match in re.finditer('state',phaseDefiniton):
            startOfPhase = match.end() + 2
            endOfPhase = phaseDefiniton.find(',',match.end()) -1
            phaseList.append(phaseDefiniton[startOfPhase:endOfPhase])

        #Creating the amount of connections from each signal
        links = traci.trafficlight.getControlledLinks(self.tlID)
        lastLane = ""
        currentConnections = 1
        for i in range(0,len(links)):
            currLane = links[i][0][0]
            if(currLane == lastLane):
                currentConnections = currentConnections + 1
            elif(lastLane != ""):
                connectionsList.append(currentConnections)
                currentConnections = 1
            if(i == len(links) -1):
                connectionsList.append(currentConnections)

            lastLane = currLane

        #Creating the binary phases and their indices
        binaryPhases = []
        binaryPhaseIndices = []
        for i in range(0, len(phaseList)):
            index = 0
            binaryPhase = ""
            for j in range (0, len(connectionsList)):
                signalConf = phaseList[i][index:index + connectionsList[j]]
                if('G' in signalConf or 'g' in signalConf):
                    binaryPhase += "1"
                else:
                    binaryPhase += "0"
                index = index + connectionsList[j]
            binaryPhases.append(binaryPhase)
            binaryPhaseIndices.append(i)

        #Removing any phases that dont have any green. These are not interesting for the model
        binaryToDecimalPhases = []
        for i in range(0,len(binaryPhases)):
            if(int(binaryPhases[i],2) != 0):
                binaryToDecimalPhases.append(int(binaryPhases[i],2))
            else:    
                binaryPhaseIndices.remove(i)

        return binaryPhases, binaryToDecimalPhases, binaryPhaseIndices
                                                

    def get_max_green(self):
        if self.programID == 'max':
            return 64,40
        if self.programID == 'mid':
            return 54,26
        if self.programID == 'low':
            return 36,20
        if self.programID == '0':
            return 54,26

    def get_det_func(self,func,dets):
        numDet = len(dets)
        res = [0] * numDet
        for deti in range(0,numDet):
            res[deti] = func(dets[deti])
        return res  

    def print_dets_state(msg,dets,res):
        print(msg + " detectors: " +str(dets) + " values: " + str(res))