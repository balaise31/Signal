# Installation

Install avec le même script ``./installation/install`` que ce soit sur :
   * le site montp de l'insa
   * une install de linux (ou machine virtuelle) avec conda
   * une install de linux avec virtualenv

## Récup du git
Voir [README](../README.md "README du Github") pour voir comment faire un git clone du projet
	
## Install Conda comme à l'INSA en local

Si vous voulez installer en utilsant Conda, lancez dans un terminal

```bash   
cd ~/Signal/installation
git pull
./install
goSignal
```
C'est long mais c'est prêt !
Utilisez une icone goSignal du bureau, ou la commande goSignal dans un terminal.

Cela va :

  * utiliser une installation de conda existante visible (il faut que la commande ocnda existe)
  * ou utiliser une installation de conda non visible dans $HOME/anaconda3
  * ou télécharger conda et installer conda dans $HOME/anaconda3

Puis cela va créer un environnement "Octave" avec ce qu'il faut pour les notebook Jupyter avec octave. 

A la fin des icones goSignal et l'alias goSignal sont créés pour démarrer jupyter notebook.

## Install Virtualenv locale Linux

Si vous voulez installer en utilsant Virtualenv de l'atp de Ubuntu (plus léger et rapide que conda), lancez dans un terminal

```bash
cd ~/Signal/installation
git pull
./install venv
goSignal
```
## Install sur OSx
 A vous de jouer !
 Si conda est installé alors tentez les même commandes git pour récupérer le projet puis 


    conda init
    conda install octave-kernel
    jupyter-notebook

A vous de proposer des scripts !

## Install sur windows
 Utiliser Tortoise GIt ou l'appli github pour récupérer le projet.
 Si conda est installé tentez le jupyter notebook...

A vous de proposer des tutoriels ou scripts.
