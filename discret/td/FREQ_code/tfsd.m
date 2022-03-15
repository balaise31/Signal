function [dual] = tfsd(primal,k,f,Te)

% Onde d'analyse
W= @(f,k) exp(i*2*pi*f*k*Te) ;

% tfsd en un point par produit scalaire
tfsd = @(s,f) sum(s .* conj(W(f,k))); 

for n=1:length(f)
    frequ=f(n);
    dual(n) = tfsd(primal,frequ);
end

