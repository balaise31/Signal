%% Affiche 4 graphiques en 2x2
% A gauche le primal temporel      A droite le dual fréquentiel
% En haut la partie réelle 
% En bas  la partie imaginaire
%
%  xPrimal,labelXprimal : valeurs en abscisse du primal, et titre de l'axe (string)
%  ysPrimal,labelYprimal : idem pour les ordonnées
%  xDual,labelXdual,ysDual,labelYdual: idem pour le dual (fréquentiel)
%  legendeSignaux : tableau de 4 strings donnant la description des 4 signaux
%  primalDiscret : Booléen indiquant si le primel (temps) est discret ou continu
%  dualDiscret : idem pour les fréquence discrète ou pas...
function [] = plot_dual(xPrimal,labelXprimal,
                            ysPrimal,labelYprimal,
                            xDual,labelXdual,
                            ysDual,labelYdual,
                            legendeSignaux,
                            primalDiscret,dualDiscret)
%% on affiche le temporel
subplot(221);
axis(axis*1.1)
if (primalDiscret)
    stem(xPrimal',real(ysPrimal'));
else
    plot(xPrimal',real(ysPrimal'));
end 
legend(legendeSignaux)
xlabel(labelXprimal);
ylabel(labelYprimal);
title("Primal partie Reelle");
axis(axis*1.1)


subplot(222);
if (dualDiscret)
    stem(xDual',real(ysDual'));
else
    plot(xDual',real(ysDual'));
end
xlabel(labelXdual);
ylabel(labelYdual);
title("Dual partie Reelle");
axis(axis*1.1)


subplot(223);
title("Primal partie Imaginaire");
if (primalDiscret)
    stem(xPrimal',imag(ysPrimal'));
else
    plot(xPrimal',imag(ysPrimal'));
end
xlabel(labelXprimal);
ylabel(labelYprimal);
title("Primal partie Imaginaire");
axis(axis*1.1)

subplot(224);
if (dualDiscret)
    stem(xDual',imag(ysDual'));
else
    plot(xDual',imag(ysDual'));
end
xlabel(labelXdual);
ylabel(labelYdual);
title("Dual partie Imaginaire");
axis(axis*1.1)