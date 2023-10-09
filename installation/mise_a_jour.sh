source chemin_depot
CIBLE="$HOME/signal_$DISCONT"

cd $CIBLE
SUFFIXE=.sauvegarde_du_"$(date +%d_%h_%Hh%Mm%Ss)".ipynb
rsync -abL --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/tp/ ./tp/
rsync -abL --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/td/ ./td/
rsync -abL --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/utiles/ ./utiles/

cp -f "$DEPOT"/installation/go.sh ./
cp -f "$DEPOT"/installation/mise_a_jour.sh ./
cp -f "$DEPOT"/installation/*vieux*.sh ./
cp -f "$DEPOT"/installation/README.ipynb ./

if [ -d "$DEPOT"/$DISCONT/cours/notebooks/ ] ;
then
    test ! -d cours && mkdir cours
    test ! -d cours/notebooks  && mkdir ./cours/notebooks 
    rsync -abL --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/cours/notebooks/ ./cours/notebooks/
fi
if [ -d "$DEPOT"/$DISCONT/defis ] ;
then
    test ! -d defis && mkdir defis
    rsync -abL --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/defis/ ./defis/
fi
./quoi_de_vieux.sh

echo "_______________________________________"
