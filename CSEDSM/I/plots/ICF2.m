%
% $Id: ICF2.m 29 2013-05-17 04:18:06Z nicb $
%
clear all;
close all;

% yt = xt - R^L*x(t-L)
% H(z) = [1-R^L*z^-L]

R = 0.999999; % profondità dei denti
L = 8; % ordine del filtro (L+1 termini, da 0 a L+1)
step = 0.01;
W = [0:step:2*pi-step];
z = exp(i*W);

H = 1-((R.^(L))*(z.^(-L))); %fn di trasferimento ==> che diventa la risp in freq per via di z 
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
zri = roots(coefs);
cerchio = exp(i*W);
hold on
plot(cerchio, 'LineWidth', 2)
plot(zri, 'o', 'markersize', 12);
hold off
%PRINT 2

figure(3, 'visible', 'off')
meshstep = 0.01;
reals = [-1.2:meshstep:1.2];
imags = reals;
zplane = zeros(length(reals), length(imags));
ringsize=0.2;
lowerring=R-ringsize;
upperring=R+ringsize;
for k=1:length(imags)
  for l=1:length(reals)
    zval = reals(l) + (i*imags(k));
    zvalmag = abs(zval);
    if zvalmag >= lowerring && zvalmag <= upperring
      zplane(l,k) = 1 - ((R.^(L)*zval^(-L)));
    else
      zplane(l,k) = NaN;
    end
  end
end
surfl(reals, imags, abs(zplane))
axis([-1.2 1.2 -1.2 1.2 -0.01 2]);
%PRINT 3
