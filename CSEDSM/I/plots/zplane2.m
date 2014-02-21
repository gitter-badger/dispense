close all
clear all

step = 0.01 ; 
reali = [-1.1 : step : 1.1] ; 
immag = [-1.1 : step : 1.1];
Z = zeros(length(immag), length(reali));
for (x=1:length(reali))
	for (y=1:length(immag))
		Z (x, y) = reali(x) + i*immag(y) ;  #creiamo la x, y, campionati
	end
end