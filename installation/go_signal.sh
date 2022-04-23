DEPOT="/mnt/commetud/3eme Annee IMACS/Signal"
CIBLE="$HOME/signal_local"
GOCONDA=".goConda.sh"

CHECK="\U2705" 
UNCHECK="\U274C"
CHAMP="\U1F37E"
BEER="\U1F37A"
TEMPS="\U231A"
BISOUS="\U1F48B"
LIGNE="_______________________________________________________________"

echo

if [ -d $CIBLE ];
then
    cd $CIBLE
    
    if [ -v CONDA_EXE ] ;
    then
	echo -e "Conda déjà initialisé $CHECK"
	echo $LIGNE
    else
	if [ ! -e $HOME/$GOCONDA ];
	then
	    
	    echo "Pas de script $GOCONDA: $UNCHECK"
	    echo " Exécutez dans ce terminal la commande "
	    echo "   source /mnt/commetud/3eme\ Annee\ IMACS/Signal/installation/install_tp.sh"
	    echo $LIGNE
	    exit
	else
	    source $HOME/$GOCONDA
	    echo $LIGNE
	fi;
    fi;
    echo -en "Activation de l'environnement octave : $TEMPS ...  "
    conda activate Octave
    echo -e "   $BISOUS"
    
    echo -e "Lancement de jupyter lab : un navigateur va apparaitre $TEMPS ..."
    jupyter-lab &
    echo -e "     ... voilà c'est fait $BISOUS"
    
else
    echo "Install des tp signal pas faite: $UNCHECK"
    echo "Avez-vous déplacé $CIBLE ?"
    echo "-> Exécutez dans ce terminal la commande pour recopier"
    echo "    source /mnt/commetud/3eme\ Annee\ IMACS/Signal/installation/install_tp.sh"
fi
