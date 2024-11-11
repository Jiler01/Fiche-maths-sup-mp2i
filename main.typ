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
#remarque[On ne reviendra pas ici sur toutes les définitions.]
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
  Soit $I$ un interval de $RR$, et $f: I -> RR$ continue est strictement monotone.
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
]<th3.5>
#théorème[
  Soit $n in NN$, et $(a,b) in CC$ :
  $ a^n - b^n = (a-b) sum_(k=0)^(n-1) a^k b^(n-1-k) $
]<th3.6>
#théorème(title: "Sommation géométrique")[Corrolaire de @th3.6\
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
  _Exemple_: $(x,y,z) in {(3z+2,9z^2,z) | z in CC}$
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
    + Expression en utilisant les formules d'Euler (@prop1.5).
    + Développement en utilisant la formule du binôme de Newton (@th3.5)
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
  - $f in cal(C)^infinity <=> f$ est infiniment dérivable.
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
  $ (union.big_(i in II) A_i) sect E = union.big_(i in II) (A_i sect E) $
  $ (sect.big_(i in II) A_i) union E = sect.big_(i in II) (A_i union E) $
]
#proposition(title: "Relations de De Morgan")[\
  On suppose ${(A_i)_(i in II)} subset cal(P)(E)$.
  $ (sect.big_(i in II) A_i)^C = union.big_(i in II) A_i^C $
  $ (union.big_(i in II) A_i)^C = sect.big_(i in II) A_i^C $
  Où $A_i^C = E \\ A_i$. (On le note aussi $C_E A_i$ ou $dash(A_i)$ si il n'y a aucune confusion.)
]
#proposition(title: "Recouvrement disjoint et partition")[\
  On suppose ${(A_i)_(i in II)} subset cal(P)(E)$.\
  Alors, $A$ est un  _recouvrement disjoint_ de $E$ si:
  - $forall (i,j) in II^2, i!=j => A_i sect A_j = emptyset$ (Les éléments de $A$ sont deux à deux disjoints);
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