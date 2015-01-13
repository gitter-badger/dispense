% vi:set nowrap:
%
% $Id: impulse-partials.m 5 2008-04-02 10:37:04Z nicb $
%
% This plot shows how simple relationships produce simple wavetables
%

npoints = 8192;
idx = [ 1 : 1 : npoints ];
inc = (2*pi / npoints).*idx;
frq = 5;
fundamental = sin(frq*inc)';
impulse = zeros(size(inc));

for i=1:100
    impulse = impulse .+ sin(frq*i*inc);
end

%impulse = fundamental .+ harm1 .+ harm2 .+ harm3 .+ harm4 .+ harm5 \
%	.+ harm6;
impulsefft = abs(fft(impulse))/npoints;

figure;
% gset origin 0,0.75;
% gplot [][-7.5:7.5] impulse title "a = k";
subplot(2,1,1)
plot(impulse,';a = k;');
subplot(2,1,2)
stem(impulsefft, ';a = k;');
axis([0 26 0 0.6]);


hold on;
print -deps 'impulse-partials.eps';
%
%
