---
# Guide de TP
---


Il y a deux sujets de TP :

1. Décomposition en séries de Fourier [TP1](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24774) en 1 séances
  - un script `noms_binones_Gpe_X_TP1_1.m` pour la decomposition numérique + calculs **à remettre sur moodle**
  - un script `noms_binones_Gpe_X_TP1_2.m` pour le calcul de la puissance moyenne en numérique + calcul **à remettre sur moodle**
    
2. Convolution et correlation [TP2](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24774) en 2 séances



# Préparation du TP1
---

Vous allez faire un script `noms_binones_Gpe_X_TP1_1.m` programme qui :
- calcule les coefficients de Série de Fourier réels (a(n) et b(n)) et imaginaires (c(n)) ;
- affiche ces valeurs de coefficients sous forme de spectre (amplitude et phase) ;
- calcule une somme partielle de Fourier et affiche cette fonction par-dessus la fonction décomposée.

Pour vérifier s'il n'y a pas d'erreurs dans ce programme, vous allez comparer les résultats approchés numériquement par octave **aux calculs que vous aurez faits à l'avance**

## Calcul des séries (Partie 1 du sujet de TP1)

Vous avez deux signaux dans [le sujet p.11 q4](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24774#page=11)
- f(t) est le sinus en valeur absolue qui se ramène à celui vu dans l'exo2 de manière classique [Exo 2 S.d.F.](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s6_series.ipynb#Exercice-2-:) et en passant par Laplace dans [Exo 2 S.d.F. suite](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s9_series.ipynb#Faire-le-lien-avec-Laplace-(exo-2))  
pour cela il faut trouver la relation entre T0 et alpha.
  - posez-vous à nouveau la question de la période d'un tel signal ! T0 est-elle bien la période ? Faites entuite le lien avec la période trouvée en fonction de alpha   
  - calculez cette série des deux manières vue en TD (calcul direct et par Laplace) et vérifiez le résultat
  - Effectuez les contrôles habituels pour être sûre de votre expression analytique :
    + homogénéité des termes (arguments des exponentielles et sinus sans dimention, c(n) de dimension [V])
    + c(0) doit être la surface algébrique du signal
    + pas de T0 dans l'expression de c(n) (étirement temporel uniquement sur les vecteurs de base)
    + A doit intervenir linéairement : c(n)=A... (étirement d'amplitude uniquement sur les coordonnées de la base)
    + c(n) tend vers 0 quand n tend vers l'infini pour avoir convergence de la série de Fourier.
- g(t), si vous avez suivi les [indiquations de l'exo 3e) des TF](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch6_tf.ipynb#Exercice-3) vous avez la formule des c(n). Bien faire une vérification en faisant le lien comme indiqué avec l'[ex1.3 SdF](https://moodle.insa-toulouse.fr/mod/resource/view.php?id=24741#page=95)

## Calcul de la puissance moyenne (Partie 2 du sujet de TP1)

De la même manière, vous allez calculer l'énergie sur une période ou la puissance moyenne de signaux.  

- Cela peut se faire en temporel
  + de manière analytique en calculant l'intégrale du module au carré
  + de manière numérique avec un script octave faisant la somme des carrés 

- Cela peut se faire en fréquentiel
  + de manière analytique avec le théorème de Parseval et la somme des coefficients au carré
  + de manière numérique avec un script octave faisant la somme des coefficients en module au carré

### Révisez la notion de puissance moyenne 

1. Revenez sur [l'exercice 1.1 et 1.2](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/ch5_s9_series.ipynb#Exercice-1.1-et-1.2) qui abordent la notion de spectre et de puissance moyenne.

2. Attention au piège [des bases de Fourier normées ou non ](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/intro_series.ipynb#Coefs-de-Fourier-avec-une-base-imaginaire-norm%C3%A9e-:-c(n)) ! **Vous pouvez perdre la moitié de la puissance moyenne du signal par erreur et la totalité des points à l'interro !**

3. Calculez analityquement en temporel la puissance moyenne des signaux f(t) et g(t)

4. Comment faire ce calcul avec octave ?

## Révisions sur octave

1. Retournez sur la page de [TD d'init à octave](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/intro_octave. ipynb) et rovoyez votre code

2. En guise de correction regardez ce qui est fait pour l'[exo 3 des SdF en octave](https://nbviewer.org/github/balaise31/Signal/blob/master/continu/tds/Series_exo3_pour_TP.ipynb) : c'est quasiment le corrigé du TP1 ! En séance repartez de 0 et faites vos scripts en vous inspirant de ce que vous avez compris.

### 
En TP vous calculerez numériquement la valeur des $c(n), a(n), b(n)$ pour quelques valeurs de $n$.  
Ce script devra donner les mêmes valeurs que la formule trouvée analityquement.

> l'avantage est que ce script pourra calculer des SdF dont on n'a pas de résultat analytique car :
> - il n'y a pas de formule connue (primitive inconnue)
> - le signal n'est pas connu mathématiquement (enregistrement de valeurs)
> - on n'a pas le temps ni le talent pour le faire 

Il peut être utile/élégant/lisible de définir **vous-mêmes** les versions numériques des opérateurs :
- **intégrale** d'un vecteur de valeurs `integ = @(f_de_t, Te) ...` 
- **produit scalaire périodique** entre deux signaux `scalp = @(f_de_t, g_de_t, Te) ...` 
- **Série de Fourier** d'un signal `sdf = @(f_de_t,Te,n) ...`

Votre script pourra s'adapter à n'importe quelle fonction. Dans un script **on ne demande jamais à l'utilisatice de rentrer des valeurs pendant l'exécution !** : ce serait pénible voir impossible de demander "quelle est la fonction"...

Comme Matlab/octave est un langage interprété, **l'utilisatrice modifie directement le début du script** puis lance l'exécution.

Ce qui donne un script du type 

```matlab
clear all
close all
clc 


%%____________________________________________________________________
%% Configs utilisatrice
% Entrez ici votre fonction et sa période
f = @(t) abs(sin(t)) ;
T0 = 0.1 ;

% Parametrez la période d'échantillonage et la fenêtre d'observation 
Te = 0.1 ;
tmin = -T0 ; 
tmax = T0 ;

%% NE PAS MODIFIER LA SUITE du script
%%____________________________________________________________________


%% Fonctions utiles
integ = @(f_de_t,Te) sum(f_de_t)*Te ;

%% Calculs 
t = tmin:Te:tmax ;
f_de_t = f(t) ;
...

%% Affichage
...
plot(t,f_de_t)
...


```