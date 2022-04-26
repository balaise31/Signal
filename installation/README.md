# Installation
---

Du plus facile au plus balèse :
   - Exécuter les notebooks en ligne avec [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/balaise31/Signal/HEAD?urlpath=lab).  
   :kiss: On peut exécuter des Notebooks Octave/Matlab et python  
   :poop: Mais il faut une bonne connection
   :poop: On ne peut pas facilement sauver son travail

  - On peut [utiliser les ordinateurs ou le VPN (monTP guacamole) de l'INSA](#Etudiante-INSA).  
   :kiss: On peut exécuter des Notebooks Octave/Matlab et python  
   :poop: Mais il faut une bonne connection
   :poop: Il faut être étudiante INSA.
   :kiss: On sauve son travail sur son compte INSA

  - Installer sur sa machine Conda et le kernel octave.
   Plus besoin de connection ! On peut tout faire.
   :kiss: On peut exécuter des Notebooks Octave/Matlab et python  
   :kiss: Plus besoin de connection
   :kiss: Plus besoin d'être étudiante à l'INSA.
   :kiss: On sauve son travail localement


# Etudiante INSA
---

## La première fois

Sur ma machine, il faut d'abord :
   - [Installer le VPN sur son ordi](https://wiki.etud.insa-toulouse.fr/books/r%C3%A9seau-et-internet/chapter/vpn) 
   - Se connecter au VPN et aller sur [montp.insa-toulouse.fr](https://montp.insa-toulouse.fr/)(appli Guacamole). Puis se connecter à une **Salle de TP virtuelle LINUX**

Dans une salle de TP (virtuelle ou non) lancez **dans un terminal** le script d'installation avec  

```bash     
source /mnt/commetud/3eme\ Annee\ IMACS/Signal/installation/install_tp.sh 
```

Le script d'installation doit se dérouler et créer une copie dans votre $HOME/signal_local **qu'il ne faut pas déplacer !**

## À chaque séance

Il suffit d'exécuter dans un terminal 
   
```bash
go_signal
```
## Lors des mises à jour

Il se peut que l'on vous demande de mettre à jour cette copie (en cas de modifications).  
Dans ce cas faites :
   
```bash
cd $HOME/signal_local
. ./maj_signal
```  
N'oubliez pas le premier `.` qui est synonyme de `source` en bash.

Les fichiers que vous avez modifiés seront **sauvegardés dans des _sauvegarde.ipynb !**  

Recopiez à la main vos modifications de _sauvegarde.ipynb vers le .ipynb mis à jour **avant toute nouvelle mise à jour**

## Vous avez perdu un fichier ?

Pas de problème, à l'insa **vous avez accès à des sauvegardes chaque heure avec des Snapshots** :

```bash
cd .snapshots
cd hourly.2022-04-21_2205
```
Bien sûr, mettez la bonne date qui vous intéresse.

Vous avez accès à vos anciens fichiers que vous pouvez rétablir par simple copie "en remontant"
```bash
cp mon.ipynb ../../
```

# Installation locale
---

## Windows
---

Pour une installation sous windows merci à Vincent Eychenne pour ces [instructions sous Windows](windows.md)


## Linux
---
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

Ouvrez un terminal (git bash par exemple) et lancez la commande
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
