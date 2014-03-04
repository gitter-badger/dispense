close all
clear all

a1 = [-1 -0.90 -0.8 0.8 0.90 1];	#vettore 
step = 0.01; 			 #ci da il campion
W = [0:step:pi-step] ;		 # da 0 a ny
Z = exp(i*W); 		#abbiamo tanti z, vettore di z, i numero immaginario puro
hold on ; 			#contiua a riscrivere nel grafico le fun che ti scrivo 
for (k = 1: length(a1))	
H = abs(1-(a1(k)*(1./Z))); 		#H di Omega
plot(W, H, [';a1 = ' num2str(a1(k)) ';']) ; 	
end
hold off;