#!/bin/bash
. utiles.sh
. config.txt
echo "_____________________________________________________"
echo "Normalement il suffit de quelques lignes de commandes"
echo ">> cd $DEPOT/installation"
echo ">> " `cat $DEPOT/installation/activer` 
echo "puis"
echo ">> cd .. &&    jupyter-notebook"
echo "_____________________________________________________"
echo

/bin/bash

exit
