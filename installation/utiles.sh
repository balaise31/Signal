# Alt codes 
INTERDIT="\u26D4"
KISS="\U1F48B"
BIERE="\U1F37A"
MERDE="\U1F4A9"
TIC="\U2705"
PASTIC="\U274E"
TELEPHONE="\U1F4DE"
YEUX="\U1F440"
SABLIER_FINI="\U231B"
SABLIER="\U23F3"



#paquets
function pas_dans_path(){ 
   return "$(which $1 2> /dev/null |wc -l)"
}

function pas_dans_apt(){ 
   return "$(apt -qq list $1 2> /dev/null |wc -l)"
}

function pas_installe(){ 
   return "$(apt -qq list $1 --installed 2> /dev/null |wc -l)"
}


if ( pas_installe mate-terminal ); then
    if ( pas_installe gnome-terminal ); then
	echo $INDENT "ça pue pas de terminal sympa... on prend xterm"
	TERMINAL=xterm
	OPTION_TITRE="--title="
	OPTION_EXEC="--command="
    else
	TERMINAL=gnome-terminal
	OPTION_TITRE="--title="
	OPTION_EXEC="-- "
    fi
else
    TERMINAL=mate-terminal
    OPTION_TITRE="--title="
    OPTION_EXEC="--command="
fi



function assure_apt() { 
    unset installe
    unset pas_trouve

    echo -n $INDENT
    for var in "$@"
    do
        if $(pas_dans_apt $var)
        then
	    echo -ne " $MERDE $var "
	    pas_trouve+=" $var"
	    exit 1
	else
	    if $(pas_installe $var)
	    then
		echo -ne "$PASTIC $var "
		installe+="${var} "
	    else
		echo -ne "$TIC $var "

	    fi
        fi
    done
    echo 
    if [ -n "$installe" ];
    then
	echo -n"$INDENT Installation de $installe ..."
        sudo apt-get install -qy $install && echo -e "$INDENT $KISS" || echo -e "$INDENT $INTERDIT"
    fi
}

# Internet

chope_sur_internet () {
    echo -ne $INDENT $TELEPHONE
    if $(wget -nv --progress=bar "$1""$2")
    then
	echo -e $INDENT $KISS
    else
	echo -e $INDENT $MERDE $1$2
	exit 1
    fi
}

assure_internet()
{
    if [ -f "$2" ] ;
    then
	echo -e $INDENT $TIC $2
    else
	echo -e $INDENT $PASTIC $2
	INDENT=$INDENT"... ->"
	chope_sur_internet "$1" "$2"
	INDENT=${INDENT%%... ->}
    fi
}

assure_script() {
    
    
    if [ -e $1 ] ;
    then
	echo -e "$INDENT $TIC $1 "
    else
	echo -e "$INDENT $PASTIC $1 :"
	RETRAIT=$INDENT
	INDENT=$INDENT"... ->"
	echo -en "$INDENT alors on lance $2 ..."
	$2 && echo -e $RETRAIT $KISS || echo -e  $RETRAIT $INTERDIT
	INDENT=${INDENT%%... ->}
    
	if [ ! -e $1 ] ;
	then
	    echo -e $INDENT $MERDE $2 à pas marché !
	    return 1
	fi
	
    fi
    if [ ! -x $1 ];
    then
	chmod a+x $1 || (echo -e "$INDENT $MERDE on peut pas le rendre exécutable !"; return 1)
    fi
}

assure_commande() {
    if ! command -v $1 &> /dev/null
    then
	echo -e "$INDENT $NOTIC $1 :"
	echo -e "$INDENT alors on lance $2 ..."
	RETRAIT=$INDENT
	INDENT=$INDENT"... ->"
	$2 && echo -e $RETRAIT $KISS || echo -e  $RETRAIT $INTERDIT
	INDENT=${INDENT%%... ->}
    else
	echo -e "$TIC  $1"
    fi
}


dans_un_terminal () {
    echo -en $INDENT "Exec de $1 dans un terminal : $YEUX le terminal nommé \" Exec de $1 \" ... "
    
    $TERMINAL $OPTION_TITRE"$1" $OPTION_EXEC bash -c " \"$1\" | tee  \"$1\".log && echo 0> ./\"$1\".code|| echo 1 > ./\"$1\".code ; echo Appuyez sur une touche ou attendre 10s; read -t 10 -n 1 ; touch \"$1\".lock" 
    while [ ! -f ./"$1".lock  ] ;
    do
	ANIM=$SABLIER
	echo -en "$ANIM\b"
	sleep 1
	ANIM=$SABLIER_FINI
	echo -en "$ANIM\b"
	sleep 1
    done
    code_erreur=$(cat "$1".code)
    rm ./"$1".lock
    rm ./"$1".code
    
    echo $code_erreur
    if [[ $code_erreur -eq "0" ]]
    then
	echo -e "$INDENT Terminé l'exec de $1"
	rm -f "$1".log
	return 0
    else
	echo -e "$INDENT $MERDE voir \"$1\".log"
	cat "$1".log
	return 1
    fi
}


lance_externe () {
    if [ -e $1 ] ;
    then
	if [ ! -x $1 ]; then
	    chmod a+x $1 || (echo "$INDENT pas executable"; exit 1 ) 
	fi
	dans_un_terminal $1
	rm $1.log
    else
	echo -e $MERDE $1
	exit 1
    fi
}

installe_si_marche_pas() {

    if ( $2 &> /dev/null )
    then
	echo -e "$INDENT $TIC $1 "
    else
	echo -e "$INDENT $PASTIC $1 :"
	RETRAIT=$INDENT
	INDENT=$INDENT"... ->"
	echo -e "$INDENT alors on lance $3 ..."
	$3 && echo -e $INDENT $KISS || (echo -e "$INDENT $MERDE raté !"; return 1) 
	INDENT=${INDENT%%... ->}
    
	if ( $2 &> "$2.log")
	then
	    echo -e "$INDENT $TIC $1 "
	    test -e "$2".log && rm "$2".log
	    return 0
	else
	    echo -e "$INDENT $MERDE $3 s'exécute mais le test $2 marche toujours pas !"
	    test -e "$2.log" && (echo "voici le log"; cat "$2.log")
	    return 1
	fi
	
    fi
}

dans_terminal_si_marche_pas () {
    installe_si_marche_pas "$1" "$2" "dans_un_terminal $3" && return 0 ||return 1
}
