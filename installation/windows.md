# Installation de JupyterLAb avec Kernel Octave sur Windows
---

## Installation
---

1.	Installer GNU octave (https://www.gnu.org/software/octave/download) 
2.	Installer Anaconda (https://www.anaconda.com/products/individual)
3.	Lancer Anaconda, installer JupyterLab ou Jupyter Notebook
4.	Lancer depuis Anaconda « CMD.exe Prompt »
5.	Rentrer les commandes suivantes : 
`conda config --add channels conda-forge`
`conda install octave_kernel`

## Ajouter octave aux variables d'environnement système 
---

1.	Taper « variables » dans le menu démarrer
<a href="https://ibb.co/w0kHRJv"><img src="https://i.ibb.co/f1gR28c/Image1.png" alt="Image1" border="0"></a>
2.	Cliquer sur « Variables d’environnement » puis « Nouvelles »
<a href="https://ibb.co/tCgym4d"><img src="https://i.ibb.co/JkVXBKh/Image2.png" alt="Image2" border="0"></a>
3.	Créer la nouvelle variable comme suit : 
<a href="https://imgbb.com/"><img src="https://i.ibb.co/y4CPg9M/Image3.png" alt="Image3" border="0"></a>
4. De même créez une variable `OCTAVE_CLI_OPTIONS` que vous configurez à `--eval "graphics_toolkit('gnuplot')" --persist`
7.	Redémarrer
8.	Si un plot ne marche pas : ajouter cette ligne au début de chaque notebook
`graphics_toolkit("gnuplot");`
