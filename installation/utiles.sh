# Alt codes 
INTERDIT="\u26D4"
KISS="\U1F48B"
BIERE="\U1F37A"
MERDE="\U1F4A9"
TIC="\U2705"
PASTIC="\U274E"
TELEPHONE="\U1F4DE"
YEUX="\U1F440"

#paquets
function pas_dans_path(){ 
   return "$(which $var 2> /dev/null |wc -l)"
}

function pas_dans_apt(){ 
   return "$(apt -qq list $var 2> /dev/null |wc -l)"
}
function pas_installe(){ 
   return "$(apt -qq list $var --installed 2> /dev/null |wc -l)"
}

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

# Internet

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
	echo -e "$INDENT  $TIC $1 "
    else
	echo -e "$INDENT   $PASTIC $1 :"
	echo -e "$INDENT alors on lance $2 ..."
	RETRAIT=$INDENT
	INDENT=$INDENT"... ->"
	$2 && echo -e $RETRAIT $KISS || echo -e  $RETRAIT $INTERDIT
	INDENT=${INDENT%%... ->}

    
	if [ ! -e $1 ] ;
	then
	    echo -e $INDENT $2 à pas marché !
	    exit 1
	fi
	
    fi
    if [ ! -x $1 ];
    then
	chmod a+x $1 || (echo -e "$INDENT $MERDE on peut pas le rendre exécutable !"; exit 1)
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
    echo -e $INDENT Exec de "$1" :
    echo -e "$INDENT  $YEUX dans le gnome-terminal nommé \" Exec de $1 \" ..."
	
	if $( gnome-terminal --wait \
		       --title="Exec de $1"\
		       -- bash -c "./$1 | tee $1.log" )
	then
	    echo -e "$INDENT Terminé l'exec de $1" 
	else
	    echo -e "$INDENT $MERDE voir \"$1\".log"
	    exit 1
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
	$3 && echo -e $INDENT $KISS || (echo -e "$INDENT $MERDE raté !"; exit 1) 
	INDENT=${INDENT%%... ->}
    
	if ( $2 )
	then
	    echo -e "$INDENT $TIC $1 "
	    test -e "$3".log && rm "$3".log
	else
	    echo -e "$INDENT $MERDE $3 s'exécute mais le test $2 marche toujours pas !"
	    test -e "$2.log" && (echo "voici le log"; cat "$2.log")
	    exit 1
	fi
	
    fi
}

dans_terminal_si_marche_pas () {
    installe_si_marche_pas "$1" "$2" "dans_un_terminal $3"
}
