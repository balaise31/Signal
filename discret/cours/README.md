# Systèmes et signaux discrets
---

## VEC : Les espaces vectoriels des signaux
---

Un signal est vu comme un vecteur dans un espace vectoriel. On y trouve une base de signaux orthonormés temporelle et une fréquentielle. Changer de base est calculer une transofrmée.

  * Voir le polycopié [premier chapitre](../poly/poly_discret.pdf#chapter.1) jusqu'aux [bases temporelles (1.2)](../poly/poly_discret.pdf#section.1.2) incluses 
  * Y associer la lecture des notebooks:
     - [VEC1](./notebooks/VEC1_bases_temporelles.ipynb) sur les bases temporelles
     - [VEC2](./notebooks/VEC2_bases_frequentielles.ipynb) sur les bases fréquentielles

## FREQ : Transformée de Fourier des Signaux Discrets (TFSD) : dans $\mathbb{C}^\mathbb{Z}$ et $\mathbb{C}_b^\mathbb{Z}$
Dans le cas des signaux **discrets apériodiques** $\mathbb{C^\mathbb{Z}}$ ou apériodiques bornés $\mathbb{C}_b^\mathbb{Z}$, le passage à la base fréquencielle en utilisant le produit scalaire $<\!< \dots, \dots >\!>$ revient à calculer la TFSD du signal :
  * Voir de la section [1.4.1 les TF](../poly/poly_discret.pdf#subsection.1.4.1) jusqu'aux [1.4.3 les TFSD](../poly/poly_discret.pdf#subsection.1.4.3)
  * Faire dans exo 1 et 2 tout ce qui parle de TFSD (mais pas de TFD) dans le [TD FREQ](../td/FREQ_sujet.ipynb)
  * Regarder le principe de dualité des transformées [1.5 Dualité](../poly/poly_discret.pdf#section.1.5)

## FREQ : Transformée de Fourier Discrète (TFSD) : dans $\mathbb{C}_p^\mathbb{Z}$
Dans le cas des signaux **discrets périodiques** $\mathbb{C_p^\mathbb{Z}}$, le passage à la base fréquencielle en utilisant le produit scalaire $<\!< \dots, \dots >\!>_p$ revient à calculer la TFD du signal et possède même des matrices de passage :
  * Voir la section [1.4.4 les TF](../poly/poly_discret.pdf#subsection.1.4.4)
  * Terminer exo. 1 et 2 avec la TFD dans le [TD FREQ](../td/FREQ_sujet.ipynb)
  * Terminer l'exercice 3 du [TD FREQ](../td/FREQ_sujet.ipynb)

