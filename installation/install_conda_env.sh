#!/bin/bash
. utiles.sh

MON_INIT_CONDA=~/.local/bin/initialise_conda.sh
dans_terminal_si_marche_pas "initialise_conda.sh" $MON_INIT_CONDA ./conda.sh
. $MON_INIT_CONDA


cree_octave_env () {
conda create -n octave python=3    
}
installe_si_marche_pas "Env. Octave de Conda" "conda activate octave" cree_octave_env

cree_activer_maj () {
echo "source $MON_INIT_CONDA && conda activate octave && alias desactiver=\"conda deactivate\"" > activer
chmod a+x activer
. activer

echo ". $PWD/activer && pip install -r requirements.txt" > maj
chmod a+x maj
dans_terminal_si_marche_pas "Test maj" ./maj ./maj
}
cree_activer_maj
