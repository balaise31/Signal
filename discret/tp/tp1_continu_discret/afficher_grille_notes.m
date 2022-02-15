function [octaves_utilisees] = afficher_grille_notes (octaves=666)
	
	%Récupère l'axe des fréquences
	La4 = 440 ;
	La3 = La4/2;
	Tons=["C";"D";"E";"F";"G";"A";"B"];
	Tons=["Do";"Re";"Mi";"Fa";"So";"La";"Si"];
	Ecarts=[  2  , 2  , 1  , 2  ,  2  ,  2  , 1];
	demiton = 2^(1/12);
	nb_demi_tons=3	; % du La3 au Do4 = 3 demitons
	for i=1:7
		Freqs4(i)=La3*demiton^(nb_demi_tons);
		nb_demi_tons = nb_demi_tons + Ecarts(i);
	end
	marge=0.1;
	
	ylims=ylim() ;
	ylims=ylims + (ylims(2)-ylims(1))*marge*[1 -1];
	
	if octaves==[666]
		xlims=xlim();
		xlims=xlims + (xlims(2)-xlims(1))*marge*[1 -1];
	
		octaves=log2(xlims/Freqs4(1));
		octaves=ceil(octaves(1)):ceil(octaves(2));
	end
	
	for octave = octaves
		for i=1:7
			if (i==1)
				text(Freqs4(i)*2^(octave-4),ylims(2),[Tons(i,:),num2str(octave)]);
			elseif (mod(i,2) == 1)
				text(Freqs4(i)*2^(octave-4),ylims(2),Tons(i,:));
			else	
				text(Freqs4(i)*2^(octave-4),ylims(1),Tons(i,:));
			end	
			%text(Freqs4(i)*2^(octave-4),ylims(1),num2str(octave));
			line([Freqs4(i)*2^(octave-4) Freqs4(i)*2^(octave-4)], ylims)
		end
	end
octaves_utilisees = octaves;	
return 


