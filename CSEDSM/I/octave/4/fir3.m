clear all
close all 

a1=0.99;
fc=1;
Ts=1/fc; 
winsize=4096;
binsize=fc/winsize;
k=23;
F=[0:binsize:fc-binsize];
W=F*2*pi;
size(F)
size(W)
M=sqrt(1+2*a1*cos(W*k)+a1^2);
MdB=20*log10(M);
plot(F, MdB);

