clear all
close all 

a1=0.99;
fc=1;
Ts=1/fc; 
winsize=4096;
binsize=fc/winsize;
F=[0:binsize:fc-binsize];
W=F*2*pi;
M=sqrt(1+2*a1*cos(W)+a1^2);
MdB=20*log10(M);
figure(1,'visible','off');
plot(F, MdB, [';{/Symbol t} = ' num2str(1/Ts, "%6.4f") ';'], 'LineWidth', 3);
axis([0 0.5])
