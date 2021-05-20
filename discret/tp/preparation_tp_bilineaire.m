clear all; close all; clc;
Fe=100;Df=1;Te=1/Fe;

% fonctions de transfert (fonctions inline de la variable z VECTORISEE "./")
Hf = @(z) ((z-1)./(z*Te));   % forward Euler ou "zero order hold"
Hb = @(z) ((z-1)./Te)     ;  % backward Euler
Ht = @(z) ((z-1)./(z+1)*2/Te); % bilineaire ou Tustin ou trapezoidale

f=0:Df:2*Fe;         % vecteur des fréquences
w=2*pi*f;            % vecteur des pulsations
p=i*w ;              % Et oui ! vecteur de la variable de Laplace 
z=exp(Te*p);         % encore plus fort : les valeurs de z aux différentes pulsations

% certaines fréquences comme 0 et we/2 donnent 
% des singularités à éviter pour l'afficahge: 
% on fait un vecteur des indices à afficher qui évite
% cela en prenant que les indices pairs
aff=2:2:length(f);
plot(f(aff),abs(Hf(z(aff))),'g+-'); hold on;
plot(f(aff),abs(Hb(z(aff))),'bo-'); 
plot(f(aff),abs(Ht(z(aff))),'k+-'); 
plot(f(aff),abs(p(aff)),'r');
xlabel("frequence [Hz]");
ylabel("module en echelle lineaire")
legend(["forwar";"backward";"bilineaire";"derivateur continu"],"location","north")

dBde = @(g) 20*log10(abs(g));

semilogx(f(aff),dBde(Hf(z(aff))),'g+-'); hold on;
semilogx(f(aff),dBde(Hb(z(aff))),'bo-'); 
semilogx(f(aff),dBde(Ht(z(aff))),'k+-'); 
semilogx(f(aff),dBde(p(aff)),'r');
xlabel("frequence [Hz]");
ylabel("module dB")
legend(["forwar";"backward";"bilineaire";"derivateur continu"],"location","northwest")

argDeg = @(g) (180/pi*arg(g));

plot(f(aff),argDeg(Hf(z(aff))),'g-'); hold on;
plot(f(aff),argDeg(Hb(z(aff))),'b-'); 
plot(f(aff),argDeg(Ht(z(aff))),'k.-'); 
plot(f(aff),argDeg(p(aff)),'r');grid
xlabel("frequence [Hz]");
ylabel("module dB")
legend(["forwar";"backward";"bilineaire";"derivateur continu"],"location","southwest")

N = Fe/Df;
k=0:(N-1);
stem(k,ifft(Hf(z(1:(Fe/Df)))),'g'); hold on;
stem(k,ifft(Hb(z(1:(Fe/Df)))),'b'); 
legend("forward","backward");

k=k-N/2;
stem(k,fftshift(ifft(Hf(z(1:(Fe/Df))))),'g'); hold on;
stem(k,fftshift(ifft(Hb(z(1:(Fe/Df))))),'b'); 
legend("forward","backward");

stem(k,fftshift(ifft(Ht(z(1:(Fe/Df))))),'k'); hold on;
ht = 2/Te*(k>=0) .* (2*(-1).^k -(k==0)) ;
stem(k,ht,'r');
legend("Rip par TFD avec repliement","Rip analytique par TFSD sans repliement","location","northwest")

k=0:20 ;
x = (k==0) ; % impulsion unité (vrai = 1, faux = 0)
y = zeros(1,21);

y(1) = x(1)/Te*2 ; % première itération

for id=2:length(k)-1 
    y(id) = -y(id-1) + (x(id)-x(id-1))/Te*2 ;
end
stem(k,y,'r'); hold on



pkg load control %% pour octave uniquement, inutile avec matlab

% si tf reçoit un troisième argument alors c'est Te
%    et tf contruit un système discret
% coef des polynomes en z ! pas z^-1
backward=tf([1 -1]/Te , [1],Te) 
        %   (z -1)/Te /  1   = (z-1)/Te = Hb

forward=tf([1 -1]/Te ,[1 0],Te) 
        %  (z -1)/Te / z     = (1-z^-1)/Te = Hf

tustin= tf(2*[1 -1]/Te , [1 1],Te) 
        %  2 (z -1)/Te / (z+1)     = Ht

% système continu celui là!
derivateur = tf([1 0],[1])

bode(backward,forward,tustin,derivateur)

impulse(forward,tustin,T=k*Te)
disp("ça passe pour forward et tustin")
disp("\n en revanche pour backward...\n")
impulse(backward,tustin,T=k*Te)


wn=1000*2*pi;
zeta = 0.1; 
second=tf([wn^2],[1 2*zeta*wn wn^2])
bode(second)

wn=2*pi*10;
zeta = 0.1; 
second=tf([wn^2],[1 2*zeta*wn wn^2])
Fe=100;Te=1/Fe;
Gt=c2d(second,Te,'bilinear')
Gf=c2d(second,Te,'zoh')
pzmap(Gt); hold on;
z=exp(i*2*pi*(0:1:100)/100);
plot(real(z),imag(z))

bode(Gt,Gf,second,W=2*pi*(7:0.01:12))

help bode


