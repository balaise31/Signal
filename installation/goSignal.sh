#!/bin/bash

if [ -e ~/.initialise_conda.sh ]; then
    if [ -e ~/tp_signal ]; then
	
	cd $HOME/tp_signal
	echo "initialisation de conda qui peut durer qq secondes..."
	source $HOME/.initialise_conda.sh
	echo
	echo "... je vous l'avias dit"

	echo "activation de l'environnement  Octave"
	conda activate Octave

	echo "lancement du notebook jupyter"
	jupyter-notebook
    else
	echo "Le répertoire $HOME/tp_signal n'existe pas"
	echo "soit vous l'avez déplacé soit vous n'avez pas fait l'init"
	echo "Il faut lancer le script install_signal.sh sur commetud"
	read -p "Press enter to continue"
    fi
else
    echo "Le fichier d'init $HOME/.initialise_conda.sh n'existe pas"
    echo "soit vous l'avez déplacé soit vous n'avez pas fait l'init"
    echo "Il faut lancer le script install_signal.sh sur commetud"
    read -p "Press enter to continue"
fi

