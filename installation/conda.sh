#!/bin/bash
. ./utiles.sh

MON_INIT_CONDA=~/.local/bin/initialise_conda.sh
BIN_CONDA_LOCAL=~/anaconda3/bin/conda

installer_conda () {
    cd /tmp
    assure_apt wget
    
    cp ~/.bashrc ~/.bashrc.vieux
    SCRIPT_CONDA="Anaconda3-2020.11-Linux-x86_64.sh"
    assure_internet "https://repo.anaconda.com/archive/" $SCRIPT_CONDA
    rm -rf ~/anaconda3
    lance_externe $SCRIPT_CONDA
    mv -f ~/.bashrc.vieux ~/.bashrc
}

creer_initialise_conda () {

    if $(pas_dans_path conda)
    then
	assure_script $BIN_CONDA_LOCAL installer_conda 
	BIN_CONDA=~/anaconda3/bin/conda
    else
	BIN_CONDA=conda
    fi
    echo -e $INDENT $TIC "conda =  $BIN_CONDA"
    
    touch ~/.bashrc
    mv -f ~/.bashrc ~/.bashrc.vieux
    $BIN_CONDA init bash &> /dev/null
    mv -f ~/.bashrc $MON_INIT_CONDA
    mv ~/.bashrc.vieux ~/.bashrc
}



INDENT=""
assure_script $MON_INIT_CONDA "creer_initialise_conda "

