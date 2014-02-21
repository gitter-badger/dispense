%
% $Id: iir3.m 24 2013-03-06 04:12:35Z nicb $
%
step = 0.01;
W = [0:step:(2*pi)-step];
Norm = W ./ (2*pi);
a1 = 0.99999999;
theta = pi/15;
Y = 1 - (2*a1*cos(theta)*exp(-i*W)) + ((a1^2)*exp(-(i*2*W)));
Ynorm = Y/max(Y);
Yinversenorm = 1./Ynorm;
YnormdB= 20*log10(Ynorm);
YinversenormdB = 20*log10(Yinversenorm);

figure(1,'visible','off');

plot(W, YnormdB, ['; Inverso risposta per theta = ' num2str(theta) ';'], 'LineWidth', 4, W, YinversenormdB, '; (Risposta dritta);', 'LineWidth', 4)
axis([0 0.5*pi])
