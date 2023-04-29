# Instructions d'installation 
---

Si vous êtes étudiante INSA :
 1) Connectez-vous sous linux 
  - Allez sur une salle de TP virtuelle avec [monTP (Guacamole)](#monTP-INSA-virtuel)
  - Allez en salle de TP réelle et logez vous sous LINUX
 2) Exécutez la ligne de commande d'installation 
  - 2IMACS, [install du "continu"](#Pour-les-2IMACS)
  - 3IMACS, [install du "discret"](#Pour-les-3IMACS)
 3) Lancez Jupyter-Lab avec la commande `go_continu` ou `go_discret`.

Sinon pour les utilisations "chez-soi", du plus facile au plus balèse vous pouvez:
 - Naviguer sur le [Github Signal](https://github.com/balaise31/Signal#signal-continu-et-discret)  
   :poop: On ne peut qu'observer des Notebooks Octave/Matlab et python  
   :poop: Il faut une connection     
 - Exécuter les notebooks en ligne : cliquez sur [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/balaise31/Signal/HEAD?labpath=README.ipynb).  
   :kiss: On peut exécuter des Notebooks Octave/Matlab et python  
   :poop: Mais il faut une bonne connection (et la première est longue !)  
   :poop: On ne peut pas facilement sauver son travail  

 - Sur un serveur virtuel de l'INSA (VPN insa +  monTP guacamole) : voir [Etudiante INSA](#etudiante-insa).  
   :kiss: On peut exécuter des Notebooks Octave/Matlab et python    
   :poop: Mais il faut une bonne connection  
   :poop: Il faut être étudiante INSA.  
   :kiss: On sauve son travail sur son compte INSA  

 - Installer tout sur sa machine : voir [Installer en local](#installation-locale)  
   :kiss: On peut exécuter des Notebooks Octave/Matlab et python   
   :kiss: Plus besoin de connection  
   :kiss: Plus besoin d'être étudiante à l'INSA.  
   :kiss: On sauve son travail localement  

Pour les curieuses voir les [détails de l'installation](#détails-de-linstallation) !



---
# Avec compte INSA 
---
Si vous avez un compte informatique INSA ou un ordinateur personnel


## monTP INSA virtuel
---

Sur ma machine, il faut d'abord :
   - [Installer le VPN sur son ordi](https://wiki.etud.insa-toulouse.fr/books/r%C3%A9seau-et-internet/chapter/vpn) 
   - Se connecter au VPN et aller sur [montp.insa-toulouse.fr](https://montp.insa-toulouse.fr/)(appli Guacamole). Puis se connecter à une **Salle de TP virtuelle LINUX**
   - *Menu-> Internet -> Navigateur Web Firefox* et naviguez à nouveau vers cette page car Guacamole ne permettra pas de copier/coller en dehors de son onglet.
   - *Menu-> Outils Système -> Terminal MATE* pour avoir un terminal car Guacamole ne prends pas le raccourcis clavier (CTRL+ALT+T)
   - L'installation se fait ensuite comme [en salle de TP INSA](#en-salle-de-TP-INSA)
   
Ensuite CTRL+ALT+T pour ouvrir un terminal et `go_continu` (2IMACS) ou `go_discret` (3IMACS)

## Pour les 2IMACS
--
La première fois, logez-vous sous LINUX et lancez cette commande dans un terminal (`CTRL+ALT+T` ou bien *Menu-> Outils Système -> Terminal Mate*) :
```bash     
cd /mnt/commetud/3eme\ Annee\ IMACS/Signal/installation/ && source install_locale.sh continu 
```

 * Copiez en cliquant sur l'icône qui apparait en fin de ligne ci-dessus vers ici   ̂|
 * Collez dans le terminal (click bouton milieu ou `CTRL+V`)
 
 
A chaque début de séance, la commande `go_continu` lance le **jupyter-lab avec kernel octave**.


## Pour les 3IMACS
--

La première fois, logez-vous LINUX et lancez cette commande dans un terminal (`CTRL+ALT+T`) :
```bash     
cd /mnt/commetud/3eme\ Annee\ IMACS/Signal/installation/ && source install_locale.sh discret 
```
A chaque début de séance, la commande `go_discret` lance le **jupyter-lab avec kernel octave**.



---
# Installation locale
---

## Installer Octave
---

Octave est la version gratuite et libre (du GNU) de Matlab un des premier MathCAD (Logiciel de math)

Sous linux (CTRL+ALT+T) pour ouvrir un terminal et tapez :

```
sudo apt install octave

```

Pour Window et Mac préferrez [Installer Anaconda](https://www.anaconda.com/products/distribution) (Distribution de python) et installer octave avec anaconda en suivant les liens Wiki de [Installer GNU octave](https://www.gnu.org/software/octave/download) 


## A - Linux
---

Pour les Geekettes pressées qui ont déjà `conda` et `git` installé, la suite suffit :
```bash
cd
git clone https://github.com/balaise31/Signal.git
cd Signal/installation
conda env create -f ./Octave.yaml
cd ~/Signal/installation
source install_locale.sh continu
cd ~/Signal/installation
source install_locale.sh discret
```
Jupyter-lab est lancé :
 * dans le dépot Git `~/Signal` avec la commande `goSignal`,
 * dans la copie locale `~/signal_continu` pour modifier avec `go_continu`
 * dans la copie locale `~/signal_discret` pour modifier avec `go_discret`

## B - Windows
---

Pour une installation sous windows merci à Vincent Eychenne pour ces [instructions sous Windows](windows.md)


---
# Détails de l'installation
---

En cas de problème ou pour voir ce qu'il y a sous le capot, voici le détail des étapes d'installation Linux à adapter pour mac et windows.

## A - Prérequis
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


## B - Récup de ce dépôt git
---

Ouvrez un terminal (git bash par exemple) et lancez la commande
```bash
cd ~
git clone  https://github.com/balaise31/Signal.git Signal
```
Si vous n'arrivez pas à avoir un compte git avec une authentification qui marche ? Vous pouvez toujours 
[télécharger le zip](https://github.com/balaise31/Signal/archive/refs/heads/master.zip) et gérér les mises à jour à l'ancienne

De temps en temps, vous pourrez importer les mises à jour en faisant un `git pull`.


## C - Installation de l'environnement avec conda
---

En utilisant conda, on va créer un environnement `octavelab` contenant tous les paquets nécessaires

```bash   
cd ~/Signal/installation
conda env create -f ./Octave.yaml
```
C'est long, mais à la fin, c'est prêt !
Normalement si vous faites `conda env list`, l'environnement octavelab doit apparaître parmi d'autres.


## D - Lancement de jupyter-lab
---

Dans un terminal exécutez la commande :
```bash
cd ~/Signal
conda activate Octave
jupyter-lab
```

Cela lance un serveur `jupyter-lab` et un navigateur qui s'y connecte capable d'exécuter des notebooks (fichier `.ipynb`)
 mélangeant cellules de texte et cellules de code (python, octave, etc.) 

Naviguez par exemple jusqu'à `Signal\Installation\test.ipynb`, ouvrez la page et exécutez les cellules de code avec MAJ+ENTREE.

Vous pouvez créer un alias goSignal qui fait cela à chaque fois en ajoutant la ligne suivante à la fin de votre `~/.bashrc` :

`alias goSignal='cd ~/Signal/ && conda activate Octave && . ./installation/setenv_octave_kernel.sh && jupyter-lab'`

Cela peut se faire en exécutant la ligne suivante :
```bash
cd ~
echo "alias goSignal='cd ~/Signal/ && conda activate Octave && . ./installation/setenv_octave_kernel.sh && jupyter-lab'">>.bashrc
source .bashrc
```
Ainsi dans un terminal la commande `goSignal` lancera jupyterlab dans le répertoire Signal.
