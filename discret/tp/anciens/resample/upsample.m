clear all;
close all;

fich = "../../usap/usap.wav";
M=12;
[y, Fe]=audioread(fich);

y=y';
[C,N] = size(y)

Ndemi= ceil(N/2);
Y=fft(y);
Ypad = [Y(:,1:Ndemi)*M, zeros(C,N*(M-1)), Y(:,(Ndemi+1):end)*M];
%Ypad = [Y,Y];
n=0:(N-1);
nup = 0:(N*M-1);
plot(nup*Fe/N,abs(Ypad));hold on;
plot(n*Fe/N, abs(Y)); hold on;

figure()
yup = real(ifft(Ypad));

t=0:(N-1); t=t/Fe;
tup = 0:(N*M-1); tup=tup/Fe/M;

plot(t,y,'b+-'); hold on;
plot(tup,yup,'ro-')

fichout = [fich(1:(end-4)), sprintf("_%.0fkHz",Fe*M/1000), ".wav"]
audiowrite(fichout,yup',Fe*M) ;
