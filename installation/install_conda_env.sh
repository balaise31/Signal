#!/bin/bash
. utiles.sh
. config.txt


chercher_conda () {
    if $(pas_dans_path conda)
    then
	if [ -f $HOME/anaconda3/bin/conda ] ;
	then
	    BIN_CONDA=~/anaconda3/bin/conda
	else
	    BIN_CONDA="plouf"
	    return 1
	fi
    else
	BIN_CONDA=conda
    fi
    }


dans_terminal_si_marche_pas "conda" "chercher_conda" "./conda.sh" || exit 1

chercher_conda || exit 1
 
creer_initialise_conda () {
    touch ~/.bashrc
    mv -f ~/.bashrc ~/.bashrc.vieux
    $BIN_CONDA init bash &> /dev/null
    mv -f ~/.bashrc $INIT_ENV
    mv ~/.bashrc.vieux ~/.bashrc
}


assure_script $INIT_ENV "creer_initialise_conda" || exit 1

echo -en $INDENT "  Init de conda (peut être long)..." && . $INIT_ENV && echo -e " $KISS je vous l'avais dit" ||exit 1
chercher_conda || exit 1
cree_octave_env () {
conda create -n Octave python=3    
}

installe_si_marche_pas "Env. Octave de Conda" "conda activate Octave" cree_octave_env || exit 1



cree_activer_maj () {
echo "echo -n \"Init de l'env. (peut être long)...\"&& source $INIT_ENV && $BIN_CONDA activate Octave && alias desactiver=\"$BIN_CONDA deactivate\"&&echo -e \"$KISS je vous l'avais dit !\" " > $INIT
chmod a+x $INIT

echo ". $INIT && pip install -r requirements.txt" > maj
chmod a+x maj
}

installe_si_marche_pas "script activation et maj" "$INIT" cree_activer_maj



echo -e $INDENT $BIERE
