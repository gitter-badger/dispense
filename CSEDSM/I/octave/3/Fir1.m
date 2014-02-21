
clear all
close all 

a1=0.99;
fc=44100;
F=[0:fc-1];
W=F*2*pi;
size(F)
size(W)
tau=0.00166;
M=sqrt(1+2*a1*cos(W*tau)+a1^2);
MdB=20*log10(M);
plot(F, MdB);
axis([0 3000 -80 +10]); 
