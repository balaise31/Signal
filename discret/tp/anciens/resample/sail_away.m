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
F0=Fe/N; 
f=(0:(N-1))*F0;
% On normalise la fft avec fft/N
plot(f,20*log10(abs(Sfft)/N)); hold on

xlabel("Axe des abcisses en indice de 1 à N");
ylabel("Module fft dB")


%% Trouvez la décimation M=?
% On garde un échantillon sur M ave cla commande ;
M = 12; %12=96/8
% Avec M=2
% le scartman à 40KHz est recopié autour de -Fe/2=-48kHz
% soit replié dans 40 - 48 = -8 kHz et donc à 8kHz aussi.
% on entend un aigu pénible à 8KHz

% Avec M=3    40 -96/3 = 8kHz aigu aussi
% Avec M=4    40 - 2*96/4 = -8kHz 
%   mais aussi 40 -96/4 = 16 kHZ   inaudible 

% Avec M=5   40 - 2*96/5 = 1kHz TRès audible !!!!
% Avec M=6   40 - 2*96/6 = 8kHZ
% Avec M=7 pareil que M=5 Audible effet robot
% Avec M=12  40 - 96/12 = 0kHz ! ça superpose !

Repli_audible_a_kHz = 40-round(40/(96/M))*96/M

s_decim = s(1:M:end);

%% Que devient la période d'échantillonnage Te ?
Te = 1/Fe;
Te_decim = Te*M;
Fe_decim = 1/Te_decim;
N_decim = length(s_decim);
% La résolution fréquentielle ne change pas !
F0_decim= Fe/N; % Fedecim/(N/M)= (Fe/M)/(N/M) =Fe/N
f_decim = (0:(N_decim-1))*F0_decim;
% La fft n'est pas divisée /N pas normalisée:
% Sfft est en fait la tFD normalisée * N
% ici fft(sdecim) est la tFD normalisée *N/M
% l'amplitude est plus petite   
plot(f_decim,20*log10(abs(fft(s_decim))/(N/M)));

audiowrite("sail_decim.wav",s_decim,Fe/M);



%% Vous avez vu ce qu'il faut filtrer ?
% Ouvrez resampler.m qui simule un filtre temps réelse
% Ajoutez-y un copier coller de votre code de calcul de filtre 
% Pour avoir des variables globales bà,b1,a0,a1
% Modifez la fonction d'interruption ADC_conv_interrupt.m
% pour y effectuer votre calcul de filtre.
% Lancez le script resampler.m et écoutez le out.wav
