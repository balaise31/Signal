%% Fonction d'intérruption déckenchée 
% quand l'ADC vient de terminer une conversion

function ADC_conv_interrupt()
	global audio;				% pour accéder à l'ADC et DAC
	global xm K ;           % pour accéder aux variables globales
	
	x = audio.ADC_get_conv();			% x = x(k)
	
	%xm = x(k-1) pusique mémorisé 
	audio.DAC_set_output(x*K);  % un gain y(k) = K.x(k)
	xm=x;  %on mémorise x pour la prochaine IT
	
end
