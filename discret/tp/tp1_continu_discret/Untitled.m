clear all;
close all;


[Y,Fs]=audioread("anna_a.wav");
N=length(Y);
t=((1:N)-1)/Fs;
plot(t,Y);
title("Signal quelconque !")


Df=Fs/N;
f=0:Df:Fs-Df;
mag = abs(fft(Y(:,1)'));
semilogx(f(2:end),20*log10(mag(2:end)));
[amp, ifmax] = max(mag) ;
hold on;
fmax=(ifmax-1)*Df;
plot(fmax,20*log10(amp),'or');

for i=2:6
	plot(i*fmax,20*log10(mag(round(i*fmax/Df))),'+r');

end

harmo=4;
wn=2*pi*harmo*fmax;
p=j*2*pi*f;
zeta=0.01;
H_de_p=wn^2./(p.^2+2*zeta*wn*p+wn^2);
semilogx(f(2:end),20*log10(abs(H_de_p(2:end))),'g');
	
Hfilt = fft(Y(:,1)').*H_de_p;
yfilt=ifft(Hfilt);
audiowrite('anatone.wav',yfilt,Fs)
