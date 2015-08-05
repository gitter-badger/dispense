clear all
fc= 44100;
sinc= 1/fc;
dur= 2;
m= 1; % rapporto portante e modulante
freqp= 200;
freqm= freqp*m;
t= [0 : sinc : dur-sinc];
maxindex= 0.6;
indexstep= maxindex/(dur*fc); 

index= [0: indexstep: maxindex-indexstep];
ymodamp= freqm*index;
ymod= index.*cos(2*pi*freqm*t);
yport=0.8*cos((2*pi*freqp*t).+ymod);

%figure(1)
%plot(t, yport)
%axis([ 0 0.02])

winsize= 1024;
overlap= 4;
hopsize= winsize/overlap;
binsize= fc/winsize;
F= [0:binsize:fc-binsize];
n_coefs= winsize/2;
ystft= stft(yport,winsize, hopsize, n_coefs, 2);


figure(1)
hopsinc= hopsize*sinc;
hopt= [0: hopsinc : dur-hopsinc*overlap];
size(hopt);
size(F(1:n_coefs));
size(ystft);

mesh(hopt, F(1:n_coefs), ystft) 
print("FM.pdf", "-dpdf")
% wavwrite(yport', fc, 16, "FM2.wav");
