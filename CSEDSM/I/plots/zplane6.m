close all
clear all

step = 0.2 ; 
reali = [-2.1 : step : 2.1] ; 
immag = [-2.1 : step : 2.1];
Z = zeros(length(immag), length(reali));
for (x=1:length(reali))
	for (y=1:length(immag))
		Z (x, y) = reali(x) + i*immag(y) ;  #creiamo la x, y, campionati
	end
end
a1 = 1;
H=1-a1*(1./Z);
surf (reali, immag, abs(H));
