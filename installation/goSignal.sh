#!/bin/bash
. utiles.sh
. config.txt

lance_notebook () {
    if [ -e $DEPOT ]; then
	
	cd $DEPOT/installation
	source ./activer
	
	echo "lancement du notebook jupyter"
	cd ..
	jupyter-notebook
    else
	echo "Le répertoire $DEPOT n'existe pas"
	echo "soit vous l'avez déplacé soit vous n'avez pas fait l'installation..."
	echo "Il faut lancer le script $SCRIPT_INSTALL"
	read -p "Press enter to continue"
    fi
}

lance_notebook
