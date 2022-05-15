DEPOT="/mnt/commetud/3eme Annee IMACS/Signal"
CIBLE="$HOME/signal_local"

cd $CIBLE
SUFFIXE=sauvegarde_du_"$(date +%d_%h_%Hh%Mm%Ss)".ipynb
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/discret/tp/ ./tp/
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/discret/td/ ./td/

cp -f "$DEPOT"/installation/*.sh .
