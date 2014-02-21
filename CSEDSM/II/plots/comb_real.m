%
% $Id$
%
fc=44100;
sinc=1/fc;
dur=10;
T=[0:sinc:dur-sinc];
R=0.99999;
freq=233;
L=round(fc/freq); %ritardo di L campioni
X=zeros(length(T), 1);
X(L+10)=1;
Y=zeros(length(T), 1);
Y(1:L)=X(1:L);
for(k=L+1:length(T))
	Y(k)=X(k)+((R^L)*Y(k-L));
end

figure(1, 'visible', 'off');
plot(T, Y)
