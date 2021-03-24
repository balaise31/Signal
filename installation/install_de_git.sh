#!/bin/bash

. utiles.sh

OK=$KISS
DEAD=$INTERDIT

if [ "$1" = "venv"  ] ; then
 
    echo "Installation avec virtualenv de l'apt de linux"
    grep venv activer &> /dev/null && echo "activer qui va bien" ||	( rm -f activer; echo "pas de activer qui va bien" )
    INSTALLATION="venv" # install avec virtualenv installé avec apt .
else
    if [ "$1" = "conda_env" ] ; then
	echo "Installation avec conda (comme à l'Insa)"
	
    else 
	echo "Installation avec conda (comme à l'Insa) par DEFAUT" 
    fi
    grep conda activer &> /dev/null && echo "activer qui va bien" ||	( rm -f activer; echo "pas de activer qui va bien" )
    
    INSTALLATION="conda_env" # install avec conda comme à l'INSA
fi


#INSTALLATION=conda_env  # installation insa ou locale avec conda
#INSTALLATION=venv   #installation locale avec virtualenv du apt-get linux

DEPOT="$(cd .. && pwd)"
INIT=./activer


dans_terminal_si_marche_pas " scrit $INIT" "$INIT" "./install_$INSTALLATION.sh"

echo "+ Installation à partir des fichiers de $DEPOT"

gerer_alias_bashrc ()
{
    echo -e "+  Mise à jour du .bashrc pour les alias goConda et goSignal"
    echo -n "    -effacement des traces existantes du bashrc "
    sed -i "s:alias goConda=.*$::g" ~/.bashrc && echo -ne $OK || echo -e $DEAD
    sed -i "s:alias goSignal=.*$::g" ~/.bashrc && echo -ne $OK || echo -e $DEAD
    sed -i 's:echo "===.*$::g' ~/.bashrc && echo -e $OK || echo -e $DEAD

    echo -n "    -creation des alias "
    echo 'alias goConda="echo \"Initialisation de conda peut prendre quelques secondes...\" && source ~/.initialise_conda.sh && echo \"..je vous l''avais dit !\""'>>~/.bashrc && echo -ne $OK || echo -e $DEAD
    
    echo 'alias goSignal="cd ~/Signal && goConda && conda activate Octave && jupyter-notebook"'>>~/.bashrc && echo -ne $OK || echo -e $DEAD
    echo 'echo "===Pour les TP de signaux, tapez la commande goSignal"'>>~/.bashrc&& echo -e $OK || echo -e $DEAD
}

gerer_alias_bashrc

echo "+ Ajout de quelques raccourcis  sur le bureau "
echo  "  creation du fichier raccourcis goSignal"

echo "./.fait_un_lanceur.sh goSignal.sh .no_brain.jpg">creer_icones_bureau.sh
echo "./.fait_un_lanceur.sh goSignalGeek.sh .geeke.png">>creer_icones_bureau.sh
chmod a+x creer_icones_bureau.sh
dans_un_terminal "creer_icones_bureau.sh"

copier_vers_bureau () {
    if [ -e "$1" ]; then
	cp -f "$DEPOT/installation/goSignal.sh.desktop" "$1/goSignal.desktop" && echo -ne $OK || echo -e $DEAD
	cp -f "$DEPOT/installation/goSignalGeek.sh.desktop" "$1/goSignalGeeke.desktop"&& echo -ne $OK || echo -e $DEAD
	ln -sf $DEPOT $1 && echo -ne $OK || echo -e $DEAD
    fi
}

echo  -en "\n copy des lanceurs sur le Bureau "
copier_vers_bureau $HOME/Desktop
copier_vers_bureau $HOME/Bureau

echo -en "\n Ajout dans la liste des applications "
mv "$DEPOT/installation/goSignal.sh.desktop" "$HOME/.local/share/applications/goSignal.desktop"&& echo -ne $OK || echo -e $DEAD
mv "$DEPOT/installation/goSignalGeek.sh.desktop" "$HOME/.local/share/applications/goSignalGeeke.desktop"&& echo -e $OK || echo -e $DEAD

echo -e $BIERE

rm *.log
source ~/.bashrc
/bin/bash
exit
