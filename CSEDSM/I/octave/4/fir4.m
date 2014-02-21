clear all
close all 

a1=0.99;
fc=1;
Ts=1/fc; 
winsize=4096;
binsize=fc/winsize;
k=1;
F=[0:binsize:fc-binsize];
W=F*2*pi;
H=1+(a1*exp(-i*W));
size(F)
size(W)
M=abs(H);		#valore assoluto --> modulo per un numero complesso
MdB=20*log10(M);
plot(F, MdB);
Ph=arg(H)		#arg --> arcotangente della parte im sulla parte reale
figure(2);
plot(F,Ph);