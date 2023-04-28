DISCONT=$1
CIBLE="$HOME/signal_$DISCONT"
GOCONDA=".goConda.sh"
MAJ_LOCAL="mise_a_jour.sh"

CHECK="\U2705" 
UNCHECK="\U274C"
CHAMP="\U1F37E"
BEER="\U1F37A"
TEMPS="\U231A"
BISOUS="\U1F48B"
LIGNE="_______________________________________________________________"


DEPOT=$(cd $(dirname "${BASH_SOURCE[0]}") && cd .. && pwd)

cd $HOME;

echo ""
echo "Installation de $DEPOT vers $CIBLE"
echo""

if [ -d "$CIBLE" ]; then
    echo $LIGNE
    echo "$CIBLE déjà présent !"
    echo "   On fait une mise à jour..."
    echo "____"
    
    cd "$CIBLE"; "./$MAJ_LOCAL"
    echo -e "____\n  ... mise à jour :  $CHECK"
    echo $LIGNE
    
else
    echo $LIGNE
    echo -en "Copie des fichiers dans $CIBLE$ ..."

    mkdir $CIBLE
    #cp -rf "$DEPOT/$DISCONT/tp" "$CIBLE"/
    #cp -rf "$DEPOT/$DISCONT/td" "$CIBLE"/
    #cp -rf "$DEPOT/$DISCONT/utiles" "$CIBLE"/
    cp -rf "$DEPOT"/installation/README.ipynb "$CIBLE"/
    cp -rf "$DEPOT"/installation/go.sh "$CIBLE"/
    cp -rf "$DEPOT"/installation/mise_a_jour.sh "$CIBLE"/
    cp -rf "$DEPOT"/installation/*vieux*.sh "$CIBLE"/
    #cp -rf "$DEPOT"/installation/*$DISCONT.sh "$CIBLE"/
    ln -s  "$DEPOT" $CIBLE/Signal_Depot
    echo "export DEPOT=\"$DEPOT\"" > "$CIBLE"/chemin_depot
    echo "export DISCONT=\"$DISCONT\"" >> "$CIBLE"/chemin_depot

    cd $CIBLE && ./mise_a_jour.sh

    echo -e " ... $CHECK"
    echo $LIGNE
fi

if [ -v CONDA_EXE ] ;
then
    echo -e "Conda déjà initialisé $CHECK"
    echo $LIGNE
else
    if [ ! -e $HOME/$GOCONDA ];
    then
	
	echo "Pas de script $GOCONDA: je le fait ..."
	echo "____"
	
	mv $HOME/.bashrc $HOME/.bashrc_backup
	echo "echo -en \"Init de conda $TEMPS ...\"" >$HOME/$GOCONDA
	conda init bash
	cat $HOME/.bashrc >>$HOME/$GOCONDA
	echo "echo -e \" $CHECK\"" >>$HOME/$GOCONDA
	mv -f $HOME/.bashrc_backup $HOME/.bashrc
	
	echo "____"
	echo -e " ... script de Conda : $CHECK"
	echo $LIGNE

    fi;

    source $HOME/$GOCONDA
    echo $LIGNE
fi;

echo -en "Ajout de l'alias go_$DISCONT au .bashrc ... "


grep -v DEPOT_SIGNAL $HOME/.bashrc > /tmp/.bashrc
grep -v "go_$DISCONT" /tmp/.bashrc > /tmp/.bashrc1
grep -v goSignal /tmp/.bashrc1 > /tmp/.bashrc2
grep -v goConda /tmp/.bashrc2 >$HOME/.bashrc

echo "export DEPOT_SIGNAL=\"$DEPOT\"">>$HOME/.bashrc
echo "alias go_$DISCONT='cd $CIBLE; . ./go.sh &'">>$HOME/.bashrc
echo "alias goConda='. $HOME/$GOCONDA'">>$HOME/.bashrc
echo "alias goSignal='cd \"$DEPOT\" && goConda && conda activate Octave && . ./installation/setenv_octave_kernel.sh && jupyter-lab'">>$HOME/.bashrc
echo -e "$CHECK"
echo $LIGNE

echo -en "On re-source le .bashrc ..."
. $HOME/.bashrc
echo -e "$CHECK"
echo $LIGNE

echo -e "$CHAMP Installation réussie ! $CHAMP \nTapez go_$DISCONT dans ce terminal et ça démarre !"
echo $LIGNE
