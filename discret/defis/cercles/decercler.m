clear all; 
close all;
clc;

% Affichage des spectres
for im=1:4
	[c{im}, MAP, ALPHA] = imread (["circle",num2str(im),".png"]);
	c{im}=sum(c{im},3);
%	c{im}=c{im}-mean(mean(c{im}));
	[n,m]=size(c{im});
	C{im} = fft2(c{im},2*n,2*m);
	S{im} = abs(C{im})/n/m;
	figure(im);
	subplot(221);
	imshow(real(ifft2(C{im})));
	title("image depart (padding)")
	subplot(222);
	imshow(fftshift(S{im}));
	title("fft image")
end	

x=0:(m-1);
y=(0:(n-1))';
xy = y*x;

cercle = @(r,a,x,y) exp(-abs(r^2-(x.^2+y.^2))/(a)^2)*255;

%recherche du meilleur cercle
idr=1;
for r=10:2:60
	ray(idr)=r;
	h = (cercle(r,6,x-m/2,y-n/2)*255);
	H=fft2(h,2*n,2*m);
	for im=1:4
		corr = abs(real(ifft2(H.*C{im})));
		tmax(idr,im)=max(max(corr));
	end
	idr ++;
end	
[maxicor, idrmax] = max(tmax);




for im=1:4
	h = (cercle(ray(idrmax(im)),6,x-m/2,y-n/2)*255);
	H=fft2(h,2*n,2*m);
	figure(im);
	subplot(224);
	corr = ifft2(H.*C{im})/n/m;
	if (sum(sum(real(corr).^2)) > 1e6 * sum(sum(imag(corr).^2)) )
		corr=real(corr);
	else
		disp("PRobleme imaginaire")
	end
	maxi = max(max(corr));
	mini = min(min(corr));
	printf("Max= %f min =%f rayon=%f\n",maxi, mini,ray(idrmax(im)));
	imshow(corr, [mini, maxi] );
	title("fonction de correlation");
	subplot(223)
	plot(ray,tmax(:,im)); hold on;
	plot(ray(idrmax(im)),tmax(idrmax(im),im),'+r');
	title("pic correlation vs rayon")
end	

figure

h = (cercle(20,6,x-m/2,y-n/2)*255);
H=fft2(h,2*n,2*m);
corr = ifft2(H.*C{1})/n/m;
if (sum(sum(real(corr).^2)) > 1e6 * sum(sum(imag(corr).^2)) )
	corr=real(corr);
else
	disp("PRobleme imaginaire")
end
maxi = max(max(corr));
mini = min(min(corr));
imshow(corr, [mini, maxi] );
title("Dans la tête de Homer !")