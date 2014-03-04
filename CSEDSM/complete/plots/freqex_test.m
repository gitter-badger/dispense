%
%
%
fc = 44100;
sinc = 1/fc;

dur = 0.375;
t = [0:sinc:dur-sinc];
freq = 8.26;
freq_nominale = 7.9;
amp = 0.33;
y = amp*exp(i*2*pi*freq*t);
yn = exp(i*2*pi*freq_nominale*t);

last_y = y(size(y, 2));
last_yn = yn(size(yn, 2));
last_t = t(size(t, 2));

last_y_angle = arg(last_y);
last_yn_angle = arg(last_yn);

y_freq = last_y_angle/(2*pi*last_t);
yn_freq = last_yn_angle/(2*pi*last_t);

y_freq
yn_freq
