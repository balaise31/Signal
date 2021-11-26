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
- $f(t)$ est le sinus en valeur absolue $A|\sin\left(\frac{\pi}{T_0}.t\right)|$ qui se ramène au $A|\sin\left(\alpha.t\right)|$ vu dans l'exo2 de manière classique [Exo 2 S.d.F.](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s6_series.ipynb#Exercice-2-:) et en passant par Laplace dans   [Exo 2 S.d.F. suite](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s9_series.ipynb#Faire-le-lien-avec-Laplace-(exo-2))   
   - reposez-vous la question de la période d'un tel signal ! $T_0$ est-elle bien la période ? Faites entuite le lien avec la période trouvée en fonction de $\alpha$    
   - calculez cette série des deux manières vue en TD (calcul direct et par Laplace) et vérifiez le résultat
   - Effectuez les contrôles habituels pour être sûre de votre expression analytique :
      - homogénéité des termes (arguments des exponentielles et sinus sans dimention, $c(n)$ de dimension [V])
      - $c(0)$ doit être la valeur moyenne
      - pas de $T_0$ dans l'expression de $c(n)$ (étirement temporel uniquement sur les vecteurs de base)
      - A doit intervenir linéairement : $c(n)=A\ldots$ (étirement d'amplitude uniquement sur les coordonnées de la base)
      - $c(n)\to0$ quand $n\to +\infty$ pour avoir convergence de la série de Fourier.
- $g(t)$, si vous avez suivi les [indiquations de l'exo 3e) des TF](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch6_tf.ipynb#Exercice-3) vous avez la formule des c(n). Bien faire une vérification en faisant le lien comme indiqué avec l'[ex1.3 SdF](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24741#page=95)

