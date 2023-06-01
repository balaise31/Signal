clear all; close all; clc;
%% ADAPTER et CORRIGER les 666
%% Paramètres du filtre discret imposés
Fe = 666;      % Fréquence d'échantillonnage [Hz]
Te = 666;      % Période d'échantillonnage   [s] 

%% Parametres du filtre continu imposé
K = 666;
Fc = Fe/4;


%% MODIFIEZ avec vos formules les paramètres de récurrence
% du genre  Tau = 1/fc, 
%  a0 = Te-2*tau/Te
%  etc.
wc = 666;
tau = 666;

b0 = 666 ;
b1 = 666 ; 
a0 = 666; 
a1 = 666; 

%% Vérifiez vos gain statiques et HF
% MODIFIEZ
gain_statique = (a0+a1)/(b0+b1) * 666 
gain_hf = (a0-a1)/(b0-b1)/666

clear all; close all; clc;
%% ADAPTER et CORRIGER les 666
%% Paramètres du filtre discret imposés
Fe = 48e3;      % Fréquence d'échantillonnage [Hz]
Te = 1/Fe;      % Période d'échantillonnage   [s] 

%% Parametres du filtre continu imposé
K = 1;
Fc = Fe/4;


%% MODIFIEZ avec vos formules les paramètres de récurrence
% du genre  Tau = 1/fc, 
%  a0 = Te-2*tau/Te
%  etc.
wc = 2*pi*Fc;
tau = 1/wc;

b0 = K*Te ;
b1 = K*Te ; 
a0 = Te-2*tau; 
a1 = Te+2*tau; 

%% Vérifiez vos gain statiques et HF
% MODIFIEZ
gain_statique = (b0+b1)/(a0+a1) 
gain_hf = (b0-b1)/(a0-a1)

% On définit la fonction de transfert (où p peut être un vecteur complexe)
% Laissez l'erreur pour voir si on détecte
G= @(p) tau*K./(1-tau*p) ;

%% On vérifie avec le Gain statique
gain_statique = G(0)  % équivalent de p = j.w --> 0 en statique
%% Gain Hautes fréquences
gain_Hf = G(j*inf)   % équivalent de p = j.w --> +j.oo en HF

%% On vérrifie G(j.wc) = K/(1+i)  <-> f=Fe/4=fc
gain_Fe_sur_4 = G(j*wc)
if abs(G(j*2*pi*Fe/4)-(1/(1+i)))<1e-10
    disp("Vous semblez avoir corrigé l'erreur");
else
    disp("Il est possible qu'il y ait une erreur...");
end

% On définit la fonction de transfert (où p peut être un vecteur complexe)
% Laissez l'erreur pour voir si on détecte
G= @(p) K./(1+tau*p) ;

%% On vérifie avec le Gain statique
gain_statique = G(0)  % équivalent de p = j.w --> 0 en statique
%% Gain Hautes fréquences
gain_Hf = G(j*inf)   % équivalent de p = j.w --> +j.oo en HF

%% On vérrifie G(j.wc) <-> f=Fe/4=fc
gain_Fe_sur_4 = G(j*wc)
if abs(G(j*2*pi*Fe/4)-(1/(1+i)))<1e-10
    disp("Vous semblez avoir corrigé l'erreur");
else
    disp("Il est possible qu'il y ait une erreur...");
end

Df=5; 
f = -Fe:Df:Fe ;  % vecteur des fréquences [Hz]
w = 666*f;       % vecteur des pulsation en radians par secondes
p = 666*w;       % vecteur complexes des équivalents harmoniques de p 

G_de_p = G(p) ;   % On calcule pour chaque fréquences G(p=j.w)

% On affiche en linéaire module et argument 
subplot(211);
plot(f, abs(G_de_p)); grid on;
xlabel("f [Hz]");
ylabel("Module G(j.w)")
subplot(212);
plot(f, angle(G_de_p)); grid on;
xlabel("f [Hz")
ylabel("Argument G(j.w) [rad]")


Df=100; 
f = Df:Df:10*Fe ;  % vecteur que des positif >0
w = 2*pi*f;       % vecteur des pulsation en radians par secondes
p = j*w;          % vecteur complexes des équivalents harmoniques de p 

G_de_p = G(p) ;   % On calcule pour chaque fréquences G(p=j.w)

% On affiche en linéaire module et argument 
subplot(211);
semilogx(f, 20*log10(abs(G_de_p))); grid on;
xlabel("f [Hz]");
ylabel("Module G(j.w) dB")
subplot(212);
semilogx(f, angle(G_de_p)/pi*180); grid on;
xlabel("f [Hz]")
ylabel("Argument G(j.w) [deg]")

%% CORRIGEZ l'étourderie dans ce qui suit
% On définit la fonction de transfert (où z peut être vecteur)
Gd = @(z) (b0 + b1 .* z.^(-1) ) ./ (a0 + a1*z.^(-1) ) ;
% Indice pour l'erreur : convention Matlab !

%% On vérifie avec le Gain statique
gain_statique = Gd(666)
%% Gain Hautes fréquences
gain_Hf = Gd(666)


%% CORRIGÉ 
% On définit la fonction de transfert (où z peut être vecteur)
Gd = @(z) (b0 + b1 .* z ) ./ (a0 + a1*z ) ;

%% On vérifie avec le Gain statique
gain_statique = Gd(1)
%% Gain Hautes fréquences
gain_Hf = Gd(-1)

Df=5; 
f = -Fe:Df:2*Fe ;  % vecteur des fréquences [Hz]
w = 666*f;       % vecteur des pulsation en radians par secondes
p = 666*w;       % vecteur complexe des équivalents harmoniques de p 
z = 666*p;       % vecteur complexe des équivalents harmoniques de z 
G_de_z = Gd(z) ;   % On calcule pour chaque fréquences G(p=j.w)

% On affiche en linéaire module et argument 
subplot(211);
plot(f, abs(G_de_z)); grid on;
xlabel("f [Hz]");
ylabel("Module Gd(z)")
subplot(212);
plot(f, angle(G_de_z)); grid on;
xlabel("f [Hz")
ylabel("Argument Gd(z) [rad]")


Df=100; 
f = Df:Df:10*Fe ;  % vecteur que des positif >0
w = 2*pi*f;       % vecteur des pulsation en radians par secondes
p = j*w;          % vecteur complexes des équivalents harmoniques de p 
z = exp(Te*p);   % Avec le théorème du retard pour z.

G_de_z = Gd(z) ;   % On calcule pour chaque fréquences G(p=j.w)

% On affiche en linéaire module et argument 
subplot(211);
semilogx(f, 20*log10(abs(G_de_z))); grid on;
xlabel("f [Hz]");
ylabel("Module Gd(z) dB")
subplot(212);
semilogx(f, angle(G_de_z)/pi*180); grid on;
xlabel("f [Hz]")
ylabel("Argument Gd(z) [deg]")

Df = Fe/100;        % résolution fréquentielle d'affichage
f = -Fe: Df: 2*Fe ; % vecteur des fréqeunces [Hz]
p = j*2*pi*f;        % équivalents harmoniques de p
z = exp(Te*p);  % équivalents harmoniques de z

% utilisez la fonction anonyme Gd qui prend l'équivalent de z en argument
% pour calculer la fonction de transfert pour chaques fréquences
G_continu = G(p);
G_discret = Gd(z);


plot(f,G_continu,'k');hold on;
plot(f,G_discret,'r');grid on;

fc=Fe/4;
gain_continu_fc = G(j*2*pi*fc)
gain_discret_fc = Gd(exp(j*2*pi*fc*Te))
plot(fc,gain_continu_fc,'k+');
plot(fc,gain_discret_fc,'ro');



Df=455; 
f = Df:Df:10*Fe ;  % vecteur que des positif >0
w = 2*pi*f;       % vecteur des pulsation en radians par secondes
p = j*w;          % vecteur complexes des équivalents harmoniques de p 
z = exp(Te*p);   % Avec le théorème du retard pour z.
G_continu = G(p);
G_discret = Gd(z);

fc=Fe/4;
gain_continu_fc = G(j*2*pi*fc)
gain_discret_fc = Gd(exp(j*2*pi*fc*Te))


% On affiche en linéaire module et argument 
subplot(211);
semilogx(f, 20*log10(abs(G_continu)),'b'); hold on;
semilogx(f, 20*log10(abs(G_discret)),'r');grid on;
semilogx(fc, 20*log10(gain_continu_fc),'b+'); 
semilogx(fc, 20*log10(gain_discret_fc),'ro'); 
xlabel("f [Hz]");
ylabel("Module Gd(z) dB")
subplot(212);
semilogx(f, angle(G_continu)/pi*180,'b'); hold on;
semilogx(fc, angle(gain_continu_fc)/pi*180,'b+'); 
semilogx(f, angle(G_discret)/pi*180,'r'); grid on;
semilogx(fc, angle(gain_discret_fc)/pi*180,'ro'); 
xlabel("f [Hz]")
ylabel("Argument Gd(z) [deg]")

clear all; close all; clc;
Fe = 48e3;      % Fréquence d'échantillonnage [Hz]
Te = 1/Fe;      % Période d'échantillonnage   [s] 

%% Parametres du filtre continu imposé
K = 1;
Fc = Fe/4;


%% MODIFIEZ pour avoir un prewarp et un cassure à wd
wc = 2*pi*Fc;
tau = 1/wc;

b0 = K*Te ;
b1 = K*Te ; 
a0 = Te-2*tau; 
a1 = Te+2*tau; 


Gd = @(z) (b0 + b1 .* z ) ./ (a0 + a1*z ) ;
S = @(z) (2/Te*(z-1)./(z+1));
G = @(p) K./(1+tau*p) ;

%% On vérifie avec le Gain statique
gain_statique = Gd(1)
gain_statique_compo = G(S(1))
%% Gain Hautes fréquences
gain_Hf = Gd(-1)
gain_Hf_compo = G(S(-1))
%% gain fc
zc = exp(i*2*pi*Fc*Te);
gain_fc = Gd(zc)
gain_fc_compo = G(S(zc))

if abs(gain_fc - K/(1+i))>0.001 
    printf("\n\nPas de bon prewarp ! On veut 0.5 - 0.5 i = K/(1+i) comme gain...")
else
    printf("\n\nTu es sur la bonne voie jeune padawan")
end


clear all; close all; clc;
Fe = 48e3;      % Fréquence d'échantillonnage [Hz]
Te = 1/Fe;      % Période d'échantillonnage   [s] 

%% Parametres du filtre continu imposé
K = 1;
Fc = Fe/4;


%% MODIFIEZ pour avoir un prewarp et un cassure à wd
wc = 2*pi*Fc;
wd = 2/Te*tan(wc*Te/2);
tau = 1/wd; % Oui on met s un tau qui casse pour wd

b0 = K*Te ;
b1 = K*Te ; 
a0 = Te-2*tau; 
a1 = Te+2*tau; 


Gd = @(z) (b0 + b1 .* z ) ./ (a0 + a1*z ) ;
S = @(z) (2/Te*(z-1)./(z+1));
G = @(p) K./(1+tau*p) ;

%% On vérifie avec le Gain statique
gain_statique = Gd(1)
gain_statique_compo = G(S(1))
%% Gain Hautes fréquences
gain_Hf = Gd(-1)
gain_Hf_compo = G(S(-1))
%% gain fc
zc = exp(i*2*pi*Fc*Te);
gain_fc = Gd(zc)
gain_fc_compo = G(S(zc))

if abs(gain_fc - K/(1+i))>1e-9
    printf("\n\nPas de bon prewarp ! On veut 0.5 - 0.5 i = K/(1+i) comme gain...")
else
    printf("\n\nTu es sur la bonne voie jeune padawan")
end


Df=1055; 
f = Df:Df:2*Fe ;  % vecteur que des positif >0
w = 2*pi*f;       % vecteur des pulsation en radians par secondes
p = j*w;          % vecteur complexes des équivalents harmoniques de p 
z = exp(Te*p);   % Avec le théorème du retard pour z.

G = @(p) K./(1+p/wc) ;
Gpre = @(p) K./(1+p/wd) ;

G_continu = G(p);
G_continu_pre = Gpre(p);
G_discret = Gd(z);

fc=Fe/4;

gain_continu_fc = G(j*2*pi*fc)
gain_discret_fc = Gd(exp(j*2*pi*fc*Te))


% On affiche en linéaire module et argument 
subplot(211);
semilogx(f, 20*log10(abs(G_continu)),'b'); hold on;
semilogx(f, 20*log10(abs(G_continu_pre)),'b--'); hold on;
semilogx(f, 20*log10(abs(G_discret)),'r');grid on;
semilogx(fc, 20*log10(gain_continu_fc),'b+'); 
semilogx(fc, 20*log10(gain_discret_fc),'ro'); 
xlabel("f [Hz]");
ylabel("Module Gd(z) dB")
subplot(212);
semilogx(f, angle(G_continu)/pi*180,'b'); hold on;
semilogx(f, angle(G_continu_pre)/pi*180,'b--'); hold on;
semilogx(fc, angle(gain_continu_fc)/pi*180,'b+'); 
semilogx(f, angle(G_discret)/pi*180,'r'); grid on;
semilogx(fc, angle(gain_discret_fc)/pi*180,'ro'); 
xlabel("f [Hz]")
ylabel("Argument Gd(z) [deg]")


