function [] = plot_dual(xPrimal,labelXprimal,
                            ysPrimal,labelYprimal,
                            xDual,labelXdual,
                            ysDual,labelYdual,
                            legendeSignaux,
                            primalDiscret,dualDiscret)
%% on affiche le temporel
subplot(221);
if (primalDiscret)
    stem(xPrimal',real(ysPrimal'));
else
    plot(xPrimal',real(ysPrimal'));
end 
legend(legendeSignaux)
xlabel(labelXprimal);
ylabel(labelYprimal);
title("Primal partie Reelle");

subplot(222);
if (dualDiscret)
    stem(xDual',real(ysDual'));
else
    plot(xDual',real(ysDual'));
end
xlabel(labelXdual);
ylabel(labelYdual);
title("Dual partie Reelle");

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

subplot(224);
if (dualDiscret)
    stem(xDual',imag(ysDual'));
else
    plot(xDual',imag(ysDual'));
end
xlabel(labelXdual);
ylabel(labelYdual);
title("Dual partie Imaginaire");
