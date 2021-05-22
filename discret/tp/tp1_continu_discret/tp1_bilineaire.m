clear all; close all; clc;

[Y,Fs]=audioread("anna_a_mono.wav");
Y=Y(:,1); % récupère que le son gauche

N=length(Y);
t=((1:N)-1)/Fs;

Df=Fs/N;
f=0:Df:Fs-Df;

% fenetre audio interessante à regarder
fmin=440/4; %LA2
fmax=440*8; %LA7
aff= floor(fmin/Df):ceil(fmax/Df) ;

mag = abs(fft(Y(:,1)'));
subplot(211)
ax=semilogx(f(aff),20*log10(mag(aff))); 
title("zoom sur les octaves 3 a 6 en echelle log")
hold on;
octaves=afficher_grille_notes();
subplot(212)
ax=plot(f,20*log10(mag)); 
hold on;
afficher_grille_notes(octaves);
title("De 0 a Fe en echelle lineaire")


