#!/bin/bash
. utiles.sh

assure_apt python3-virtualenv


virtualenv -p python3 ./venv
virtualenv -p python3 --relocatable ./venv

echo "source $PWD/venv/bin/activate && alias desactiver=deactivate" > activer

chmod a+x activer
. activer

echo ". $PWD/activer && pip install -r requirements.txt" > maj
chmod a+x maj
. maj


