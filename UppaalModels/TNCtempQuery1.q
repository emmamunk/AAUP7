/*

*/
strategy Opt =minE (totalTravelTime) [<=horizon]: <> Simulator.End
/*

*/

simulate 1 [<=horizon] {  pid[1000], route[0][0], route[0][1], route[0][2], route[0][3], route[0][4], route[0][5], route[0][6], route[0][7], route[0][8], route[0][9], route[0][10], route[0][11], route[0][12], route[0][13], route[0][14], route[0][15], route[0][16], route[0][17], route[0][18], route[0][19], route[0][20], route[0][21], route[0][22], route[0][23], route[0][24], route[0][25], route[0][26], route[0][27], route[0][28], route[0][29], route[0][30], route[0][31], route[0][32], route[0][33], route[0][34], route[0][35], route[0][36], route[0][37], route[0][38], route[0][39], route[0][40], route[0][41], route[0][42], route[0][43], route[0][44], route[0][45], route[0][46], route[0][47], route[0][48],
 pid[1001], route[1][0], route[1][1], route[1][2], route[1][3], route[1][4], route[1][5], route[1][6], route[1][7], route[1][8], route[1][9], route[1][10], route[1][11], route[1][12], route[1][13], route[1][14], route[1][15], route[1][16], route[1][17], route[1][18], route[1][19], route[1][20], route[1][21], route[1][22], route[1][23], route[1][24], route[1][25], route[1][26], route[1][27], route[1][28], route[1][29], route[1][30], route[1][31], route[1][32], route[1][33], route[1][34], route[1][35], route[1][36], route[1][37], route[1][38], route[1][39], route[1][40], route[1][41], route[1][42], route[1][43], route[1][44], route[1][45], route[1][46], route[1][47], route[1][48],
 pid[1010], route[2][0], route[2][1], route[2][2], route[2][3], route[2][4], route[2][5], route[2][6], route[2][7], route[2][8], route[2][9], route[2][10], route[2][11], route[2][12], route[2][13], route[2][14], route[2][15], route[2][16], route[2][17], route[2][18], route[2][19], route[2][20], route[2][21], route[2][22], route[2][23], route[2][24], route[2][25], route[2][26], route[2][27], route[2][28], route[2][29], route[2][30], route[2][31], route[2][32], route[2][33], route[2][34], route[2][35], route[2][36], route[2][37], route[2][38], route[2][39], route[2][40], route[2][41], route[2][42], route[2][43], route[2][44], route[2][45], route[2][46], route[2][47], route[2][48],
 pid[1011], route[3][0], route[3][1], route[3][2], route[3][3], route[3][4], route[3][5], route[3][6], route[3][7], route[3][8], route[3][9], route[3][10], route[3][11], route[3][12], route[3][13], route[3][14], route[3][15], route[3][16], route[3][17], route[3][18], route[3][19], route[3][20], route[3][21], route[3][22], route[3][23], route[3][24], route[3][25], route[3][26], route[3][27], route[3][28], route[3][29], route[3][30], route[3][31], route[3][32], route[3][33], route[3][34], route[3][35], route[3][36], route[3][37], route[3][38], route[3][39], route[3][40], route[3][41], route[3][42], route[3][43], route[3][44], route[3][45], route[3][46], route[3][47], route[3][48],
 pid[1002], route[4][0], route[4][1], route[4][2], route[4][3], route[4][4], route[4][5], route[4][6], route[4][7], route[4][8], route[4][9], route[4][10], route[4][11], route[4][12], route[4][13], route[4][14], route[4][15], route[4][16], route[4][17], route[4][18], route[4][19], route[4][20], route[4][21], route[4][22], route[4][23], route[4][24], route[4][25], route[4][26], route[4][27], route[4][28], route[4][29], route[4][30], route[4][31], route[4][32], route[4][33], route[4][34], route[4][35], route[4][36], route[4][37], route[4][38], route[4][39], route[4][40], route[4][41], route[4][42], route[4][43], route[4][44], route[4][45], route[4][46], route[4][47], route[4][48],
 pid[1003], route[5][0], route[5][1], route[5][2], route[5][3], route[5][4], route[5][5], route[5][6], route[5][7], route[5][8], route[5][9], route[5][10], route[5][11], route[5][12], route[5][13], route[5][14], route[5][15], route[5][16], route[5][17], route[5][18], route[5][19], route[5][20], route[5][21], route[5][22], route[5][23], route[5][24], route[5][25], route[5][26], route[5][27], route[5][28], route[5][29], route[5][30], route[5][31], route[5][32], route[5][33], route[5][34], route[5][35], route[5][36], route[5][37], route[5][38], route[5][39], route[5][40], route[5][41], route[5][42], route[5][43], route[5][44], route[5][45], route[5][46], route[5][47], route[5][48],
 pid[1004], route[6][0], route[6][1], route[6][2], route[6][3], route[6][4], route[6][5], route[6][6], route[6][7], route[6][8], route[6][9], route[6][10], route[6][11], route[6][12], route[6][13], route[6][14], route[6][15], route[6][16], route[6][17], route[6][18], route[6][19], route[6][20], route[6][21], route[6][22], route[6][23], route[6][24], route[6][25], route[6][26], route[6][27], route[6][28], route[6][29], route[6][30], route[6][31], route[6][32], route[6][33], route[6][34], route[6][35], route[6][36], route[6][37], route[6][38], route[6][39], route[6][40], route[6][41], route[6][42], route[6][43], route[6][44], route[6][45], route[6][46], route[6][47], route[6][48],
 pid[1005], route[7][0], route[7][1], route[7][2], route[7][3], route[7][4], route[7][5], route[7][6], route[7][7], route[7][8], route[7][9], route[7][10], route[7][11], route[7][12], route[7][13], route[7][14], route[7][15], route[7][16], route[7][17], route[7][18], route[7][19], route[7][20], route[7][21], route[7][22], route[7][23], route[7][24], route[7][25], route[7][26], route[7][27], route[7][28], route[7][29], route[7][30], route[7][31], route[7][32], route[7][33], route[7][34], route[7][35], route[7][36], route[7][37], route[7][38], route[7][39], route[7][40], route[7][41], route[7][42], route[7][43], route[7][44], route[7][45], route[7][46], route[7][47], route[7][48],
 pid[1006], route[8][0], route[8][1], route[8][2], route[8][3], route[8][4], route[8][5], route[8][6], route[8][7], route[8][8], route[8][9], route[8][10], route[8][11], route[8][12], route[8][13], route[8][14], route[8][15], route[8][16], route[8][17], route[8][18], route[8][19], route[8][20], route[8][21], route[8][22], route[8][23], route[8][24], route[8][25], route[8][26], route[8][27], route[8][28], route[8][29], route[8][30], route[8][31], route[8][32], route[8][33], route[8][34], route[8][35], route[8][36], route[8][37], route[8][38], route[8][39], route[8][40], route[8][41], route[8][42], route[8][43], route[8][44], route[8][45], route[8][46], route[8][47], route[8][48],
 pid[1007], route[9][0], route[9][1], route[9][2], route[9][3], route[9][4], route[9][5], route[9][6], route[9][7], route[9][8], route[9][9], route[9][10], route[9][11], route[9][12], route[9][13], route[9][14], route[9][15], route[9][16], route[9][17], route[9][18], route[9][19], route[9][20], route[9][21], route[9][22], route[9][23], route[9][24], route[9][25], route[9][26], route[9][27], route[9][28], route[9][29], route[9][30], route[9][31], route[9][32], route[9][33], route[9][34], route[9][35], route[9][36], route[9][37], route[9][38], route[9][39], route[9][40], route[9][41], route[9][42], route[9][43], route[9][44], route[9][45], route[9][46], route[9][47], route[9][48],
 pid[1008], route[10][0], route[10][1], route[10][2], route[10][3], route[10][4], route[10][5], route[10][6], route[10][7], route[10][8], route[10][9], route[10][10], route[10][11], route[10][12], route[10][13], route[10][14], route[10][15], route[10][16], route[10][17], route[10][18], route[10][19], route[10][20], route[10][21], route[10][22], route[10][23], route[10][24], route[10][25], route[10][26], route[10][27], route[10][28], route[10][29], route[10][30], route[10][31], route[10][32], route[10][33], route[10][34], route[10][35], route[10][36], route[10][37], route[10][38], route[10][39], route[10][40], route[10][41], route[10][42], route[10][43], route[10][44], route[10][45], route[10][46], route[10][47], route[10][48],
 pid[1009], route[11][0], route[11][1], route[11][2], route[11][3], route[11][4], route[11][5], route[11][6], route[11][7], route[11][8], route[11][9], route[11][10], route[11][11], route[11][12], route[11][13], route[11][14], route[11][15], route[11][16], route[11][17], route[11][18], route[11][19], route[11][20], route[11][21], route[11][22], route[11][23], route[11][24], route[11][25], route[11][26], route[11][27], route[11][28], route[11][29], route[11][30], route[11][31], route[11][32], route[11][33], route[11][34], route[11][35], route[11][36], route[11][37], route[11][38], route[11][39], route[11][40], route[11][41], route[11][42], route[11][43], route[11][44], route[11][45], route[11][46], route[11][47], route[11][48] } under Opt