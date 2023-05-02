SCRIPTS="./scripts_octave"

echo "on sauve les fichiers .m existants de $SCRIPTS"
cd $SCRIPTS
for pointm in $(ls *.m)  ;
do
    sauv=.sauv."$pointm".du_"$(date +%d_%h_%Hh%Mm%Ss)".m
    echo "==> $sauv"
    cp "$pointm" "$sauv"
    echo "    pour voir les diffs :  diff $SCRIPTS/$pointm $SCRIPTS/$sauv "
done;
cd ..
echo
echo "On  génère les .m à partir des .ipynb dans $SCRIPTS"
jupyter-nbconvert *.ipynb --to script --output-dir "$SCRIPTS"

echo
echo "Pour voir les sauvegardes"
echo "ls -a $SCRIPTS"


echo
echo "Pour nettoyer les sauvegardes faites"
echo "rm $SCRIPTS/.sauv.*"
