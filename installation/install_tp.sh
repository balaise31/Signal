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

cd ;

echo ""

if [ -d "$CIBLE" ]; then
    echo $LIGNE
    echo "$CIBLE déjà présent !"
    echo "   On fait une mise à jour..."
    echo "____"
    
    "$DEPOT"/installation/maj_signal.sh
    echo -e "____\n  ... mise à jour :  $CHECK"
    echo $LIGNE
    
else
    echo $LIGNE
    echo -en "Copie des fichiers dans $CIBLE$ ..."

    mkdir $CIBLE
    cp -rf "$DEPOT/discret/tp" $CIBLE/
    cp -rf "$DEPOT/discret/td" $CIBLE/
    cp -rf "$DEPOT"/installation/*.sh $CIBLE/
    ln -s  "$DEPOT" $CIBLE/Signal_github
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

echo -en "Ajout de l'alias go_signal au .bashrc ... "

grep -v go_signal $HOME/.bashrc > /tmp/.bashrc
echo "alias go_signal='cd $CIBLE; . ./go_signal.sh &'">>/tmp/.bashrc
grep -v goConda /tmp/.bashrc >$HOME/.bashrc
echo "alias goConda='. $HOME/$GOCONDA'">>$HOME/.bashrc
echo -e "$CHECK"
echo $LIGNE

echo -en "On re-source le .bashrc ..."
. $HOME/.bashrc
echo -e "$CHECK"
echo $LIGNE

echo -e "$CHAMP Installation réussie ! $CHAMP \nTapez go_signal dans ce terminal et ça démarre !"
echo $LIGNE
