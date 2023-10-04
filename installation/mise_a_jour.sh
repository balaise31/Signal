source chemin_depot
CIBLE="$HOME/signal_$DISCONT"

cd $CIBLE
SUFFIXE=.sauvegarde_du_"$(date +%d_%h_%Hh%Mm%Ss)".ipynb
rsync -ab --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/tp/ ./tp/
rsync -ab --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/td/ ./td/
rsync -ab --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/utiles/ ./utiles/

cp -f "$DEPOT"/installation/go.sh ./
cp -f "$DEPOT"/installation/mise_a_jour.sh ./
cp -f "$DEPOT"/installation/*vieux*.sh ./
cp -f "$DEPOT"/installation/README.ipynb ./

if [ -d "$DEPOT"/$DISCONT/cours/notebooks/ ] ;
then
    test ! -d cours && mkdir cours
    test ! -d cours/notebooks  && mkdir ./cours/notebooks && cp "$DEPOT"/$DISCONT/cours/notebooks/  
    rsync -ab --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/cours/notebooks/ ./cours/notebooks/
fi
if [ -d "$DEPOT"/$DISCONT/defis ] ;
then
    test ! -d defis && mkdir defis
    rsync -ab --suffix="$SUFFIXE" "$DEPOT"/$DISCONT/defis/ ./defis/
fi
echo "______________________________________"
echo "Des fichiers ont peut-être été mis à jour"
echo " et les anciennes versions sont sauvegardées avec le suffixe :"
echo "   <fichier>$SUFFIXE"
echo "Pour avoir une liste des sauvegardes de vos fichiers écrasés faites :"
echo " ./quoi_de_vieux.sh"
echo "_______________________________________"
