# Transformée de Laplace

La transformée de Laplace est un opérateur : c'est une application linéaire qui transforme une application de $\mathbb{R}\mapsto \mathbb{R} (ou \;\mathbb{C})$ (une fonction de la variable réelle : souvent le temps) en une application de $\mathbb{C}\mapsto\mathbb{C}$ (fonction de la variable complexe : la variable de Laplace)

On va privilégier l'utilisation de transformées connues (table page 47) et éviter le calcul direct avec la formule
$$
L[f](p) = F(p) = \int\limits_{\mathbb{R}} f(t).e^{-p.t}.dt
$$


## À faire

* Exercice 1 : sans calcul direct !
    - d) Retrouver $L[u]$ en intégrant le Dirac, appliquer le théorème du retard pour avoir $L[u\circ T_1]=L[t\mapsto u(t-1)]$. Représenter le signal comme une somme de 4 échelons de Heavisides avec 4 retards différents. Par linéarité trouver cette transformée
    - e) Décomposer ce signal comme une somme de deux rampes avec des retards différents et d'un échelon $2.u(t-2)$. Retrouver la transformée de la rampe en intégrant un échelon et calculer la transformée avec les propriétés de linéarité et le théorème du retard.
* Démontrer le théorème du retard. Pour cela utiliser la formule et faire un changement de la variable d'intégration en remplaçant t par $t-\tau$. Voir la démo dans le poly 3.3.2 p43. 
* Faire le calcul direct de la transformée d'un sinus causal $sin(\omega t).u(t)$ si vous n'y arrivez pas regarder l'exemple 2 du 3.4 p.46. Tracez l'allure du signal
* Exercice 1 : suite 
    - g) représenter le signal comme la somme de deux sinus causaux avec des retards différents. Utiliser la transformée du sinus causal trouvez auparavant ou dans la table p47 théorème du retard pour trouver la transformée.
    -c) faites une décomposition IQ du cosinus déphasé, utilisez les résultats sur les cosinus et sinus causaux et la linéarité pour obtenir la transformée.
* Utilisez le théorème de la translation en fréquence (3.3.4 p 44) pour trouver $L[t\mapsto e^{-\alpha t}.f(t)]$. Tenter le calcul direct (sera refait en séance).
* Exercice 1 : suite
    - b) Représenter cette fonction comme le retard de l'exponentielle causale $e^{-\alpha t}.u(t)$ vue précédemment, mais avec un retard. Appliquer le fameux théorème à la transformée trouvée.
    - a) Bidouiller l'exponentielle pour se ramener à b) et conclure.

## En séance 
* Retour sur l'exo 1
* Calcul direct propre de $L[e^{-\alpha t}.u(t)]$, explication des bornes et du lien entre causalité et transformée de Laplace unilatérale
* Lien avec les systèmes et les signaux, la stabilité des systèmes et les pôles pour retrouver les formules sans faire appel à la mémoire. 
* Explication de la résolution d'une équa. diff. (exo 3) et de la méthode de calcul de transformée inverse par décomposition.
