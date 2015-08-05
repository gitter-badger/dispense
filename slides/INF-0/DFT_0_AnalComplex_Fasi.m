fc=44100;
sinc=1/fc;
dur=0.05;
t=[0:sinc:dur-sinc];
freq=4000;
amp=0.8;
w=2*pi*freq;
winsize=size(t,2);
binsize=fc/winsize;
F=[0:binsize:(fc-binsize)];   %asse frequenze

mag=zeros(size(t));
fasi=zeros(size(t));


x=amp*cos(w*t+(pi/2));

for k=1:winsize
    c=exp(-i*(2*pi*F(k)*t));  
    output=sum(x.*c);
    mag(k)=abs(output)/winsize;
    fasitot(k)=arg(output);
    fasi(k)=mag(k)*fasitot(k);
    
end

figure(1)
plot (F, 20*log10(mag))

figure(2)
plot (F,fasi)
    