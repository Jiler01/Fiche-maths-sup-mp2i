#import "@preview/great-theorems:0.1.0": *
#import "@preview/headcount:0.1.0": *

#set heading(numbering: "I.1")
#show: great-theorems-init

#show link: text.with(fill: blue)

#let mathcounter = counter("mathblocks")
#show heading: reset-counter(mathcounter)

#let sapphireBlue = rgb("#035b8e")

#let théorème = mathblock(
  blocktitle: "Théorème",
  counter: mathcounter,
  stroke: sapphireBlue,
  inset: 1em,
  numbering: dependent-numbering("1.1"),
)

#let proposition = mathblock(
  blocktitle: "Proposition",
  counter: mathcounter,
  stroke: black,
  inset: 1em,
  numbering: dependent-numbering("1.1"),
)

#let lemme = mathblock(
  blocktitle: "Lemme",
  counter: mathcounter,
  numbering: dependent-numbering("1.1")
)

#let remarque = mathblock(
  blocktitle: "Remarque",
  prefix: [_Remarque._],
  inset: 5pt,
  radius: 5pt,
  stroke: black
)

#let preuve = proofblock()

#set page(header: [
  Contenu sous Licence MIT
  #h(1fr)
  _github.com/Jiler01/Fiche-maths-sup-mp2i_
])

#text(20pt)[
  Fiche de révision MP2I 2025\
  _Complétude et correction non-assurée._
]

#outline(title: "Table des matières", depth: 2)
#pagebreak()

= Trigonométrie et nombres imaginaires
== Trigonométrie
#proposition(title: "Formules d'addition et de duplication")[\
  Soit $(a,b) in RR^2$ :
  $ cos(a+b) = cos(a)cos(b) - sin(a)sin(b) $
  $ sin(a+b) = sin(a)cos(b) + cos(a)sin(b) $
  \
  De plus, on déduit les formules de duplication suivantes:
  - $cos(2a) = cos(a)^2 - sin(b)^2 = 2cos(a)^2 - 1 = 1 - 2sin(a)^2$
  - $sin(2a) = 2sin(a)cos(a)$
  Ces deux dernières formules peuvent être manipulées afin d'obtenir les suivantes:
  - $cos(a)^2 = (1+cos(2a))/2$
  - $sin(a)^2 = (1-cos(2a))/2$
]
#proposition(title: "Formules de linéarisation et de délinéarisation")[\
  Soit $(a,b) in RR^2$ :
  + $cos(a)+cos(b) = 2cos((a+b)/2)cos((a-b)/2)$
  + $sin(a)+sin(b) = 2sin((a+b)/2)cos((a-b)/2)$
  + $cos(a)cos(b) = 1/2(cos(a-b)+cos(a+b))$
  + $sin(a)sin(b) = 1/2(cos(a-b)-cos(a+b))$
  + $sin(a)cos(b) = 1/2(sin(a+b)(sin(a-b)))$
]
#remarque[
  Les deux premières formules sont déduites des formules d'addition et des faits que \
  $a=(a+b)/2 + (a-b)/2$ et $b=(a+b)/2 - (a-b)/2$. Les trois dernières par manipulation des formules d'addition.
]
#remarque[
  On déduit les formules de soustraction par parité de $cos$ et imparité $sin$.
]
#proposition(title: "Tangente et formules reliées")[
  On définis $tan(a) = sin(a)/cos(a)$.
  \ Alors $forall (a,b) in RR^2$ :
  + $tan(a+b) = (tan(a)+tan(b))/(1-tan(a)tan(b))$
  + $1/cos(a)^2 = 1 + tan(a)^2$
  + $cos(2a) = (1-tan(a)^2) / (1+tan(a)^2)$
  + $sin(2a) = (2tan(a)^2) / (1+tan(a)^2)$
]
#proposition(title: "Forme amplitude-phase")[
  $ forall (a,b) in RR^2, exists (A,phi) in RR^2, forall t in RR, a cos(t) + b sin(t) = A cos(t-phi) $
  De plus, on a $A = sqrt(a^2+b^2)$ et $phi$ tel que $cos(phi) = a/A$ et $sin(phi) = b/A$.
]
== Nombres imaginaires
#proposition(title: "Formules d'Euler")[\
  Soit $theta in RR$ :
  $ e^(i theta) = cos(theta) + i sin(theta) $
  En découlent:\
  - $e^(-i theta) = cos(theta) - i sin(theta)$
  - $cos(theta) = (e^(i theta) + e^(-i theta))/2$
  - $sin(theta) = (e^(i theta) - e^(-i theta))/2$
]<prop1.5>
#proposition(title: "Technique de l'angle moitié")[\
  Soit $(x,y) in RR^2$ :\
  - $e^(i x) + e^(i y) = e^(i (x+y)/2)(e^(i (x-y)/2)+e^(-i (x+y)/2)) = 2 e^(i (x+y)/2) cos((x-y)/2)$
  - $e^(i x) - e^(i y) = e^(i (x+y)/2)(e^(i (x-y)/2)-e^(-i (x+y)/2)) = 2 e^(i (x+y)/2) sin((x-y)/2)$
]
#pagebreak(weak: true)
= Fonctions usuelles
== Composition
#théorème[
  Une composée de fonctions continue est continue.
]
#proposition[
  Soit $A,B subset RR$, $f: A->RR$, $g: B->RR$, telles que $g compose f$ soit définie.
  - $f$ paire $=>$ $g compose f$ paire.
  - $f$ impaire et $g$ paire $=>$ $g compose f$ paire.
  - $f$ et $g$ impaires $=>$ $g compose f$ impaire.
]

#proposition[
  Soit $A,B subset RR$, $f: A->RR$, $g: B->RR$, telles que $g compose f$ soit définie.
  - $f$ et $g$ de même monotonie $=>$ $g compose f$ croissante.
  - $f$ et $g$ de monotonie opposées $=>$ $g compose f$ décroissante.
]
== Fonction réciproque
#théorème[
  Soit $I$ un intervalle de $RR$, et $f: I -> RR$ continue est strictement monotone.
  + $f^(-1)$ est de même monotonie stricte.
  + $f$ impaire $=>$ $f^(-1)$ impaire.
  + $f^(-1)$ est continue.
  + Si $f$ est dérivable et $f^(-1)$ ne s'annule pas, alors $d/(d x) f^(-1) = 1/(f' compose f^(-1))$
]
#remarque[
  On retouve le dernier point en dérivant $f compose f^(-1) = "Id"_I$, ce qui donne $ (f^(-1))' times f' compose f^(-1) = 1 $
]
#proposition("Logarythme de base a")[
  $ log_a(x) = ln(x)/ln(a) $
]
== Fonctions trigonométriques réciproques
#proposition(title: "Domaines de définition")[
  - $arcsin : [-1;1] -> [-pi/2: pi/2]$
  - $arccos : [-1;1] -> [0; pi/2]$
  - $arctan : RR -> ]-pi/2; pi/2[$
]
#proposition(title: "Dérivées")[

  - $arcsin'(x) = 1/sqrt(1-x^2)$
  - $arccos'(x) = (-1)/sqrt(1-x^2)$
  - $arctan'(x) = 1/(1+x^2)$
]
#proposition(title: "Formules remarquables")[\
  Soit tq. $abs(x)<=1$
  - $sin(arccos(x)) = cos(arcsin(x)) = sqrt(1-x^2)$
  - $arcsin(x) + arccos(x) = pi/2$
]
== Fonctions hyperboliques
#proposition(title: "Définition")[
  - $"ch" : x |-> (e^x + e^(-x))/2$
  - $"sh" : x |-> (e^x - e^(-x))/2$
  - $"th" : x |-> "ch"/"sh" = (e^x - e^(-x))/(e^x + e^(-x))$
  (Fonctions $RR -> RR$)
]
#proposition(title: "Propriétés")[
  - ch est paire.
  - sh et th sont impaires.
  - Soit $x in RR, abs("th"(x)) < 1$
  - $"ch"' = "sh"$ et $"sh"' = "ch"$
  - $"th"' = 1 - "th"^2 = 1/"ch"^2$
  - $"ch" + "sh" = exp$
  - $"ch"^2 - "sh"^2 = 1$
]
== Divers
#théorème[
  Toute fonction de $RR$ dans $RR$ peut s'écrire comme la somme de deux fonctions, une paire et une impaire.
]
#pagebreak(weak: true)
= Un peu de calcul
== Sommes et produits
#proposition[
  - Une somme vide vaut 0
  - Un produit nul vaut 1
]
#proposition(title: "Somme remarquables")[
  $ sum_(k=0)^n 1= n+1 $
  $ sum_(k=0)^n k= (n(n+1))/2 $
  $ sum_(k=0)^n k^2= (n(n+1)(2n+1))/6 $
]
== Coeficients binomiaux
#théorème(title: "Formule du triangle de pascal")[\
  Soit $(n,k) in NN^* times ZZ$ :
  $ binom(n,k) = binom(n-1, k-1) + binom(n-1, k) $
]
#proposition(title: "Relations utiles")[\
  Soit $(n,k) in NN^* times ZZ$ :
  $ binom(n,k) = binom(n,n-k) $
  $ binom(n,k) = n/k binom(n-1,k-1) $
]
#théorème(title: "Formule du binôme de Newton")[
  Soit $n in NN$, et $(a,b) in CC$ :
  $ (a+b)^n = sum_(k=0)^n binom(n,k) a^k b^(n-k) $
]
#théorème(title: "Formule de Bernoulli")[
  Soit $n in NN$, et $(a,b) in CC$ :
  $ a^n - b^n = (a-b) sum_(k=0)^(n-1) a^k b^(n-1-k) $
]
#théorème(title: "Sommation géométrique")[\
  Soit $n in NN$, et $z in CC$ :
  $ sum_(k=0)^n z^k = (z^(n+1) - 1)/(z-1) $
  _Note: _ Si $z=1$, alors la somme vaut $n+1$.
]
== Systèmes linéaires
#proposition(title: "Opérations licites")[
  - Sommation d'une ligne à une autre.
  - Multiplication d'une ligne par un scalaire non nul.
  - Echange de lignes et/ou de colonnes.
]
#proposition(title: "Paramètrisation")[
  On peut décider d'éxprimer les valeurs de ceratines variables en fonction d'autres, et de définir ces dernières comme membres d'un ensemble.
  _Exemple_: $(x,y,z) in {(3z+2, 9z^2, z) | z in CC}$
]
#pagebreak(weak: true)
= Un peu de logique
Soit $p$ et $q$ des propositions logiques, et $P$ un prédicat.
#théorème(title: "Loi de De Morgan")[
  - $not (p and q) equiv not p or not q$
  - $not(p or q) equiv not p and not q$
]
#proposition(title: "Implication")[
  $ (p => q) equiv not p or q $
]
#proposition(title: "Négations intéressantes")[
  - $not (forall x, P(x)) <=> exists x, not P(x)$
  - $not (exists x, P(x)) <=> forall x, not P(x)$
]
#pagebreak(weak: true)
= Nombres complexes
#proposition(title: "Astuce pour les racines carrés")[\
  Soit $(t,z) in CC^2$ :
  $ t^2 = z <=> cases(t^2 = z,abs(t)^2 = abs(z)) $
]
#théorème(title: "Racine n-ième")[
  - La racine n-ième de $0$ est $0$.
  - L'ensemble des racines n-ièmes de $z in CC$ est ${root(n,abs(z)) times e^((i arg(z))/n + (2i k pi)/n) | k in [|0;n-1|]}$.
  - La somme des racines n-ièmes de $1$ est nulle.
]
#proposition(title: "Sommation et linéarisation de fonctions trigonométriques")[\
  Soit $f$ une fonction.
  - $sum cos compose f = sum "Re"(e^f(x)) = "Re"(sum e^f(x))$, et de même pour $sin$, avec Im. On peut alors espérer une somme géométrique.
  - Pour simplifier un mix produit-puissances de sinus et de conisus, on peut utiliser la méthode _Euler-Newton-Euler_:
    + Expression en utilisant les formules d'Euler.
    + Développement en utilisant la formule du binôme de Newton
    + Réassemblage à l'aide des les formules d'Euler.
]
#théorème(title: "Exponentielle complexe")[\
  Soit $z in CC, t in CC^*$:
  $ e^z = t <=> z = exists k in ZZ, ln abs(t) + i arg(t) + 2i k pi$
]
#proposition(title: "Alignement et perpendicularité")[\
  Soit $A,B,C$ trois points *deux à deux distincts* d'affixes respectives $(a,b,c) in CC^3$.
  - Ils sont alignés ssi $(c-a)/(c-b) in R$.
  - Ils $(A C) perp (B C)$ ssi $(c-a)/(c-b) in i R^*$.
]
#proposition(title: "Transformations")[
  - Généralement, on ramène à l'origine, puis effectue la transformation, et on renvois au centre.
  - La transformation $z -> a z +b "avec" (a,z) in CC^2$, est composée de centre $b/(1-a)$, de:
    - Une homotétie de rapport $abs(a)$,
    - Une rotation d'angle $arg(a)$.
]
#pagebreak(weak: true)
= Equations déférentielles linéaires
$KK$ vaut $RR$ ou $CC$, en fonction du contexte.
== Divers
#proposition(title: "Dérivée d'une fonction complexe")[\
  Soit $f: RR -> CC$, telle que Re($f$) et Im($f$) sont dérivables.
  $ f'(a) =  ("Re"(f))'(a) + i ("Im"(f))'(a) $
  Autrement, les opérations classiques s'appliquent.
]
#proposition(title: "Catégories de fonctions")[\
  - $f in cal(C) <=> f$ est continue.
  - $f in cal(D)^n <=> f "est" n "fois dérivable"$.
  - $f in cal(C)^n <=> f in cal(D)^n and f^((n)) in cal(C)^n$.
  - $f in cal(C)^oo <=> f$ est infiniment dérivable.
]
#proposition(title: "Primitive de fonction de forme inverse d'une fonction quadratique.")[\
  Soit $f: x |-> 1/(a x^2+b x+c)$, avec $(a,b,c) in RR^3$.
  On pose $Delta = b^2 - 4 a c$.
  - Si $Delta>=0$ : On factorise, linéarise si $Delta != 0$, et primitive.
  - Sinon: On passe sous la forme inverse de forme canonique, puis la forme $1/(1+g(x)^2)$, avec $g$ une fonction, et on primitive en $arctan compose g$.
]
#proposition(title: "Changement de variable en intégration")[\
  Soient $I,J$ deux intervalles de $RR$, $a,b in I, phi in cal(C)^1(I,RR), omega = phi^(-1), f in cal(C)^0(J in RR)$. \ On suppose $phi(I) subset J$. \ On peut alors effectuer le changement de variable $x = phi(t)$, soit $omega(x) = t$:
  $ integral_phi(a)^phi(b) f(x) dif x = integral_a^b phi'(t) times (f compose phi)(t) dif t $
  Soit aussi
  $ integral_a^b f(x) dif x = integral_omega(a)^omega(b) (f compose omega)(t) (dif t)/(omega'(x)) $
  où l'on devra exprimer $omega'(x)$ en fonction de $t$.
]
== Cas général
#théorème(title: "Strcuture des solutions")[\
  Soient:
  - $n in NN$
  - $(E)$ une équa-diff linéaire d'ordre $n$ et $S_E$ son ensemble de solutions.
  - $(H)$ l'équation homogène de $(E)$ (membre de droite nul), et $S_H$ son ensemble de solutions.
  Alors:
  - $S_e subset cal(C)^n$
  - $0_KK in S_H$
  - Pour tout $y_0 in S_E$ fixée, $S_E = {y_0 + y_H | y_H in S_H}$.
  - $S_E$ est soit $emptyset$, soit un singleton, soit un ensemble de taille infinie.
]
#théorème(title: "Principe de superposition")[\
  Soient:
  - $n in NN$
  - ${a_i | i in [|0,n-1|]} union {b_1, b_2}$ un ensemble d'appliaction continues.
  - $a_n : x -> 1$
  - $lambda_1, lambda_2$ des membres de $KK$
  - $(E_1) : sum_(i=0)^n a_i y^((i)) = b_1$
  - $(E_2) : sum_(i=0)^n a_i y^((i)) = b_2$
  - $(E) : sum_(i=0)^n a_i y^((i)) = lambda_1 b_1 + lambda_2 b_2$
  Alors $y_1 in S_E_1 and y_2 in S_E_2 => lambda_1 y_1 + lambda_2 y_2 in S_E$.
]
#théorème(title: "Solutions d'un problème de Cauchy")[\
  Un problème de Cauchy d'ordre $n_0$ (strictement inférieur au degré de l'équation) impose des conditions initiales à chaque dérivée $n$-ième de la solution, pour $0<=n<=n_0$.\
  Pour tout choix de conditions initiales, un problème de Cauchy d'ordre $n$, pour une équation de même ordre, n'admet *qu'une solution*.
]
== Ordre 1
#théorème(title: "Solution d'une equation homogène d'ordre 1")[\
  Soit $a in cal(C)^0$ et $A$ sa primitive.\
  L'ensemble des solution de $y' + a y = 0$ est:
  $ {t |-> K e^(-A(t)) | K in KK)} $
  Ainsi, la seule solution s'annulant est $0_KK$ (où $K=0$).
]
#proposition(title: "Méthode de la variation de la constante (ordre 1)")[\
  Soient $a,b in cal(C)^0$ et $A,B$ leurs primitives respectives.\
  Soient $(E) : y' + a y = b$ et $(H)$ son équation homogène.\
  Soit $y_h != 0_KK in S_h$.\
  - On prends $y in S_E$
  - On pose $C$ tq. $y = C times y_h$.(Existe, $y/y_H$)
  - On développe $y' + a y = b <=> C'y_h + C y_h' + a C y_h = C'y_h + C(y_h'+ a y_h) = b$.
  - $<=> C'y_h = b "car" y_h in S_h$
  - $<=> C' : x |-> b/y_h$
  - $<=> C : x |-> lambda + integral^x b/y_h$, $lambda in KK$.
  - $<=> y : x |-> y_H lambda + y_H integral^x b/y_h$, $lambda in KK$.
]
== Ordre 2
Soient $a,b,c,d in cal(C)^0$ et leurs primitives respectives $A,B,C,D$.\
Soient $(E) = a y'' + b y' + c y = d$ et $(H)$ son équation homogène.\
Soient $("EC"): a r^2 + b r + c = 0$. et $P_H : a X^2 + b X + c$\
#proposition[
  $ y_r : t |-> e^(r t) in S_H <=> r in S_("EC") $
]
#théorème(title: "Solutions complexes de (H)")[
  - Si $("EC")$ a deux solution complexes, $r_1, r_2$: $ S_H = {t |-> alpha e^(r_1t) + beta e^(r_2t) | (alpha, beta) in CC^2} $.
  - Si $("EC")$ n'a qu'une solution complexe, $r_0$: $ S_H = {t |-> (alpha t + beta) e^(r_0t) | (alpha, beta) in CC^2} $.
]
#proposition(title: "Solutions réelles de (H)")[
  - Dans les cas où les solutions de $("EC")$ sont toute deux réelles, on procède comme dans le cas où elles seraint complexes.
  - Sinon, les deux solutions étant conjugées, de la forme $gamma plus.minus i omega$, avec $(gamma, omega) in RR^2$.
  Alors $ S_H = {t |-> alpha cos(omega t) e^( gamma t) + beta sin(omega t) e^(gamma t) | (alpha, beta) in RR^2} $

  $ S_H = {A cos(omega t + phi )e^(gamma t) | A in RR_+, phi in ]-pi; pi[} $
  Ces deux ensembles sont égaux.
]
#proposition(title: "Recherche de solution particulière à (E)")[\
  On écrit $(E)$ sous la forme $y'' + alpha y' + beta y = phi$.
  - Si $phi$ est un polynôme, alors il existe un polynome à coefficient dans $KK$ solution de $(E)$.
  - Si il existe $(A, k) in KK^2$ tels que $c(x) = A e^(k x)$, alors il existe polynome $Q$ à coefficient dans $KK$ tel que $x |-> Q(x)e^(k x) in S_E$.
  - Si il existe $(A, omega) in KK^2$ tels que $c(x) = A cos(omega x)$, il existe un polynôme $Q$ à coefficient dans $KK$ tel que $x |-> Q(x)e^(i omega x)$ est solution de $y' + alpha y = A e^(i omega x)$ ou $y'' + alpha y' + beta y = A e^(i omega x)$. Alors $x |-> "Re"(Q(x)e^(i omega x)) in S_E$.
  - De même, si il existe $(A, omega) in KK^2$ tels que $c(x) = A sin(omega x)$, on prendra $x |-> "Im"(Q(x)e^(i omega x))$.
]
#pagebreak(weak: true)
= Théorie des ensembles
Soient $E$ un ensemble de $n in NN$ éléments, et $A = (A_i)_(i in II)$ une famille d'ensembles.
#proposition[
  $ cal(P)(E) = {F | F subset E} $.
  - $emptyset in cal(P)(E)$
  - $cal(P)(E)$ a $2^n$ éléments
]
#proposition(title: "Distributivité")[
  $ (union.big_(i in II) A_i) inter E = union.big_(i in II) (A_i inter E) $
  $ (inter.big_(i in II) A_i) union E = inter.big_(i in II) (A_i union E) $
]
#proposition(title: "Relations de De Morgan")[\
  On suppose ${(A_i)_(i in II)} subset cal(P)(E)$.
  $ (inter.big_(i in II) A_i)^C = union.big_(i in II) A_i^C $
  $ (union.big_(i in II) A_i)^C = inter.big_(i in II) A_i^C $
  Où $A_i^C = E \\ A_i$. (On le note aussi $C_E A_i$ ou $dash(A_i)$ si il n'y a aucune confusion.)
]
#proposition(title: "Recouvrement disjoint et partition")[\
  On suppose ${(A_i)_(i in II)} subset cal(P)(E)$.\
  Alors, $A$ est un  _recouvrement disjoint_ de $E$ si:
  - $forall (i,j) in II^2, i!=j => A_i inter A_j = emptyset$ (Les éléments de $A$ sont deux à deux disjoints);
  - $E = union.big_(i in II) A_i$ ($A$ est un recouvrement de $E$).
  De plus, si $forall i in II, A_i != emptyset$, $A$ est une partition  de $E$.
]
#pagebreak(weak: true)
= Notion d'application
#proposition[
  On note $cal(F)(E,F) = F^E$ l'ensemble des applications de $E$ dans $F$.
]
#proposition(title: "Fonction indicatrice de A")[
  Soit $A$ une partie de $E$.\
  On a la fonction indicatrice $1_A$ telle que :
  $ 1_A: x |-> cases(1 "si" x in A, 0 "si" x in dash(A)) $
]
#proposition(title: "Restriction est prolongement")[\
  Soient $E, F, E', F'$ des ensembles, $f in cal(F)(E,F)$ et $f' in cal(F)(E',F')$.
  - Pour tout $G in cal(P)(E)$, la restriction de $f$ à $G$ est :
  $ f_(|G) : cases(G -> F, x |-> f(x)) $
  - $f'$ est un prolongement de $f$ si:
    - $E subset E'$ et $F subset F'$;
    - $forall x in E, f'(x) = f(x)$.
]
#proposition(title: "Injectivité, Surjectivité et Bijectivité")[\
  Soit $f in cal(F)(E,F)$.
  - $f$ est injective ssi $forall (x,y) in E^2, f(x) = f(y) <=> x = y$; (Un seul antécédant).
  - $f$ est surjective ssi $forall a in F, exists alpha in E, x = f(alpha)$; (Toujours au moins un antécédant).
  - $f$ est bijective si elle est injective et surjective. ($forall a in F, exists ! alpha in E, x = f(alpha)$)
]
#remarque[
  $f$ est surjective ssi $f(E) = F$
]
#théorème(title: "Fonction réciproque")[
  + $f in cal(F)(E,F)$ bijective $<=>$ il existe $g in cal(F)(F,E)$ tq. $g compose f = "Id"_E$ et $f compose g = "Id"_F$.
  + Alors $g=f^(-1)$ et $forall (x,y) in E times F f(x)=y <=> x=f^(-1)(y)$.
  + De plus, $f(-1)$ est bijective et $(f^(-1))^(-1) = f$
]
#théorème(title: "Compositions")[\
  Soient $f in cal(F)(E,F), g in cal(F)(F,G)$.
  - $f$ et $g$ injectives $=>$ $g compose f$ injective.
  - $f$ et $g$ surjectives $=>$ $g compose f$ surjective.
  - $f$ et $g$ biejctives $=>$ $g compose f$ bijective. De plus, $(g compose f)^(-1) = f^(-1) compose g^(-1)$.
]
#proposition(title: "Tirée en arrière")[
  Soient $f in cal(F)(E,F), B in cal(P)(F)$. $ f^(<-)(B) = {x in E bar f(x) in B} $
  De plus, ${f^(<-)({y}) bar y in F}$ est un recouvrement disjoint de $E$, et ${f^(<-)({y}) bar y in "Im"(F)}$ est une partition de $E$. \
  De même, si $(F_i)_(i in II)$ est une partition de $"Im"(F)$, alors ${f^(<-)(F_i) bar i in II}$ est une partition de $E$.
]
#pagebreak(weak: true)
= Calcul matriciel
#proposition(title: "Produit matriciel")[
  Soient $A in italic(M)_(n,p)(KK)$ et $B in italic(M)_(p,q)(KK)$.
  On note $ A B = (sum^p_(k=1)a_(i,k)b_(k,j))_(i,j) in italic(M)_(n,q) $
  Ce produit est associatif et bilinéaire. \
  Il admet pour neutre (resp. élément absorbant) la matrice identitée (resp. la matrice nulle) de dimensions adaptée.
]

#proposition(title: "Matrice carée d'ordre 2")[
  En prenant $A = mat(a, b ; c, d)$
  - On note $det A = a d - b c$.
  - Ssi $det A != 0$, $ A^(-1) = 1/(det A) mat(d, -b; -c, a) $
]

#proposition(title: "Matrice élémentaire")[
  On note $ E_(i,j) = mat(
                    0,      dots,   dots,   0       ;
                    dots.v,     ,   1   ,   dots.v  ;
                    dots.v,     ,       ,   dots.v ;
                    0,      dots,   dots,   0
                    ) $
  Avec le $1$ sur la $i$-ème ligne, $j$-ème colonne. \
  On notera que:
  - $E_(i,j) E_(k,l) = delta_(j,k)E_(i,l) = cases(E_(i,j) "si" j=k, 0 "    sinon")$
  - $M E_(i,j)$ est la matrice nulle sauf en sa $j$-ème colonne qui vaut la $i$-ème de $M$.
  - $E_(i,j) M$ est la matrice nulle sauf en sa $i$-ème ligne qui vaut la $j$-ème de $M$.
]

#proposition(title: "Matrices-opérations")[
  - $epsilon_(i,j) = I_n - E_(i,i) - E_(j,j) + E_(i,j) + E_(j,i)$
  - $D_i (lambda) = I_n + (lambda - 1)E_(i,i)$
  - $T_(i, j) (lambda) = I_n + lambda E_(i,j)$

  Exemples de taille $4$:
  $ epsilon_(2,3) = mat(1,0,0,0; 0,0,1,0; 0,1,0,0; 0,0,0,1); D_2 (lambda) = mat(1,0,0,0; 0,lambda,0,0; 0,0,1,0; 0,0,0,1); T_(3,2) (lambda) = mat(1,0,0,0; 0,1,0,0; 0,lambda,1,0;0,0,0,1) $
]

#théorème(title: "Opération-matrices")[ \
  Opérations sur les lignes :
  - $L_i <-> L_j$ equiv. $A times epsilon_(i,j)$.
  - $L_i <- lambda L_i$ equiv. $A times D_i (lambda)$.
  - $L_i <- L_i + lambda L_j$ equiv. $A times T_(i,j) (lambda)$.
  Opération sur les colonnes :
  - $C_i <-> C_j$ equiv. $epsilon_(i,j) times A$.
  - $C_i <- lambda C_i$ equiv. $D_i (lambda) times A$.
  - $C_i <- C_i + lambda C_j$ equiv. $T_(j,i) (lambda) times A$. (⚠️ au sens des coefs !!)
]

#proposition[
  - $(A^(-1))^tack.b = (A^tack.b)^(-1)$
  - $A$ est symétrique si $A = A^tack.b$
  - $A$ est antisymétrique $A = -A^tack.b$ (Note: ses coefs. diag. sont nuls !)
]

#théorème[
  Une matrice triangulaire est inversible ssi ses coefs. diag. sont non nuls.
]
#pagebreak(weak: true)
= Relations d'ordre et d'équivalence

#proposition(title: "Relation d'équivalence")[
  Relation binaire reflexive, transitive, symétrique. \
  Soit $R$ une telle, $dash(x) = {y in E bar x R y}$ est la classe d'équivalence de $x$.
]

#proposition(title: "Relation d'ordre")[
  Relation binaire reflexive, transitive, antisymétrique.
]

#proposition(title: "Borne inf/sup")[
  La borne inf (resp. sup) est le plus grand de minorant (resp. le plus peteit des majorants). Si inclus, il est alors aussi le min (resp. max).
]

== Sur $ZZ$
#théorème[
  Toute partie non vide minoreé (resp. majorée) de $ZZ$ possède un plus petit (resp. plus grand) élément.
]

== Sur $RR$
#proposition[On pose $dash(RR) = RR union {- oo; +oo}$.]

#proposition(title: "Caractérisation")[
  Soit $A$ une partie non vide majorée de $RR$.
  - $a = sup A$ ssi $forall x in A, x<=a$ et $ forall epsilon > 0, exists x  in A inter ]a - epsilon, a].$
  - $a = inf A$ ssi $forall x in A, x>=a$ et $ forall epsilon > 0, exists x  in A inter [a, a + epsilon[.$
]

== Densité

#théorème(title: "Approximations décimales")[
  $ frac(floor 10^n a floor.r,10^n) <= a <= frac(floor 10^n a floor.r +1, 10^n) $
  Ces deux suites convergent vers $a$. Ainsi, tout réel est la limite d'une suite de rationels.
]

#théorème[
  $I$ est un intervalle de $RR$ ssi $forall u,v in I, forall t in RR, u<=t<=v => t in I$.
]
#pagebreak(weak: true)
= Entiers relatifs et arithmétique de $ZZ$

#proposition(title: "Relation de divisibilitée")[
  - $a bar b and b bar a => abs(a) = abs(b)$
  - $x bar a and x bar b => forall lambda, mu in ZZ, x bar lambda a + mu b$
  - $a bar b and c bar d => a c bar b d$
  - $forall c in ZZ^*, a bar b <=> a c bar b c$
]

#proposition(title: "Relation de congruance")[
  $a equiv b [n] <=> n bar a-b$
  - $a equiv b [n] and c equiv d [n] => a+c equiv c+d [n] and a c equiv b c [n]$
]

#théorème(title: "Théorème de Bézout")[
  Soient $(a,b) in ZZ^2 \\ {(0,0)}$ \
  Il existe $u,v in ZZ$ tq. $a u+b v = a and b$. $(u,v)$ est alors un couple de Bézout de $a$ et $b$.

  On notera que, $forall a,b,c in ZZ, c!=0$ :
  - $a ZZ + b ZZ = (a and b) ZZ$
  - $(a c) and (b c) = abs(c)(a and b)$

]

#théorème(title: "Lemme de Gauss")[
  Soient $a,b,c in ZZ$, $a bar b c "et" a and b = 1 => a bar c$.
]

#proposition[
  $ a or b = frac(abs(a b), a and b) $
]

#proposition(title: "Valuation p-adique")[
  Un réel peut s'écrire comme produit de puissances de nombres premiers.
]

#proposition(title: "Petit théorème de Fermat, 1640")[
  Soit $p in PP$:
  - $forall a in ZZ, p bar a^p - a$
  - $forall a in ZZ \\ p ZZ, p bar a^(p-1) - 1$
]
#pagebreak(weak: true)
= Suites réelles et complexes

== Suites réelles

#proposition(title: "Convergence d'une suite réelle")[
  $ u --> l <=> forall epsilon in RR^*_+, exists n_0 in NN, forall n in NN, (n >= n_0 => abs(u_n - l) < epsilon) $
]

#théorème[Toute suite convergente est bornée]

#proposition(title: "Divergence d'une suite réelle")[
  $ u --> +oo <=> forall A in RR, exists n_0 in NN, forall n in NN, (n >= n_0 => u_n >= A) $
  $ u --> -oo <=> forall A in RR, exists n_0 in NN, forall n in NN, (n >= n_0 => u_n <= A) $
]

#proposition(title: "Formes indéterminées")[
  - $oo - oo$
  - $frac(oo, 0)$ et $frac(0,oo)$
]

#proposition[
  Suppsosons $u-->l_u and v--> l_v$.
  - $min(u,v) --> min(l_u, l_v)$
  - $max(u,v) --> max(l_u, l_v)$
]

== Limites et suites extraites

#proposition[Une extractrice est une fonction *strictement croissante de $NN$ dans $NN$*]

#théorème[Toute suite extraite d'une fonction qui tend vers $l in dash(RR)$, tend vers $l$.

Donc si on peut en extraire qui ne convergent pas vers une même limite, la suite ne converge pas.

#underline[Note:]\
On peut extraire des suites telles que chaque terme se touve dans au moins l'une d'elle, afain de trouver la limite. Ainsi, $(u_(2n) -->_(n -> +oo) l and u_(2n + 1) -->_(n -> +oo) l )=> u --> l$, par exemple.
]

#proposition[
  $ u --> l and a<l<b => exists n_0 in NN, forall n in NN, (n>=n_0 => a<u_n<b) $
]

#théorème(title: "Théorème du point fixe")[\
  $forall n in NN, u_(n+1) = f(u_n)$ avec $f$ continue, et $u --> l in RR => f(l) = l$
]

#proposition[\
  Une suite croissante (resp. décroissante) et majorée (resp. minorée) converge.
]

== Equations de suites
#proposition(title: "Suites arithmético-géométriques")[
  $ forall n in NN, u_(n+1) = a times u_n + b $
  Alors on peut écrire $(u_(n+1) - a u_n)_(n in NN) = b$ dont on peut trouver une solution constant $alpha$ tq. : $ alpha = a alpha + b $
  Ensuite $u$ est solution $=>$ $u_(n+1)-a u_n = alpha + a alpha$ donc $u_(n+1) - alpha = a(u_n - alpha)$ donc $u_(n) - alpha = a^n (u_0 - alpha)$ et donc: $ u_n = a^n (u_0 + alpha) $

]
#proposition(title: " Suites récurrentes linéaires doubles")[
  $ (E): forall n in NN u_(n+1) + a u_(n+1) + b u_n = 0 $
  On pose d'ailleurs $(C) : r^2 + a r + b = 0$.\
  Alors on a que $(r^n)_(n in NN)$ verifie $(E)$ ssi $r$ vérifie $(C)$.

  Les solutions dans $KK$ sont alors, pour $r_1,r_2$ solutions de $(C)$:\
  - Si $r_1,r_2 in KK$, avec $lambda, mu in KK$:
    - $lambda (r_1^n + mu r_2^n)_(n in NN)$
    - $((lambda + n mu) r_1^n)_(n in NN)$ si $r_1=r_2$
  - Sinon ($KK=RR$ et $r_1,r_2$ des solutions non réeles conjuguées),\ avec $lambda, mu in RR$, et $r,theta in RR$ tq. $r_1=r e^(i theta)$ et $r_2=r e^(-i theta)$:
    - $(r^n ( lambda cos(n theta)) + mu sin(n theta))_(n in NN)$
]

#pagebreak(weak: true)
= Groupes, anneaux et corps

== Loi de composition interne
#proposition(title: "Loi de composition interne")[\
  Soit $(E,*)$ un magma, donc $E$ un ensemble et $(*)$ une loi de composition interne, donc une application de $E times E -> E$, et $x, y, z in E$

  - _Associativité :_ $(x*y)*z = x*(y*z)$
  - _Comuntativité :_ $x*y = y*x$
  - _Distributivité de $(°)$ par rapport à $(*)$ :_ $x°(y*z) = (x°y) * (x°z)$ (et de même à droite)
  - _Neutralité :_ $e$ est neutre de $(*)$ ssi $e*x = x$ (et de même à droite). Si il existe, il est unique.

]

#proposition(title: "Inverse")[
  L'inverse de $x$ est $y$ tq. $x*y = e$. Il est unique.

  On notera que si $x$ est inversible, alors $x*y=x*z <=> y=z$

  De plus, $ (x*y)^(-1) = y^(-1) * x^(-1) $

]

== Groupes

#proposition(title: "Groupe")[
  + Un magma
  + Ayant un élément neutre
  + Dont chaque élément est inversible.
  Exemples: $(CC,+); (RR,+); (QQ,+); (ZZ,+); (CC\\{0},times); (RR\\{0},times); (QQ\\{0},times)$

  Note: un groupe est _abélien_ ssi sa loi de composition interne est commutative.
]

#proposition(title: "Sous-groupe")[ $H$ est un sous groupe de $G$ ssi
  + $H subset G$
  + $e in H$
  + $forall x,y in H, x*y in H$
  + $forall x in H, x^(-1) in H$

  *Caractérisation* $H subset G$, $H != emptyset$ et $ forall x,y in H, x^(-1)*y in H $

  On notera que $H$ peut alors être un groupe si muni de $(*)$ induite sur $H$.
]

#proposition(title: "Morphisme de groupe")[
  Avec $(G,*)$ et $(G', °)$ des groupes, $phi: G->G'$ est un morphisme de $G$ dans $G'$ ssi $ phi(x*y) = phi(x)°phi(y) $
  - _Endomorphisme :_ de $G$ dans $G$
  - _Isomorphisme :_ $phi$ une bijection
  - _Automorphisme :_ Les deux précédents

  On notera que :
  - $phi(e) = e'$
  - $phi(x^k) = phi(x)^k$
  - La composée de deux morphismes en est un.
  - La réciproque d'un isomorphisme en est un.
  - L'image (resp. le tiré en arrière) d'un s\\groupe par un morphisme est un s\\groupe.
]

#proposition(title: "Noyeau et image")[
  $ ker phi = {x in G bar phi(x) = e'} $
  $ im phi = {phi(x) bar x in G} $
  - $ker phi = {e} <=> phi$ injective
  - $im phi = G' <=> phi$ surjective
]

== Anneaux

#proposition(title: "Anneaux")[$(A,+,times)$ est un anneau ssi
 + $(A,+)$ est un groupe abélien de neutre $0_A$
 + $(A, times)$ un magma associatif de neutre $1_A$
 + $(times)$ est distributif par rapport à $(+)$

Alors, on notera que:
 - $a times 0 = 0 times a = 0$
 - $-(a times b) = (-a) times b = (-b) times a$

De plus, si $a$ et $b$ commutent:
$ (a+b)^n = sum_(k=0)^n binom(n,k) a^k b^(n-k) $
$ a^n - b^n = (a-b) sum_(k=0)^(n-1) a^k b^(n-1-k) $

_Intégrité :_ $forall a,b in A, a b = 0 => a=0 or b=0$

Enfin, $(A^*, times)$ est un groupe. ($A^*$ étant l'ensemble des inversibles par $(times)$ de $A$)
]

#proposition(title: "Sous-anneau")[ $B$ est un sous anneau de $(A,+,times)$ ssi
 - $B subset A$
 - $B$ est s\\groupe de $(A,+)$
 - $forall x,y in B, x y in B$
 - $1_A in B$
]

#proposition(title: "Morphisme d'anneau")[
  Soit $(A,+,times)$ et $(B,+,times)$ des anneaux, et $phi: A-> B$, $phi$ est un morphisme d'anneau ssi
  + $phi(x+y) = phi(x) + phi(y)$
  + $phi(x y) = phi(x)phi(y)$
  + $phi(1_A) = 1_B$

  On notera que l'image (resp. le tiré en arrière) d'un s\\anneau par un morphisme d'anneau est un s\\anneau.


]

== Corps

#proposition(title: "Corps")[
  Un groupe est un anneau tq.
  + il est commutatif
  + il est non-nul ($E != {0}$)
  + $forall x in E, x!=0, x^(-1) in E$

  On notera que:
  - Un corps est intègre.
  - $KK$ un corps, $(KK\\{0} = KK^*, times)$ est un groupe.
]#pagebreak(weak: true)
=  Limite d’une fonction
== Définitions

#proposition[Soient $E$ un ensemble et $I = (a,b)$ avec ( et ) valant [ ou ] \
_Intérieur de $E$, $circle(E)$:_\ Ensemble des $x in E, exists delta>0, ]x-delta;x+delta[ subset E$. Pour $I$: $]a,b[$.

_Adhérance de $E$, $dash(E)$:_\
Ensemble des éléments de $dash(RR)$ limites de suites d'éléments de $E$. Pour $I$: $[a,b]$.

_Frontière de $E$:_ $dash(E)\\circle(E)$.
]

#proposition(title: "Définition des limites")[
  Soit $f : I -> RR$
  - $f-->_a l <=> forall epsilon > 0, exists alpha > 0, forall x in I, abs(x-a)<alpha => abs(f(x)-l)<epsilon$
  - $f-->_a + oo <=> forall A > 0, exists alpha > 0, forall x in I, abs(x-a)<alpha => f(x) >= A$
  - $f-->_(+ oo) l$ <=> $forall epsilon > 0, exists B > 0, forall x in I, x>=B => abs(f(x)-l)<epsilon$
  - $f-->_(+ oo) - oo$ <=> $forall A < 0, exists B > 0, forall x in I, x>=B => f(x)<=A$

    Déduire les autres cas.
]

== Considérations utiles

#proposition[La limite est unique.]

#théorème[$f-->_(a in dash(RR)) l in RR => f$ est bornée au voisinage de a.]

#théorème(title: "Caractérisation séquentielle de la limite")[
  $forall (u_n)_(n in NN) in I^NN$ tq. $u -->_(+ oo) a$:  $ f -->_a  l <=> f(u_n) -->_(n--> + oo) l $
]

#proposition(title: "Passage à la limite")[
  Avec $a in dash(I)$, et $f -->_a l$:
  - $m$ minore $f$ au voisinage de $a$ $=>$ $m<=a$
  - $M$ majore $f$ au voisinage de $a$ $=>$ $a<=M$
]

#théorème(title: "Théorème de la limite monotone (partiel)")[\
  Avec $f: I->R$ croissante, $(alpha,beta) = (inf I inter RR, sup I inter RR)$:
  - en $alpha$: si $f$ est minorée alors elle y tend vers une limite finie, sinon vers $-oo$.
  - en $beta$: si $f$ est majorée alors elle y tend vers une limite finie, sinon vers $+oo$.
]

#pagebreak(weak: true)
= Continuité
#proposition[$f: I->RR$ est continue ssi $forall a in I, f-->_a f(a)$]

#proposition[\
  Soit $lambda in RR$, $f,g : I-> RR$ continues en $a$, et $H: J->R$ tq. $g(I) in J$ et $h$ continue en $g(a)$, on a:
  - $abs(f), lambda f$ continues en $a$
  - $f+g$ et $f g$ continues en $a$ et si $g(a) != 0$, $f/g$ aussi
  - $h compose g$ continue en a

]

#théorème(title: "TVI")[
  L'image d'un intervalle par une fonction continue est un intervalle.

  Ce théorème fonctionne à l'infini et aux limites.
]

#théorème(title: "Théorème des bornes atteintes")[\
  Toute fonction continue sur un segment est bornée et atteint ses bornes.
]

#théorème(title: "Théorème de la bijection strictement monotone")[\
  Avec $I$ un intervalle, $f: I->RR$ et $J=f(I)$, si deux quelconques des trois propriétés suivantes sont vraies, la troisième l’est également :
  + $f$ est strictement monotone sur $I$
  + $f$ est continue sur $I$
  + $J$ est un intervalle et $f$ réalise une bijection de $I$ sur $J$

  De plus, lorsque ces conditions sont vérifiées, l’application réciproque $f^(−1) : J ->I$ est aussi une bijection continue strictement monotone.

]
#pagebreak(weak: true)

= Polynômes
#proposition(title: "Écriture du produit")[
  $ "Avec" P = sum_(k=0)^(+oo)a_k X^k "et" Q = sum_(k=0)^(+oo)b_k X^k ":" $
  $ P+Q = sum_(k=0)^(+oo)(a_k + b_k) X^k = sum_(k=0)^(+oo)s_k X^k "avec" s_k = a_k + b_k $
  $ P Q = sum_(i,j in NN) a_i b_j X^(i+j) = sum_(k=0)^(+oo)p_k X^k "avec" p_k = sum_(i=0)^k a_k b_(k-i) $
]
#proposition(title: "Degré")[Avec $P,Q in KK[X]$:
  - $deg P+Q <= max(deg P, deg Q)$
  - $deg P+Q = deg P + deg Q$
  - $deg P compose Q = deg P times deg Q$ si $Q$ n'est pas constant, $0$ ou $-oo$ sinon.

  De plus, $P$ a au plus $deg P$ racines distinctes.
]
#proposition[\
  - Si $P in KK_n [X]$ s'annule $n+1$ fois, alors $P=0$
  - $P,Q in KK_n [X]$ coïncident sur $n+1$ points, alors $P=Q$
]

#proposition(title: "Relations coefficients racines")[
  $ "Pour" P = sum_(k=0)^n a_k X^k =lambda product_(k=1)^n (X-alpha_k), "on a" P = lambda (X^n + sum_(k=1)^n (-1)^k sigma_k X^(n-k)) $
  $ "Avec" sigma_k = sum_(1<=i_1<=...<=i_k<=n) alpha_i_1 times ... times alpha_i_k = (-1)^k times frac(a_(n-k), a_k) $

  Les $(sigma_k)_(k in [|1,n|])$ sont les _fonctions symétriques élémentaires_ des racines de $P$.

  _Exemple:_ Pour $n = 5$, $sigma_3 = alpha_1 alpha_2 alpha_3 + alpha_2 alpha_3 alpha_4 + alpha_3 alpha_4 alpha_5 = - frac(a_2,a_5)$
]

#proposition[Une racine d'ordre $r in NN^*$ de $P$, est une racine d'ordre $r-1$ de $P'$
]

#proposition(title: "Décomposition en polynômes irreductibles")[\
  #underline[_Théorème fondamental de l'algèbre (d'Alembert-Gauss):_]\ Tout polynôme non constant à coefficients dans $CC$ admet au moins une racine dans $CC$.

  On en déduit que:
  - Les polynômes irreductibles de $CC$ sont de degré $1$, et que tout polynôme non constant dans est scindé dans $CC[X]$.

  - Les polynômes de $RR[X]$, si $z in CC$ en est racine alors $dash(z)$ aussi.

  - On déduit du point précédent que les polynômes irreductibles de $RR$ sont ceux de degré $1$, et ceux de degré $2$ à racines non réeles.

  Ainsi, pour $P in CC_n [X]$ de coefficient dominant $c$ et de racines $z_1,...,z_n$: $ P = c product_(k=1)^n (X-z_k) $

  Et, pour $P in RR_n [X]$ de coefficient dominant $c$ et de racines réelle $a_1,...,a_r$ et complexes $z_1,...,z_m,, dash(z_1),...,.dash(z_m)$ tq. $r+2m=n$: $ P = c product_(k=1)^r (X-z_k) product_(k=1)^r (X-z_k) (X- dash(z_k)) = P = c product_(k=1)^r (X-z_k) product_(k=1)^r (X^2 - 2"Re"(z_k) + abs(z_k)^2) $

  _Note:_ Ainsi, tout polynôme à coefficients réels de degré impair a au moins une racine réelle.
]

#proposition(title: "Formule d’interpolation de Lagrange.")[\
  On cherche un polynôme passant par tout les points ${(x_k, y_k) "couples de" KK^2 bar k in [|0;n|]}$.\
  On supposera $forall i,j in [|0;n|], x_i=x_j => y_i=y_j$, sinon le problème est insolvable.

  L'ensemble des solutions est alors ${ P times D + P_0 bar P in KK[X] }$ avec:
  $ D = product_(k=0)^n (X-x_k) = 0 "si" X in.not (x_k)_(k in [|0;n|]) $
  $ P_0 = sum_(i=0)^n y_i L_i "une solution particulière" $
  $ L_i = frac(1,alpha_i) product_(j in [|0;n|]\\{i}) (X-x_j) = delta_(i,j) $
  $ alpha_i = product_(j in [|0;n|]\\{i}) (x_i - x_j) $

  $ "Ainsi," P_0 = sum_(i=0)^n (y_i times product_(j in [|0;n|]\\{interleave}) frac((X-x_j),(x_i - x_j)) ) $
]

#proposition(title: "Formule de Leibniz")[
  $ (P Q)^((n)) = sum_(k=0)^n binom(n,k) P^((k)) Q^((n-k)) $
]

#proposition(title: "Formule de Taylor")[
  $ P = sum_(k=0)^(deg P) frac(P^((k)) (a),k!) (X-a)^k $
]

#pagebreak(weak:true)
= Dérivabilité
== Généralitées

#proposition[ $D^(n+1) subset C^n$]

#proposition[
  La tangente à $cal(C)_f$ en $a$ est la droite d'équation $y = f(a) + f'(a)(x-a)$
]

#proposition(title: "Caractérisations")[
  $f'(a) = l$ est équivalent à :
  - _Carathéodory:_ $exists phi_(f,a) : I -> RR, phi_(f,a) = l$ tq. $forall x in I, f(x) = f(a) + (x-a) phi_(f,a) (x)$
  - _Hilbert:_ $exists epsilon : I -> RR, epsilon -->_a 0$ tq. $forall x in I, f(x) = f(a) + (x-a) dot l + (x-a)epsilon(x)$

Note: $epsilon(x) = o(x-a)$ (chap. XX)
]

#proposition(title: "Formule de Leibniz")[
  $ (f g)^((n)) = sum_(k=0)^n binom(n,k) f^((k)) g^((n-k)) $
]

== Théorèmes
#théorème[
  Si $f$ possède un extremum local en $a in circle(I) $ et y est dérivable, alors $f′(a) = 0$.
]

#théorème(title: "Égalité - ou Théorème - des accroissement finis - TAF")[\
  Soient $(a,b) in I^2$ avec $a<b$ et $f in C^0([[a,b],RR]) inter D(]a,b[, RR)$.
  Alors il existe $c in ]a,b[$ tq. :
  $ f'(c) = frac(f(b) - f(a), b-a) $

  _Note (Théorème de Rolle):_ si $f(a) = f(b)$ on a $f'(c) = 0$.
]

#théorème(title: "Inégalité des accroissement finis - IAF")[\
  Soient $(a,b) in I^2$ avec $a<b$ et $f in C^0([[a,b],RR]) inter D(]a,b[, RR)$.

  - Si $f'$ est majorée par $M$ alors
    $f(b) - f(a) <= M(b-a)$
  - Si $f'$ est minorée par $m$ alors
    $m(b-a) <= f(b) - f(a)$
  - Si $abs(f')$ est majorée par $K>0$ alors $abs(f(b) - f(a)) <= K abs(b-a)$ et $f$ est _$K$-lipschitzienne_.

  _Notes:_
  - Toute fonction lipschitzienne est continue.
  - Si $f in C([a,b], RR)$, alors $f$ est lipschitzienne sur $[a, b]$.


]
== Convexité
#proposition(title: "Définition")[
  Pour $f: I -> RR$:
  - $f$ est convexe signifie $forall x,y in I, forall lambda in [0,1] f(lambda x + (1-lambda) y) <= lambda f(x) +  (1-lambda) f(y)$
  - $f$ est concave signifie $forall x,y in I, forall lambda in [0,1] f(lambda x + (1-lambda) y) >= lambda f(x) +  (1-lambda) f(y)$
]

#proposition(title: "Inégalité de Jensen")[\
  Pour $f: I -> RR$ convexe, $x_1, dots, x_n in I$ et $lambda_1, dots, lambda_n >= 0$ tq. $lambda_1 + dots + lambda_n = 1$ :
  $ f(lambda_1 x_1 + dots + lambda_n x_n) <=  lambda_1 f(x_1) + dots + lambda_n f(x_n)$
]

#théorème[
  $f: I-> RR$ est convexe ssi $forall a in I$, $x in I\\{a}|-> frac(f(x) - f(a), x-a)$ est croissante.

  _Note (Théorème des trois pentes):_ Vrai ssi $forall a<b<c in I$, $frac(f(a) - f(b), a-b) <= frac(f(a) - f(c), a-c) <= frac(f(b) - f(b), b-c)$
]

#théorème[
  Pour $f: I -> RR$ convexe:
  - $forall a in circle(I), f$ est dérivable à gauche et àa droite et $f'_g (a)<=f'_d (a)$
  - $f$ est continue sur $circle(I)$
]

#pagebreak(weak: true)
= Fractions rationelles
== Théorie

#théorème(title: "Décomposition en élémnts simples d'une fraction rationelle dans " + $KK$)[\
Soit $R in KK(X)$.
  - $R$ s'écrit sous la forme $frac(P,Q)$ avec $Q$ unitaire.
  - $Q$ s'écrit sous la forme $H_1^(n_1) times dots times H_p^(n_p)$ où
    - les $H_, dots, H_p$ sont des polynômes irreductibles unitaires.
    - les $n_1, dots, n_p in NN^*$

  Alors $R$ se décompose sous la forme $E + F_1 + dots + F_p$ avec
  - $E in KK[X]$ la partie entière de $R$.
  - $forall k in [|1;p|], F_k$ s'écrit comme $sum_(j=1)^(n_k) frac(J_(k,j),H_k^j)$ avec
    - $forall j in [|1;n_k|] deg J_(k,j) < deg H_k$.
]

#théorème(title: "Décomposition en élémnts simples d'une fraction rationelle dans " + $CC$)[\
  Soit $R in CC(X)$
  - de pôles $lambda_1, dots, lambda_n$.
  - de multiplicitées respectives $m_1, dots, m_n$.

  Alors il existe une unique famille $(a_(k,j))_(k in [|1;n|], j in [|1;m_k|])$ soit $a_(1,1), dots, a_(1,m_1), dots, a_(n,1), dots, a_(n,m_n)$ tq.:
  $ R = E + sum_(k=1)^n sum_(j=1)^(m_k) frac(a_(k,j),(X - lambda_k)^j) $
  où $E$ est la partie entière de $R$.
]

#théorème(title: "Décomposition en élémnts simples d'une fraction rationelle dans " + $RR$)[\
  Soit $R = frac(P,Q) in RR(X)$
  - avec $Q$ unitaire
  - où $Q$ s'écrit $product_(i=1)^q (X-lambda_i)^(m_i) times product_(i=1)^p H_i^(n_i)$ où
    - les $lambda_1, dots, lambda_q$ sont les racines deux à deux distinctes de $Q$.
    - les $H_, dots, H_p$ sont des polynômes de degré 2 sans racine réelle.

  Alors $R$ se décompose de façon unique sous la forme:
  $ R = E + sum_(k=1)^q sum_(j=1)^(m_k) frac(a_(k,j),(X - lambda_k)^j)  + sum_(k=1)^p sum_(j=1)^(n_k) frac(b_(k,j)X + c_(k,j),H_k^j) $
  où $E$ est la partie entière de $R$.
]

== Méthodes de calcul
Ces méthodes s'appliquent à une fraction $R$ tq. $deg R < 0$. Il conviendra de retirer la partie entière par division euclidienne.

=== Diverses simplifications

#proposition(title: "Par symétrie, parité et imparité ")[
  $ "Exemple de" R=frac(1,(X-1)^2 (X+1)^2) $
  + On a qu'il existe $a,b,c,d in RR$ tels que: $ R = frac(a,X-1) + frac(b,(X-1)^2) + frac(c,X+1) + frac(d,(X+1)^2) $
  + On a aussi que: $ R(-X) = -frac(a,X+1) + frac(b,(X+1)^2) + -frac(c,X-1) + frac(d,(X-1)^2) $

  Ainsi $a=-c$ et $b=d$ !
]

#proposition(title: "Par conjugaison")[
  $ "Exemple de" R=frac(1,X^2+1) in R(X) $
  + On a qu'il existe $a,b in CC$ tels que: $ R = frac(a,X-i) + frac(b,X+i) $
  + On a aussi que $ dash(R) = frac(dash(a),X-dash(i)) + frac(dash(b),X+dash(i)) = frac(dash(a),X+i) + frac(dash(b),X-i) $

  Or, $R = dash(R)$ car $R in R(X)$, donc $dash(b) = a$ !
]

=== Détermination des coefficients
#proposition(title: "Méthode de base")[\ Cette méthode consiste à multiplier l'équation par le dénominateur du coefficient à déterminer, puis à l'évaluer en son pôle, et enfin à retrancher la fraction avec le coefficient déterminé et à réitérer.
  $ "Exemple de" R=frac(3X+2,(X-1)^2) in R(X) $
  $ "On a qu'il existe" a,b in RR "tels que:" R = frac(a,X-1) + frac(b,(X-1)^2) $
  + Alors $R(X-1)^2 = a(X-1) + b$ donc $3X+2 = a(X-1) + b$.\
    En évaluant en 1, on obtient *$b=5$*

  + Ensuite, on décompose $ (R - frac(b,(X-1)^2) = frac(3X-3,(X-1)^2) = 3frac(X-1,(X-1)^2) = frac(3,X-1)) = frac(a,X-1) $
    Immédiatement, *$a=3$*.
]

#remarque(title: "Cas d'un pôle simple")[
  $ "Exemple de" R = frac(3X+2,X^2 - 1) = frac(A,B) $
  $ "On a qu'il existe" a,b in RR "tels que:" R = frac(a,X-1) + frac(b,X+1) $
  $ "Alors" a = frac(A(1),B'(1)) = frac(3,2 times 1) = 3/2 "et" b = frac(A(-1),B'(-1)) = frac(3,2 times (-1)) = - 3/2 $
]

#proposition(title: "Résidus")[\
  Cette méthode consiste à comparer les limites quand $ x--> +oo$ de $x R(x)$ sous sa forme décomposée et mono-fractionnaire.
  $ "Exemple de" R = frac(3,(X+1)(X-1)^2) $
  $ "On a qu'il existe" a,b,c in RR "tels que:" R = frac(a,X-1) + frac(b,(X-1)^2) + frac(c,X+1) $
  + Par la méthode de base, on a $c=frac(3,(-1-1)^2)=3/4$ et $b=frac(3,1+1)=3/2$
  + $deg R = -2$ donc $x R(x) --> 0$.
  + De l'autre côté, on a :$ a frac(x,x-1) + b frac(x,(x+1)^2) + c frac(x,x+1) --> a+c $

  Ainsi, $a=-c=-3/4$.
]

#proposition(title: "Évaluation hors des pôles")[
  Il est intéréssant de noter qu'avec $n$ coefficient à determiner, il suffirait d'évaluer en $n$ points pour avoir un systèmes $n$-inconnues/$n$-équations.

  Utile principalement quand il reste peu de coefficients à déterminier.
]

#proposition(title: "Identification")[
  En dernier recours, par exemple pour $frac(1,X(X+1)) = frac(a,X) + frac(b,X*+1)$, $frac(a,X) + frac(b,X*+1) = frac((a+b)X+a,X(X+1))$ donc $a+b=0$ et $a=1$ donc $(a,b) = (1,-1)$.
]

#proposition(title: "Développements limités")[
  Exemple pour un pôle double.
  $ R = frac(a,X-lambda) + frac(b,(X-lambda)^2) + G "avec" G "n'ayant pas" lambda "comme pôle." $

  Alors pour h au voisinage de 0, $h^2 R(lambda + h) = b + a h + h^2 G(lambda + h)$.\
  Or $G(lambda + h)$ est borné, donc $h^2 G(lambda + h) = o(h)$.\
  Alors par unicité des DL, il suffit de calculer un DL de $h^2 R(lambda + h)$.

   $ "Exemple pour la partie polaire de " R=frac(3X-1,(X-1)^2 (X^2+1)) "associée à 1." $
   Pour $h$ au voisinage de 0, on a:\
  $ h^2 R(1+h) = (3h+2)/(2+2h+h^2) = 1/2 (3h+2)/(1+h+1/2 h^2) = 1/2 (3h+2) (1-h+o(h)) = 1 + 1/2 h + o(h) $
   $ "La partie polaire recherchée est alors " 1/(2(X-1)) + 1/(X-1)^2 $
]

== Décomposition de $P'/P$
#proposition(title: "Dans " + $KK$)[
  $ "Pour" P = lambda product_(k=1)^n H_k^(p_k) in KK[X] $
  - $lambda in KK$ et $p_1, dots, p_n in NN^*$
  - $H_1, dots, H_n$ des polynômes irreductibles deux à deux distincts

  $ P'/P = sum_(k=1)^n H'_k/H_k p_k $
]

#proposition(title: "Dans " + $CC$)[
  Pour $P in CC[X]$
  - à $n$ racines distinctes $a_1, dots, a_n$
  - de multiplicitées respectives $r_1, dots, r_n$

  $ P'/P = sum_(k=1)^n r_k/(X-a_k) $
]

#pagebreak(weak: true)
= Espaces vectoriels
== Définitions et caractérisations
#proposition(title: "Espace vectoriels")[\
  On appelle $(E,+,dot)$ un _$KK$-ev_ avec
  - $+$ une lci
  - $dot : KK times E -> E$
  - $E$ un ensmble fini
  tel que $forall lambda,mu in KK$ appelés _scalaires_,  $forall x,y in E$ appelés _vecteurs_:
  + $(E,+)$ est un groupe commutatif (de neutre $0_E$)
  + $1_KK dot x = x$
  + $(lambda + mu) dot x = lambda dot x + mu dot x$
  + $lambda dot (x+y) = lambda dot x + lambda dot y$
  + $(lambda times mu) dot x = lambda dot (mu dot x)$
]

#proposition[
  Soit $F subset E$, avec $E$ un _$KK$-ev_, $F$ est un _sev_ de $E$ si:
  + F est non vide
  + F stable par combinaison linéaire $(forall x,y in F, lambda in KK, lambda x + y in F)$
]

#proposition[
  - $lambda dot_E x = 0_E <=> x = 0_E "ou" lambda = 0_KK$
  - $-x = (-1) dot x$
]

#proposition[
  Dans le contexte $E$ un _$KK$-ev_, et $X subset E$, on note $"Vect"(X)$ le plus petit _sev_ de $E$ contenant $X$.

  _*Théorème:*_ C'est l'ensemble des combianaisons linéaires de $X$.
]

== Propositions utiles

#proposition[
  Pour $(E,+_0,dot_0)$ un _$KK$-ev_ et $X != emptyset$, $(E^X,+,dot)$ est un _$KK$-ev_ avec le $(+)$ et le $(dot)$ usuels sur les applications.
]

#théorème[
  - L'intersection d'sev est un sev.
  - L'union d'sev est un sev ssi l'un des sev contient tout les autres.
]

#proposition[
  - $X subset Y => "Vect"(X) subset "Vect"(Y)$
  - $"Vect"("Vect"(X)) = "Vect"(X)$
]

== Considérations sur la somme
Avec $F$ et $G$ des _sev_ de $E$, et $X,Y subset E$

#théorème[
  - $F + G = "Vect"(F union G)$
  - $"Vect"(X) + "Vect"(Y) = "Vect"(X union Y)$
]

#proposition[
  $F + G = F plus.circle G$ (La somme est directe) équivaut à
  + $forall x in F+G, exists ! (f,g) in F times G, x = f + g$
  + $forall (f,g) in F times G, f+g=0_E => f=g=0_E$
  + $F inter G = {0_e}$

  De plus, si $F plus.circle G = E$, $F$ et $G$ sont supplémentaires.
]

== Sous-espaces affines

#proposition[Pour $E$ un _ev_, $F$ un _sev_ de $E$, et $u in E$
  $ cal(F) = u + E $
  est un sous espace affine de $E$ de direction $F$.

  On notera alors que $forall a in cal(F), forall b in E$:
  - $F = {x-y bar x,y in cal(F)}$
  - $cal(F) <=> b-a in F$
  - $cal(F) = a + F$

]

#théorème[\
  On dit $cal(F)$ parallèle à $cal(G)$ si $F subset G$.\
  Donc si $F inter G != emptyset$, $cal(F)$ et $cal(G)$ sont _concourants_ ou _séctants_.

  Ainsi, $cal(F)$ est parallèle à $cal(G)$ ssi $cal(F) subset cal(G)$ ou $cal(F) inter cal(G) = emptyset$.
]



#pagebreak(weak: true)
= Analyse asymptotique
== Notation $o$/$O$
#proposition(title: "Définition")[\
  _Suites:_
  - $u_n = O(v_n) <=> u/v "bornée"$

  - $u_n = o(v_n) <=> u/v -->_(+oo) 0$

  _Fonctions:_
  - $f=_a O(g) <=> f/g "est bornée au voisinage de" a$

  - $f=_a o(g) <=> f/g -->_a 0$
]

#proposition(title: "Opérations interdites")[
  + Somme des deux côtés: $f + h =_a o(g + k$)
  + Composition à gauche: $psi compose f =_(psi(a))o(psi compose g)$
]

== Notation équivalent
#proposition(title: "Définition")[\
  _Suites:_
  - $u_n tilde v_n <=> u/v -->_(+oo) 1$

  _Fonctions:_
  - $f tilde_a g <=> f/g -->_a 1$
    - $<=> f - g =_a o(g)$
    - $<=> f - g =_a o(f)$
]

#proposition(title: "Opérations interdites")[
  + Somme des deux côtés: $f + h tilde_a o(g + k$)
  + Composition à gauche: $psi compose f tilde_(psi(a))o(psi compose g)$
]

==  Développements limités
=== Théorie
#proposition(title: "DLs à connaitre")[Pour $x$ au voisinage de 0:
  $ e^x = 1 + x + x^2/2! + dots + x^n/n! + o(x^n) $
On en déduit sh et ch les parties respectivements impaires et paires de $e^x$,\ et $sin x = (-1)^k times k"-ième"$ terme de sh comme $cos x = (-1)^k times k"-ième"$ de ch. Pour les tangentes, on fait le quotient et se ramène à $1/(1 plus.minus x)$.

$ (1+x)^a = 1 + a x + (a(a-1))/2! x^2 + dots + (a(a-1)(a-2) dots (a-(n-1)))/n! x^n + o(x^n) $
On en déduit directement $sqrt(1 plus.minus x)$ et $1/(1 plus.minus x)$, ainsi que $ln(1 plus.minus x)$ en intégrant le deuxième.
De plus, on déduit $arcsin$, $arccos$ et $arctan$ en intégrant respectivement $1/sqrt(1-x^2)$, $(-1)/sqrt(1-x^2)$ et $1/(1+x^2)$.
]
#proposition(title: "Opérations licites")[Pour deux DL d'ordres $n,m$.
  - Somme (*!!*)
  - Produit
  - Quotient
  - Composition

On ne gardera que les termes d'ordre adapté.
]
#théorème[
  La partie principale d'un DL$(x_0,n)$ est unique.
]
#proposition[
  Si f est paire (resp. impaire) et admet un DL$(0, n)$, alors la partie principale de ce DL est un polynôme pair (resp. impair).
]
#théorème[
  Si $f'$ admet un DL$(x_0,n)$ alors $f$ en admet un DL$(x_0,n+1)$ dont la
  - partie principale est la primitive du premier
  - le terme constant vaut $f(x_0)$ en $x_0$

  On en déduit la formule de Taylor-Young:
  $ f(x) =_(x->x_0) sum_(k=0)^n (f^((k))(x_0))/k! (x-x_0)^k + o((x-x_0)^k) $
]
=== Cas utiles
#proposition[
  $ n! tilde sqrt(2n pi)(n/e)^n $
  $ ln(n!) =_(n-->+oo) n ln(n) - n + 1/2 ln (2pi) + o(1) $
]
#théorème[
  $ forall alpha in RR (sum^N_(n=1) 1/n^alpha)_(N in NN) "converge ssi" alpha>1 $
]
