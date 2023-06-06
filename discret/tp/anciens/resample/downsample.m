clear all;
close all;

fich = "../../usap/usap_96kHz.wav";
fich = "../../usap/usap_96kHz_mod40kHz.wav";
fich = "../../usap/toulouse_usap_mod40kHz.wav";
fich = "sail_away.wav"
M=12;
[y, Fe]=audioread(fich);
N=length(y);
N = floor(N/M)*M;
y=y';
y=y(:,1:N);
[C,N] = size(y);

ydo = y(:,1:M:end);

Y=fft(y);
Ydo = fft(ydo);
n=0:(N-1);
ndo = 0:(N/M-1);
plot(ndo*Fe/N,abs(Ydo));hold on;
plot(n*Fe/N, abs(Y)); hold on;

figure()

t=0:(N-1); t=t/Fe;
tdo = 0:(N/M-1); tdo=tdo/Fe*M;

plot(t,y,'b+-'); hold on;
plot(tdo,ydo,'ro-')

fichout = [fich(1:(end-4)), sprintf("_%.0fkHz",Fe/M/1000), ".wav"]
audiowrite(fichout,ydo',Fe/M) ;
