clear all;
close all;
step=0.01;
theta=2*pi/3;
gamma=pi/10;
zpos=theta-gamma;
R=0.95;
a=2*R*cos(zpos);
b=R^2;
c=2*R*cos(theta);
d=R^2;
zeri=roots([1 a b ])
poli=roots([1 c d ])
W=[0:step:2*pi-step];
cerchio=exp(i.*W);
figure(1);
hold on;
plot(cerchio);
plot(zeri,"o");
plot(poli,"x");
hold off;

figure(2)
z = exp(i*W);
H_fir_part = 1 + (a*(z.^(-1))) + (b*(z.^(-2))); 
H_iir_part = 1 + (c*(z.^(-1))) + (d*(z.^(-2))); 
H = H_fir_part ./ H_iir_part;

subplot(2,1,1);
plot(W, 20*log10(abs(H)), "LineWidth", 4);
axis([0 pi]);

subplot(2,1,2);
plot(W, arg(H), "LineWidth", 4);
axis([0 pi]);
