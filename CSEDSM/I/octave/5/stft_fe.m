%
% Estrazione della frequenza attraverso la rilevazione della fase su due
% finestre successive di un dato bin di frequenza.
%
% Problema: il bin di una DFT/FFT ha una frequenza nominale (che  è  la
% frequenza del bordo inferiore del bin). Dal rilevamento della fase  su
% due finestre successive è possibile estrarre la frequenza *realmente*
% presente in quel bin.
%
% Il codice qui sotto crea una finestra rettangolare nella quale e` iscritta
% un'onda cosinusoidale di frequenza Fn (frequenza nominale) e di frequenza F
% (frequenza reale, da rilevare in base ai calcoli).
%
clear all;
fc = 44100;
sinc = 1/fc;
dur = 1;
Fn = 8;
F = 8.3;
Delta_F = F - Fn;
w = 2*pi*Fn;
Delta_w = 2*pi*Delta_F
t = [0:sinc:dur-sinc];
last_t = size(t, 2);
t1 = t(last_t);

yn = exp(-i*w*t);
y = exp(-i*(w+Delta_w)*t);

figure(1)
plot(t, real(yn), t, real(y))
axis([-0.1 dur+0.1 -1.1 1.1])

last_Fn = yn(last_t)
last_F = y(last_t)

RDelta_w = arg(log(last_F/exp(-i*w*t1))/t1)
