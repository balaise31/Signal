clear all;
close all;

u = @(x) (x>0);
porte = @(a,b,x) (x>a).*(x<b) ;
constante = @(x) (x==x);

[Y,Fs]=audioread("anna_a_mono.wav");
%[Y,Fs]=audioread("moi_u_mono.wav");
Y=Y(:,1);
rms = sqrt(Y'*Y);

N=length(Y);
t=((1:N)-1)/Fs;
plot(t,Y);
title("Signal quelconque !")
figure

Df=Fs/N;
f=0:Df:Fs-Df;
fmin=440/4; %LA2
fmax=440*8; %LA7
aff= floor(fmin/Df):ceil(fmax/Df) ;

mag = abs(fft(Y(:,1)'));
subplot(211)
ax=semilogx(f(aff),20*log10(mag(aff))); 
hold on;
octaves=afficher_grille_notes();
subplot(212)
ax=plot(f,20*log10(mag)); 
hold on;
afficher_grille_notes(octaves);

subplot(211)
[amp, ifond] = max(mag) ;
fond=(ifond-1)*Df;

plot(fond,20*log10(amp),'or');
for i=2:6
	plot(i*fond,20*log10(mag(round(i*fond/Df))),'+r');
end

p=j*2*pi*f;
demiton = 2^(1/12);
harmo=6;
fmin = fond*harmo/demiton;
fmax = fond*harmo*demiton;
gain=100;
H_de_p = gain*porte(fmin,fmax,f) + gain*porte(Fs-fmax,Fs-fmin,f)+constante(f);
Hfilt = fft(Y(:,1)').*H_de_p;
yfilt=real(ifft(Hfilt));
yfilt = yfilt/sqrt(yfilt*yfilt')*rms;
semilogx(f(aff),20*log10(abs(H_de_p(aff))),'r');
semilogx(f(aff),20*log10(abs(Hfilt(aff))),'g');
subplot(212)
plot(f,20*log10(abs(H_de_p)),'r');
plot(f,20*log10(abs(Hfilt)),'g');


audiowrite('anatone.wav',yfilt,Fs)
