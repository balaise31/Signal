#!/bin/bash

lance_bash () {
    echo -e "Copiez-collez la commande ci-dessus en sélectionnant avec la souris et en cliquant avec le bouton du milieu"
    echo 
    echo "Puis relancez ce script avec la commande:"
    echo
    echo "    "$(printf "%q" "$0")
    echo
    echo "_________________________________________________"
    echo "Ne tenez pas compte du message ci-dessous"
    /bin/bash
    exit
}

echo "_____________________________________________________"
echo "Normalement il suffit de quelques lignes de commandes"
echo "     source ~/.initialise_conda.sh"
echo "puis"
echo "     conda activate Octave"
echo "puis"
echo "     cd ~/tp_signal"
echo "puis"
echo "     jupyter-notebook"
echo "_____________________________________________________"
echo
echo "Tentez de les lancer toutes (tapez le debut puis appuyez deux fois rapidement sur tab pour completer automatiquement le reste)"
echo "ou faites pas à pas ce qui est dit ci-dessous c'est le message pour les non geek-e-s :"
echo
echo
echo "_______________version guidée_____________________"
if (( CONDA_SHLVL > 0 )) ; then
    if [[ CONDA_DEFAULT_ENV = "base" ]] ; then
	echo " Là vous êtes dans l'nevironnement de base de conda (d'où le (base) dans le prompt"
	echo " Il faut charger l'environnement Octave de conda avec :"
	echo
	echo "      conda activate Octave"
	echo
	lance_bash
    else
	echo "Pour finir, lancez jupyter notebook avec :"
	echo
	echo "   jupyter-notebook"
	echo
	lance_bash
    fi
fi

if [ -e ~/.initialise_conda.sh ]; then
    echo "D'abord chargez l'environnement conda :"
    echo  "   source ~/.initialise_conda.sh"
    echo "La commande prends quelques secondes à s'exécuter..."
    lance_bash
else
    echo "Vous n'avez pas configuré conda une seule fois de votre vie !"
    echo "Il faut lancer le script install_signal.sh sur commetud"
    read -p "Press enter to continue"
fi

