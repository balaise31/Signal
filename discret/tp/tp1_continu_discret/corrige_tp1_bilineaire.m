clear all;
close all;
clc;

K=1
wn=100;
zeta=0.1;
we=1000;
Fe=we/2/pi;
Te=1/Fe;


b = [1 2 1] *K*wn^2*Te^2 ;
a = [ (4+4*zeta*wn*Te+(wn*Te)^2)  , 2*(wn*Te)^2-8 , 4-4*zeta*wn*Te+(wn*Te)^2 ] ;
b/a(1)
a/a(1)


pkg load control

second = tf (K*[wn^2], [1 2*zeta*wn wn^2])
secondo = tf(b,a,Te)
secondon = c2d(second,Te,"tustin")

bode(second,secondo,secondon);
figure ;

%% sans les outils avec le cerveau
N=1000;         		 % 
f = logspace(-1,log10(Fe),N);  % 1024 points de 0 à Fe espacés en log
w=2*pi*f;
p=i*w;
z=exp(Te*p);

G=@(x,wn) (K*wn^2./(x.^2 + 2*zeta*wn*x + wn^2)) ;
Gc = G(p,wn) ;
Gz = G(2/Te*(z-1)./(z+1),wn) ;
dBde=@(g) 20*log10(g);

semilogx(w,dBde(Gc),'k');
grid on;
hold on; 
semilogx(w,dBde(Gz),'g');

wncomprime= 2/Te*atan(wn*Te/2)
semilogx(wncomprime,dBde(G(i*wncomprime,wn)), 'og');



%% application d'un prewarp
wnprecomp = 2/Te*tan(wn*Te/2)
Gzprecomp=G(2/Te*(z-1)./(z+1),wnprecomp) ;
semilogx(w(aff),dBde(Gzprecomp(aff)),'r');
