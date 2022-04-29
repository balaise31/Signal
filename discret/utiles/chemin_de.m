function [racine, relatif]=chemin_de(fichier, depot="Signal")
    racine = pwd; 
    racine = [racine(1:(findstr(racine,depot)+length(depot)))]
    