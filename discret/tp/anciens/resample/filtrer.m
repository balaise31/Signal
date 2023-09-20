clear all;
close all;



global audio;
global xm ym a1 Kp ;

audio = processus_audio("sail_away.wav");
Fe = audio.Fe; Te= 1/Fe;

xm=0;
ym = 0 ;
fc = 4000;
wc=2*pi*fc;
wcpre = 2/Te*tan(2*pi*wc/2);
taupre = 1/wcpre
tau = 1/wc
a1 = (Te-2*tau)/(Te+2*tau)
Kp = 1 * Te/(Te+2*tau);

f=0:10:2*Fe;
w=2*pi*f;
p=j*w;
z=exp(i*2*pi*f*Te);
plot(f,20*log10(1./(1+tau*p)));hold on;
s = 2/Te * (z-1)./(z+1);
plot(f,20*log10(1./(1+tau*s)),'r');

disp("on calcule")
audio.timed_ADC_start(@ADC_conv_interrupt)
audio.save_to_wav(fich="out.wav", decim=12)

