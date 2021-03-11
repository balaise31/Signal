#!/bin/bash

DEPOT_DEFAUT="$(cd .. && pwd)"
## la ligne suivante peut être réécrite par le script fait-un-lanceur
# recopier la ligne
# DEPOT =DEPOT_DEFAUT
# ci dessous pour réinitialiser
DEPOT="/home_pers/acco/tp test/"

echo "+ Installation à partir des fichiers de $DEPOT"


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
    echo "==Lancement de la commande: conda init bash"
    echo "========================================="
    conda init bash
    echo "========================================="
    echo "===Récupération du scrypt OK"
    mv ~/.bashrc ~/.initialise_conda.sh
    mv ~/.bashrc.vieux ~/.bashrc
}


echo ""
echo -n "+  Fichier ~/.initialise_conda.sh "
if [ -e ~/.initialise_conda.sh ]; then
    echo " existe OK"
else
    echo " n'existe pas"
    echo "--- création du script d'init"
    echo
    echo 
    creer_initialise_conda
    echo
    echo
fi

echo
echo -n "+  Le répertoire de tp ~/tp_signal"
if [ -d ~/tp_signal  ]; then
    echo " existe OK"
else
    echo " n'existe pas :"
    echo " ----- je le copie pour vous"
    cp -r "$DEPOT/tps" "$HOME/tp_signal"
fi
echo

echo -e "===Mise à jour du .bashrc pour les alias goConda et goSignal"
sed -i "s:alias goConda=.*$::g" ~/.bashrc
sed -i "s:alias goSignal=.*$::g" ~/.bashrc
sed -i 's:echo "===.*$::g' ~/.bashrc

echo 'alias goConda="echo \"Initialisation de conda peut prendre quelques secondes...\" && source ~/.initialise_conda.sh && echo \"..je vous l''avais dit !\""'>>~/.bashrc

echo 'alias goSignal="cd ~/tp_signal && goConda && conda activate Octave && jupyter-notebook"'>>~/.bashrc
echo 'echo "===Pour les TP de signaux, tapez la commande goSignal"'>>~/.bashrc

echo "Ajout de quelques raccourcis  sur le bureau, vous pouvez les utiliser ou les enlever de votre bureau en les supprimant (cela ne supprimera pas les originaux) ..."

ln -fs "$DEPOT/installation/goSignal.sh.desktop" "$HOME/Desktop/goSignal.desktop"
ln -fs "$DEPOT/installation/goSignal.sh.desktop" "$HOME/.local/share/applications/goSignal.desktop"

ln -fs "$DEPOT/installation/goSignalGeek.sh.desktop" "$HOME/Desktop/goSignalGeeke.desktop"
ln -fs "$DEPOT/installation/goSignalGeek.sh.desktop" "$HOME/.local/share/applications/goSignalGeeke.desktop"
ln -fs "$DEPOT" "$HOME/Desktop/commetud_signal"
ln -fs "$HOME/tp_signal" "$HOME/Desktop/mon_tp_signal"

source ~/.bashrc
/bin/bash
exit
