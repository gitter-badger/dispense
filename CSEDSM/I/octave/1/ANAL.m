clear all
close all

w=1;
x=[0:0.01:50*pi];
wanal=1;
y=cos(w*x);
yanal=cos(wanal*x);
r=y.*yanal;
stem(x(1:1000),r(1:1000));
sum(r)
