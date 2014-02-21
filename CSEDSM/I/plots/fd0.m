%
% $Id$
%
clear all;
close all;

%
% filtro FIR passabasso con frequenza 1/8 fc
%
fc = 1;
cutoff = fc/18;
tband = fc/40;
lunghezza = round(fc / tband); 	% lunghezza del filtro in campioni di ritardo
if mod(lunghezza, 2)==0
	lunghezza += 1;
end
npunti = floor(lunghezza / 2)+1;	%num coeff
coeff = zeros(1, lunghezza);
fstep = tband;
F = [0:fstep:fc-fstep]; 		%freq divisa in tband
punti = zeros(1, length(F));
lastpb =floor ((cutoff-(0.5*tband)) / tband); 	%
punti (1:lastpb) = 1;
punti (lastpb+1:length(punti)) = 0.001;
coeff = fliplr(real(ifft(punti)));
filtcoeffs = coeff(2:length(coeff)) * 2;
fullfiltcoeffs = [ filtcoeffs filtcoeffs(2:length(filtcoeffs)) ];
frqcoefs = [0:npunti];
wstep = 0.01;
W = [0:wstep:2*pi-wstep];
cos_series = cos(frqcoefs.*W);
