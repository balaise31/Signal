# Signal continu et discret
---
Cours, TD et TP de filtrage numérique en continu et discret (enseignements de l'INSA de Toulouse en IMACS2 et 3)

Vous y trouverez :
  - poly de cours
  - guide de td
  - Tps et guides de TP
  - installation de Notebooks Jupyter avec octave

Liens :
  - [la page du projet](https://balaise31.github.io/Signal/index.html) pour accéder aux polys, instructions etc.
  - [la chaîne Youtube du discret](https://youtube.com/playlist?list=PL_wkaC4iMBTlJQpi7W18pkzR_kY9d-jsU) 


## Utilisation en ligne
---
Cliquez sur les "badges" ci-dessous pour lancer jupyter-lab sur un serveur et naviguer pour lancer les notebooks  ".ipynb" :

Vous pouvez naviguer en Interactif avec Jupyter Lab (conseillé) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/balaise31/Signal/HEAD?urlpath=lab)
---|---
Interactif avec Jupyter Notebook | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/balaise31/Signal/HEAD?urlpath=tree)
Interactif avec nteract | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/balaise31/Signal/HEAD?urlpath=nteract)

Le premier lancement peut être long, voire nécessiter de recharger la page, mais après ça va...

Vous pouvez aussi juste naviguer sans modifier, mais toujours connectée :
  - **Naviguer avec [gitHub](https://github.com/balaise31/Signal)**  cliquer sur un notebook (fichier de type **.ipynb**) et laisser git le visualiser
  - **Naviguer et Visualiser avec nbviewer** en cliquant sur ce badge [![nbviewer](https://raw.githubusercontent.com/jupyter/design/master/logos/Badges/nbviewer_badge.svg)](https://nbviewer.org/github/balaise31/Signal/tree/master/)


## Installation locale rapide
---

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

