clear all; close all; clc;
%% ADAPTER et CORRIGER ce code d'init.
%% Parametres du filtre continu désiré
wn = 1 ;          % pulsation propre [rad/s]
zeta = sqrt(2)/2; % facteur d'amortissement [1]

%% Paramètres du filtre discret imposés
Fe = 48e3 ;       % Fréquence d'échantillonnage [Hz]
Te = 2*pi/Fe;     % Période d'échantillonnage   [s] 

%% MODIFIEZ avec vos formules les paramètres de récurrence
K=1;
b0 = K*Te*wn ;
b1 = K*Te*wn ; 
b2 = K*Te*wn ; 
a0 = (1+4*zeta/(Te*wn)+4/(Te*wn)**2); 
a1 = (1+4*zeta/(Te*wn)+4/(Te*wn)**2); 
a2 = (1+4*zeta/(Te*wn)+4/(Te*wn)**2);

%% CORRIGEZ l'étourderie dans ce qui suit
% On définit la fonction de transfert (où z peut être vecteur)
Gd = @(z) K * (b0 + b1./z + b2./(z.^2)) ./ (a0 + a1./z + a2./(z.^2)) ;
% Indice pour l'erreur : convention et signes ! 
% y[k] = a1 y[k-1] pas -a1.y[k-1] ...

%% Gain statique
Gd(1)
%% Gain Hautes fréquences
Gd(-1)

%% Pour octave seulement il faut charger 
%% la package control
%% Avec matlab inutile et commentez cette ligne
pkg load control

%% VOTRE CODE G_de_p = tf....
% déclarant la fonction de transfert en continu
G_de_p = tf([4,5,6],[1,2,3])

%% VOTRE CODE Gd_c2d = c2d...
% passant du continu au discret la fonction de transfert
% c2d prend en argument une TF et en second argument Te
Gd_c2d = c2d(G_de_p,1)

% On extrait les coefficients avec .num et .den
num_c2d = Gd_c2d.num{1};
den_c2d = Gd_c2d.den{1};

%% VOTRE CODE num=, den= 
% construisez les vecteurs de coefficients 
% ATTENTION ! prenez la convention de signe de matlab
num_math = [b2, b1, b0];
den_math = [a2, a1, a0];

%% On vérifie que cela colle
disp("")
num_err = num_c2d-num_math;
den_err = den_c2d-den_math;

if (num_err * num_err' > 1e-6)
 disp('Mauvais numérateurs !')
 num_err
else
 disp('Bon numérateur')
 erreur_de = num_err*num_err'
end
if (den_err * den_err' > 1e-6)
 disp('Mauvais dénominateur !')
 den_err
else
 disp('Bon dénominateur')
 erreur_de = den_err*den_err'
end

bode(Gd_c2d)

step(Gd_c2d)

pzmap(Gd_c2d);

Df = Fe/100;        % résolution fréquentielle d'affichage
f = -Fe: Df: 2*Fe ; % vecteur des fréqeunces [Hz]

%%VOTRE CODE ftilde = , p= , z=
f_tilde = 1;  % fréquences normalisées [1<-> Fe]
p = 1;        % équivalents harmoniques de p
z = 1;        % équivalents harmoniques de z


Gc = @(p,wn,zeta) wn^2./(p.^2 + 2*zeta*wn*p + wn^2)  ;
%%VOTRE CODE G_continu=..., Gd_math=...
% utilisez la fonction anonyme Gd qui prend l'équivalent de z en argument
% pour calculer la fonction de transfert pour chaques fréquences
G_continu = Gc(1,wn,zeta);
Gd_maths = Gd(1);

%%VOTRE affichage ici 
dB_de = @(gains_complexes) 20*log10(gains_complexes);

plot(f,dB_de(G_continu),'k');  
xlabel("Frequences en ?");
ylabel ("Gain  en ? ");grid on;


clear all; close all; clc;

%% On cherche le chemin vers le fichier
dir = pwd
if (strcmp(dir((end-7):end),"_discret"))
    chemin = "./";
else % on tente un peu au hasard...
    chemin = "./discret/tp/tp1_continu_discret/";
endif
[Y,Fs]=audioread([chemin, "anna_a_mono.wav"]);
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


