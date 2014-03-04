%
% $Id$
%
clear all;
close all;
step=0.01;
reali=[-1-step:step:1+step];
imm=reali;
z=zeros(length(reali),length(imm)); %matrice
for(r=1:length(reali))	%riempio la matrice
  for(img=1:length(imm))
		z(r,img)=reali(r)+i*(imm(img));
	end
end	
theta=2*pi/3;
gamma=pi/10;
zpos=theta-gamma;
R=0.95;
a=2*R*cos(zpos);
b=R^2;
c=2*R*cos(theta);
d=R^2;
H_fir_part =(1+(a*(z.^(-1)))+(b*(z.^(-2))));
H_iir_part =(1+(c*(z.^(-1)))+(d*(z.^(-2)))); %funzione trasferimento (dispense pag.18)
H= H_fir_part ./ H_iir_part; %funzione trasferimento (dispense pag.18)
surf(reali,imm,abs(H));
axis([-1.1 1.1 -1.1 1.1 0 4]);
W=[0:-step:(-2)*pi-step];
cerchio=exp(i.*W);
