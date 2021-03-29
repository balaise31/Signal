#!/bin/bash
DEPOT=$HOME/Signal

cd $DEPOT/installation
. utiles.sh
. config.txt

$TERMINAL -e "bash -c \"./$1\";read "
