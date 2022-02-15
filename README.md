# Signal continu et discret

Pour récupérer le tout et utiliser les notebooks avec octave/matlab suivez ces instructions.

# Installation rapide

Voir dans [instruction d'installation](./installation/README.md) les prérequis et instructions détaillées

Pour les Geekettes pressées qui ont déjà `conda` et `git` installé, la suite suffit :
```bash
cd
git clone https://github.com/balaise31/Signal.git
cd Signal/installation
conda env create -f ./octavelab.yaml
cd
echo "alias goSignal='cd ~/Signal/ && conda activate octavelab && jupyter-lab'">>.bashrc
source .bashrc
```

Jupyter-lab est lancé d'un terminal avec la commande `goSignal`


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
