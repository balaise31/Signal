#!/bin/bash

lance_bash () {
    echo -e "Ne tenez pas compte du message en dessous et allez- y !"
    /bin/bash
    exit
}

echo "_____________________________________________________"
echo "Normalement il suffit de quelques lignes de commandes"
echo "     source ~/.initialise_conda.sh"
echo "puis"
echo "     conda activate Octave"
echo "puis"
echo "     cd ~/Signal"
echo "puis"
echo "     jupyter-notebook"
echo "_____________________________________________________"
echo
echo "Tentez de les lancer toutes (tapez le debut puis appuyez deux fois rapidement sur tab pour completer automatiquement le reste)"

lance_bash
