clear all
close all
fc=44100;
sinc=1/fc;
dur=0.5;
T=[0:sinc:dur-sinc];

freq=440;
y=0.5*cos(2*pi*freq*T)+0.9*cos(3*2*pi*freq*T);
winsize=12000;
binsize=fc/winsize;
F=[0:binsize:fc-binsize];
dft=zeros(1,winsize);
for k=1:winsize
	freq=F(k);
	yanal=cos(freq*2*pi*T(1:winsize));
	r=y(1:winsize).*yanal;
	dft (k)=(sum(r)*2)/winsize;
end
stem(F(1:1000),dft(1:1000))