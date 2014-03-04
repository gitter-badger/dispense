%
% Convolution of noise and a sawtooth wave to show that a convolution in the
% time domain is equivalent to a multiplication of spectra.
%
winsize = 1024;
x = (2 * rand(1, winsize)) - 1;
xfft = fft(x);
amp = 2;
wstep = amp/winsize;
h = [amp/2:-wstep:-(amp/2)+wstep];
hfft = fft(h);

figure(1, 'visible', 'off')
subplot(1,2,1)
plot(x)
subplot(1,2,2)
stem((2*abs(xfft))/winsize)
axis([0 winsize/16 0 0.11])
%PRINT 1

figure(2, 'visible', 'off')
subplot(1,2,1)
plot(h)
subplot(1,2,2)
stem((2*abs(hfft))/winsize)
axis([0 winsize/16 0 amp/2])
%PRINT 2

%
% convolve both signals
%
y = conv(x, h*0.1);
yfft = fft(y);

figure(3, 'visible', 'off')
subplot(1,2,1)
plot(y)
subplot(1,2,2)
stem((2*abs(yfft))/winsize)
axis([0 winsize/16 0 1])
%PRINT 3
