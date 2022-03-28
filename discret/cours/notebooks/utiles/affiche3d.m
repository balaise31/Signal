%% Fonction affiche3d(t,s,j,W)
% t,s : le signal complexe continu (t vecteur temps, s vecteur de s(t))
% j,W : vecteur discret complexe  (j le temps, W vecteur de W(j))
% 
% s et W peuvent avoir le même nombre de colonnes
% et seront affichés comme une famille de signaux en couleurs
%
function affiche3d(t,s,j,W)
    couleurs = ['k' ; 'r' ; 'g'; 'b' ];
    N = size(s)(2);
    couleurs = couleurs((5-N):end);
    subplot(2,2,2)
    for id_n = 1:N
        plot3(t,real(s(:,id_n)),imag(s(:,id_n)),couleurs(id_n)); 
        hold on; box off;
        plot3(j,real(W(:,id_n)),imag(W(:,id_n)),[couleurs(id_n),'o']);
    end
    xlabel('temps')
    ylabel('reel');
    zlabel('imaginaires')
 
 subplot(2,2,1);
    for id_n = 1:N
        zoo = 1 + 0.1* j(id_n);
        plot(zoo*real(s(:,id_n)),zoo*imag(s(:,id_n)),couleurs(id_n));
        hold on; box off;
        plot(zoo*real(W(:,id_n)),zoo*imag(W(:,id_n)),[couleurs(id_n),'o']);
    end
    xlabel('reel')
    ylabel('imaginaire');
    
    subplot(2,2,4);
    for id_n = 1:N
        plot(t,real(s(:,id_n)),[couleurs(id_n),'--']); hold on; box off;
        stem(j,real(W(:,id_n)),couleurs(id_n));
    end
    xlabel('temps')
    ylabel('reel');
    
    subplot(2,2,3);
    for id_n = 1:N
        plot(t,imag(s(:,id_n)),[couleurs(id_n),'--']); hold on; box off;
        stem(j,imag(W(:,id_n)),couleurs(id_n));
    end
    xlabel('temps')
    ylabel('imaginaire');
    
end
