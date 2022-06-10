clear all; close all; clc;
LA4 = 440;

%% VOTRE CODE demiton= ... et demiton_dB...
% multiplier par demiton doit augmenter  d'un demi-ton
% ^ permet de calculer une puissance non entière
demiton = 2^(1/12) 
demiton_dB = 10*log10(demiton)
demiton_log2 = 1/12;
quart_de_ton = sqrt(demiton); 

%% VOTRE CODE LA4diese=...
% LA + 1demiton = LA#
LA4diese = LA4 * demiton 
% LA + 2demiton = SI
SI4 = LA4 * demiton^2
% Et oui! SI +1demiton = DO (octave audessus)
DO5 = LA4 * demiton^3
% Descendez le DO5 de 2 octaves 
DO3 = DO5/4  
DO7 = DO5*4

%% Nombre de points
M = 4 * 12 * 2 +1 ; % 4 octaves * 12 demi-ton * 2 quart de tons

%% VOTRE CODE f_aible = ...
%% Le faible utilise logspace
f_aible = logspace(log10(DO3),log10(DO7), M);

%% OU BIEN VOTRE CODE f_orte=...
%% La forte utilise une boucle For
f=DO3;
for id=1:M
    f_orte(id) = f;
    f = f*quart_de_ton;
end

%% OU BIEN VOTRE CODE f_abuleuse = ...
%% La geeke utilise la fonction 'ln' 
log2_f = 0 : 1/12/2 : 4;  % *2^0 à *2^4 par quart de ton
f_abuleuse = DO3 * 2.^log2_f;

%% CHOISISSEZ f= f_aible OU f=f_orte OU f=f_abuleuse
%% Pour vérifier
f=f_aible;
if abs(f(1)-DO3)>1e-6
    disp("La première fréquence n'est pas un DO3")
elseif abs(f(end)-DO7)>1e-3
    disp("La dernière fréquence n'est pas un DO7")
elseif abs(f(end)/f(end-1)-2^(1/24))>1e-6
    disp("Ce n'est pas espacé au quart de ton")
else
    disp("Bravo, f semble bon");
end
M=length(f)

racine = pwd; racine = [racine(1:(findstr(racine,"Signal")+6)), "discret/tp/tp2_overtone"];cd (racine);

fich="ana_ah";

[Y,Fe]=audioread(["./",fich,".wav"]);
s=Y(:,1); % récupère que le son gauche (colonne 1) 
N=length(s);Te=1/Fe;

%% VOTRE CODE t=...
t=(1:N);t=t-1;t=t*Te;

%% VOTRE CODE s = s ... 
%% Normalisant s en norme infinie
s=s/max(abs(s));

%% VOTRE AFFICHAGE de s en fonction du  temps
plot(t,s)
xlabel("temps [s]")

%% On peut créer un fichier .wav  avec audiowrite ainsi
audiowrite(["./",fich,"_mono.wav"],s,Fe);


!ls
!aplay ana_ah.wav 
!aplay ana_ah_mono.wav

printf(" N=%d points temporels et M=%d points fréquentiels\n",N,M);
printf("Construction de la matrice de calcul de TFD (%d x %d) pour les f en échelle log...\n",M,N);
tic;
%% VOTRE CODE W=...
% Signaux en lignes de la forme ci-dessous
% utiliser le produit matriciel d'un colonne par une ligne !
%  ----------> t
% |
% |   W = matrice conjuguée de exp(i.2.pi.f.t)
% V
W =  exp(-i*2*pi*f'*t);
toc
printf("\nCalcul de la TFD : soit %d x %d = %d Mflo (Millions d'opérations flottantes)...\n",length(f),N,N*length(f)/1e6);

tic;
%% VOTRE CODE tfd_s = ...
% Utilisant la matrice W et le signal s pour 
% obtenir les "projections" aux fréquences voulues da,s tfd_s
tfd_s = W*s;
toc

clear W % Plus besoin ! et occupe 27M floats * 4 octets = 108 M de RAM !

addpath("../../utiles");
dBde = @(gain) max(-100,20*log10(abs(gain))) ;

subplot(211) % échelle log/log comme bode
ax=semilogx(f,dBde(tfd_s),'.-'); 
title("quelques octaves en echelle de frequence log...");
xlabel("Frequences [Hz] echelle log")
hold on;
grid_notes(); % Fonction maison pour les octaves

subplot(212)% échelle lin
plot(f,dBde(tfd_s),'.-'); 
hold on;
grid_notes();
title(".. en echelle lineaire")
xlabel("Frequences [Hz] echelle lin")


## VOTRE CODE Df=..., f_lin=...
df=Fe/N ;   % La résolution fréquentielle en N points
f_lin = 0:df:(Fe-df);  % Les fréquences linéaires

## VOTRE CODE fft_s= ....
# help fft  si nécessaire
# Pourquoi fft n'as pas besoin de connaitre Fe ?!
fft_s = fft(s);    

# On affiche de même le résultat mais avec l'algo fft
# Avec vos fréquences
pas_tout = round(110/df):round(9000/df);
subplot(211)
ax=semilogx(f_lin(pas_tout),dBde(fft_s(pas_tout)),'-'); 
title("quelques octaves en echelle de frequence log...");
xlabel("Frequences [Hz] echelle log")
hold on;
grid_notes();

subplot(212)
plot(f_lin,dBde(fft_s),'-'); 
hold on;
grid_notes();
title(".. en echelle lineaire")
xlabel("Frequences [Hz] echelle lin")


## VOTRE affichage avec fftshift centré autour de 0 en fréquence

f_sym = f_lin - Fe/2;
subplot(211);
plot(f_sym, fftshift(dBde(fft_s)));

subplot(212);
pas_tout = round(N/2-1900/df):round(N/2+2000/df);
plot(f_sym(pas_tout),fftshift(dBde(fft_s))(pas_tout));

Gc= @(p,wn,zeta) wn^2./(p.^2 + 2*zeta*wn*p + wn^2);
p = i*2*pi*f_lin';


pas_tout = round(100/df):round(3000/df);
plot(f_lin(pas_tout),dBde(fft_s(pas_tout))); hold on;

%% On recherche le pic de fréquence autour de F0
[maxi, id_max] = max(abs(fft_s)); % la fondamentale est maximum
w0 = (id_max*df-df)  *2*pi;

puis = [1    1    1    1     1    1    1    1    1    1];
zetas = [0.2 0.1 0.08 0.07 0.06 0.04 0.03 0.02 0.02 0.02];
for rang = 1:10
    wn = rang * w0;    % on multiplie par 3 pour l'harmonique
    plot(f_lin(pas_tout),dBde(Gc(p(pas_tout),wn,zetas(rang)).^puis(rang)));
end
rang=7;
wn = w0*rang;
zeta=zetas(rang);
pow=puis(rang);

! ./genere_les_scripts.sh


! cd scripts_octave && octave --force-gui

fft_filt_c = fft_s .* Gc(p,wn,zeta).^pow;
y_filt_c = real(ifft(fft_filt_c));
y_filt_c = y_filt_c/max(abs(y_filt_c));
audiowrite("filt_c.wav",y_filt_c,Fe)

Gbi = @(z) 2/Te*(z-1)./(z+1);
wnpre = 2/Te*tan(wn*Te/2);
z=exp(Te*p);
Gzpre = Gc(Gbi(z),wnpre,zeta);
Gz = Gc(Gbi(z),wn,zeta);
plot(f_lin(pas_tout),dBde(fft_s(pas_tout))); hold on;
plot(f_lin(pas_tout),dBde(Gc(p(pas_tout),wn,zeta).^pow),'k');
plot(f_lin(pas_tout),dBde(Gzpre(pas_tout).^pow),'g-');
plot(f_lin(pas_tout),dBde(Gz(pas_tout).^pow),'g--');

fft_filt_z = fft_s .* Gz.^2;
y_filt_z = real(ifft(fft_filt_z));
y_filt_z = y_filt_z/max(abs(y_filt_z));
audiowrite("filt_z.wav",y_filt_z,Fe)

function [a,b] = filt_overtone(w0,rang,Te)
    wn=2/Te*tan(rang*w0*Te/2);
    puis = [1    1    1    1     1    1    1    1    1    1]*1;
    zetas = [0.2 0.1 0.08 0.07 0.06 0.04 0.03 0.02 0.02 0.02]*1;
    zeta=zetas(rang);
    a0 = (1+4*zeta/(Te*wn)+4/(Te*wn)**2); 
    a1 = (2-8/(Te*wn)**2); 
    a2 = (1-4*zeta/(Te*wn)+4/(Te*wn)**2);

    aa = [a0, a1, a2]/a0;
    bb = [1, 2, 1]/a0;
    a=aa;
    b=bb;
    for k=2:puis(rang)
        a=conv(a,aa);
        b=conv(b,bb);
    end
end


%% Fonction pouvant implémenter un filtre IIR de type I
% Implique la mémorisation des x et des y
% cette mémoire est accessible en général par variables globales
global mem_x
global mem_y
filtre = @filt_iir_I; % version stupide de la fonction
%% CODEZ VOTRE FONCTION dans le fichier filtre_iir_I.m


mem_x = zeros(1,15);   % mémoire du filtre vide au début
mem_y = mem_x;

%% Le vecteur des sorties à la même taille que s
rang=3;
inc=1;
y = 0*s;
a=1;
b=1;
for k = 1:N
    if (mod(k,Fe/4)==Fe/4-1)
        [a,b] = filt_overtone(w0,rang,Te);
        rang = rang + inc ;
        if (rang>9)
            inc = -inc;
        end
        if (rang<3)
            inc = -inc;
        end
    end
    y(k) = filtre(s(k),b,a);    
end

plot(t,y)
y = y /max(abs(y));
audiowrite("filt_rec.wav",y,Fe)

!./genere_les_scripts.sh

!aplay ana_ah.wav


