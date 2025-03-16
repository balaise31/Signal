clear all;
close all;

fich = "da_funk.wav";
fich_cache = "scatt.wav"
fm = 20e3;


[y, Fe]=audioread(fich);
[yc, Fe]=audioread(fich_cache);
y=y';
yc=yc';
y=sum(y,1);
yc=sum(yc,1);
[C,N] = size(y);
[Cc,Nc] = size(yc);

C = min(C, Cc);
N = min(N,Nc);
y=0.1*y(1:C,1:N);
%y=(y-mean(y))./max(y')';
yc=yc(1:C,1:N);
%yc=(yc-mean(yc))./max(yc')';
yc = yc;
t=0:(N-1); t=t/Fe;
yc = yc.*cos(2*pi*fm*t);
Y=fft(y);
Yc = fft(yc);
n=0:(N-1);
plot(n*Fe/N,20*log10(abs(Yc(1,:))),'r');hold on;
plot(n*Fe/N,20*log10(abs(Y(1,:))),'b'); hold on;



fichout = [fich(1:(end-4)), "_", fich_cache(1:(end-4)),sprintf("_mod%.0fkHz",fm/1000), ".wav"];
fichout="da_fuck.wav"
audiowrite(fichout,(y+yc)',Fe) ;
