#!/bin/bash

INIT=~/.local/bin/initialise_conda.sh

if [ -e $INIT ]; then
    if [ -e ~/Signal ]; then
	
	cd $HOME/Signal
	echo "initialisation de conda qui peut durer qq secondes..."
	source $INIT
	echo
	echo "... je vous l'avias dit"

	echo "activation de l'environnement  Octave"
	conda activate Octave

	echo "lancement du notebook jupyter"
	jupyter-notebook
    else
	echo "Le répertoire $HOME/Signal n'existe pas"
	echo "soit vous l'avez déplacé soit vous n'avez pas fait l'init"
	echo "Il faut lancer le script install_de_git.sh"
	read -p "Press enter to continue"
    fi
else
    echo "Le fichier d'init $HOME/.initialise_conda.sh n'existe pas"
    echo "soit vous l'avez déplacé soit vous n'avez pas fait l'init"
    echo "Il faut lancer le script install_de_git.sh sur commetud"
    read -p "Press enter to continue"
fi

