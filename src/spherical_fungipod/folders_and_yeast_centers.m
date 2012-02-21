function [folder, center, no_of_img] = folders_and_yeast_centers()

%no_of_img = [81 69 63 73 67 80 70 66 75 77];
no_of_img = [81 69 63 80 70 66 75 77];

folder = [];

curPath = pwd;
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc01 full/dc01 actin'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc02 full/dc02 actin'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc03 full/dc03 actin'];
%folder = [folder ; 'C:/Users/cakici/Desktop/real data/pllok.0520103col/052010 3color fpd confocal/TIF export/8bit actin/dc04'];
%folder = [folder ; 'C:/Users/cakici/Desktop/real data/pllok.0520103col/052010 3color fpd confocal/TIF export/8bit actin/dc05'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc06 full/dc06 actin'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc07 full/dc07 actin'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc08 full/dc08 actin'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc09 full/dc09 actin'];
folder = [folder ; 'Data/pllok.0520103col/052010 3color fpd confocal/TIF export/dc10 full/dc10 actin'];


%  x  y  z  img_no  amount_of_fungipod
center = [
178 183 33 1 3;
302	289	48 1 1;
341	277	38 1 2;
		
265	228	26 2 2;
269	256	16 2 1;
265	276	41 2 2;
254	290	40 2 3;
		
369	64	44 3 1;

214	261	32 4 1;
236	309	30 4 1;
259	326	45 4 1;
256	311	44 4 1;

390	165	44 5 2;
363	269	37 5 2;
	
416	85	34 6 1;
215	109	34 6 1;
233	299	27 6 3;
325	343	27 6 1;
321	353	30 6 1;
312	414	25 6 1;

96	174	36 7 1;
104	177	44 7 3;
180	149	21 7 2;
401	261	49 7 4;
366	272	47 7 2;
		
405	175 53 8 3;
385	277 51 8 1;
420	373 38 8 1;
441	380 32 8 4;
287	409 51 8 2
];