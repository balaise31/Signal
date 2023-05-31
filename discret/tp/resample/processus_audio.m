
function self = processus_audio(fichier_in="in.wav", C=1)
	global  x  y  k  l;
	k=1;
	l=1;
	[s, self.Fe]=audioread(fichier_in);
	if (C==-1)
		self.C = min(size(s));
		self.N = max(size(s));
	else 
		self.C = 1;
		x = (s(:,1)+s(:,2))/2;
		self.N = max(size(x));
	end
	
	self.ADC_get_conv = @() ADC_get_conv(self);
	self.DAC_set_output = @(val) DAC_set_output(self, val);
	self.timed_ADC_start = @(handler_it = @it_par_defaut) timed_ADC_start(self, handler_it);
	self.save_to_wav = @(fich, decim) save_to_wav(self, fich, decim);
	
end

function timed_ADC_start(self, handler_it)
	k=1;
	N10=floor(self.N/10);
	for dix = 1:10
		for j = 1:N10;
			handler_it();
			k=k+1;
		end
		disp(sprintf("%d % calculés",dix*10))
	end
	for j=k:self.N
		handler_it();
	end	
end	

function val = ADC_get_conv(self)
	global  x  k;
	val = x(k);
	k=k + 1; 
end

function DAC_set_output(self,val)
	global  y l;
	y(l) = val;
	l = l +1; 
end

function save_to_wav(self, fich, decim)
	global y;
	audiowrite(fich,y(1:decim:end), (self.Fe/decim));
	sprintf("Audio à %.1f kHz => %s",self.Fe/decim/1000,fich)
end

function it_par_defaut()
	print("Interruption par defuat");
end	