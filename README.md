# Signal continu et discret
---



Cours, TD et TP de filtrage numérique en continu et discret (enseignements de l'INSA de Toulouse en IMACS2 et 3)

Vous y trouverez :
  - poly de cours
  - guide de td
  - Tps et guides de TP
  - installation de Notebooks Jupyter avec octave

> Le plus simple est de voir ici pour naviguer en ligne dans les notebooks et leurs [README](README.ipynb)



Liens :
  - [la page du projet](https://balaise31.github.io/Signal/index.html) pour accéder aux polys, instructions etc.
  - [la chaîne Youtube du discret](https://youtube.com/playlist?list=PL_wkaC4iMBTlJQpi7W18pkzR_kY9d-jsU) 
  - 
## Installation locale rapide
---

Voir dans [instruction d'installation](./installation/README.md) les prérequis et instructions détaillées (même sous windows)

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



