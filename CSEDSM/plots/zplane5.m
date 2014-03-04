close all
clear all

step = 0.1 ; 
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
mesh (reali, immag, abs(H));
axis([reali(1) reali(length(reali)) immag(1) immag(length(immag)) -0.1 4])