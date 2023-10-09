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
    source "${OCTAVE_ENV}"/activate &&     echo -e "   $BISOUS\n\n" || exit
    
else
    echo "Pas d'environnement $OCTAVE_ENV: $UNCHECK"
    echo " Avez-vous exécuté la commande suivante "
    echo "   source $DEPOT/installation/install_venv.sh"
    exit
fi;

if [ -d $CIBLE ];
then

    echo -e " Mise à jour des fichiers :"
    . "$CIBLE"/mise_a_jour.sh
    echo -e "... c'est à jour $BISOUS\n\n"
    
    echo -en "Lancement de jupyter lab : un navigateur va apparaitre $TEMPS ... "
    #. "${DEPOT}"/installation/setenv_octave_kernel.sh
    2>/dev/null 1>/dev/null jupyter-lab README.ipynb &
    sleep 15
    echo -e "voilà c'est fait $BISOUS\n\n"
    echo -e "Faire dans le notebook Jupyter (dans Firefox) : File->Shutdown\n  puis ENTER dans ce terminal pour arrêter tout.\n\n"
    echo -e "Vous pouvez ensuite  lancer les commandes"
    echo -e "~/signal_${DISCONT}/mise_a_jour.sh \n   ->pour mettre à jour"
    echo -e "~/signal_${DISCONT}/quoi_de_vieux.sh\n   -> pour gérer les conflits de fichiers nouveaux"
    echo -e "\n Ou bien relancer la commande : go_$DISCONT"
else
    echo "Install des tp signal pas faite: $UNCHECK"
    echo "Avez-vous déplacé $CIBLE ?"
    echo "-> Exécutez dans ce terminal la commande pour recopier"
    echo "    source ${DEPOT}/installation/install_locale.sh $DISCONT"
fi
