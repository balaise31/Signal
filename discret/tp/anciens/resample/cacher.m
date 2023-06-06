clear all;
close all;

fich = "styx.wav";
fich_cache = "scatt.wav"
fm = 40e3;

[y, Fe]=audioread(fich);
[yc, Fe]=audioread(fich_cache);
y=y';
yc=yc';
[C,N] = size(y);
[Cc,Nc] = size(yc);
C = min(C, Cc);
N = min(N,Nc);
y=y(1:C,1:N);
%y=(y-mean(y))./max(y')';
yc=yc(1:C,1:N);
%yc=(yc-mean(yc))./max(yc')';
yc = yc-y;
t=0:(N-1); t=t/Fe;
yc = yc.*cos(2*pi*fm*t);
Y=fft(y);
Yc = fft(yc);
n=0:(N-1);
plot(n*Fe/N,20*log10(abs(Yc(1,:))),'r');hold on;
plot(n*Fe/N,20*log10(abs(Y(1,:))),'b'); hold on;



fichout = [fich(1:(end-4)), "_", fich_cache(1:(end-4)),sprintf("_mod%.0fkHz",fm/1000), ".wav"];
fichout="sail_away.wav"
audiowrite(fichout,(y+yc)',Fe) ;
