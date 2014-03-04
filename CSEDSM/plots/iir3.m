%
% $Id: iir3.m 24 2013-03-06 04:12:35Z nicb $
%
A_1s = [0.7 0.8 0.9 0.99 0.999 0.9999];
A_1s_colors = [ 'yellow'; 'red'; 'green'; 'cyan'; 'yellow'; 'blue' ];
A_1s_types = [ '-'; '--'; ':'; '.-'; '-'; '--' ];
step = 0.01;
W = [0:step:(2*pi)-step];
Norm = W ./ (2*pi);
figure(1,'visible','off');
hold on;
for a=1:length(A_1s)
	a1 = A_1s(a);
	Y = 1./sqrt(1 - (2*a1*cos(W)) + (a1^2));
	Ymax = max(Y);
	Ynorm = Y/Ymax;
	Ydb = 20*log10(Ynorm);
	plot(Norm, Ydb, [ A_1s_types(a) ';a_1 = ' num2str(A_1s(a)) ';'], 'linewidth', 3, 'color', A_1s_colors(a));
	axis([0 0.51 -100 +15]);
end
hold off;
