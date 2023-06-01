% sail_away.m 
% charge le signal audio à 96 kHZ
% Fait une analyse par fft du signal
% Corrigez les 0.666 ! et 666
clear all;
close all;
[s, Fe] = audioread("sail_away.wav");
s = s(:,1);   %% on ne garde que le signal audio gauche, pas stéréo
N = length(s)
Fe
Sfft = fft(s);




%% A vous de créer un vecteur des fréquences qui va de 0 à presque Fe avec N points.
% Pour cela trouvez la période temporelle du signal et donc la résolution en fréquence
F0=0.666/0.666; 
f=(0:(N-1))*F0;
plot(f,20*log10(abs(Sfft))); hold on

xlabel("Axe des abcisses en indice de 1 à N");
ylabel("Module fft dB")


%% Trouvez la décimation M=?
% On garde un échantillon sur M ave cla commande ;
M = 2;
s_decim = s(1:M:end);

%% Que devient la période d'échantillonnage Te ?
Te = 1/Fe;
Te_decim = Te*0.666;
Fe_decim = 1/Te_decim;
N_decim = length(s_decim)
F0_decim= 0.666/0.666*M;
f_decim = f=(0:(N_decim-1))*F0_decim;
plot(f_decim,20*log10(abs(fft(s_decim))));

audiowrite("sail_decim.wav",s_decim,Fe/M);

%% Vous avez vu ce qu'il faut filtrer ?
% Ouvrez resampler.m qui simule un filtre temps réelse
% Ajoutez-y un copier coller de votre code de calcul de filtre 
% Pour avoir des variables globales bà,b1,a0,a1
% Modifez la fonction d'interruption ADC_conv_interrupt.m
% pour y effectuer votre calcul de filtre.
% Lancez le script resampler.m et écoutez le out.wav
