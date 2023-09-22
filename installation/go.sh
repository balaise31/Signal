source ./chemin_depot
CIBLE="$HOME/signal_$DISCONT"
OCTAVE_ENV="${DEPOT}/installation/env/bin"


CHECK="\U2705" 
UNCHECK="\U274C"
CHAMP="\U1F37E"
BEER="\U1F37A"
TEMPS="\U231A"
BISOUS="\U1F48B"
LIGNE="_______________________________________________________________"

echo

if [ -d "${OCTAVE_ENV}" ];
then
    echo -e "Environnement python + jupyter + octave présent : $CHECK"
    echo $LIGNE
    echo -en "Activation de l'environnement $OCTAVE_ENV : $TEMPS ...  "
    source "${OCTAVE_ENV}"/activate &&     echo -e "   $BISOUS" || exit
    
else
    echo "Pas d'environnement $OCTAVE_ENV: $UNCHECK"
    echo " Avez-vous exécuté la commande suivante "
    echo "   source $DEPOT/installation/install_venv.sh"
    exit
fi;

if [ -d $CIBLE ];
then
    
    echo -e "Lancement de jupyter lab : un navigateur va apparaitre $TEMPS ..."
    #. "${DEPOT}"/installation/setenv_octave_kernel.sh
    jupyter-lab README.ipynb &
    sleep 10
    echo -e "     ... voilà c'est fait $BISOUS"
    
else
    echo "Install des tp signal pas faite: $UNCHECK"
    echo "Avez-vous déplacé $CIBLE ?"
    echo "-> Exécutez dans ce terminal la commande pour recopier"
    echo "    source ${DEPOT}/installation/install_locale.sh $DISCONT"
fi
