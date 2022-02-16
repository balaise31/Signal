# Installation

Pour installer sur sa machine de quoi lire les notebooks, modifier et exécuter des notebooks, et développer du code octave/python. Voici les instructions à tenter.

Que ce soit sur Windows/Mac/Linux on suppose que :
   - vous avez un client `git` avec ligne de commande qui marche
      * Sous windows installez un `git bash`
      * Sous mac git doit y être. Sinon un bon conseil est d'utiliser `macport` ou `brew` pour installer des softs dans le style ligne de commande
      * Sous Linux ça y est déjà ou un simple `sudo apt get install git` fera l'affaire.
   - Vous avez une installation de python (plûtot 3.7) `conda` ou `pip`
      * Sous windows allez sur le site de `conda` et faite une install avec .exe
      * Sous mac on peut installer conda avec un .dmg ou utiliser macport ou brew pour installer pip avec
       `sudo port install pip`
      * Sous linux ça y est déjà ou sinon `sudo apt install python3`

## Récup de ce dépôt git
---

Ouvrez un terminal (git bash) et lancez la commande
```bash
cd ~
git clone  https://github.com/balaise31/Signal.git Signal
```
Si vous n'arrivez pas à avoir un compte git avec une authentification qui marche ? Vous pouvez toujours 
[télécharger le zip](https://github.com/balaise31/Signal/archive/refs/heads/master.zip) et gérér les mises à jour à l'ancienne

De temps en temps, vous pourrez importer les mises à jour en faisant un `git pull`.

## Installation de l'environnement avec conda
---
En utilisant conda, on va créer un environnement `octavelab` contenant tous les paquets nécessaires

```bash   
cd ~/Signal/installation
conda env create -f ./octavelab.yaml
```
C'est long, mais à la fin c'est prêt !
Normalement si vous faites `conda env list`, l'environnement octavelab doit apparaître parmi d'autres.


## Lancement de jupyter-lab
---

Dans un terminal exécutez la commande :
```bash
cd ~/Signal
conda activate octavelab
jupyter-lab
```

Cela lance un serveur `jupyter-lab` et un navigateur qui s'y connecte capable d'exécuter des notebooks (fichier .ipynb)
 mélangeant cellules de texte et cellules de code (python, octave, etc.) 

Naviguez par exemple jusqu'à `Signal\Installation\test.ipynb`, ouvrez la page et exécutez les cellules de code avec MAJ+ENTREE.

Vous pouvez créer un alias goSignal qui fait cela à chaque fois en ajoutant la ligne suivante à la fin de votre `~/.bashrc` :

`alias goSignal='cd ~/Signal/ && conda activate octavelab && jupyter-lab'`

Cela peut se faire en exécutant la ligne suivante :
```bash
cd ~
echo "alias goSignal='cd ~/Signal/ && conda activate octavelab && jupyter-lab'">>.bashrc
source .bashrc
```
Ainsi dans un terminal la commande `goSignal` lancera jupyterlab dans le répertoire Signal.
