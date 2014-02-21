clear all
close all 

a=[0.99,0.6,0.4,0.2];
fc=1;
Ts=1/fc; 
winsize=4096;
binsize=fc/winsize;
k=1;
F=[0:binsize:fc-binsize];
W=F*2*pi;
H=1+(a(1)*exp(-i*W))+(a(2)*exp(-i*W*2))+(a(3)*exp(-i*W*3))+(a(4)*exp(-i*W*4));
size(F)
size(W)
M=abs(H);		#valore assoluto --> modulo per un numero complesso
MdB=20*log10(M);
plot(F, MdB);
Ph=arg(H)		#arg --> arcotangente della parte im sulla parte reale
figure(2);
plot(F,Ph);