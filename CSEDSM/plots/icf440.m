clear all
close all

fc = 44100;
sinc = 1/fc;
freq = 440;
wlength = round(fc/freq);
step = 2*pi/fc;
W = [0:step:2*pi-step];
L = wlength;
R = 0.9999;
z = exp(i*W);
H = 1-(R^L)*z.^(-L);

coefs = zeros(1, L+1);
coefs(1) = -R^L;
coefs(L+1) = 1;
zeri = roots(coefs); #dove stanno gli zeri
figure(1);
hold on 
plot(z);
plot(zeri, "o");
hold off;
figure(2);
plot(W, 20*log10(abs(H)));
