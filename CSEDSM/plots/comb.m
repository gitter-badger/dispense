%
% $Id$
%
clear all;
close all;
%
% comb filters, no sign inversion
%

R = 0.999999; % altezza dei poli
L = 8; % ordine del filtro (L+1 termini, da 0 a L+1)
step = 0.01;
W = [0:step:2*pi-step];
z = exp(i*W);

H = 1 ./ (1-((R.^(L))*(z.^(-L)))); %fn di trasferimento ==> che diventa la risp in freq per via di z 
figure(1, 'visible', 'off')
subplot (2,1,1)
plot (W,20*log10(abs(H)), 'LineWidth', 2);
subplot(2,1,2)
plot (W,arg(H), 'LineWidth', 2);
%PRINT 1

figure(2, 'visible', 'off')
coefs = zeros(1,L+1); % L+1 coefficienti (include anche lo zero), dal più alto al più basso
coefs(L+1) = 1; % coefficiente zero (ultimo)
coefs(1) = -R^L; % coefficiente L-esimo (primo)
poli = roots(coefs);
cerchio = exp(i*W);
hold on
plot(cerchio, 'LineWidth', 2)
plot(poli, 'x', 'markersize', 12);
hold off
%PRINT 2

figure(3, 'visible', 'off')
meshstep = 0.02;
lim = 1.6;
reals = [-lim:meshstep:lim];
imags = reals;
zplane = zeros(length(reals), length(imags));
maxheight = 3;
for k=1:length(imags)
  for l=1:length(reals)
    zval = reals(l) + (i*imags(k));
    zvalmag = abs(zval);
    zplane(l,k) = 1 ./ (1 - ((R.^(L)*zval^(-L))));
		if zplane(l, k) > maxheight
			zplane(l, k) = maxheight;
		end
  end
end
surfl(reals, imags, abs(zplane))
axis([-lim lim -lim lim -0.01 maxheight+0.5]);
%PRINT 3
