clear all
close all
clc

%% Fonctions usuelles

eps = 1e-6;             % Attention aux comparaisons de nombre flottants
u = @(t) (t>=0-eps);    % échelon sur [0, +oo]
porte = @(t,L) u(t+L/2)-u(t-L/2); % porte sur [-L/2, L/2[ <- exclue !

dirac = @(t) abs(t)<1e-6;


function []=plot_rr(t,y)
    plot(t,y)
    return
end