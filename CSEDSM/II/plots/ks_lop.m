%
% $Id: ks_lop.m 33 2013-06-28 03:55:30Z nicb $
%

step=0.01;
W = [0:step:2*pi-step];
z = exp(i*W);
H = 0.5 * (1 + z.^(-1));

figure(1, 'visible', 'off')
plot(W, 20*log10(abs(H)), 'LineWidth', 4);
axis([0 pi -100 +10])
