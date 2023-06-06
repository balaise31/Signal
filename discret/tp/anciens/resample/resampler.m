clear all;
close all;
%% global permet de faire des variables globales 
%% à plusieurs fonctions 

%% Permet de filtrer un fichier .wav
%% comme si on était en temps réel.
global audio;
audio = processus_audio("sail_away.wav", 1);
Fe = audio.Fe
Te= 1/Fe;
fprintf("Audio à %.1f kHz ",Fe/1000)


%% C'est comme si un timer déclanchait
% toute les Te secondes une interruption qui déclenche
% une conversion de l'ADC_conv_interrupt (Hardware pas de Handler)

% Quand l'adc à terminé sa conversion, il déclenche une interruption
% qui décclenche l'appel de la fonction ADC_conv_interrupt (voir le .m)
% Cette interruption à besoin de mémoire, de paramètres etc. qu'il faut 
% stocker dans des vairables persistantes en mémoire (globales)
% Par exemple pour un retard avec un gain k
global xm ym; %mémoire du vieux x
global K;  % valeur du gain
xm=0;
ym=0;
K=1;

%% VOTRE CODE de calcul des coef du filtre
global a1 a0 b1 b0
Fc=4000;
wc = 2*pi*Fc;
wd = 2/Te*tan(wc*Te/2);
tau = 1/wd; % Oui on met s un tau qui casse pour wd

b0 = K*Te ;
b1 = K*Te ; 
a0 = Te-2*tau; 
a1 = Te+2*tau; 


%% Modifiez le code du handler dans ADC_conv_interrupt.m


%% On lance le timer et lui donne 
% le pointeur du handler 
disp("on calcule...")
audio.timed_ADC_start(@ADC_conv_interrupt)

disp ("...Calcul fini.")

%% On sauve la sortie calculée dans un wav
% on peut indiquer une décimation 
% Ici decim=2 veut dire sauve un sample sur deux
% La fréquence d'échantillonnage est alors divisée par deux...
% On aimerait décendre à 8kHz...
% À vous de jouer.
audio.save_to_wav("out.wav", 12)


