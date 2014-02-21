%
% $Id: zplane.m 28 2013-05-03 04:38:41Z nicb $
%
close all
clear all

step = 0.01 ; 
reali = [-1.1 : step : 1.1]; 
immag = [-1.1 : step : 1.1];
Z = zeros(length(immag), length(reali));
for (x=1:length(reali))
	for (y=1:length(immag))
		Z (x, y) = reali(x) + i*immag(y) ;  #creiamo la x, y, campionati
		if (abs(Z(x, y)) > 1.0)
			Z(x, y) = NaN;
		end
	end
end
a1 = 0.8;
H=1-a1*(1./Z);
figure(1, 'visible', 'off');
surfl(reali, immag, abs(H));
xlabel('reali');
ylabel('immaginari');
zlabel('H(z)');
view(130.0, 30.0);
axis([reali(1) reali(length(reali)) immag(1) immag(length(immag)) 0 6])
