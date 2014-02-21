%
% $Id$
%
step = 0.01;
W = [0:step:2*pi-step];
z = exp(i*W);
H = 1./(1 + ((z - 1)./(z + 1)));
plot(W, 20*log10(abs(H)));
