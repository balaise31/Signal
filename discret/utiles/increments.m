%% increments(f, k)
%___________________________________________________
% Dessine l'onde complexe de fréquence normalisée f
% dans le plan complexe avec le cercle unité,
% affiche les instants k de chaques échantillons
%____________________________________________________
% f : fréquence normalisée  
% k : vecteur des instants à afficher 
% [phaseur=1] : optionnel, phaseur de l'onde
%____________________________________________________
% par exemple
% f=1/4
% k=0:5
% increments(f,k)
% title("Onde de periode 4 pour les 6 premiers echantillons")

function increments(f, k, phaseur=1)
    p = phaseur;
    q = exp(i*2*pi*f);
    theta = 0:0.1:2.01*pi;
    plot(cos(theta),sin(theta),'b--'); hold on;
    plot(real(p*q.^k),imag(p*q.^k),'ro');
    if (abs(angle(q))<0.001)  
        if abs(f) >=1
            text(-1,-1.3*abs(p),sprintf("phase q=%+.1f degres", round(f*360)))
        end
        text(-0.5,-0.2,sprintf("inc. = 0 "))
        periode=1;
    else
        if abs(f) >=1
            text(-1,-1.3*abs(p),sprintf("phase q=%+.1f degres", round(f*360)))
        end
        text(real(p*sqrt(q)*1.05),imag(p*sqrt(q)*1.05),sprintf("inrement %+.1f deg.  ", angle(q)*180/pi))
        periode = 2*pi/abs(angle(q));
    end;
    for kk=k
        polaire = p*q^kk - 0.2*p*q^kk + 0.4*floor(kk/periode)*p*q^kk ;
        text(real(polaire)-0.07,imag(polaire),sprintf('k=%d',kk));
    end
    xlabel("real");
    ylabel("imag");
    axis([-1,1,-1,1]*1.5*abs(p),"square"); 
    box off;
    grid off;
end
