#!/bin/bash

lance_bash () {
    echo -e "Faites le copiez-collez en sélectionnanat avec la souris et en cliquant avec le bouton du milieu"
    echo 
    echo "Puis relancez ce script avec :"
    echo "source $0"
    
    /bin/bash
    exit
}


creer_initialise_conda () {
    touch ~/.bashrc
    mv ~/.bashrc ~/.bashrc.vieux
    conda init bash
    mv ~/.bashrc ~/.initialise_conda.sh
    mv ~/.bashrc.vieux ~/.bashrc

    echo -e "Modification du .bashrc pour ajouter l'alias goConda"
    echo 'alias goConda="source ~/.initialise_conda.sh"'>>~/.bashrc    
}

if $CONDA_SHLVL>0 ; then
    echo "Lancez jupyter notebook avec :"
    echo "   jupyter-notebook"
    lance_bash       
fi

if [ -e ~/.initialise_conda.sh ]; then
    echo "D'abord chargez l'environnement conda :"
    echo  "   source ~/.initialise_conda.sh"
    lance_bash
else
    echo "Vous n'avez pas configuré conda une seule fois de votre vie !"
    echo "Je m'en occupe"
    creer_initialise_conda
fi

