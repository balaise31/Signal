%% Fonction d'intérruption déckenchée 
% quand l'ADC vient de terminer une conversion

function ADC_conv_interrupt()
	global audio;				% pour accéder à l'ADC et DAC
	global xm ym a1 a0 b1 b0 ;           % pour accéder aux variables globales
	
	x = audio.ADC_get_conv();			% x = x(k)
	
	%xm = x(k-1) pusique mémorisé
        %Gd(z) (b0 + b1 .* z ) ./ (a0 + a1*z ) ;
        y = -a0 * ym + b1 * x + b0*xm;
        y = y/a1;
	audio.DAC_set_output(y);  % un gain y(k) = K.x(k)
	xm=x;  %on mémorise x pour la prochaine IT
	ym=y;
end
