# Signal continu et discret

Pour récupérer le tout et utiliser les notebooks avec octave/matlab suivez ces instructions.

Sinon cliquez ici pour pouvoir créer et modifier les notebook avec binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/balaise31/Signal/tps?filepath=continu/tps/pourquoi_octave.ipynb)

# Récupérer le projet
Allez sur https://montp.insa-toulouse.fr et dans une **session linux** ouvrir un terminal (CTRL+ALT+T) et cloner le git
avec ces commandes :
```bash
 cd
 git clone https://github.com/balaise31/Signal.git
 cd Signal
 git checkout discret
 ```
La dernière version de la branche discret sera sur votre disque. Pour tenter de mettre à jour faites un *git pull*.

# Lancer le script d'installation
```bash
cd ~/Signal/installation
git pull
./install
goSignal
```
Eventuellement ``chmod a+x ./install`` si pas exécutable.

Un script est installé, votre bash est modifié et deux icones "goSignal" et "Geek" sont crées sur le Bureau.

Une fois le projet récupéré inutile de refaire cela à chaque fois !

Voir [README](https://github.com/balaise31/Signal/tree/discret/installation) de ./installation pour plus de détails

## Lancer jupyter-notebook

Ce n'est pas obligatoire mais bien pratique d'utiliser jupyter pour faire des notebook bien commentés de code octave/matlab.
  * on peut lancer octave (ou matlab mais sous windows à l'INSA) et commenter les .m
  * faire un notebook jupyter en mode octave
  * mixer les deux (fonctions en .m et explications jolies en .ipynb)

Pour utilser le jupyter notebook avec octave il faut initaliser **à chaque fois** avec

  - Cliquer sur l'icone du Bureau *goSignal* 
  - Naviguez dans les répertoires et ouvrez un fichier .ipynb.
       Pour exécuter une cellule de code (SHIFT + ENTER)

Ou en mode ligne de commande pour faire le défi paparité par exemple:
```bash
cd Signal/discret/defis/paparite/
goSignal
```
Pour écouter le son en ligne de commande :

    rhythmbox paparite.ogg &

 Faire CTRL-C CTRL-C pour stopper le notebook.
 
Enjoy !
