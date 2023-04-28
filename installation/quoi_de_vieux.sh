#!/bin/bash

echo -e "Les fichiers..."
echo "_____________________________________________________"
for FICH in $(find . -name "*.sauvegarde_du*");
do
    if [[ $FICH = *checkpoint* ]]
    then
	#echo "J'éfface le ${FICH}"
	rm ${FICH}
    else
	if [[ ! $FICH = *.la_tombe* ]]
	then
	    echo "________________"
	    ORIG=${FICH%.sauvegarde_du*}
	    ORIG=${ORIG##*/} 
	    echo "NOUVEAU : $ORIG "
	    echo "VIEUX  => $FICH" 
	    sed s@"\"cells\": \["@"\"cells\": \[{\"cell_type\": \"markdown\",\"metadata\": {},\"source\": \[\"**CECI EST UNE SAUVEGARDE DE** \[cet original mis à jour\]($ORIG)\",\"  \",\"  => Faites les copier coller des modifications et puis effacez cette sauvegarde avec\"\]},"@g $FICH --in-place
	    echo -e "POUR COMPARER => \n  jupyter-lab $FICH &" 
	    echo "________________"
	fi
    fi
    
    
done;
echo "_____________________________________________________"

echo "  ... ont été modifiés"
echo "Recopiez les commandes \"POUR COMPARER\" puis,"
echo -e "    une fois que tous vos .ipynb sont bons \n   vous pouvez EFFACER les sauvegardes avec la commande"
echo " ./mort_aux_vieux.sh"
