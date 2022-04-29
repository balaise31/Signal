%% Affiche un diagramme de bode à partir d'une fonction de transfert
%
%  freq = "LinFreq", "LogFreq", "LinPuls", "LogPuls", "LinNorm", "LogNorm"
%

function [graphe] = mon_bode(transfert,f_ou_w=10.^(-1:0.1:4),Fe=1,freq="LinFreq",gain="dBs",phase="degres")
  if (freq(1:3)=="Lin")
    plote = @ plot  ;
  else
    plote = @ semilogx;
  end
  if (freq(4:7)=="Freq")
    etiqx="Frequence [Hz]";
    x=f_ou_w;
  elseif (freq(4:7)=="Puls")
    x=f_ou_w;
    etiqx="Pulsation [rad/s]";
  else
    x =f_ou_w;
    etiqx="Frequence Normalisee [1 <-> Fe]";
  end

  if (gain="dBs")
  subplot(211);
  plote(x,x); hold on;
  xlabel(etiqx);
  
  subplot(212);
  plote(x,x); hold on;
  xlabel(etiqx);
  graphe=gcf() ;
end

