# Séance 2 Onde complexe et systèmes linéaire

## À faire
* Terminer l'exo 2.1 (signaux a, b et c) avec l'approche indiquée :
    - schéma bloc de somme de " retards + intégrales + gain " transformant une impulsion unité (Dirac en 0)
    - traduction en somme de "fonctions de base" (échelon unité, voire rampes unités)
    - VÉRIFIER ! Prendre une valeur de t un peu avant 3 et calculer pour voir si ça colle.

* Ne pas faire le 2.2 tout de suite, mais avant de passer au 4, d'abord faire le lien entre les 3 représentations d'une onde pure : cos déphasé, représentation IQ (cos + sin) et représentation par phaseur (exponentielles complexes)

* Pour cela regarder la [fiche de récapitulation](./phaseur_onde_IQ.pdf)

* Faire le lien entre les trois représentations et retrouver les formules passages entre IQ, amplitude déphasage, et phaseur.

* Faites l'exercice 4
    -  Ex. 4a,b en utilisant au maximum le phaseur (qui est la fonction de transfert prise pour une valeur de la pulsation $\omega$). On comprend alors que pour la pulsation $\omega=2\pi$ le système ne fait que multiplier le phaseur du signal d'entré par le phaseur du système ($g(\omega=2\pi)=\frac{1}{2}e^{i\frac{pi}{3}}$)
    - Ex 4c. D'abord calculer le phaseur $z_e$ du signal d'entrée qui est donné sous la forme IQ. Et appliquer la linéarité du système $\Sigma[t\mapsto z_e.e^{i\omega t}]=z_e\,\Sigma[t \mapsto e^{i\omega t}]$ où $\Sigma$ est un opérateur (application linéaire qui transforme une fonction en fonction) transformant un signal d'entré $x$ en signal de sortie $y$ soit $\Sigma[x]=y$. Attention x et y sont bien des fonctions ! 


## En séance 

Présentation complète du passage entre les visions de l'onde complexe :
* cosinus amplitude déphasage
* IQ
* phaseur d'onde complexe

Revue de l'exercice 4 complète




