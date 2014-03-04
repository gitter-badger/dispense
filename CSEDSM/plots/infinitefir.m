%
% $Id: infinitefir.m 24 2013-03-06 04:12:35Z nicb $
%
%                                                         1 
% H*(z) = 1 + z^-1 + z^-2 + ... = sum_k=0^\inf z^-k = --------
%                                                       z - 1
%
%                                       1
% Magnitude response is |H*(z)| = -------------
%                                 2 |sin(w/2)|
%
step = 0.01;
W = [0:step:(2*pi)-step];
M = 1./(2*abs(sin(W/2)));
Norm = W/(2*pi);

figure(1,'visible','off');
plot(Norm, M, ';Magnitude of z^{-k};', 'LineWidth', 8);
axis([0 0.55 0 5.5])
