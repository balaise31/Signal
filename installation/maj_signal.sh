DEPOT="/mnt/commetud/3eme Annee IMACS/Signal"
CIBLE="$HOME/signal_local"

cd $CIBLE

rsync -abv --suffix=_sauvegarde.ipynb "$DEPOT"/discret/tp/ ./tp/
rsync -abv --suffix=_sauvegarde.ipynb "$DEPOT"/discret/td/ ./td/

cp -f "$DEPOT"/installation/*.sh .
