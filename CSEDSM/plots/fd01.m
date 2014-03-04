%
% $Id$
%
clear all;
close all;

%
% filtro FIR passabasso con n zeri (cut-off desiderato: fc/4)
%
fc = 1;
lunghezza = 51; 	% lunghezza del filtro in campioni di ritardo
cutoff = fc/4;
if mod(lunghezza, 2)==0
	lunghezza += 1;
end
tband = fc / lunghezza;
npunti = floor(lunghezza / 2)+1;	%num coeff
fstep = tband;
F = [0:fstep:fc-fstep]; 		%freq divisa in tband
punti = zeros(1, npunti);
lastpb =round((cutoff-(0.5*tband)) / tband); 	%
if lastpb < 1
		lastpb = 1
end
punti (1:lastpb) = 1;
punti (lastpb+1:npunti) = 0.001;
coeff = fliplr(real(ifft(punti)));
filtcoeffs = [coeff(1) coeff(2:length(coeff)) / 2];
fullfiltcoeffs = [ filtcoeffs filtcoeffs(2:length(filtcoeffs)) ];
frqcoefs = [[npunti-1:-1:0][1:npunti-1]];
wstep = 0.01;
W = [0:wstep:2*pi-wstep];
H = zeros(1,length(W));

for k=1:length(W)
	w = W(k);
	H(k) = 0;
	for l=1:length(frqcoefs)
		H(k) = H(k) + (fullfiltcoeffs(l)*cos(frqcoefs(l)*w));
	end
end
