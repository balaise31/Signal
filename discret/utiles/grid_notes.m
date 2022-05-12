function [] = grid_notes ()
	
	%Récupère l'axe des fréquences
	LA4 = 440 ;
	DO4 = LA4/2^(9/12);

    Tons=["C";"D";"E";"F";"G";"A";"B"];
	Tons=["Do";"Re";"Mi";"Fa";"So";"La";"Si"];
	Ecarts=[  2  , 2  , 1  , 2  ,  2  ,  2  , 1];
	
    marge=0.1;
	ylims=ylim() ;
    dy = (ylims(2)-ylims(1))*marge;
	ylims=ylims + dy*[-1 1];
	
    xlims=xlim();
	octave=max(-2,floor(log2(xlims(1)/DO4)));
    nb_demis = octave*12;
    degre=1;
    freq = DO4 * 2^(nb_demis/12);
	while (freq < xlims(2))
        if (freq > xlims(1))
            if (degre==1)
                text(freq,ylims(2)+2*dy,["DO-",num2str(octave+4)]);
                line([freq freq], ylims+dy*[0 2], "linewidth", 2);
            elseif (mod(degre,2) == 1)
                text(freq,ylims(2),Tons(degre,:));
                line([freq freq], ylims+dy*[1 1]);
            else	
                text(freq,ylims(1),Tons(degre,:));
                line([freq freq], ylims+dy*[-1 -1]);
            end	
		end
        nb_demis = nb_demis + Ecarts(degre);
        degre = degre + 1;
        freq = DO4 * 2^(nb_demis/12);
        if (degre == 8)
            octave = octave + 1;
            degre = 1;
            %line([freq*1.1, freq*2*0.9],ylims(2)+dy*[1, 1]);
        end
      
	end
end

