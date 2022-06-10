source chemin_depot
CIBLE="$HOME/signal_local"

cd $CIBLE
SUFFIXE=sauvegarde_du_"$(date +%d_%h_%Hh%Mm%Ss)".ipynb
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/discret/tp/ ./tp/
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/discret/td/ ./td/
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/discret/utiles/ ./utiles/

cp -f "$DEPOT"/installation/*.sh .
