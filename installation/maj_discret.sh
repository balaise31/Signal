DISCONT="discret"
CIBLE="$HOME/signal_$DISCONT"
source "$CIBLE"/chemin_depot

cd $CIBLE
SUFFIXE=sauvegarde_du_"$(date +%d_%h_%Hh%Mm%Ss)".ipynb
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/tp/ ./tp/
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/td/ ./td/
rsync -abv --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/utiles/ ./utiles/

cp -f "$DEPOT"/installation/*$DISCONT.sh ./
cp -f "$DEPOT"/installation/README.ipynb .
