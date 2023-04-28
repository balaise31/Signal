#!/bin/bash

echo "Les vieux fichiers..."
for FICH in $(find . -name "*.sauvegarde_du*");
do
    if [[ ! -d .la_tombe ]]; then
	mkdir .la_tombe
    fi
    if [[ ! $FICH = *.la_tombe* ]]
    then
	mv -f $FICH .la_tombe/
	echo $FICH
    fi
done
echo "... ont été transférés dans .la_tombe"
