clear all;
close all;

% yt = xt - R^L*x(t-L)
% H(z) = [1-R^L*z^-L]

fc = 44100;
sampinc = 1/fc;
F = [0:sampinc:fc-sampinc];
freqdel = 100;

W = F*2*pi;
R = 0.98; % profondità dei denti
L = round(sampinc/(2*freqdel));
step = 0.01;
W = [0:step:2*pi-step];
z = exp(i*W);

H = 1-(R.^(L))*(z.^(-L)); %fn di trasferimento ==> che diventa la risp in freq per via di z 
plot (W,20*log10(abs(H)));
