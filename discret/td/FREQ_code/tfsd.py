""" Calcule la TFSD d'un signal primal[k]
  et renvoie les valeurs de la fonction duale(f)

               TFSD
  primal[k] ----------> dual(f)

 primal : vecteur des valeurs aux instants k
 k : vecteur entier des instant k 
 f : vecteur réel des fréquences à calculer
 Te : période d'échantillonnage du primal
"""
from numpy import exp, sum, conj, pi

def tfsd(primal,k,f,Te):

    # Onde d'analyse W(f,k)
    W = lambda f, k : exp(1j*2*pi*f*k*Te)

    # tfsd en un point par produit scalaire
    tfsd_de = lambda s, f: sum(s * conj(W(f, k)))

    # calcul pour toutes valeur f demandée
    dual = 0j*f   # vecteur nul de la taille de f

    n = 0
    for frequ in f:
        dual[n] = tfsd_de(primal, frequ)
        n += 1
        
    return dual

        
""" Affiche 4 graphiques en 2x2
 A gauche le primal temporel      A droite le dual fréquentiel
 En haut la partie réelle 
 En bas  la partie imaginaire

  xPrimal,labelXprimal : valeurs en abscisse du primal, et titre de l'axe (string)
  ysPrimal,labelYprimal : idem pour les ordonnées
  xDual,labelXdual,ysDual,labelYdual: idem pour le dual (fréquentiel)
  legendeSignaux : tableau de 4 strings donnant la description des 4 signaux
  primalDiscret : Booléen indiquant si le primel (temps) est discret ou continu
  dualDiscret : idem pour les fréquence discrète ou pas...
"""
from matplotlib.pyplot import stem, plot, subplot, legend, xlabel, ylabel, title
from numpy import real, imag, conj, array
def plot_dual(xs,
              ys,
              legendes,
              labelx=("", ""),
              labely=("", ""),
              est_discret=(True, False)):

    op = [real, imag]
    couleurs = ['k', 'r', 'g', 'b']
    titre_deb = ["Primal ", "Dual "]
    titre_fin = [" partie réelle", "partie imaginaire"]

    for ligne in (0, 1):
        for colonne in (0, 1):
            subplot(2, 2, 2*ligne+colonne+1)
            x = xs[colonne]
            y = ys[colonne]
            N = len(x)
            for n in range(0, N):
                if est_discret[colonne]:
                    stem(x[n], op[ligne](y[n]), couleurs[n])
                else:
                    plot(x[n], op[ligne](y[n]), couleurs[n])
            legend(legendes)
            xlabel(labelx[colonne])
            ylabel(labely[colonne])
            title(titre_deb[colonne] + titre_fin[ligne])
