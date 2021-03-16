# Signal continu et discret

Pour récupérer le tout et utiliser les notebooks avec octave/matlab suivez ces instructions.



## Installation avec  MonTP 

### Récupérer le projet
Allez sur https://montp.insa-toulouse.fr et dans une **session linux** ouvrir un terminal (CTRL+ALT+T) et cloner le git
avec ces commandes :

    cd
    git clone https://github.com/balaise31/Signal.git
    cd Signal
    git checkout discret    

### Lancer le script d'installation

    cd installation
    ./install_de_git.sh
Eventuellement |chmod a+x ./install_de_git.sh| si pas exécutable.

Un script est installé, votre bash est modifié et deux icones "goSignal" et "Geek" sont crées sur le Bureau.

Une fois le projet récupéré inutile de refaire cela à chaque fois !


## Lancer jupyter-notebook

Ce n'est pas obligatoire mais bien pratique d'utiliser jupyter pour faire des notebook bien commentés de code octave/matlab.
  * on peut lancer octave (ou matlab mais sous windows à l'INSA) et commenter les .m
  * faire un notebook jupyter en mode octave
  * mixer les deux (fonctions en .m et explications jolies en .ipynb)

Pour utilser le jupyter notebook avec octave il faut initaliser **à chaque fois** avec
    
    ./goSignal
    
Naviguez dans les répertoires et ouvrez un fichier .ipynb.
Pour exécuter une cellule de code (SHIFT + ENTER)

Par exemple pour relever le défis paparité :

    cd
    cd Signal/discret/defis/paparite/
    jupyter-notebook paparite.ipynb

Pour écouter le son en ligne de commande :

    rhythmbox paparite.ogg &

 Faire CTRL-C CTRL-C pour stopper le notebook.
 
Enjoy !
