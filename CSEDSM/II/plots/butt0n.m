%
% $Id$
%
step = 0.01;
W = [0:step:2*pi-step];
z = exp(i*W);
nmax = 8;
colors = 0;

hold on;
for k=0:nmax
	color = mod(k, 6);
	n = 2^k;
	H_n = 1./(1+ (((z - 1)./(z + 1)).^n));
	plot(W, 20*log10(abs(H_n)), [ num2str(color) ';F(z)^{' num2str(n) '};'], 'linewidth', 3);
  axis([0 2*pi -100 +60]);
end
hold off;
