%
% $Id: fir3.m 23 2013-02-08 15:02:32Z nicb $
%
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
M=sqrt(1+2*a1*cos(W*k)+a1^2);
MdB=20*log10(M);
figure(1,'visible','off');
plot(F, MdB, [';{/Symbol t} = ' num2str(1/(k*Ts), "%6.4f") ';'], 'LineWidth', 3);
axis([0 0.5])
