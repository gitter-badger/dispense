close all
clear all

a1 = 0.8;
step = 0.01; 			 #ci da il campion
W = [0:step:pi-step] ;		 # da 0 a ny
Z = exp(i*W); 		#abbiamo tanti z, vettore di z, i numero immaginario puro
H = abs(1-(a1*(1./Z))); 		#H di Omega
plot(W, H) ; 