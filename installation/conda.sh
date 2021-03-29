#!/bin/bash
. ./utiles.sh

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

if $(pas_dans_path conda)
then
    assure_script $BIN_CONDA_LOCAL installer_conda 
    BIN_CONDA=~/anaconda3/bin/conda
else
    BIN_CONDA=conda
fi
echo -e $INDENT $TIC "conda =  $BIN_CONDA"
