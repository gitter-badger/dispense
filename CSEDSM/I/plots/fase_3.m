%
% $Id: fase_3.m 28 2013-05-03 04:38:41Z nicb $
%
step = 0.01;
W = [0:step:pi-step];
Coefs = [0.5 0.8 0.5];
z=exp(i*W);
H = Coefs(1) + (Coefs(2)*z.^(-1)) + (Coefs(3)*z.^(-2));
ReH = real(H);
ImH = imag(H);
PHI = atan2(ImH, ReH);
Mag = abs(H);

figure(1, 'visible', 'off')
subplot(2,1,1);
plot(W, 20*log10(Mag), 'LineWidth', 4)
subplot(2,1,2);
plot(W, PHI, 'LineWidth', 4)
