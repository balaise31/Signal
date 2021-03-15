

La doc est lisible en ligne ici https://balaise31.github.io/Signal/


## Récupérer le projet
Pour utiliser ce git en TP à l'INSA aller sur MonTP  https://montp.insa-toulouse.fr

Dans une **session linux** ouvrir un terminal (CTRL+ALT+T) et importer le git

    git clone https://github.com/balaise31/Signal.git
    cd Signal
    git checkout discret
    conda init

Une fois le projet récupéré inutile de refaire cela à chaque fois !

## Lancer jupyter en mode octave/matlab

Ce n'est pas obligatoire mais bien pratique d'utiliser jupyter pour faire des notebook bien commentés de code matlab.
  * on peut lancer octave (ou matlab mais sous windows à l'INSA) et commenter les .m
  * faire un notebook jupyter en mode octave
  * mixer les deux (fonctions en .m et explication jolies en .ipynb)

Pour utilser le jupyter notebook avec octave il faut initaliser **à chaque fois** avec

    source ~/.bashrc
    conda activate Octave 
    jupyter-notebook 
    
Naviguez dans les répertoires et ouvrez un fichier .ipynb.
Pour exécuter une cellule de code (SHIFT + ENTER)

Par exemple pour relever le défis paparité :

    cd
    cd Signal/discret/defis/paparite/
    rhythmbox paparite.ogg &
    jupyter-notebook paparite.ipynb
    
 Faire CTRL-C CTRL-C pour stopper le notebook.
 
Enjoy !
