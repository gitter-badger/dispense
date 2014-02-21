clear all
close all
fc=44100;
sinc=1/fc;
dur=0.5;
T=[0:sinc:dur-sinc];

winsize=1000;
binsize=fc/winsize;
freq1=round(440/binsize)*binsize
freq2=round(3*freq1/binsize)*binsize

phi1=pi/5
phi2=0

y=0.5*cos(2*pi*freq1*T+phi1)+0.9*cos(2*pi*freq2*T+phi2);
F=[0:binsize:fc-binsize];
dftcos=zeros(1,winsize);
dftsin=zeros(1,winsize);

for k=1:winsize
	freq=F(k);
	yanalcos=cos(freq*2*pi*T(1:winsize));
	yanalsin=sin(freq*2*pi*T(1:winsize));
	rcos=y(1:winsize).*yanalcos;
	rsin=y(1:winsize).*yanalsin;
	
	dftcos(k)=sum(rcos);
	dftsin(k)=sum(rsin);
end

mag=sqrt(dftcos.^(2)+dftsin.^(2))*2/winsize;
fase=atan2(dftsin,dftcos);
subplot(2,1,1)
stem(F(1:100),mag(1:100))
subplot(2,1,2)
stem(F(1:100),fase(1:100))