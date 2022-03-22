%% Calcule la TFSD d'un signal primal[k]
%  et renvoie les valeurs de la fonction duale(f)
%
%               TFSD
%  primal[k] ----------> dual(f)
%
% primal : vecteur des valeurs aux instants k
% k : vecteur entier des instant k 
% f : vecteur réel des fréquences à calculer
% Te : période d'échantillonnage du primal

function [dual] = tfsd(primal,k,f,Te)

% Onde d'analyse W(f,k)
W= @(f,k) exp(i*2*pi*f*k*Te) ;

% tfsd en un point par produit scalaire
tfsd_de = @(s,f) sum(s .* conj(W(f,k))); 

% calcul pour toutes valeur f demandée
for n=1:length(f)
    frequ=f(n);
    dual(n) = tfsd_de(primal,frequ);
end

