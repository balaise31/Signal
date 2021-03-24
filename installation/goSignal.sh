#!/bin/bash
. utiles.sh

DEPOT="/home/pacco/Documents/gitens/Signal/"

if [ -e $DEPOT ]; then
    
    cd $DEPOT/installation
    echo "initialisation de l'environnement Python qui peut durer qq secondes..."
    source ./activer
    echo
    echo "... je vous l'avias dit"
    
    echo "lancement du notebook jupyter"
    cd ..
    jupyter-notebook
else
    echo "Le répertoire $DEPOT n'existe pas"
    echo "soit vous l'avez déplacé soit vous n'avez pas fait l'init"
    echo "Il faut lancer le script install_de_git.sh"
    read -p "Press enter to continue"
fi
