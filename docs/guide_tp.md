---
# Guide de TP
---


Il y a deux sujets de TP :

1) Décomposition en séries de Fourier [TP1](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24774) en 1 séances
    - un script '''noms_binones_Gpe_X_TP1_1.m''' pour la decomposition numérique + calculs **à remettre sur moodle**
    - un script '''noms_binones_Gpe_X_TP1_2.m''' pour le calcul de la puissance moyenne en numérique + calcul
      **à remettre sur moodle**
    
2) Convolution et correlation [TP2](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24774) en 2 séances



# Préparation du TP1
---

Vous allez faire un script '''noms_binones_Gpe_X_TP1_1.m''' programme qui :
- calcule les coefficients de Série de Fourier réels (a(n) et b(n)) et imaginaires (c(n)) ;
- affiche ces valeurs de coefficients sous forme de spectre (amplitude et phase) ;
- calcule une somme partielle de Fourier et affiche cette fonction par-dessus la fonction décomposée.

Pour vérifier s'il n'y a pas d'erreurs dans ce programme, vous allez comparer les résultats approchés numériquement par octave **aux calculs que vous aurez faits à l'avance**

## Calcul des séries

Vous avez deux signaux dans [le sujet p.11 q4](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24774#page=11)
- le premier est le sinus en valeur absolue vu dans l'exo2 de manière classique [Exo 2 S.d.F.](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s6_series.ipynb#Exercice-2-:) et en passant par Laplace dans   [Exo 2 S.d.F. suite](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s9_series.ipynb#Faire-le-lien-avec-Laplace-(exo-2))      
