clear all
close all

w=0.78;
x=[0:0.01:50*pi];
wanal=1;
y=0.5*cos(w*x)+0.9*cos(3*w*x);
yanal=cos(wanal*x);
r=y.*yanal;
stem(x(1:1000),r(1:1000));
sum(r)
