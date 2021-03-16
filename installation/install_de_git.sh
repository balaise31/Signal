#!/bin/bash

DEAD="\u26D4"
OK="\U1F48B"

DEPOT_DEFAUT="$(cd .. && pwd)"
## la ligne suivante peut être réécrite par le script fait-un-lanceur
# recopier la ligne
DEPOT=$DEPOT_DEFAUT
# ci dessous pour réinitialiser
#DEPOT="/home_pers/acco/tp test/"

echo "+ Installation à partir des fichiers de $DEPOT"



creer_initialise_conda () {
    touch ~/.bashrc
    mv ~/.bashrc ~/.bashrc.vieux
    echo "==Lancement de la commande: conda init bash"
    echo "========================================="
    conda init bash && echo -e $OK || echo -e $DEAD
    echo "========================================="
    echo "===Récupération du scrypt OK"
    mv ~/.bashrc ~/.initialise_conda.sh
    mv ~/.bashrc.vieux ~/.bashrc
}


echo ""
echo -n "+  Fichier ~/.initialise_conda.sh "
if [ -e ~/.initialise_conda.sh ]; then
    echo -e $OK
else
    echo -e " n'existe pas $DEAD"
    echo "--- création du script d'init"
    echo
    echo 
    creer_initialise_conda 
    echo
    echo
fi


echo -e "+  Mise à jour du .bashrc pour les alias goConda et goSignal"
echo -n "    -effacement des traces existantes du bashrc "
sed -i "s:alias goConda=.*$::g" ~/.bashrc && echo -ne $OK || echo -e $DEAD
sed -i "s:alias goSignal=.*$::g" ~/.bashrc && echo -ne $OK || echo -e $DEAD
sed -i 's:echo "===.*$::g' ~/.bashrc && echo -e $OK || echo -e $DEAD

echo -n "    -creation des alias "
echo 'alias goConda="echo \"Initialisation de conda peut prendre quelques secondes...\" && source ~/.initialise_conda.sh && echo \"..je vous l''avais dit !\""'>>~/.bashrc && echo -ne $OK || echo -e $DEAD

echo 'alias goSignal="cd ~/Signal && goConda && conda activate Octave && jupyter-notebook"'>>~/.bashrc && echo -ne $OK || echo -e $DEAD
echo 'echo "===Pour les TP de signaux, tapez la commande goSignal"'>>~/.bashrc&& echo -e $OK || echo -e $DEAD

echo "+ Ajout de quelques raccourcis  sur le bureau "
echo  "  creation du fichier raccourcis goSignal"
./.fait_un_lanceur.sh goSignal.sh .no_brain.jpg && echo -e $OK || echo -e $DEAD

echo  "  Creation du fichier raccourcis goSignal"
./.fait_un_lanceur.sh goSignalGeek.sh .geeke.png && echo -e $OK || echo -e $DEAD

echo  -n "  copy dans le bureau et lanceur "
if [ -e "$HOME/Desktop/goSignal.desktop" ]; then
    cp "$DEPOT/installation/goSignal.sh.desktop" "$HOME/Desktop/goSignal.desktop" && echo -ne $OK || echo -e $DEAD
    cp "$DEPOT/installation/goSignalGeek.sh.desktop" "$HOME/Desktop/goSignalGeeke.desktop"&& echo -ne $OK || echo -e $DEAD
   ln -s "$DEPOT"  "$HOME/Desktop/Signal" 
else
    cp "$DEPOT/installation/goSignal.sh.desktop" "$HOME/Bureau/goSignal.desktop" && echo -ne $OK || echo -e $DEAD
    cp "$DEPOT/installation/goSignalGeek.sh.desktop" "$HOME/Bureau/goSignalGeeke.desktop"&& echo -ne $OK || echo -e $DEAD
    ln -s  "$DEPOT"  "$HOME/Bureau/Signal"
fi
mv "$DEPOT/installation/goSignal.sh.desktop" "$HOME/.local/share/applications/goSignal.desktop"&& echo -ne $OK || echo -e $DEAD


mv "$DEPOT/installation/goSignalGeek.sh.desktop" "$HOME/.local/share/applications/goSignalGeeke.desktop"&& echo -e $OK || echo -e $DEAD

source ~/.bashrc
/bin/bash
exit
