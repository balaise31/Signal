#!/bin/bash
. utiles.sh
. config.txt

assure_apt python3-virtualenv

cd $DEPOT/installation

cree_venv () {
    cd $DEPOT/installation
    virtualenv -p python3 ./venv
    virtualenv -p python3 --relocatable ./venv
}

sans_verif_si_marche_pas "venv" "source $DEPOT/installation/venv/bin/activate" cree_venv

cree_activer_maj () {
    cd $DEPOT/installation
    echo "source $DEPOT/installation/venv/bin/activate && alias desactiver=deactivate" > activer
    
    chmod a+x activer
    
    echo ". $DEPOT/installation/activer && pip install -r requirements.txt" > maj
    chmod a+x maj
}

sans_verif_si_marche_pas "activer et maj" "source activer" "cree_activer_maj" || exit 1

dans_un_terminal ./maj
echo -e $INDENT $BIERE
