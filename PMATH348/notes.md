---  
title: PMATH 348 Lecture Notes  
description: by Imaad Mian | Taken during Spring 2023  
class: pmath348  
kramdown:  
  hard_wrap: true  
---

<span style="display=none">
$$
\newcommand{\bb}[1]{\mathbb{#1}}  
\newcommand{\N}{\mathbb{N}}   
\newcommand{\Z}{\mathbb{Z}}   
\newcommand{\Q}{\mathbb{Q}}   
\newcommand{\R}{\mathbb{R}}   
\newcommand{\C}{\mathbb{C}}   
\newcommand{\F}{\mathbb{F}}  
\newcommand{\E}{\mathcal{E}}  
\newcommand{\H}{\mathcal{H}}  
\newcommand{\l}{\mathcal{l}}  
\newcommand{\iso}{\cong}  
\newcommand{\orb}[1]{\text{Orb}({#1})}  
\newcommand{\stab}[1]{\text{Stab}({#1})}  
\newcommand{\tleq}{\trianglelefteq}  
\newcommand{\tgeq}{\trianglerighteq}  
\newcommand{\tf}{\therefore}  
\newcommand{\qed}{ // Q.E.D }  
\newcommand{\sub}{\subseteq}  
\newcommand{\sup}{\supseteq}  
$$
</span>
The following is a cleaned up version of an exported Obsidian file.
The original Markdown is available [here](./PMATH348_Lecture_Notes.md).
It will look better in Obsidian.

- TOC
{:toc}

### Chapter 1 - Sylow ("See-Low") Theory

**Prop [Cauchy's Theorem for Finite Abelian Groups]** If `$G$` is a finite abelian group and `$p \in \bb{N}$` is prime with `$p \mid |G|$` then `$G$` has an element of order `$p$`. 

**Definition [Sylow Groups]** `$G$` a group.  
1. We say `$G$` is a `$p$`-**group**, `$p$` prime, if `$|G| = p^n, n \in \bb{N}$`  
2. We say `$H \leq G$` is `$p$`-**subgroup** if `$H$` is a `$p$`-group.  
3. Say `$|G| = p^n m, n \in \bb{N}, p \nmid m, p$` prime. Any subgroup `$H \leq G$` of order `$p^n$` is called a **Sylow `$p$`-subgroup**

*Recall[Group Actions]*  
1. Suppose a finite group `$G$` acts on a finite set `$X$`, i.e. `$\bullet: G \times X \to X$` where   
	1. `$\forall x, e \cdot x = x$`  
	2. `$\forall g, h \in X, \ g(hx) = (gh)x$`  
2. For `$x \in X$`, `$\orb{X}$`  
3. *Orbit Stabilizer Theorem:* `$\forall x \in X$`  
`$$|G| = |\stab{X}| \cdot |\orb{X}|$$`
4. If `$x, y \in X$`, then either `$\orb{X} \cap \orb{Y} = \varnothing$` or `$\orb{X} = \orb{Y}$`.   
	Therefore `$X = \sqcup \orb{X_i}$` where `$X_i$` are distinct orbit reps.  
5. Assume `$X = G$`, and `$G$` acts on `$X$` by conjugation, i.e. `$gx = gxg^{-1}$`  
	For `$x \in X$`, `$\orb{x}$` = Conjugacy Class, and `$\stab{X} = C(x)$`, the centralizer (aka the things that commute with `$x$`)  
6. `$|\orb{X}|=1 \iff \orb{X} = \{x\} \iff \forall g, gxg^{-1} = x \iff Z(G)$`  
7. *The Class Equation* `$|G| = |Z(G)| + \sum[G:C(a_i)]$`

**Theorem [Sylow's 1st Theorem]**  
Let `$G$` be a finite group of order `$p^n$`m where `$p$` prime, `$n \in \bb{N}$`,  `$p \nmid m$`.  
There exists a subgroup `$H \leq G$` s.t. `$|H| = p^n$`

*Proof (by Induction):*  
if `$|G| = 2$`, take `$H=G$`. Proceeding inductively, assume `$G = p^n m, p \nmid m$`

Case 1: `$p \mid |Z(G)|$`. By Cauchy, `$\exists a \in Z(G)$` s.t. `$|a| = p$`. Take `$N = <a>$`

If `$n=1, H=N$`. Assume `$n > 1$`. Since `$N \subseteq Z(G)$`, `$N \tleq G$`. Note `$|G/N| = p^{n-1}m$`.

By induction, `$\exists \ \bar{p} \leq G/N$` such that `$|\bar{p}| = p^{n-1}$`. By PMATH347, `$\bar{P} = P/N$` where `$N \leq P \leq G$`.   
`$\tf p^{n-1} = |\bar{P}| = \frac{|P|}{|N|} = \frac{|P|}{p}$`  
`$\implies |P| = p^n$`

Case 2: `$p \nmid |Z(G)|$`  
`$p^n m = |G| = |Z(G)| + \sum [G : C(a_i)]$`. `$\tf \exists s.t. p \nmid [G:C(a_i)]$` i.e. `$p \nmid \frac{|G|}{|C(a_i)|}. Hence $`p^n \mid |C(a_i)|.  
By induction, `$\exists H \leq C(a_i) \leq G$`. such that `$|H| = p^n$` `$\qed$`

**Corollary [Cauchy's General Theorem]**  
`$G$` a finite group, `$p$` prime. If `$p \mid |G|$` then `$\exists a \in G$` s.t. `$|a|=p$`

*Why?**  
`$|G| = p^n m, p \nmid m$`. `$\exists |H| = p^n,  e \neq a \in H, |a| = p^k$`. if `$k=1$`, we done. Otherwise `$b=a^{p^{k-1}}, b\neq e$`  
`$b^p = a^{p^k} = e \implies |b| = p$`

**Definition [Normalizer]**  
`$G$` a group, `$H \leq G$`, `$N_G(H) = \{g \in G: gHg^{-1} = H\}$`  
called the **normalizer** in `$G$`.  
--> the largest subgroup of `$G$` in which `$H$` is normal, `$H \tleq N_G(H)$`

**Theorem [Sylow's 2nd Theorem]**  
If `$P, Q$` are Sylow `$p$`-subgroups of `$G$`, then `$\exists \ g Pg^{-1} = Q$`. I.e. once you find one of these, conjugate and you'll find them all

**Theorem [Sylow's 3rd Theorem]**  
`$|G| = p^n m, p \nmid m$`. Let `$n_p$` be the number of Sylow `$p$`-subgroups of `$G$`.  
1. `$n_p \equiv 1 \mod{p}$`  
2. `$n_p \mid m$`

**Corollary**  
`$n_p = [G : N_G(P)]$` where `$P$` is any Sylow `$p$`-subgroup of `$G$`

**Definition [Simple Groups]** G a group.  
`$G$` is simple `$\iff G$` has no proper non-trivial normal subgroups

**Corollary**  
`$n_p = 1 \iff P \tleq G$`, where `$P$` is a Sylow `$p$`-subgroup of `$G$`. 


*Exercise* Prove there is no simple group of order 56  
*Proof* 56 = `$2^3 \times 7$`  
`$n_2 \equiv 1 \mod{2}, n_2 \mid 7 \implies n_2 \in \{1, 7\}$`  
`$n_7 \equiv 1 \mod{7}, n_7 \mid 8 \implies n_7 \in \{1, 8\}$`  
Suppose `$n_2 = 7, n_7 = 8$`. This acounts for `$8 \cdot 6 = 48$` elements of order 7. This leaves 56-48 = 8 other elements. Hence `$n_2 =1$`. Contradiction!  
Therefore `$n_2=1$` or `$n_7 = 1$` and such a group is not simple. `$\qed$`

**Counting Arguments in Sylow Theory**  
`$p, q \mid |G|, p, q$` are distinct primes  
1. `$H_p$` Sylow `$p$`-subgroup, `$H_q$` Sylow `$q$`-subgroup, `$H_p \cap H_q = \{e\}$`  
2. `$|G| = pm, p \nmid m$`, if `$H_1 \neq H_2$` are Sylow `$p$`-subgroups, then `$H_1 \cap H_2$` = \{e\}  
3. Suppose `$H_p \tleq G$` or `$H_q \tleq G$`, `$\tf H_pH_q \leq G$` and   
	`$$|H_pH_q| = \frac{|H_p| \cdot |H_q|}{|H_p \cap H_q|} = |H_p| \cdot |H_q|$$`
4. `$|H_p \cup H_q| = |H_p| + |H_q| -1$`

*Exercise* `$|G| = pq$`, `$p < q$` are primes where `$p \nmid (q-1)$`. Prove `$G$` is cyclic.  
*Proof* `$n_p \equiv 1 \mod{p}$`, `$n_p \mid q \implies n_p = 1$`  
Then `$n_q \equiv 1 \mod{q}, n_q \mid p \implies n_q = 1$`  
So `$H_p, H_q \tleq G$`. We know that `$H_p$` and `$H_q$` are abelian (prime order). Let `$a \in H_p, b \in H_q$`, then `$aba^{-1}b^{-1} \in H_p \cap H_q = \{e\}, \ \tf ab = ba$`. So `$H_pH_q$` is abelian! By the Fundamental Theorem of finite abelian groups,   
`$$H_p H_q \iso \Z_p \cdot \Z_q \equiv \Z_{pq}$$` and therefore cyclic.  
Note: `$H_p H_q \leq G$` where `$|H_pH_q| = pq = |G|$`, therefore `$H_pH_q = G \ \qed$`

**Proposition** `$|G|=30$`. Then there exists `$H \tleq G$` such that `$H \iso \Z_{15}$`

*Why?*  
`$$30 = 15 \times 2 = 2 \cdot 3 \cdot 5$$`
`$n_2 \equiv 1 \mod{2}, n_2 \mid 15$`  
`$n_3 \equiv 1 \mod{3}, n_3 \mid 10 \implies n_3 \in \{1, 10\}$`  
`$n_5 \equiv 1 \mod{5}, n_5 \mid 6 \implies n_5 \in \{1, 6\}$`

Suppose `$n_3 = 10, n_5 = 6$`. This accounts for 10(3-1)+6(5-1)+1=20+24=45 elements in `$G$`. Contradiction!  
`$$\tf \ n_3 = 1 \text{ or } n_5 = 1$$`
Let `$H_3$` be a Sylow 3-subgroup and let `$H_5$` be Sylow 5-sub. `$\tf H_3 \tleq G \text{ or } H_5 \tleq G$`  
`$\implies H_3 H_5 \leq G$`  
`$$|H_3H_5| = \frac{|H_3| \cdot |H_5|}{|H_3 \cap H_5|} = \frac{3 \cdot 5}{1} = 15$$`
Since `$3\mid(5-1)$` from last time `$H_3H_5$` is cyclic, `$\tf H_3 H_5 \iso \Z_{15}$`  
Since `$[G:H_3H_5]=2, H_3H_5 \tleq G \ \qed$`. 

**Proposition**  
`$|G|= 60$`, if `$n_5 > 1$`, then `$G$` is simple. Note `$60 = 2^2 \times 3 \times 5$`  
*Why?*  
`$n_5 \equiv 1 \mod 5, n\mid 12 \implies n_5 = 6$`  
This gives us 6(5-1) = 24 elements of order 5.  
Assume `$G$` has a proper non-trivial `$H \tleq G$`. 

Case 1: `$5 \mid |H|$`  
Since `$H \tleq G$` and `$H$` contains a Sylow 5-subgroup of `$G$`, then `$H$` contains ALL Sylow 5  
`$$\tf \ |H| \mid 60 \text{ and } |H| \geq 24+1$$`
`$\implies |H| = 30$`  
We know `$\exists \ H_0 \tleq H$` such that `$H_0 \iso \bb{Z}_{15}$`  
Again `$H_0$` contains all Sylow 5-subgroups of `$G$`. Since `$H_0$` is abelian, `$n_5 = 1$`. Contradiction!

Case 2: `$5 \nmid |H|$`  
`$|H| \in \{2, 3,4,6, 12\}$`  
1. `$|H| = 12 = 2^2 \times 3$`. HOMEWORK to show `$n_2 = 1$` or `$n_3 = 1$`  
	`$\tf \ H$` contains a Sylow 2-or-3 subgroup which is normal. Call it `$K$`. `$|K| \in \{3, 4\}$`  
2. HOMEWORK, If `$|H|=6$`, then `$n_3=1$`. Let `$K \tleq$` Sylow 3-subgroup of `$H$`  
	Note: by Sylow 2nd theorem, in either case `$K$` is normal in `$G$` (see Case 1 Argument)  
	By replacing `$H$` with `$K$` (if necessary), we may assume `$|H|\in\{2,3,4\}$`  
`$\bar{G} := G/H$`, then `$|\bar{G}| \in \{15, 20, 30\}$`. HOMEWORK in any case above, `$\exists \bar{P} \tleq \bar{G}, |\bar{P}| = 5$`

So then `$\bar{P} = P/H, \text{ where } H \leq P \tleq G$` (by the correspondence theorem)  
`$\tf P \tleq G \text{ s.t. } 5 = \frac{|P|}{|H|}$`  
	`$\implies 5 \mid |P|$`. This contradicts that Case 1 is impossible. Therefore `$G$` is simple `$\qed$`

**Corollary**: `$A_5$` is simple.

### Chapter 2 - Irreducibility Criteria

*Motivation*  
`$\F$` a field, `$p[x] \in \F[x]$`. Let `$I$` be a non-zero proper ideal of `$\F[x]$`. Say `$I = <p(x)>$`.  
Then `$\F[x]/<p(x)>$` is a field `$\iff$` `$<p(x)>$` maximal `$\iff p(x)$` irreducible.

*Recall*  
`$R$` integral domain ("ID"). Then `$p(x) \in R[x]$` is **irreducible** `$\iff$`  
1. `$p(x) \neq 0$`  
2. `$p(x) \notin R[x]^\times = R^\times$`  
3. Whenever `$p(x) = a(x)b(x), a(x), b(x) \in R[x]$`, then `$a(x)$` or `$b(x)$` is a unit.

We say `$p(x) \in R[x]$` is **reducible** `$\iff$`  
1. `$p(x) \neq 0$`  
2. `$p(x) \notin R^\times$`  
3. `$p(x)$` NOT irreducible

*example:* `$p(x) = 2x+2$`. Then `$p$` is reducible in `$\Z[x]$` but irreducible in `$\Q[x]$`

*Motivating Question* Given `$p(x) \in R[x]$` how can we decide if `$p(x)$` is irreducible?

**Proposition** `$\F$` a field. `$f(x) \in \F[x], a \in \F$`  
The remainder when `$f(x)$` is divided by `$x-a$` is `$f(a)$`

*Why?*  
`$f(x) = (x-a)q(x)+r(x)$` where `$r(x)=0$` or `$\deg r(x) < \deg (x-a)$` (from the Division Algorithm, also another way to say `$r(x)$` is constant)  
Therefore `$r(x) = r \in \F$`.   
`$$\tf f(a) = 0+r \implies r =f(a)$$`
`$\qed$`

**Proposition** `$\F$` a field, `$f(x) \in \F[x]$`, `$\deg (f(x)) \geq 2$`. If `$f(x)$` has a root in `$\F$`, then `$f(x)$` is reducible.

*Why?*  
`$$f(a) = 0$$`
`$$f(x) =(x-a) q(x) + 0 = (x-a)q(x)$$`
*example:* `$f(x) = x^4+2x^2+1 = (x^2+1)^2 \in \R[x]$`  
no roots, reducible.

**Proposition [Irreducible Means No Roots]** `$\F$` field, `$f(x) \in \F[x]$`, `$\deg f(x) \in [2, 3]$`  
Then `$f(x)$` is irreducible `$\iff$` `$f(x)$` has no roots.

*Why?*  
`$f(x) \text{ reducible} \iff \text{linear factor } \iff \text{root}$`

**Theorem [Gauss's Lemma]**  
`$R$` UFD, `$\F = \frac{R}$`, let `$f(x) \in R[x]$`  
If `$f(x) = A(x)B(x)$` where `$A(x), B(x) \in \F[x]$` are non-constant then `$\exists$` `$a(x)b(x) \in R[x]$` such that   
`$$a(x) = rA(x),b(x) = sB(x)$$`
with `$r, s \in \F^\times$` and `$f(x) = a(x)b(x)$`  
--> i.e. if `$f$` is reducible over its field of fractions, it reduces over its integral domain  
In particular `$\deg a(x) = \deg A(x)$` and `$\deg b(x) = \deg B(x)$`

**Proposition [Mod-`$p$` Irreducibility Test]**  
Let `$f(x) \in \Z[x], p \in \N$` is prime. Let `$\bar{f}(x) \in \Z_p[x]$` be obtained by reducing each coefficient of `$f(x)$` modulo `$p$`  
If:  
1. `$\deg f(x) = \deg \bar{f}(x)$` and   
2. `$\bar{f}(x) \in \Z_p[x]$` is irreducible

Then `$f(x) \in \Z[x]$` is irreducible (over `$\Q$` too by Gauss)

*example:* `$f(x) = 2x^2+x$` reducible, `$\bar{f}(x) = x$` irreducible in `$Z_2[x]$`

*Proof*  
Suppose `$f(x)$` is reducible over `$\Q$`. Say `$f(x) = g(x) h(x)$` where `$g(x)h(x) \in \Q[x]$`  
`$\deg g(x), \deg h(x) < \deg f(x)$`  
--> just a cleaner way of saying that neither `$g$` nor `$h$` are constants.

By Gauss's Lemma, we may assume `$g(x), h(x) \in \Z[x]$`  
Then `$\bar{f}(x) = \bar{g}(x) \bar{h}(x) \in \Z_{p}[x]$`. Since `$\bar{f}(x)$` is irreducible, we may assume `$\bar{g}(x)$` is constant. Therefore `$\deg \bar{h}(x) = \deg \bar{f}(x)$`

`$$\tf \deg h(x) < \deg f(x)$$`
`$$= \deg \bar{f}(x)$$`
`$$= \deg \bar{h}(x)$$`
`$$\leq \deg h(x)$$`
Contradiction! `$\deg h(x) < \deg h(x)$` makes no sense. `$\qed$`

*example* `$f(x) = 23x^3 + 15x^2 - 1 \in \Z[x]$`  
So `$\bar{f}(x) = x^3+x^2+1 \in \Z_2[x]$`. Note `$\deg f(x) = \deg \bar{f}(x)$`  
`$\bar{f}(0)=1, \bar{f}(1)=1$`  
Since `$\deg \bar{f}(x) = 3$` and `$\bar{f}(x)$` has no roots, `$\bar{f}(x)$` is irreducible. By the Mod-2 Irred. Test, `$f(x)$` is irreducible.

**Proposition [Generalized Mod-P]** `$R$` an integral domain, `$I \neq R$` ideal, `$p(x) \in R[x]$` non-constant, monic.  
If `$\bar{p}(x)$` cannot be factored as two smaller degree polynomials in `$(R/I)[x]$`, then `$p(x) \in R[x]$` is irreducible.

*Proof: Exercise*

**Proposition [Eisenstein's Criteria]** `$R$` integral domain, `$P \sub R$` is a prime ideal. Let   
`$$f(x) = x^n + a_{n-1}x^{n-1} + \cdots + a_{1}x + a_0 \in R[x]$$`
If:  
1. `$a_{n-1}, \cdots, a_1, a_0 \in P$`  
2. `$a_0 \notin P^2$`

Then `$f(x)$` is irreducible over `$R$`. 

*Recall [Pairwise Ideals]* `$R$` a ring, `$I, J \sub R$` ideals  
`$$IJ = \{\sum a_i b_i : a_i \in I, b_i \in J\}$$`
and `$IJ$` itself is an ideal.

*Proof*. Suppose `$f(x) = g(x) h(x)$` where `$\deg g(x), \deg h(x) < \deg f(x)$`.  
Then `$\bar{f}(x) = \bar{g}(x) \bar{h}(x) = x^n \in (R/P)$`  
Since `$R/P$` is an integral domain (`$\star$`)  
`$\bar{g}(0) = \bar{h}(0) = 0, \tf g(0), h(0) \in P$`  
`$\implies a_0 = f(0) = g(0)h(0) \in P^2$`. This is a contradiction `$\qed$`

*example* `$f(x, y) = y^2 + x^2 - 1 \in \Q[x, y]$`. Claim: `$f(x, y)$` is irreducible.  
Consider `$g(y) = y^2 + (x^2-1) \in \Q[x][y]$`.  
Note: `$x^2-1 = (x-1)(x+1) \in <x-1>$`. Since `$x-1$` is irreducible in `$\Q[x]$`, `$P$` is maximal (prime). Also `$P^2 = <x-1>^2 = <(x-1)^2>$`  
Clearly `$(x-1)^2 \nmid x^2-1$`, so `$x^2-1 \notin P^2$` and so `$g(f)$` is irreducible by Eisenstein.

**Corollary**  
`$$f(x) = x^n + a_{n-1}x^{n-1} + \cdots + a_1 x + a_0 \in \Z[x]$$`
`$p \in \N$` prime. If `$p$` divides `$a_{n-1},\cdots, a_1, a_0$` but `$p^2 \nmid a_0$` then `$f(x)$` is irreducible over `$\Q$`.   
*Proof* Let `$P = <p>$`

*Exercises:* Are these irreducible over `$Q$`?  
1. `$f(x) = x^7 + 21x^5 + 15x^2 + 9x+6$`  
		Yes irreducible by 3-Eisenstein.  
2. `$g(x) = x^3+2x+16$`  
		Notice that `$\bar{g}(x) = x^3+2x+1 \in \Z_3[x]$`, so `$\deg g(x) = \deg \bar{g}(x)$`  
		`$\bar{g}(0)=1, \bar{g}(1)=1, \bar{g}(2)=1$`  
		Since `$\deg \bar{g}(x) = 3$`, `$\bar{g}(x)$` is irreducible. By the Mod-3 irreducibility test, `$g(x)$` is irred.  
3. `$p(x) = x^4+5x^3+6x^2-1$`  
		`$\bar{p}(x) = x^4+x^3+1 \in \Z_{2}[x]$`, with `$\bar{p}(0)=1, \bar{p}(1)=1$`  
		check: the only irreducible quadratic is `$x^2+x+1$`  
		Moreover `$(x^2+x+1)^2 = x^4+x^2+1 \neq \bar{p}(x)$`  
		`$\implies$` `$\bar{p}(x)$` is irreducible, and by the Mod-2 irred. test, `$p(x)$` is irred.  
1. `$q(x) = x^{p-1} + x^{p-2} + \cdots + x^2 + x + 1$`

### Chapter 3 - Field Extensions

**Definition [Field Extension]** `$F$`, `$K$` are fields. We say `$K$` is a **(field) extension** of `$F$` if `$F$` is a subfield of `$K$`  
--> subfield == subring that's also a field  
*Notation:* `$K/F$`   
--> "K" over F. Remember if `$F \neq K$`, K/F isn't quotient ring. B/c fields only have two ideals: themselves and 0

*Example* `$\C/\R$` and `$\C / \Q$`, `$\R / \Q$`, `$\Q / \Q$`

*Example* `$F$` a field, `$F(x) = \{ {f(x)}/{g(x)}, f, g \in F[x], g \neq 0 \}$`  
--> field of rational functions over `$F$`  
Note then `$F(x)/F$` extension

*Example* `$\Z_p(x) / \Z_p$`. (one way to extend `$\Z_p$`)

*Example* Note `$\Q(\sqrt{2}) = \{a+b\sqrt{2} : a, b \in \Q\}$`  
--> field extension of `$\Q$`  
*Example* `$\Q$` is NOT an extension of `$\Z_p = \{0, 1, \cdots, p-1\}$`  
--> different operations!

*Example* `$F$` field, `$f(x) \in F[x]$` is irreducible.   
`$K = F[x]/<f(x)>$` field. `$K/F$` is an extension  
Note: `$F \iso \{a+<f(x)> : a \in F\} \sub K$`

**Definition [Characteristic of a Field]** `$F$` a field  
The **characteristic** **of `$F$`**, denoted **`$Char(F)$`**, is the least positive `$n \in \N$` such that `$n \cdot 1= 1+1+\cdots+1 (n times) = 0$`  
If no such `$n$` exists, we say `$Char(F)=0$`  
--> basically the additive order of 1

*Example* `$Char(\Z_p)$` = `$Char(\Z_p(x)) = p$`  
*Example* `$Char(\R) = 0$`

**HOMEWORK: ** `$F$` a field, `$Char(F) = 0$` or prime.  
--> think zero-divisors, as soon as you have a composite, you've got elements that will multiply to 0

*Example* `$Char(F) = p$`  
Then `$F/\Z_p$` extension. `$\Z_p = \{0, 1, 2, \cdots, p-1\} \sub F$`  
--> isomorphic copy generated by 1

*Example* `$Char(F)=0$`, `$F/\Q$` extension  
`$\Q \iso \{nm^{-1}: \ n, m \in \Z, m \neq 0\}$`

**Definition** `$K/F$`, `$\alpha_1, \cdots, \alpha_n \in K$`  
`$$F(\alpha_1, \cdots, \alpha_n) = \{f(\alpha_1, \cdots, \alpha_n)/g(\alpha_1, \cdots, \alpha_n): f, g \in F[x_1, \cdots, x_n], g \neq 0\}$$`
This is called the **extension field of F generated by** `$\alpha_1, \cdots, \alpha_n$` in `$K$`  
"`$F$` adjoin `$\alpha_1, \cdots, \alpha_n$` ".

**HOMEWORK** `$F(\alpha_1, \cdots, \alpha_n)$` field. via operations of `$K$`. 

**Remark**  
Suppose `$L$` is a subfield of `$K$` s.t. `$F \sub L$` and `$\alpha_1, \cdots, \alpha_n \in L$`.   
Then `$F(\alpha_1, \cdots, \alpha_n) \in L$`  
i.e. `$F(\alpha_1, \cdots, \alpha_n)$` is the **smallest** subfield of `$K$` which contains `$F$` and `$(\alpha_1, \cdots, \alpha_n)$`

*Example:* Prove that `$\Q(\sqrt{2}, \sqrt{3}) = \Q(\sqrt{2}+\sqrt{3})$`  
1. `$\sqrt{2}+\sqrt{3}  \in \Q(\sqrt{2}, \sqrt{3})$`  
	By minimality, `$Q(\sqrt{2}+\sqrt{3}) \sub Q(\sqrt{2}, \sqrt{3})$`  
2. `$1/(\sqrt{2}+\sqrt{3}) (\sqrt{2}-\sqrt{3})/(\sqrt{2}-\sqrt{3}) = \sqrt{3}-\sqrt{2} \in \Q(\sqrt{2}+\sqrt{3})$`

Therefore `$\sqrt{3}-\sqrt{2}+\sqrt{3}+\sqrt{2} = 2\sqrt{3} \in \Q(\sqrt{2}, \sqrt{3})$`  
`$\implies \sqrt{3} \in \Q(\sqrt{2}+\sqrt{3})$`  
`$\implies \sqrt{2} \in \Q(\sqrt{2}+\sqrt{3})$`

By minimality, `$\Q(\sqrt{2}, \sqrt{3}) \sub \Q(\sqrt{2}+\sqrt{3})$` `$\qed$`

*Exercise* `$K/F$`, `$\alpha, \beta \in K$`. Prove `$F(\alpha, \beta) = F(\alpha)(\beta)$`  
Since `$\alpha, \beta \in F(\alpha)(\beta)$`,  
`$F(\alpha, \beta) \sub F(\alpha)(\beta)$` by minimality  
Note: `$F(\alpha) \sub F(\alpha, \beta)$` and `$\beta \in F(\alpha, \beta)$`.  
`$\tf F(\alpha)(\beta) \sub F(\alpha, \beta)$`

**Proposition** `$K/F$`, `$\alpha \in K$`  
Assume `$\alpha$` is a root of an irreducible `$f(x) \in F[x]$`  
Then `$F(\alpha) \iso F[x]/<f(x)>$`  
If `$\deg f(x) = n$`, `$F(\alpha) = \Span_F\{1, \alpha, \alpha^2, \cdots, \alpha^{n-1}\} = \{c_0 + c_1\alpha + \cdots + c_{n-1}\alpha^{n-1} : c_i \in F \}$`

*Exercise:* `$\Q(\sqrt{2}) = \{f(\sqrt{2})/g(\sqrt{2}) : f, g \in \Q[x], g(\sqrt{2}) \neq 0\}$`  
`$= \Span_{\Q} \{1, \sqrt{2}\}$` `$(f(x) = x^2-2)$`  
`$=\{a+b\sqrt{2} : a, b \in \Q\}$`

*Notation:* In `$R/I$`, `$\bar{x} = x+I$`.  
*Recall:* `$R=F[x] / <f(x)>, \deg f(x)=n$`  
Take `$\bar{g}(x) \in R$`.   
We know `$g(x) = f(x)q(x)+ r(x)$`, `$r(x)=0$` or `$\deg r(x) < n$`  
`$\tf \bar{g}(x) = \bar{f}(x) \bar{q}(x) + \bar{r}(x)$`  
`$= \bar{r}(x)$`  
`$\tf R = \{\overline{c_0 + c_1x+\cdots+c_{n-1}x^{n-1}} : c_i \in F\}$` 

*Proof:* Consider the ring homomorphism `$\varphi: F[x] \to F(\alpha)$`, `$\varphi(g(x)) = g(\alpha)$`  
Then, `$I = \ker \varphi = \{g(x): g(\alpha) = 0\}$`  
Since, `$f(x) \in I$`, `$<f(x)> \sub I$`  
Since `$F[x]$` is a PID, `$I = <g(x)>$` for some `$g(x) \in F[x]$`  
`$\tf f(x)=g(x)h(x)$` for some `$h(x) \in F[x]$`  
Since `$I \neq F[x]$` and `$f(x)$` irreducible, `$h(x)$` is a unit.  
Hence, `$I = <g(x)> = <f(x)>$`  
--> in an integral domain, two elements generate the same ideal iff they are associates (347 result)  
By the first iso theorem, `$F[x]/<f(x)> \iso \varphi(F[x])$`

By definition, `$\varphi(F[x]) \sub F(\alpha)$` (image contained in co-domain)  
Also `$\varphi(F[x])$` is a field and `$\varphi(x) = \alpha$`  
By minimality, `$F(\alpha) \sub \varphi(F[x])$`

Finally, `$F[x]/<f(x)> = \{\overline{c_0+c_1x+\cdots+c_{n-1}x^{n-1}} : c_i \in F\}$`  
and so `$F(\alpha) = \psi (F[x]/<f(x)>)$`  
`$=\overline{c_0+c_1\alpha+\cdots+c_{n-1}\alpha^{n-1}: c_i \in F}$`  
where   
`$\psi(\bar{g}(x)) = \varphi(g(x)) = g(\alpha)$`  
is the isomorphism afforded by the FIT.

**Investigation**  
`$K/F$`,  `$\alpha \in K, g(x) \in F[x], g(\alpha)=0, g(x)\neq0$`  
--> note, no mention of irreducibility yet  
Since `$F[x]$` is a UFD, `$\alpha$` is a root of an irreducible factor `$f(x)$` of `$g(x)$`

By our proof: `$<f(x)> = \{h(x) : h(\alpha) = 0\}$`  
1. If `$h(x) \in F[x]$` such that `$h(\alpha)=0$`, then `$f(x) | h(x)$`  
2. Let `$h(x) \in F[x]$` be irreducible such that `$h(\alpha) = 0$`  
	`$\tf <f(x)> = < h(x)>$`$\implies`$ $`f(x) = c h(x)`$, $`c \in F^\times$  
3. There exists a unique irreducible, monic `$m(x) \in F[x]$` such that `$m(\alpha)=0$`

**Definition [Minimal Polynomial]**  
`$K/F$` , `$\alpha \in K$`.  
Suppose `$\alpha$` is a root of a non-zero `$g(x) \in F[x]$`  
The unique irreducible, monic, `$m(x) \in F[x]$` with `$m(\alpha)=0$` is called the **minimal polynomial** of `$\alpha$` over `$F$`

If `$\deg m(x) = n$`, we write `$\deg_F (\alpha) = n$`

*Example* `$p$` prime, `$\sqrt{p} = \alpha$`  
`$m(x) = x^2 - p \in \Q[x]$` (irred by `$p$`-Eisenstein)  
`$\deg_{\Q} (\sqrt{p})=2$`

*Example* `$\alpha = \sqrt{1+\sqrt{3}} \in \R$`  
`$(\alpha^2-1)^2 = 3$`  
`$\implies \alpha^4 - 2\alpha^2=0$`  
`$m(x)=x^4-2x^2-2$` (irred by 2-Eisenstein)

`$\deg_{\Q}(\alpha)=4$`  
`$\tilde{m}(x) = x - \alpha$`, `$\deg_{\R} (\alpha)=1$`  
*Example* `$a \in F$`, `$\deg_F (a)=1$` `$(x-a)$`

**Remark**  
`$K/F$`. Then `$K$` is an `$F$`-vector space. 

**Proposition** `$K/F$`, `$\alpha \in K$`  
`$\alpha$` is the root of a non-zero `$g(x) \in F[x]$`  
Let `$m(x)$` be the minimal polynomial ("min poly") of `$\alpha$` over `$F$`

Then, `$\{1, \alpha, \alpha^2, \cdots, \alpha^{n-1}\}$`, where `$n=\deg m(x) = \deg_F (\alpha)$` is a basis for `$F(\alpha)/F$`.  
In particular, `$|F(\alpha)| = |F|^n$`

*Why?*  
`$F(\alpha) = \Span_F \{1, \alpha, \cdots, \alpha^{n-1}\}$`  
Suppose, `$c_0 + c_1 \alpha + \cdots + c_{n-1}\alpha^{n-1}=0$` (`$c_i \in F$`)  
Say `$f(x) = c_0 + c_1 x + \cdots + c_{n-1}x^{n-1}$`  
`$\tf m(x) | f(x)$`  
By degrees, `$f(x) = 0$`  
`$\implies c_0 = c_1 = \cdots = c_{n-1} = 0$`  
Hence, `$\{1, \alpha, \cdots, \alpha^{n-1}\}$` is a basis for `$F(\alpha)$` over `$F$`.

Then every `$\beta \in F(\alpha)$` can be uniquely written as `$\beta = c_0 + c_1\alpha+ \cdots + c_{n-1} \alpha^{n-1}$` (`$c_i \in F$`)  
Hence `$|F(\alpha)| = |F|^n$` `$\qed$`  
Note:  
`$\dim_F F(\alpha) = \deg_F (\alpha)$`


`$F$` as `$\Z_p$` btw for assignment

**Proposition** `$K/F$`  
If `$\alpha, \beta \in K$` have the same min poly over `$F$` then `$F(\alpha) \iso F(\beta)$`

*Why?*  
`$F(\alpha) \iso F(\beta) \iso F[x]/<m(x)>$`

*Example* `$\alpha = \sqrt[3]{2}, \beta = \sqrt[3]{2} \zeta_3$`  
--> primitive third root of 3 is `$\zeta_3$`  
`$m(x)=x^3-2$` (2-eisenstein)  
1. `$\Q(\alpha) \iso\Q(\beta)$`  
2. `$\Q(\alpha) \neq \Q(\beta)$` since `$\Q(\alpha) \sub \R$` and `$\Q(\beta) \not\subseteq \R$`  
3. `$e^{2\pi i}/3$` for example is `$\zeta_3$`

*Goal for Today* `$K/F$`, Explore `$K$` as an `$F$`-vector space.

**Definition [Finite Field Extension and Degrees]** `$K/F$`. We say `$K/F$` is **finite** iff `$K$` is a finite dimensional `$F$`-vector space

We call `$[K:F] = \dim_F(K)$` the **degree** of `$K/F$`. 

*Example* `$[\C:\R] = 2$`, `$[\R : \Q] = \infty$`  
*Example* `$K/F$`, `$\alpha \in K$` is a root of `$0 \neq f(x) \in F[x]$`. Let `$m(x)$` be the min poly of `$\alpha$`.   
`$[F(\alpha):F] = \deg_F(\alpha) = \deg m(x)$`  
*Example* `$[F:F] = 1$`, `$[K:F] = 1 \iff F=K$`  
*Example* `$[\Q(\sqrt{1+\sqrt{3}}): \Q] = 4$`  
--> when working with `$F(\alpha)$` things, find the min poly, and we'll get the degree of the extension

**Definition [Tower]** `$K/E$`, `$E/F$` are field extensions.   
We call `$K/E/F$` a **tower** of fields.

**Proposition [Tower Theorem]**  
`$K/E/F$` tower of fields.  If `$K/E, E/F$` are finite, then `$K/F$` is finite.  
Moreover, `$[K:F] = [K:E][E:F]$`

*Proof:*  
Let `$\{v_1, \cdots, v_n\}$` be a basis for `$K/E$` and let `$\{w_1, \cdots, w_n\}$` be a basis for `$E/F$`

Claim: `$\{v_i w_j : 1 \leq i \leq n, 1 \leq j \leq m\}$`  
is a basis for `$K/F$`  
--> note if this is true, there are `$nm$` elements so theorem is done.

Linear Independence: `$\sum\limits_{i, j} c_{ij} v_i w_j = 0, c_{ij} \in F$`  
`$\implies \sum\limits_{i, j} (c_{ij} w_j) v_i = 0$`  
`$\implies \sum\limits_i (\sum\limits_j c_{ij} w_j) v_i =0$`  
Note `$(\sum\limits_j c_{ij} w_j) \in E$`. Since `$\{v_i : 1 \leq i \leq n\}$` is LI

`$\forall i, (\sum\limits_j c_{ij} w_j)=0$`  
Since `$\{w_j : 1 \leq j \leq m\}$` is LI,  
`$\forall i, \forall j, c_{ij}=0$`

Spanning: Let `$\alpha \in K$`. `$\implies \alpha = \sum\limits_{i} c_i v_i$` where `$c_i \in E$`  
For all `$i, c_i = \sum\limits_j d_{i,j} w_j$`, `$d_{i,j} \in F$`  
`$$\tf \alpha = \sum\limits_{i, j} d_{i,j} v_i w_j$$`
`$\qed$`

*Example:* `$[\Q(\sqrt[3]{5}, i):\Q] = [\Q(\sqrt[3]{5})(i):\Q(\sqrt[3]{5}] \cdot [\Q(\sqrt[3]{5}):\Q]$`  
`$p(x) = \text{ min poly } i \text{ over } \Q(\sqrt[3]{5})$`  
`$q(x) = \text{ min poly } \sqrt[3]{5} \text{ over } \Q$`

Note:   
`$q(x)=x^3-5$` (5-Eis)  
`$p(x)=x^2+1$` (irred. b/c no roots, `$\Q(\sqrt[3]{5}) \sub \R$`)

`$\tf [\Q(\sqrt[3]{5}, i):\Q] = 3 \cdot 2 = 6$`

Note: Basis for `$\Q(\sqrt[3]{5})(i)$` over `$Q(\sqrt[3]{5})$`  
is `$\{1, i\}$`  
Basis for `$\Q(\sqrt{3}[5])$` over `$\Q$` is `$\{1, \sqrt[3]{5}, (\sqrt{3}[5])^2\}$`

Therefore a basis for `$Q(\sqrt[3]{5}, i)$` over `$\Q$` is:  
`$$\{1, \sqrt[3]{5}, (\sqrt[3]{5})^2, i, i \sqrt[3]{5}, i(\sqrt[3]{5})^2\}$$`

*Goal* Investigate why `$\alpha \in K$` being a root of `$0 \neq f(x) \in F[x]$` is important.

**[Definitions of `$\alpha$`]** `$K/F$`  
1. We say `$\alpha \in K$` is **algebraic** over `$F$` iff there exists `$0 \neq f(x) \in F[x]$` s.t. `$f(\alpha)=0$`  
2. We say `$K/F$` is **algebraic** iff `$\alpha$` is algebraic over `$F$` for all `$\alpha \in K$`

**Proposition**  
If `$K/F$` is finite, then `$K/F$` is algebraic.

*Why?*  
`$[K:F] = n < \infty$`. Take `$\alpha \in K$`  
Consider `$1, \alpha, \alpha^2, \cdots, \alpha^{n}$`.   
`$\exists \ c_0, c_1, \cdots, c_n \in F$` (not all 0)  
s.t. `$c_0 + c_1 \alpha + \cdots + c_n \alpha^n = 0$`  
`$f(x)=c_0+c_1 x + \cdots + c_n x^n$`  
`$f(\alpha)=0$` `$\qed$`

*Example (converse is not true)*  
`$p_1 < p_2 < \cdots$` primes  
`$\Q(\sqrt{p_1}) \sub \Q(\sqrt{p_1}, \sqrt{p_2}) \sub \cdots$`  
`$K = \cup_{n=1}^{\infty} \Q(\sqrt{p_1}, \cdots, \sqrt{p_n})$` is a field extension of `$\Q$`  
`$K/\Q$` algebraic, but NOT finite.

**Proposition**  
`$$K/F \text{ finite } \iff [K:F] < \infty$$`
Finite `$\implies$` Algebraic, Algebraic `$\nrightarrow$` Finite

**Proposition** `$K/F$`  
If `$\alpha_1, \cdots, \alpha_n \in K$` are algebraic over `$F$`, then `$[F(\alpha_1, \cdots, \alpha_n):F] < \infty$`  
--> if the alphas are algebraic, and you adjoin to a field, extension is finite and algebraic  
--> adjoin algebraic elements, everything in the field you just created is algebraic

*Proof* Induction on `$n$`  
If `$n=1$` and `$\alpha_1 \in K$` is algebraic over `$F$`  
`$[F(\alpha_1):F] = \deg_F(\alpha_1) < \infty$`

Assume the result for `$n-1$`. Let `$\alpha_1, \alpha_2, \cdots, \alpha_{n-1}$` be alg over `$F$`

Then, `$[F(\alpha_1, \cdots, \alpha_n):F]$`  
`$=[F(\alpha_1, \cdots, \alpha_{n-1})(\alpha_n):F(\alpha_1, \cdots, \alpha_{n-1})] \cdot [F(\alpha_1, \cdots, \alpha_{n-1}):F]$`  
the first term is finite b/c base case, the second term is finite bc inductive hypothesis. So `$\qed$`

**Proposition**  
`$K/E, E/F$` are algebraic, then `$K/F$` algebraic

*Proof*  
Let `$\alpha \in K$`, and suppose we have `$f(\alpha)=0$` where `$0 \neq f(x)=x^n+c_{n-1}x^{n-1} + \cdots + c_1 x + c_0 \in E[x]$`

Then, `$\alpha$` is alg over `$F(c_{n-1}, c_{n-2}, \cdots, c_1, c_0)$`

Thus, `$[F(c_{n-1}, \cdots, c_1, c_0)(\alpha):F(c_{n-1}, \cdots, c_0)] \cdot [F(c_{n-1}, \cdots, c_0) : F]$`  
`$=[F(c_{n-1, \cdots, c_1, c_0, \alpha}):F] < \infty$`


**Proposition** `$K/F$`  
`$L = \{\alpha \in K : \alpha \text{ is alg over } F \}$`  
Then `$K/L/F$` is a tower of fields. 

*Why?*  
`$\alpha, \beta \in L$`, `$\alpha \neq 0$`  
`$\alpha-\beta, \alpha \beta, \alpha^{-1} \in F(\alpha, \beta)$`  
`$[F(\alpha, \beta):F] < \infty$` and therefore algebraic

*Example[Revisited]*

`$p_1 < p_2 < \cdots$` primes  
`$K = \cup_{n=1}^\infty \Q(\sqrt{p_1}, \cdots, \sqrt{p_n})$`

Claim: `$K/\Q$` algebraic  
`$\alpha \in K \implies \alpha \in \underbrace{\Q(\sqrt{p_1}, \cdots, \sqrt{p_n})}_{\text{alg ext of} \Q}$`

Claim: `$K/\Q$` NOT finite.  
`$[K : \Q] = [K : \Q(\sqrt{p_1}), \cdots, \sqrt{p_n}] \cdot \underbrace{[\Q(\sqrt{p_1}), \cdots, \sqrt{p_n} : \Q]}_{2^n}$`

### Chapter 4 - Splitting Fields

*Goal* Given `$f(x) \in F[x]$`, find an extension `$K/F$` such that `$f(x)$` completely factors over `$K$`

*Example* `$f(x)=x^2-2 \in \Q[x]$`, `$K=\Q(\sqrt{2})$`

**Definition [Splits]** `$K/F$`  
Let `$f(x) \in F[x]$` be non-constant. We say `$f(x)$` **splits** over `$K$` if there exists `$u \in F, \alpha_1, \cdots, \alpha_n \in K$` such that `$f(x)=u(x-\alpha_1) \cdots (x-\alpha_n)$`

##### **Theorem [Kronecker's Theorem]**  
Let `$F$` be a field and let `$f(x) \in F[x]$` be non-constant.   
Then there exists `$K/F$` such that `$f(x)$` has a root in `$K$`.

*Proof* We may assume `$f(x)$` is irreducible.  
Let `$K=F[t]/<f(t)>$`, we know `$K$` is a field.

Then, `$f(\bar{t}) = 0$` `$\qed$`

**Remark**  
By applying Kronecker repeatedly , `$\exists K/F$` such that `$f(x)$` splits over `$K$`

**Definition** `$F$` field, `$f(x) \in F[x]$` non-const.  
We say `$K$` is a **splitting field** for `$f(x)$` over `$F$` iff  
1. `$K/F$`  
2. `$f(x)$` splits over `$K$`  
3. Whenever `$f(x)$` splits over `$F \sub L$`, then `$K \sub L$`

**Remark**  
`$F, f(x) \in F[x]$` as before. Let `$K/F$` be an ext. such that `$f(x)$` splits over `$K$`  
`$f(x) = u(x-\alpha_1) \cdots u(x-\alpha_n) \in K[x]$`  
Then, `$F(\alpha_1, \cdots, \alpha_n)$` is a splitting field for `$f(x)$`

*Problem* (picture drawn of different extensions `$K$` and `$E$` we could split over)

*Goal* `$F(\alpha_1, \cdots, \alpha_n) \iso F(\beta_1, \cdots, \beta_n)$`  
i.e. splitting fields are unique up to isomorphism

*Example* `$f(x)=x^4+x^2-6 \in \Q[x]$`  
`$=(x^2+3)(x^2-2)$`  
"The" splitting field of `$f(x)$` is `$\Q(i \sqrt{3}, \sqrt{2})$`

**Remark**  
`$F, F'$` are fields. `$\varphi: F \to F'$` is an isomorphism  
The natural map `$\tilde{\varphi} : F[x] \to F'[x]$` is an isomorphism

We write `$\tilde{\varphi} = \varphi$`

##### **Test 1: Chapter 1-3(Irreducibles, Irreducibility, Field Extensions)**  
1. a)[5 marks] (Sylow 3), b)[5 marks] Sylow 2  
2. a)[5 Marks] (Irreducibility of a polynomial), b)`$\deg_F(\alpha)$`  
3. a)[5 Marks] Proof `$F(\alpha_1, \cdots, \alpha_n)$`, b) [5 Marks] Proof `$[K:F]$`  
Test is out of 30 + 2/30 for showing up

##### **Lemma [Isomorphism Extension Lemma]**

`$F, F'$` fields, `$\varphi : F \to F'$` isomorphism. `$f(x) \in F[x]$` irreducible. Let `$\alpha$` be a root of `$f(x)$` in some extension of `$F$`.

Let `$\beta$` be a root of `$\varphi(f(x))$` in some extension of `$F'$`

Then `$\exists \ \psi: F(\alpha) \to F'(\beta)$` such that:  
1. `$\psi |_F = \varphi$`  
2. `$\psi(\alpha) = \beta$`

*Why?*  
`$\rho_1 (g(\alpha)) = \overline{g(x)} = g(x) + <f(x)>$`  
`$\rho_2 (\overline{h(x)}) = h(\beta)$`  
--> afforded by the 1st iso theorem

`$\sigma(\overline{g(x)}) = \overline{\varphi(g(x))}$`  
are all isomorphisms. 

`$$\psi = \rho_2 \circ \sigma \circ \rho_1$$` isomorphism.

1. `$a \in F$`.   
$$  
\begin{aligned}  
\psi(a) &= \rho_2(\sigma(\rho_1(a))) \\   
&=\rho_2(\sigma(\bar{a})) \\   
&= \rho_2(\overline{\varphi(a)}) \\   
&= \varphi(a)  
\end{aligned}  
$$  
2.   
$$  
\begin{aligned}  
\psi(\alpha) &= \rho_2(\sigma(\rho_1(\alpha))) \\   
&= \rho_2 (\sigma(\bar{x})) \\   
&= \rho_2 (\overline{\varphi({x})}) \\   
&= \rho_2(\bar{x}) \\   
&= \beta  
\end{aligned}  
$$

**Corollary**  
`$F$` field. `$f(x) \in F[x]$` is irreducible. `$\alpha, \beta$` are roots of `$f(x)$` in some extension of `$F$`.  
Then `$\exists$` isomorphism `$\psi : F(\alpha) \to F(\beta)$`  
such that `$\psi |_F = \text{id}, \psi (\alpha)=\beta$`  
--> fixing the constants, and send the roots to each other

*Why?* `$\varphi: F \to F \ \text{ id }$`

##### **Lemma**  
`$F$` field, `$f(x) \in F[x]$` non-constant. Let `$K$` splitting field for `$f(x)$` over `$F$`. Let `$\varphi: F \to F'$` be an isomorphism  
Let `$K'$` be a splitting field for `$\varphi(f(x))$` over `$F'$`

There exists an isomorphism, `$\psi : K \to K'$` such that `$\psi |_F = \varphi$`

*Why?* Induction

##### **Theorem[Splitting Fields are Unique]**

`$F$` field, `$f(x) \in F[x]$` is non-constant. Let `$K, K'$` be two splitting fields for `$f(x)$` over `$F$`  
`$\exists$` isomorphism `$\psi : K \to K'$` such that `$\psi |_F = \text{ id }$`

*Why?* `$\varphi = \text{ id }$`

*Question:* `$F$` a field. Does there exists `$K/F$` such that every `$f(x)$` non-constant splits over `$K$`.

**Definition [Algebraically Closed]** `$F$` field. We say `$F$` is **algebraically closed** iff every non-constant `$f(x) \in F[x]$` has a root (splits) in `$F$`.

*Exercise* `$\bb{C}$`

**Definition [Algebraic Closure]** `$F$` field.   
A field `$\bar{F}$` is called an **algebraic closure** of `$F$` if  
1. `$\bar{F}/F$` algebraic extension  
2. Every non-constant `$f(x) \in F[x]$` splits over `$\bar{F}$`

*Example* `$\C$` alg closure of `$\R$`  
*Example* `$\C$` not an alg closure of `$\Q$`  
(`$\pi \in \C$` not algebraic over `$\Q$`)

**Proposition** Suppose `$\bar{F}$` is an algebraic closure of `$F$`. Then `$\bar{F}$` is algebraically closed.

*Why?*  
`$f(x) \in \bar{F}[x]$` non constant.  
`$f(\alpha) = 0$` where `$\bar{F} \sub K, K/\bar{F}$`  
`$[\bar{F}(\alpha) : \bar{F}] < \infty$`

`$\bar{F}(\alpha)/\bar{F}$`, `$\bar{F}/F$` algebraic  
`$\implies \bar{F}(\alpha) / F$` algebraic  
`$\implies \alpha$` alg. over `$F$`  
`$\alpha \in \bar{F}$`, `$\qed$`

**Proposition** `$F$` field.   
There exists an alg. closed field `$K \sup F$`.

*Proof* A4

**Proposition** `$F$` field  
An algebraic closure of `$F$` exists.

*Proof*  
Let `$K \sup F$` be algebraically closed.   
and let `$L = \{\alpha \in K: \alpha \text{ algebraic over } F\}$`  
We know `$K/L/F$` is a tower of fields. 

Claim: Let `$f(x) \in F[x]$` be non-constant. Then `$f(x)$` has a root in `$L$`.

Let `$\alpha \in K$` such that `$f(\alpha)=0$`. (we know this exists since `$K$` is algebraically closed)

By definition, `$\alpha \in L$`.

*Fact:* Algebraic closures are unique up to isomorphism

*Notation* `$F$` field, `$\bar{F}$` will denote the algebraic closure of `$F$`  
### Chapter 5 - Cyclotomic Extensions

*Question:* What is the splitting field of `$f(x)=x^n-1$` over `$\Q$`

The complex roots of `$f(x)=x^n-1$` are called the nth roots of unity.

`$$1, \zeta_n, \zeta_n^2, \cdots, \zeta_n^{n-1}$$`
`$\zeta_n = e^{\frac{2\pi i}{n}}$`  
`$=\cos(\frac{2\pi}{n}) + i \sin(\frac{2\pi}{n})$`

Therefore the SF of `$x^n-1$` over `$\Q$` is `$\Q(\zeta_n)$`

We call `$\Q(\zeta_n)/\Q$` a **cyclotomic extension**.

*Question:* What is the minimal polynomial of `$\zeta_n$` over `$\Q$`?

*Example* `$n=p$` prime.  
`$x^p-1 = (x-1)(\underbrace{x^{p-1}+x^{p-2} + \cdots + x + 1}_{\phi_p (x)}$`

`$\phi_p(\zeta_p)=0$`  
`$\phi_p (x)$` minimal polynimial for `$\zeta_p$`

`$[\Q(\zeta_p):\Q]=p-1$`

*Remark*  
We know that `$G=\{1, \zeta_n, \zeta_n^2, \cdots, \zeta_n^{n-1}\}$`  
is a cyclic subgroup of `$\C^\times$`

We have `$G=<\zeta_n>$`. and `$G=<\zeta_n^{k}>$` iff  
`$\gcd(k, n)=1$`. 

We call such a generator a **primitive nth root of unity**

i.e. `$\zeta \in \C$` is a primitive `$n$`th root of unity iff  
1. `$\zeta^n=1$`  
2. `$\zeta^k \neq 1$`, `$1 \leq k \leq n$`  
		i.e. order of `$\zeta$` = n

`$\tf$` The number of primitive nth roots of unity is `$\phi(n)=|\{1 \leq k \leq n: \gcd(k, n)=1\}|$`  
--> Euler totient function

**Definition [Cyclotomic Polynomial]**  
`$n \in N$`, `$\alpha_1, \cdots, \alpha_{\phi(n)}$` are primitive nth ROUs (roots of unity).

`$\phi_n(x)=(x-\alpha_1) \cdots (x-\alpha_{\phi(n)})$`  
--> **nth cyclotomic polynomial**

**Investigation**

1. `$\{z \in \C: z^n =1\}$`  
`$= \cup_{d|n} \{z \in \C: z \text{prim dth rou} \}$`

2. `$x^n-1$`  
`$=\Pi_{\text{ nth roots of unity }} (x-\alpha_i)$`  
`$= \Pi_{d|n}\Pi_{\text{ prim dth }} (x-\alpha_i)$`  
`$= \Pi_{d|n} \phi_d(x)$`

*Example* Compute `$\phi_6(x)$`  
`$x^6-1 = \phi_1(x)\phi_2(x)\phi_3(x)\phi_6(x)$`  
`$\implies \phi_6(x) = \frac{x^6-1}{(x-1)(x+1)(x^2+x+1)}$`  
`$=\frac{(x-1)(x^2+x+1)(x+1)(x^2-x+1)}{(x-1)(x+1)(x^2+x+1)}$`  
`$= x^2-x+1$`

*Goal*  
Prove `$\phi_n(x)$` is the minimal polynomial of `$\zeta_n$` over `$\Q$`

**Proposition** `$\phi_n(x) \in \Z[x]$`

*Proof* Induction on `$n$`.  
Clearly `$\phi_1(x) = x-1 \in \Z[x]$`

Assume the result holds for `$k < n$`

By the investigation, `$x^n-1 = \phi_n(x) f(x)$`, where   
`$f(x)=\Pi_{d | n, d<n}\phi_d (x)$`

By induction, `$f(x) \in \Z[x]$`

Let `$F=\Q(\zeta_n)$`. Note:`$\phi_n(x) \in F[x]$`

By the division algorithm, `$\exists$` unique `$x^n-1=f(x)q(x)+r(x)$` where `$q(x), r(x) \in F[x]$`,  
`$r(x)=0$` or `$\deg r(x) < \deg f(x)$`

Similarly, `$\exists$` unique `$x^n-1=f(x)\tilde{q}(x) + \tilde{r}(x)$`, `$\tilde{q}(x), \tilde{r}(x) \in \Q[x]$`  
`$0=\tilde{r}(x)$` or `$\deg \tilde{r}(x) < \deg f(x)$`

By uniqueness,   
`$q(x)=\tilde{q}(x)=\phi_n(x) \in \Q[x]$`

By Gauss, `$\phi_n(x) \in \Z[x]$`, `$\qed$`



**Proposition**  
`$\phi_n(x)$` is irreducible over `$\Q$`.

*Proof*  
Let `$g(x)$` be the minimal polynomial for `$\zeta_n$` over `$\Q$`.

We show `$g(x) = \phi_n(x)$`

Since `$g(\zeta_n) = \phi_n(\zeta_n) = 0$`,   
`$g(x) | \phi_n(x)$`. 

Say `$\phi_n(x) = g(x)h(x)$`, `$h(x) \in \Q[x]$`

To show `$\phi_n(x) | g(x)$`, we prove that `$g(\zeta_n^k)=0$` whenever `$\gcd(k, n)=1$`.  
--> every root of `$\phi_n(x)$` is a root of `$g(x)$`.

Say `$k = p_1 p_2 \cdots p_r$` where `$p_i$` prime, `$p_i \nmid n$`

We will prove that `$g(\zeta_n)=0 \implies g(\zeta_n^{p_1})=0 \implies g(\zeta_n^{p_1 p_2})=0 \implies \cdots \implies g(\zeta_n^{k})=0$`

*Claim* If `$\zeta \in \C$` with `$g(\zeta)=0$` and `$p$` is prime with `$p \nmid n$`, then `$g(\zeta^p)=0$`.

*Proof of Claim:* Since `$g(\zeta)=0$`, `$\phi_n(\zeta)=0$` (divisibility)   
`$\tf \zeta$` is a primitive nth ROU `$\implies \zeta^p$` is a prim nth ROU, since `$p\nmid n$`, `$\gcd(p,n)=1$`

`$\implies \phi_n(\zeta^p)=0$`. For contradiction, suppose `$g(\zeta^p) \neq 0$`. Hence, `$h(\zeta^p)=0$`

Note: by Gauss, `$h(x) \in \Z[x]$`  
--> b/c both monic and `$\phi_n(x)$`, by proof of GL, `$g(x), h(x) \in \Z[x]$`

Define `$f(x) = h(x^p)$` `$\implies f(\zeta)=0$` `$\implies g(x) | f(x)$` `$\implies f(x)=g(x)K(x), K(x) \in \Z[x]$` Gauss

Say,  
`$$h(x) = \sum b_j x^j$$`
`$$\implies f(x) = \sum b_j x^{pj}$$`

In `$\Z_p[x]$`, 

`$\bar{f}(x) = \sum \bar{b_j} x^{pj} = \sum \bar{b_j}^p x^{pj} \text{ FLT } = (\sum \bar{b_j} x^j)^p = \bar{h}(x)^p$`

`$\tf \bar{h}(x)^p = \bar{f}(x) = \bar{g}(x)\bar{K}(x)$`

Let `$\bar{l}(x)$` be an irreducible factor of `$\bar{g}(x)$` in `$\Z_p[x]$`

`$\bar{l}(x) | \bar{h}(x)^p \implies \bar{l}(x) | \bar{h}(x)$`

Now, `$\bar{\phi}_n(x) = \bar{g}(x)\bar{h}(x)$`

`$\implies \bar{l}(x)^2 | \bar{\phi}_n(x)$` `$\implies  \bar{l}(x)^2 | \underbrace{x^n-1}_{\Z_p[x]}$`

`$\implies x^n-\bar{1} = \bar{l}(x)^2 \bar{q}(x)$`  
`$\implies \bar{n}x^{n-1} = \bar{l}(x)^2 \cdot \bar{q}'(x) + 2 \bar{l}(x) \bar{l}'(x) \bar{q}(x)$`  
`$= \bar{l}(x) \cdot \text{[stuff]}$`

Note: `$p \nmid n \implies \bar{n} \neq \bar{0}$`

`$\tf \bar{l}(\bar{0}) = \bar{0}$`

Since `$\bar{l}(x) | x^n-\bar{1}$`, `$\bar{0}^n-1 = \bar{0}$`  
`$\implies $`\bar{1}=\bar{0} \in \Z_p \implies p|1$. Contradiction!

**Corollary**  
For `$n \in \N$`, `$\phi_n(x)$` is the minimal polynomial for `$\zeta_n$` over `$\Q$`. In particular,   
`$$[\Q(\zeta_n):\Q] = \phi(n)$$`

*Examples:* let `$K$` be the splitting field of `$f(x) = x^5-3$` over `$\Q$`

1. Describe `$K$`  
2. Compute `$[K : \Q]$`  
3. Find a basis for `$K / \Q$`

1)  The complex roots of `$f(x)$` are `$\sqrt[5]{3}, \sqrt[5]{3} \zeta_5, \sqrt[5]{3} \zeta_{5^2}, \sqrt[5]{3} \zeta_{5^3}, \sqrt[5]{3} \zeta_{5^4}$`  
`$\tf K = \Q(\sqrt[5]{3}, \zeta_5)$`

2) `$[\Q(\sqrt[5]{3}):\Q] = \underbrace{\deg (x^5-3)}_{\text{3-Eis}} = 5$`  
	`$[\Q(\zeta_5):\Q] = \phi(5)=4$`  
	Since `$\gcd(4, 5)=1$`, `$[K : \Q] = 5 \cdot 4 = 20$`  
	(A4)

3) `$[\Q(\zeta_5)(\sqrt[5]{3}):\Q(\zeta_5)] = 5$`  
 `$[\Q(\zeta_5):\Q]=4$`  
(Tower Theorem)

A basis for `$\Q(\zeta_5)(\sqrt[5]{3})/\Q(\zeta_5)$` is   
$$B_1 =   
\{1, \sqrt[5]{3}, (\sqrt[5]{3})^2, (\sqrt[5]{3})^3, (\sqrt[5]{3})^4\}$$

A basis for `$\Q(\zeta_5)/\Q$` is   
`$$B_2 = \{1, \zeta_5, \zeta_5^2, \zeta_5^3\}$$`

A basis for `$K/\Q$` is   
`$$\{(\sqrt[5]{3})^i \zeta_5^j : 0 \leq i \leq 4, 0 \leq j \leq 3\}$$`
--> proof of the Tower Theorem








### Chapter 6 - Finite Fields

**Proposition** Let `$F_q$` be a finite field.  
Then `$F_{q^\ast}$`  is cyclic.

*Proof:* `$F_{q^\ast}$` has `$q-1$` elements  
So `$F_{q^\ast} \iso C_1 \times C_2 \times \cdots \times C_r$`  
where `$C_i$` is cyclic. If `$i \neq j$` and `$d|\gcd(|C_i|, |C_j|)$` then the equation `$x^d =1$` has at most `$d$` solutions.  
in `$F_{q^\ast}$`, has exactly `$d$` solutions in `$C_i$` and in `$C_j$`. So intotal, `$2d-1$` solutions in `$F_{q^\ast}$` So `$2d-1 \leq d \implies d \leq 1$`  
so the product `$\Pi C_i$` is cyclic. `$\qed$`.

**Proposition** If `$[K:F_q] = d$`, then `$|K| = q^d$`

*Proof:*  
`$K = \{a_1x_1+\cdots+a_dx_d : a_i \in F_q\}$`  
`$\implies |K| = q^d$`  
where `$\{x_1, \cdots, x_d\}$` is an `$F_q$` basis of `$K$` `$\qed$`

**Proposition** If `$K/F_q$` is finite, then `$K = F_q(\alpha)$` for some `$\alpha \in K$`.

*Proof:* Let `$\alpha =$` generator of `$K^\ast$` `$\qed$`

The characteristic of `$F_q$` is some prime `$p$`. So the image of the charac homomorphism `$\phi: \Z \to F_q$` is a field isomorphic to `$F_p = \Z / p \Z$`. So `$F_q = F_p (\alpha)$` for some `$\alpha$` and `$|F_q| = q = p^n$` for some `$n \in \Z$`

**Proposition** `$F_q$` have `$q=p^n$` elements. Then `$F_q$` is a splitting field for `$x^{p^n}-x$` over `$\Z/p\Z = F_p$`  
--> if we can prove this, any two finite fields are isomorphic

*Proof:*  
`$x^{p^n}-x$` splits in `$F_q$` because its roots satisfy `$x=0$` or `$x^{p^n-1}=1$`, so every root of `$x^{p^n}-x$` lies in `$F_q$`  
Conversely, the set of roots of `$x^{p^n}-x$` is a field `$F_q$`, so  
`$$F_q = \{r_1, \cdots, r_{p^n}\} = F_p (r_1, \cdots, r_{p^n})$$`
where `$r_1, \cdots, r_{p^n}$` are the roots of `$x^{p^n}-x$` `$\qed$`

**Corollary** So any two fields with `$p^n$` elements are isomorphic.  
Also, for any prime `$p$` and positive integer `$n$`, there is a field with `$p^n$` elements.  
If `$K$` is a field with two subfields `$L_1, L_2$` of order `$p^n$`, then `$L_1 = L_2$`, because they are both the splitting field (set of roots of) `$x^{p^n}-x$` in `$K$`

**Proposition** The field `$F_{p^n}$` contains a subfield of order `$p^m$` iff `$m|n$`

*Proof* This follows from `$x^{p^m}-x$` divides `$x^{p^n}-x$` iff `$m|n$` `$\qed$`

Let `$K$` be any field of characteristic `$p > 0$`. The Frobenius homomorphism  
Frob: `$K \to K$` is defined by:  
`$$\text{Frob}(\alpha) = \alpha^p$$`
*Check:*  
`$(\alpha+\beta)^p = \alpha^p + \binom{p}{1} \alpha^{p-1}\beta + \cdots + \binom{p}{p-1} \alpha \beta^{p-1}+\beta^p = \alpha^p + \beta^p$`

If `$K=F_p$`, then `$\text{Frob} = \text{id}$`

If `$K=F_{p^2}$`, then say `$\text{Frob}(\alpha) = \alpha$`, then `$\alpha^p=\alpha$` so `$\alpha$` is a root of `$x^p-x$` so `$\alpha \in F_p$`. Thus, Frob moves every element of `$F_{p^2} \to F_p$`

In general, the fixed set of Frob is always `$F_p$`. 

`$\text{Frob}^2 = \alpha^{p^2}$`. Its fixed set is `$F_{p^2} \cap K$`, any `$K$` characteristic `$p$`

In even more general, the fixed set of `$\text{Frob}^n$` is `$F_{p^n} \cap K$`

Note: If `$K$` is finite, then Frob`$: K \to K$` is isomorphism is an isomorphism, because it's injective

If `$K$` is not finite, then sometimes Frob is an isomorphism, and sometimes it isn't.

*Example* `$q=9$`, `$F_q \iso F_3(i)$`, `$i^2=-1$`  
What is `$\text{Frob}(a+bi)$`?  
`$(a+bi)^3 = a^3 + (b_i)^3 = a^3-b^3i: a, b \in F_3$`  
`$=a-bi$`  
If `$q$` is odd, then `$F_{p^2} \iso F_p(\sqrt{d})$`, so Frob(`$a+b\sqrt{d}$`)=`$(a-b\sqrt{d})$`

*Recall*  
1. `$F$` is a finite field, `$|F| = p^n$` where   
	1. `$p = Char(F)$`  
	2. `$n = [F:\Z_p]$`  
2. There is a unique (upto iso) field of order `$p^n$`  
	It is the splitting field of `$f(x)=x^{p^n}-x$` over `$\Z_p$`  
3. `$\F_{p^n}$` has a unique subfield of order `$p^d$` for every `$d | n$`. And, these are all the subfields of `$\F_{p^n}$`

Proof of (1): `$p = Char(F)$`, `$F^\times = <\alpha>$`, `$F = \Z_p(\alpha)$`.   
Let `$n = \deg_{\Z_p} (\alpha) = [F:\Z_p]$`  
`$F=\Span_{\Z_p}\{1, \alpha, \cdots, \alpha^{n-1}\}$`  
`$\implies |F|=p^n$`












### Chapter 7 - Galois Groups

*Context:* Galois Theory is the study of the roots of polynomials and how they "interact".

*Recall* `$K$` field  
`$Aut(K) = \{\varphi: K \to K \text{ isomorphism }\}$` is the **group of automorphisms** under function composition.

**Definition [Galois Group]** `$K/F$`   
`$Gal(K/F) = \{\varphi \in Aut(K): \varphi|_{F} = id\}$`  
--> automorphisms of K that leave `$F$` alone  
called the **Galois Group** of `$K/F$`  
We call `$\varphi \in Gal(K/F)$` a **Galois automorphism** of `$K$`.

*Remark*  
`$Gal(K/F) \leq Aut(K)$`

**Proposition** `$K/F$`  
`$f(x) = a_nx^n +a_{n-1}x^{n-1} + \cdots + a_1x + a_0 \in F[x]$`  
If `$\alpha \in K$` is a root of `$f(x)$` and `$\varphi \in Gal(K/F)$`, then `$\varphi(\alpha)$` is a root of `$f(x)$`.

*Why?*  
`$a_n\alpha^n + \cdots + a_1 \alpha + a_0 = 0$`  
`$\implies$` `$\varphi(a_n)\varphi(\alpha^n) + \cdots + \varphi(a_1)\varphi(\alpha)+\varphi(a_0)=\varphi(0)=0$`  
`$\implies a_n \varphi(\alpha)^n + \cdots + a_1 \varphi(\alpha)+a_0 = 0$`

**Corollary** `$K/F$`, `$\varphi \in Gal(K/F)$`  
Suppose `$\alpha \in K$` is algebraic over `$F$`.

Then `$\alpha, \varphi(\alpha)$` have the same minimal polynomial.

*Remark* `$K/\Q$`  
1. `$Gal(K/\Q) = Aut(K)$`  
*Why?*  
`$\varphi \in Aut(K)$`, `$\varphi(1)=1$`, `$\varphi(\underbrace{1+1+\cdots+1}_n) = n$`, i.e. `$\varphi(n)=n$`. Then `$\varphi(-n)=-\varphi(n)=-n$`  
i.e. `$\varphi(x)=x$`,  `$\forall x \in \Z$` and   
`$\varphi(\frac{a}{b}) = \frac{\varphi(a)}{\varphi(b)} = \frac{a}{b}$`  
--> everything fixes

*Remark* `$K=F(\alpha_1, \cdots, \alpha_n)$`  
`$\varphi \in Gal(K/F)$` is completely determined by `$\varphi(\alpha_i), 1 \leq i \leq n$`


*Examples* `$Gal(\C/\R)$`, `$\C = \R(i)$`  
For `$\varphi \in Gal(\C/\R)$`, `$\varphi(i) = \pm i$` (root of `$x^2+1$`)  
So `$\varphi = \text{id}$` or `$\varphi =$` complex conjugation  
`$Gal(\C/\R) = \Z_2$`

*Example* `$K=\Q(\sqrt{2})$`. Take `$\varphi \in Gal(K/\Q)$`  
`$\varphi(\sqrt{2}) = \pm \sqrt{2}$` (root of `$x^2-2$`)  
By the extension lemma, there exists an isomorphism `$\psi$` such that `$\psi : \Q(\sqrt{2}) \to \Q(\sqrt{2}): \sqrt{2} \to -\sqrt{2}$`  
`$\tf Gal(K/\Q) = \{\text{id}, \psi\} = \Z_2$`

*Example*  
`$K = \Q(\sqrt{2}, \sqrt{3})$`. `$\varphi \in Gal(K/\Q)$`  
`$\varphi(\sqrt{2}) = \pm \sqrt{2}$`, `$\varphi(\sqrt{3}) = \pm \sqrt{3}$`  
--> can't just send one root to any other root b/c not roots of the same minimal polynomial.

By extension lemma: do the diagram![[West LA - 1150 AM 1.png]]  
`$\tf Gal(K/\Q(\sqrt{2})) = \{\varphi_1, \varphi_2, \varphi_3, \varphi_4\}$`  
`$\varphi_1 = \text{id}$`  
`$\varphi_2(\sqrt{2}) = \sqrt{2}, \varphi_2(\sqrt{3}) = -\sqrt{3}$`  
`$\varphi_3(\sqrt{2}) = -\sqrt{2}, \varphi_3(\sqrt{3}) = \sqrt{3}$`  
`$\varphi_4(\sqrt{2}) = -\sqrt{2}, \varphi_4(\sqrt{3}) = -\sqrt{3}$`

*Example*  
`$K = \Q(\sqrt[3]{2})$`. `$\varphi \in Gal(K/\Q)$`  
`$\varphi(\sqrt[3]{2}) \in \{\sqrt[3]{2}, \sqrt[3]{2} \zeta_3, \sqrt[3]{2}\zeta_3^2\} \cap K \sub \R$`  
`$\implies \varphi(\sqrt[3]{2}) = \sqrt[3]{2}$`  
`$\implies Gal(K/\Q)=\{\text{id}\}$`


*Recall*  
1. `$Gal(K/F) = \varphi \in Aut(K): \forall a \in F, \varphi(a)=0$`  
2. `$f(x) \in F[x], \alpha \in K, f(\alpha)=0 \  \forall \varphi \in Gal(K/F)$`

**Definition [Seperable]** We say that `$f(x) \in F[x]$` is **seperable** if `$f(x)$` has no repeated roots in its splitting field.

**Definition [`$Gal(f(x))$`]** Let `$f(x) \in F[x]$` be non-constant. `$Gal(f(x)) := Gal(K/F)$`, `$K$` is the splitting field of `$f(x)$` over `$F$`.

**Investigation**  
1. `$f(x) \in F[x]$` seperable (non constant), `$K$` be the splitting field of `$f$`. Roots `$\alpha_1, \cdots, \alpha_n \in K$` where `$n = \deg f(x)$`  
	Let `$G = Gal(f(x)$`). Then `$G$` acts on `$\{\alpha_1, \cdots, \alpha_n\}$` via `$\varphi \cdot \alpha_i = \varphi(\alpha_i)$`. We can say `$\varphi(\alpha_i) = \alpha_{\sigma(i)}$`

	Then `$G$` is isomorphic to a subgroup of `$S_n$` via `$\varphi \mapsto \sigma$`  
2. In addition, assume `$f(x)$` is irreducible.  
	By the extension lemma, `$\forall i, j, \exists \varphi \in G$` such that `$\varphi(\alpha_i)=\alpha_j$`  
	![[West LA - 1150 AM.png]]  
	i.e. the group action is transitive.   
3. `$|G| = |Stab(\alpha_i)| \cdot \underbrace{|Orb(\alpha_i)|}_{n}$`  
	`$\implies |G| \mid n!$`, `$n | |G|$`

*Example* `$f(x) = (x^2-2)(x^2-3) \in \Q[x]$`. This polynomial is separable (just check roots). We compute `$Gal(f(x))$` we have that  
`$$Gal(f(x)) \iso \{e, (1 2), (3 4), (1 2)(3 4)\}$$`

*Example* `$G = Gal(x^3-2)$` where `$x^3-2 \in \Q[x]$`. The roots are:  
`$$\alpha_1 = \sqrt[3]{2}, \alpha_2 = \sqrt[3]{2} \zeta_3, \alpha_3 = \sqrt[3]{2} \zeta_3^2$$`

Minimal polynomial for `$\zeta_3$` over `$\Q$` is   
`$$\phi_3(x) = x^2+x+1$$`
By an argument of roots the minimal polynomial for `$\sqrt[3]{2}$` over `$\Q(\zeta_3)$` is `$x^3-2$`.   
*Why?*  
Suppose not, then   
`$$[\Q(\sqrt[3]{2}):\Q] \mid [\Q(\zeta_3):\Q]$$`
which means that `$3 \mid 2$`. We know that `$G \leq S_3$` and `$3 \mid |G|$`. So `$G = S_3$` or `$G=A_3 \iso Z_3$`. Using the extension lemma we have that:  
`$$\varphi(\alpha_1) = \alpha_1$$`
`$$\varphi(\alpha_2) = \varphi(\sqrt[3]{2}) \varphi(\zeta_3) = \sqrt[3]{2} \zeta_3^2$$`
`$$\varphi(\alpha_3) = \varphi(\sqrt[3]{2})\varphi(\zeta_3)^2 = \alpha_2$$` 
Hence `$\varphi = (2 3)$` which is odd. So it must be the case that `$G=S_3$`.

*Example* `$f(x) = x^4-4x^2+2 \in \Q[x]$`. Let `$G =Gal(f(x))$`. Using the quadratic formula, you can check roots are:  
`$$\alpha_1 = \sqrt{2+\sqrt{2}}, \alpha_2 = - \sqrt{2+\sqrt{2}}, \alpha_3 = \sqrt{2-\sqrt{2}}, \alpha_4 = -\sqrt{2-\sqrt{2}}$$`

Note that `$\alpha_1\alpha_3 = \alpha_1^2-2$` so that `$\alpha_3 = \frac{\alpha_1^2-2}{\alpha_1}$`. Since `$f(x)$` is irreducible, for all `$1 \leq i \leq 4, \exists \ \varphi_i \in G$` such that `$\varphi_i (\alpha_1) = \alpha_i$`  
From before,   
`$$G=\{\alpha_1, \alpha_2, \alpha_3, \alpha_4\}$$`
We have that  
`$$\varphi_2(\alpha_1) = \alpha_2$$`
`$$\varphi_2(\alpha_2)= -\varphi_2(\alpha_1)  = -\alpha_2=\alpha_1$$`
`$$\varphi_2(\alpha_3) = \varphi_2 \left(\frac{\alpha_1^2-2}{\alpha_1}\right) = \alpha_4$$`
`$$\varphi_2(\alpha_4) = -\varphi_2(\alpha_3) = \alpha_3$$`

Hence `$\varphi_2 = (1 2)(3 4)$`. You can also deduce `$\varphi_3 = (1 3 2 4)$` and by group properties (inverses and closure) you get that `$\varphi_4 = (1 4 2 3)$`. Hence `$G = \{e, (12)(34), (1324), (1 4 2 3)\} = <(1 3 2 4)> \iso \Z_4$`

*Goal from here:* Start to develop the theory of Galois Groups.

**Definition [`$F$`-Map]** Let `$K/F$` and `$E/F$` be field extensions. We say that `$\varphi K \to E$` is an **`$F$`-Map** iff  
1. `$\varphi$` is a homomorphism  
2. `$\forall a \in F, \varphi(a)=a$`

*Remark* Let `$\varphi: K \to E$` be an F-map. Then:  
1. `$\varphi$` is injective `$(\ker \varphi = \{0\})$`  
2. For all `$u, v \in K$`, `$\varphi(u+v)=\varphi(u)+\varphi(v)$`  
3. `$\forall \alpha \in F, u \in K$`, `$\varphi(\alpha u)=\alpha\varphi(u)$`  
This implies that `$\varphi$` is a *linear transformation!*. Moreover:

*Remark*  
If `$[K:F] < \infty$` and `$E=K$` then `$\varphi \in Gal(K/F)$`  
*Why?*  
`$K$` is a finite dimensional `$F$` vector space and hence `$\varphi$` is injective iff `$\varphi$` is surjective.

**Lemma** Let `$K/F$` and `$E/F$` be field exensions and `$[K:F]$` be finite. Then the number of `$F$`-maps `$\varphi: K \to E$` is at most `$[K:F]$`

*Proof:* We can write `$K = F (\alpha_1, \cdots, \alpha_n)$`. We proceed by induction on `$n$`. Suppose `$K=F(\alpha_1)$`. An `$F$`-map is completely determined by `$\varphi(\alpha_1)$`. But `$\alpha_1, \varphi(\alpha_1)$` have the same minimal polynomial. The number of choices of for `$\varphi(\alpha_1)$` is at most:  
`$\deg_F(\alpha_1) = [F(\alpha_1):F] = [K:F]$`

Proceeding inductively, assume `$K = F(\alpha_1, \cdots, \alpha_n), n > 1$`. Let `$L=F(\alpha_1, \cdots, \alpha_{n-1})$` and let `$\varphi: K \to E$` be an `$F$`-map. Note: `$\varphi |_L$` is an `$F$`-map. Since `$\varphi$` is completely determined by `$\varphi |_L$` and `$\varphi(\alpha_n)$`. there are at most:  
`$$\underbrace{[L:F]}_{(\text{IH})} \cdot \underbrace{\deg_L (\alpha_n)}_{[\underbrace{L(\alpha_n)}_K:L]} = [K:F]$$`
`$\qed$`


**Lemma** Suppose that `$K/F$` extension and `$[K:F]$` is finite. Then:  
`$$|Gal(K/F)| \leq [K:F]$$`
*Why?* `$\varphi \in Gal(K/F) \iff \varphi: K \to K$` `$F$`-map.

*Example* Suppose `$K = \Q(\sqrt[3]{2}), F=\Q$`. Then   
`$$|Gal(K/F) < 3 = [K:F]$$`
*Example* `$K = \Z_2(t)$` and `$F = \Z_2(t^2)$`. Then `$[K:F]=2$`. Let `$\varphi \in Gal(K/F)$`. Then, `$\varphi(t)$` is a root of `$x^2-t=(x-t)^2 (char(F)=2)$`. And hence `$\varphi(t)=t$` so that `$\varphi=\text{id}$` and hence `$|Gal(K/F)|=1$`

*Remark* We are interested when  
`$$|Gal(K/F)|=[K:F]$$`

**Definition [Separable Element]** Let `$K/F$` be an extension. We say that an algebraic `$\alpha \in K$` is **seperable over** `$F$` iff `$m_{\alpha} \in F[x]$` is separable.

**Definition [Separable Extension]** `$K/F$`. An algebraic extension `$K/F$` is **seperable** iff `$\alpha \in K$` is separable over `$F$` for all `$\alpha \in K$`

**Definition [Perfect]** `$K/F$`. `$F$` is **perfect** iff `$K/F$` is separable for all algebraic extensions `$K/F$`. 

*Example* `$\Z_p(t^p)$` is NOT perfect.

*Recall* Let `$f(x) \in F[x]$` be irreducible. Then `$f(x)$` is separable iff `$f'(x) \neq 0$`

**Proposition** Every field where `$char(F)=0$` is perfect.  
*Proof:*

**Proposition** Let `$F$` be a field with `$char(F)=p>0$`. Let `$f(x) \in F[x]$` be irreducible. Then `$f(x)$` is not seperable if and only if `$f(x)=g(x^p)$` for some `$g(x) \in F[x]$`

*Why?* `$f(x)=a_nx^n+a_{n-1}x^{n-1}+\cdots+a_1x+a_0$`, `$f(x)$` not seperable `$\iff f'(x) =0$` `$\iff ka_k=0$`, `$k=1, \cdots, n$`  
`$\iff k=0$` or `$a_k=0$`, `$k= 1, \cdots, n$`  
`$\iff k a_k = pm_k a_k, m_k \in \N, k=1, \cdots, n$`  
`$\iff f(x)=a_nx^{pm_n} + \cdots + a_1x^{m_1}+a_0$`  
`$\qed$`

*Corollary*: If `$F$` is finite, `$F$` is perfect.

*Recall*  
`$$|Gal(K/F)| \leq [K:F]$$`
`$$F \text{ perfect } \iff (K/F \text{ alg } \implies K/F \text{ sep})$$`
--> F is perfect iff every irreducible polynomial has no repeated roots. Remember that every irreducible is a minimal, take the kronecker extension

**Proposition** Every finite field is perfect.  
*Proof*  
Suppose `$F$` is finite with `$char(F)=p>0$`.   
Suppose `$f(x) \in F[x]$` is irreducible but not seperable.  
Then, `$f(x)=g(x^p)$` where `$g(x) \in F[x]$`. Say `$g(x) = a_nx^n + \cdots + a_1 x + a_0$`  
`$\implies f(x) = a_n x^{p_n} + \cdots + a_1 x^p + a_0$`

Now, `$\varphi: F \to F: \varphi(x)=x^p$` is an injective homomorphism.   
Since `$F$` is finite, `$\varphi$` is surjective.   
`$\tf \forall i, \exists b_i \in F, a_i = b_i^p$`  
Hence,  
`$f(x)=b_{n}^p x^{p_n} + \cdots + b_1^p x^p + b_0^p$`  
`$=(b_n x^n + \cdots + b_1x^ + b_0)^p$`. A contradiction! `$\qed$`  
--> Contradicted!

*Example* `$F=\Z_2(t)$`  
`$f(x)=x^2-t \in F[x]$` irreducible (because no roots degree 2)  
Let `$K$` be the splitting field of `$f(x)$` over `$F$`.   
Let `$\alpha \in K$` s.t. `$f(\alpha)=0$`.   
`$\implies \alpha^2 = t$`  
`$f(x)=x^2-t=x^2-\alpha^2=(x-\alpha)^2 \in K[x]$`   
`$\tf K/F$` is not seperable and `$F$` is not perfect.

**Theorem**  
`$f(x) \in F[x]$` is seperable and non-constant.  
Let `$K$` be the splitting field of `$f(x)$` over `$F$`. Then,   
`$|Gal(K/F)| = |Gal (f(x))|=[K:F]$`

*Remark*  
`$K/E/F$`. `$Gal(K/E) \leq Gal(K/F)$`

*Proof of Theorem*  
We proceed by induction on `$[K:F]$`.   
If `$[K:F]=1$`, then `$1 \leq |Gal(K/F)| \leq [K:F] = 1$`  
Proceeding inductively, assume `$[K:F] = n > 1$`.

Therefore `$\exists$` `$p(x) \in F[x]$` irred. such that `$p(x)|f(x)$` and `$\deg p(x) = m > 1$`. 

Say the roots of `$p(x)$` are `$\alpha_1, \cdots, \alpha_m \in K \setminus F$`

Note: `$\alpha_i \neq \alpha_j$`  
Moreover, `$K$` is the splitting field of `$f(x)$` over `$\underbrace{F(\alpha_1)}_{E}$`

We have `$[K:E]=\frac{[K:F]}{[E:F]} = \frac{n}{m} < n$`

By induction,   
`$|Gal(K/E)|=[K:E]$`

Since `$p(x)$` is irreducible, `$\forall 1 \leq i \leq m$`  
`$\exists$` `$\varphi_i \in Gal(K/F)$` such that `$\varphi_i(\alpha_1) = \alpha_i$`  
--> isomorphism extension lemma is back!

For `$i \neq j$`, `$\alpha_i \neq \alpha_j$` `$\implies \varphi_i(\alpha_1) \neq \varphi_j(\alpha_1)$`.   
`$\implies (\varphi_j^{-1} \circ \varphi_i)(\alpha_1) \neq \alpha_1$` but `$\alpha_1 \in E$`

`$\implies \varphi_j^{-1} \circ \varphi_i \notin Gal(K/E)$`  
`$\implies \varphi_i Gal(K/E)\neq \varphi_j Gal(K/E)$`  
Hence,  
`$$\frac{Gal(K/F)}{Gal(K/E)} \geq m$$`
`$\implies Gal(K/F) \geq [K:E] \cdot m = \frac{n}{m} \cdot m = n$`

### Chapter 8 - Normal + Seperable Extensions

*Goal:*  We show that for `$[K:F] < \infty$`, `$K$` is often the splitting field of a sep poly over `$F$`

**Definition [Simple Extensions]** `$K/F$`  
We say `$K/F$` is **simple** iff `$\exists$` `$\alpha \in K, K = F(\alpha)$`  
We call `$\alpha \in K$` a **primitive element** for `$K$` over `$F$`

**Theorem [Primitive Element Theorem]**  
If `$K/F$` is finite + seperable, then `$K/F$` is simple.

**Corollary** `$[K:F]$` finite, `$F$` perfect, then `$K=F(\alpha)$` for some `$\alpha \in K$`

*Proof of Theorem*  
Case 1: `$F$` is finite  
Since `$K/F$` is finite, `$K$` is finite. From before `$K^\times = <\alpha>$`, `$\alpha \in K$`  
`$K=F(\alpha)$`

Case 2: `$F$` is infinite  
Assume `$K/F$` is finite and seperable. Say `$K=F(\alpha_1, \cdots, \alpha_n)$`  
By induction, we may assume `$n=2$` and `$K=F(\alpha, \beta)$`  
Let `$p(x)$` the min poly for `$\alpha$` over `$F$`. and `$q(x)$` be the min poly for `$\beta$` over `$F$`  
--> (both seperable since `$K/F$` seperable)

Let `$L$` be the splitting field of `$p(x)q(x)$` over `$K$`  
Say the roots of `$p(x)$` and `$q(x)$` are `$\alpha = \alpha_1, \cdot,s \alpha_n \in L$` and `$\beta = \beta_1, \cdots, \beta_m \in L$` respectively.

Consider   
`$$S = \left\{\frac{\alpha_i-\alpha_1}{\beta_1-\beta_j} : i \neq 1, j \neq 1\right\}$$`

Since `$S$` is finite, and `$F$` is infinite, there exists `$u \neq 0$` in `$F$` such that `$u \notin S$`  
Let `$\gamma = \alpha + u \beta$`.

Claim: `$K = F(\alpha, \beta) = F(\gamma)$`  
By minimality `$F(\gamma) \sub F(\alpha, \beta)$`

New stuff: WWTS `$F(\alpha, \beta) \sub F(\gamma)$`  
Let `$h(x)$` be the min poly for `$\beta$` over `$F(\gamma)$`  
--> We want `$\deg h(x) = 1$`

Note: `$h(x) | q(x)$`. The roots of `$h(x)$` are a subcollection of the `$\beta_j$`'s.

Moreover, if `$k(x)=p(\gamma-ux) \in F(\gamma)[x]$`  
`$\implies k(\beta)=p(\gamma-u\beta) = p(\alpha)=0$`  
`$\implies h(x) | k(x)$`

For `$j \neq 1$`, `$k(\beta_j) = 0 \iff p(\gamma-u\beta_j)=0$`  
`$\iff \gamma - u\beta_j = \alpha_i (i \neq 1, \text{ since otherwise } (\gamma-u\beta_j=\gamma-u\beta_1, \beta_1=B_j))$`  
`$\iff \alpha_1+u\beta_1-u\beta_j=\alpha_i$`  
`$\iff u = \frac{\alpha_i-\alpha_1}{\beta_1-\beta_j}$`  
By choice of `$u$`, `$K(\beta_j) \neq 0$` for `$j \neq 1$`  
`$\implies h(\beta_j)\neq 0$` for `$j\neq 1$`  
`$h(x)=x-\beta \in F(\gamma)[x]$`  
`$\implies \beta \in F(\gamma)$`, `$\implies \alpha \in F(\gamma)$` `$\implies F(\alpha, \beta) \sub F(\gamma)$`

*Recall*  
`$$Gal(\Q(\sqrt[3]{2})/\Q) = \{1\}$$`
`$\varphi(\sqrt[3]{2}) = \{\sqrt[3]{2}, \underbrace{\sqrt[3]{2}\zeta_3}_{\notin \Q(\sqrt[3]{2}}, \underbrace{\sqrt[3]{2}\zeta_3^2}_{\notin \Q(\sqrt[3]{2}}\}$`


**Definition [Normal Extensions]** `$[K:F] < \infty$`  
We say `$K/F$` is **normal** iff `$K$` is the splitting field of a non-constant `$f(x) \in F[x]$`

**Definition [`$F$`-conjugates]** `$K/F$`, `$\alpha \in K$` is algebraic over `$F$`  
Let `$f(x)$` be the min poly for `$\alpha$` over `$F$`.  
The roots of `$f(x)$` in its splitting field are called the **`$F$`-conjugates** or just **conjugates** of `$\alpha$`  
*Example* the `$\Q$`-conjugates of `$\sqrt[3]{2}$` are `$\sqrt[3]{2} \zeta_3, \sqrt[3]{2}\zeta_3^2$`

**Theorem [Normality Theorem]** `$[K:F] < \infty$`. TFAE:  
1. `$K/F$` is normal  
2. For every `$L/K$` and `$F$`-map `$\varphi: L \to L$`, `$\varphi |_K \in Gal(K/F)$`  
	`$F$` map is a homo that fixes `$F$`  
3. If `$\alpha \in K$` then all `$F$`-conjugates of `$\alpha$` belong to `$K$`  
4. If `$\alpha \in K$` then its min poly over `$F$` splits over `$K$`

*Proof*  
(1) `$\implies$` (2) Assume `$K$` is the splitting field of `$f(x) \in F[x]$`. Say the roots of `$f(x)$` are `$\alpha_1, \alpha_2, \cdots, \alpha_n \in K$`.  
Note: `$K=F(\alpha_1, \cdots, \alpha_n)$`  
Let `$L/K$` be an extension, and let `$\varphi: L \to L$` be an `$F$`-map (homo that fixes `$F$`)  
For every `$\alpha_i$`, `$\varphi(\alpha_i)=\alpha_j$` for some `$j$`. `$\tf \varphi |_K : K \to K$` is an injective homomorphism. (injective linera transformation)  
Since `$[K:F] < \infty$`, `$\varphi$` is surjective. i.e. `$\varphi \in Gal(K/F)$`

(2) `$\implies$` (3)  
Assume (2). Let `$\alpha \in K$` and let `$p(x)$` be its min poly over `$F$`  
Since `$[K:F] < \infty$`, there exists `$\alpha_1, \cdots, \alpha_n$` such that `$K=(\alpha_1, \cdots, \alpha_n)$`

Let `$h_i(x) \in F[x]$` be the min poly for each `$\alpha_i$`. Consider `$f(x)=p(x)h_1(x)\cdots h_n(x)$`

Let `$L$` be the splitting field for `$f(x)$` over `$F$`. Then, `$L \sup K \sup F$`

Let `$\beta \in L$` be a root of `$p(x)$`. Since `$p(x)$` irreducible over `$F$`, `$\exists \varphi \in Gal(L/F)$` such that `$\varphi(\alpha)=\beta$`  
--> extension lemma

However,   
`$$\beta = \varphi(\alpha) = \varphi |_K (\alpha) \in K$$`

(3) `$\iff$` (4)

(4) `$\implies$` (1)  
Assume 4. As before, let `$K=F(\alpha_1, \cdots, \alpha_n)$`  
Let `$h_i(x)$` be the min poly for `$\alpha_i$` over `$F$`. By (4), `$K$` is the splitting field for `$f(x)= h_1(x)h_2(x) \cdots h_n(x)$`

*Example* `$\Q(\sqrt[3]{2})/ \Q$` is NOT normal, because `$\sqrt[3]{2}\zeta_3 \in \Q(\sqrt[3]{2})$`  
--> easiest way to show something is not normal is to show it is not conjugate closed

*Example* `$\Q(\zeta_n)/\Q$`. Normal b/c it is the splitting field for `$\phi_n(x)$` over `$\Q$`

*Example* `$\F_{p^n}/\F_p$`. Normal b/c splitting field for `$x^{p^n}-x$`

*Example* `$\Z_p(t)/\Z_p(t^p)$`. Normal b/c splitting field for `$x^p-t^p$`

--> to show normality, just show it's the splitting field of something.

**Definition [Galois Extensions]** `$[K:F]<\infty$`  
We say `$K/F$` is **Galois** iff `$K/F$` is normal and seperable.

*Remark*  
1. `$F$` is perfect, then `$K/F$` is Galois for iff `$K/F$` is normal

**Definition [Fixed Field]** `$K$` field, `$G \leq Aut(K)$`  
We call `$Fix(G) = \{a \in K: \forall \varphi \in G, \varphi(a)=a\}$` the **fixed field of `$G$`**

**Homework**: `$Fix(G)$` is a subfield of `$K$`.

**Theorem [Characterization Theorem]** `$[K:F] < \infty$`, TFAE:  
1. `$K$` is the splitting field of a separable polynomial in `$F[x]$`  
2. `$|Gal(K/F)| = [K:F]$`  
3. `$Fix(Gal(K/F)) = F$`  
4. `$K/F$` Galois

*Proof:*  
(1) `$\implies$` (2) done. Proved before

(2) `$\implies$` (3). Assume `$|Gal(K/F)|=[K:F]$`.Let `$E = Fix(Gal(K/F))$`.   
Note: `$F \sub E \sub K$` by definition, and  
`$Gal(K/E) \leq Gal(K/F)$`

Let `$\varphi \in Gal(K/F)$` and let `$a \in E$`. So `$\varphi(a)=a$`  
`$\implies Gal(K/E)=Gal(K/F)$`  
`$\tf [K:F] = |Gal(K/F)=|Gal(K/E)| \leq [K:E] \leq [K:F]$`  
`$\implies [E:F]=1$`


(3) `$\implies$`(4). Suppose `$Fix(G)=F$` where `$G = Gal(K/F)$`  
Let `$\alpha \in K$` and let `$p(x)$` be the minimal poly for `$\alpha$` over `$F$`. We show `$p(x)$` splits (normal) as a product of distinct linear factors (separable) over `$K$`.

Let `$$\Delta = \{\varphi(\alpha) : \varphi \in G\} \sub \{\text{roots of `$p(x)$`} \} \cap K$$`

Let `$\alpha = \alpha_1, \alpha_2, \cdots, \alpha_n$` be the distinct elements of `$\Delta$`  
Consider   
`$$h(x)=(x-\alpha_1) \cdots (x-\alpha_n) \in K[x]$$`

Clearly `$h(x)|p(x)$` in `$K[x]$`. 

For `$\varphi \in G$`, `$\varphi(h(x)) = h(x)$`  
`$\implies h(x) \in Fix(G)[x]$`  
`$\implies h(x) \in F[x]$`  
`$\implies p(x) | h(x)$` `$\implies p(x) =h(x)$`

`$\tf K/F$` is normal+seperable.

(4) `$\implies$` (1). Assume `$K/F$` Galois.  
By the PET, `$\exists \in K$` such that `$K=F(\alpha)$`. Easily, `$K$` is the splitting field of the minimal polynomial `$p(x)$` for `$\alpha$` over `$F$`. `$\qed$`  
--> Galois extensions are the splitting field of an irreducible polynomial.

### Chapter 9 - Fundamental Theorem of Galois Theory  
**Theorem [Artin's Theorem]**  
If `$H$` is a finite subgroup of `$Aut(K)$` and `$F=Fix(H)$`.  
Then:  
1. `$[K:F] = |H|$`  
2. `$K/F$` is Galois  
3. `$Gal(K/F)=H$`

*Proof:*  
First, `$H \leq Gal(K/F)$`.   
`$\tf |H| \leq |Gal(K/F)| \leq [K:F]$`. It suffices to prove   
`$$[K:F] \leq |H|$$`

Let `$\beta_1, \cdots, \beta_n \in K^\times$` s.t. `$n > m$` where `$m=|H|$`

Claim: distinct  `$\{\beta_1, \cdots, \beta_n\}$` is linearly dependent.

*Proof of Claim* Consider the system:  
`$$\varphi(\beta_1)x_1+\varphi(\beta_2)x_2 + \cdots+\varphi(\beta_n)x_n=0$$`
where `$\varphi \in H$`

Since there are `$m$` equations and `$n > m$` unknowns, this system has a non-trivial solution `$(x_1, x_2, \cdots, x_n) \in K^n$`

Note: Fix `$\psi \in H$` and let `$\varphi \in H$` be arbitrary. Then:  
`$$\varphi(\beta_1)\psi(x_1) + \cdots \varphi(\beta_1)\psi(x_n)$$`
`$$=\psi(\underbrace{\psi^{-1}\circ \varphi}_{\in H}(\beta_1)x_1 + \cdots+\underbrace{\psi^{-1}\circ \varphi(\beta_n)}_{\in H}x_n)$$`
`$$=\psi(0)=0$$`

Let `$(x_1, \cdots, x_n) \in K^n$` be a non-trivial solution with a minimal amount of non-zero entries. By reordering we may assume:  
`$$(x_1, \cdots, x_n)=(\underbrace{x_1, \cdots, x_r}_{\neq 0}, 0, 0, \cdots, 0)$$`

Note: If `$r=1$`, `$\underbrace{\varphi(\beta_1)}_{\neq 0}x_1 = 0 \implies x_1=0$`. Contradiction, `$\tf r > 1$`

Since `$(1, \frac{x_2}{x_1}, \cdots, \frac{x_r}{x_1}, 0, \cdots, 0)$` is a solution, we may assume `$x_1=1$`.

At this point, our minimal, non-trivial solution is `$(1, x_2, \cdots, x_r, 0, \cdots, 0)$`

*Subclaim* `$x_2, \cdots, x_r \in F = Fix(H)$`.   
Suppose not. Then, WLOG, say `$\psi \in H$` such that `$\psi (x_2) \neq x_2$`.   
We have the following solutions to our system:  
`$(1, x_2, \cdots, x_r, 0, \cdots, 0)$`  
`$(1, \psi(x_2), \cdots, \psi(x_r), 0, \cdots, 0)$`  
Subtracting the two above:  
`$(0, \underbrace{x_2-\psi(x_2)}_{\neq 0}, \cdots, x_r-\psi(x_r), 0, \cdots, 0)$`  
This contradicts minimality (of number of zeros)  
`$\tf x_2, x_3, \cdots, x_r \in F$`

For `$\varphi=1 \in H$`, we have:  
`$\beta_1+\beta_2x_2 + \cdots+\beta_rx_r = 0$`  
`$\implies \beta_1 + x_2\beta_2 + \cdots + x_r \beta_r=0$`  
`$\tf \{\beta_1, \cdots, \beta_n\}$` is `$F$` linearly dependent.  
`$\qed$` Artin's Theorem Proved

*Notation:* `$K/F$`  
`$\mathcal{E} = \{E: K/E/F \text{ tower }\}$`  
`$\mathcal{H} = \{H : H \leq Gal(K/F\}$`

**Galois Correspondences**

`$Gal(K/\cdot): \E \to \H : E \mapsto Gal(K/E)$`  
`$Fix: \H \to \E : H \mapsto Fix H$`

Note:  
1. `$E_1, E_2 \in \E$`, `$E_1 \sub E_2$`.   
	`$\implies Gal(K/E_2) \sub Gal(K/E_1)$`  
2. `$H_1, H_2 \in \H$`, `$H_1 \sub H_2$`  
	`$\implies FixH_2 \sub Fix H_1$`

i.e. the Galois correspondences are inclusion-reversing.

**Theorem [Fundamental Theorem of Galois Theory]**  
Let `$K/F$` be a finite Galois extension.   
1. For `$E \in \E$`, `$Fix Gal(K/E)=E$`, `$|Gal(K/E)|=[K:E]$`  
	-> fix is a left inverse of Gal  
2. For `$H \in \H$`,   
	`$Gal(K/Fix H)=H$`, `$[K:FixH]=H$`  
i.e. the Galois correspondences are inverses of each other.

*Big Picture:*  
![[West LA - 1150 AM 2.png]]

*Proof of Theorem*

By A7, `$K/E$` is Galois.   
`$\tf FixGal(K/E)=E$` (characterization theorem)  
`$|Gal(K/E)| = [K:E]$`

(2) Follows from Artin  
`$\qed$`

**Corollary** `$K/F$` finite Galois  
If `$H_1 \sub H_2$` are in `$\H$`, then `$[H_2:H_1] = [Fix H_1 : H_2]$`  
if `$E_1 \sub E_2$` are in `$\E$`, then   
`$[E_2:E_1] = [Gal(K/E_1):Gal(K/E_2)]$`

*Why?*  
`$[FixH_1:FixH_2] = \frac{[K:FixH_2]}{[K:FixH_1]} \stackrel{Artin}{=} \frac{|Gal(K/FixH_2)|}{|Gal(K/FixH_1)|} \stackrel{Artin}{=} \frac{H_2}{H_1} = [H_2:H_1]$`

Next,  
`$$|Gal(K/E_1)|/|Gal(K/E_2)| \stackrel{FT}{=} \frac{[K:E_1]}{[K:E_2]} = [E_2:E_1]$$` `$\qed$`


*Example* `$K= \text{ s.f. } f(x)=x^3-2$` over `$\Q$`  
`$K = \Q(\alpha, \zeta_3), \alpha = \sqrt[3]{2}$`

Since `$f(x)$` is irreducible (2-Eis) and `$\Q$` is perfect, `$K/\Q$` is Galois and `$Gal(K/\Q) \leq S_3$`, Since `$|Gal(K/\Q)| = [K:\Q]=6$`, `$Gal(K/\Q)=S_3$`

![[West LA - 1150 AM 3.png]]

**Corollary** `$K/F$` finite, Galois  
Then there are finitely many fields `$E$` such that `$F \sub E \sub K$`  
*Why?* `$Gal(K/F)$` has finitely many subgroups.

**Investigation** `$K/E/F$`, `$\varphi \in Gal(K/F)$`  
what does it mean for `$\psi \in Gal(K/\varphi(E))$`  
`$\iff \forall a \in E, \psi(\varphi(a)) = \varphi(a)$` and of course, `$\psi$` is a `$K$`-automorphism.

`$\iff \forall a \in E, (\varphi^{-1} \circ \psi \circ \varphi)(a)=a$`

`$\iff \varphi^{-1} \circ \psi \circ \varphi \in Gal(K/E)$`  
`$\iff \psi \in \varphi Gal(K/E) \varphi^{-1}$`  
--> `$g H g^{-1}$` moment

1. `$Gal(K/\varphi(E)) = \varphi Gal(K/E) \varphi^{-1}$`  
2. `$Gal(K/E) \tleq Gal(K/F) \iff \forall \varphi \in Gal(K/F), \varphi(E)=E$`

**Theorem** `$K/F$` finite, Galois, `$K/E/F$`, TFAE:  
1. `$E/F$` is Galois  
2. `$E/F$` Normal  
3. `$Gal(K/E) \tleq Gal(K/F)$`

*Proof:*   
By A7, `$E/F$` is separable. `$\tf (1)$` and `$(2)$` are equivalent.

Assume `$E/F$` is normal. Let `$\varphi \in Gal(K/F)$`. We must show that `$\varphi(E)=E$`

By the Normality Theorem, `$\varphi |_E \in Gal(E/F)$`

`$\tf \varphi(E)=E$`

`$(\impliedby)$`, assume for all `$\varphi \in Gal(K/F)$`, `$\varphi(E)=E$`.

Let `$\alpha \in E$` and let `$p(x)$` be its minimal polynomial over `$F$`. Assume `$\beta$` is a root of `$p(x)$` in `$K$`

There exists `$\varphi \in Gal(K/F)$` such that `$\varphi(\alpha)=\beta$`  
--> by the extension lemma.

`$\tf \beta = \varphi(\alpha) \in \varphi(E)=E$`, 

and `$p(x)$` splits over `$E$`. Hence, `$E/F$` is normal.

**Proposition** `$K/F$` finite, Galois, `$K/E/F$`, `$E/F$` Galois

Then, `$Gal(K/F) / Gal(K/E) \iso Gal(E/F)$`

*Why?*  
`$\psi : Gal(K/F) \to Gal(E/F)$`  
`$\psi(\varphi)=\varphi |_E$` (Normality Theorem)

`$\ker \psi = Gal(K/E)$`

Surjectivity:  
`$$|Gal(K/F)/Gal(K/E)| = \frac{[K:F]}{[K:E]} \stackrel{Tower Thm}{=} [E:F] = |Gal(E/F)|$$`

We conclude by computing two famous Galois Groups::

*Example* `$K=\Q(\zeta_n)$`, `$F=\Q$`

Since `$K$` is the splitting field of the separable polynomial `$\phi_n(x)$`, `$K/\Q$` is Galois.

Consider $\psi: \Z_n^\times \to Gal(K/\Q) :  
\psi(k)= \varphi_k, \varphi_k(\zeta_n)=\zeta_n^k$

1. `$\varphi_{ab}(\zeta_n) = \zeta_n^{ab}=(\zeta_n^b)^a = \varphi_a(\varphi_b(\zeta_n)) \implies \varphi_{ab}=\varphi_a \circ \varphi_b$`   
	`$\implies \psi(ab)=\psi(a) \circ \psi(b)$`  
2. `$\ker \psi = \{1\}$`  
3. `$|\Z_n^\times|=|Gal(K/\Q)|=\phi(n)$`

*Example* `$K=\F_{p^n}, F=\F_p$`  
Since `$K$` is the splitting field of the separable polynomial `$x^{p^n}-x$`, `$K/F$` is Galois. 

Consider the Frobenius automorphism: `$\varphi: \F_{p^n} \to \F_{p^n} : \varphi(a)=a^p$`

Note: `$\varphi \in Gal(K/F)$`

Let `$j = |\varphi|$`. `$|Gal(K/F)|=[K:F]=n$` So `$\tf j \leq n$`  
For all `$x \in \F_{p^n}$`, `$\varphi^j(x)=x$`   
`$\iff x^{p^j}=x \iff x^{p^j}-x=0$`  
`$\tf p^n \leq p^j \implies n \leq j$`, `$\implies n=j$`

`$\tf Gal(K/F) = <\varphi> \iso \Z_n$`

### Chapter 10 - Galois Groups of Polynomials

*Recall*  
`$f(x) \in F[x]$` irred, sep. If `$G = Gal(f(x))$`:  
1. `$G$` is a transitive subgroup of `$S_n$`, `$n=\deg f(x)$`.   
2. `$n \mid |G|$` (orbit-stabilizer, every orbit will have size `$n$`)  
	In particular, if `$n=2$`, `$G = S_2 \iso \Z_2$`

**Definition** `$f(x) \in F[x]$` monic, non-constant.   
`$K$` = splitting field of `$f(x)$` over `$F$`.   
`$f(x)=(x-\alpha_1)\cdots(x-\alpha_n) \in K[x]$`  
The **discriminant** of `$f(x)$` is:  
`$$disc(f(x))=\Pi_{i < j} (\alpha_i-\alpha_j)^2$$`

*Remarks:*  
1. `$disc(f(x))=0$` `$\iff$` `$f(x)$` is NOT separable  
2. `$f(x)$` separable. `$\forall \varphi \in Gal(f(x)) = Gal(K/F)$`  
	`$\varphi(disc(f(x)))=disc(f(x))$` (just changes up the ordering) (regardless of sep)  
	`$\implies disc(f(x)) \in FixGal(K/F)=F$`  
3. `$f(x)=x^2+bx+c = (x-\alpha_1)(x-\alpha_2)$`  
	 `$disc(f(x))=(\alpha_1-\alpha_2)^2 = \alpha_1^2+\alpha_2^2-2\alpha_1\alpha_2 = b^2-4c$`

**Investigation**   
`$char(F)\neq2$`. `$f(x) \in F[x]$` separable. `$K$` = splitting field of `$f(x)$`. `$f(x)=(x-\alpha_1) \cdots (x-\alpha_n) \sub K[x]$` distinct roots.  
Let `$d = \Pi_{i < j} (\alpha_i-\alpha_j)$` so that `$d^2=disc(f(x))$`  
Let `$G = Gal(f(x))=Gal(K/F)$`  
For all `$\varphi \in G$`, `$\varphi(d)^2=d^2 \implies \varphi(d)$` root of `$x^2-d^2 \in F[x]$`  
`$\implies \varphi(d)=\pm d$`. *`$char 2$`, don't want 1=-1*

*Fact:* `$\varphi(d)=d \iff \varphi \in A_n$`

`$\tf$` TFAE:  
1. `$G \sub A_n$`  
2. `$\forall \varphi \in G, \varphi(d)=d$`  
3. `$d \in F$`  
4. `$discf(x)$` is a square in `$F$`.

**Cubics**  
`$f(x) \in F[x]$` monic irred., sep. `$\deg f(x)=3$`  
`$f(x)=x^3+\alpha x^2+\beta x + \gamma$`  
Assume `$charF \neq 2, 3$`  
`$g(x):=f(x-\alpha/3)$`  
`$=\underbrace{x^3+ bx+c}_{\textbf{depressed cubic}}$` 

*Important Note*  
`$g(t)=0 \iff t=s+\frac{\alpha}{3}$`, `$f(s)=0$`  
`$\tf Gal(f(x))=Gal (g(x))$`

WLOG, `$f(x)=x^3+bx+c$`

*Fact:* `$disc(f(x))=-4b^3-27c^2$`.   
Let `$G=Gal(f(x))$`. Then, `$G \leq S_3$` and `$3 \mid |G|$` `$\implies G=A_3$` or `$S_3$`

From before, `$Gal(f(x))=G=$`  
$$\begin{cases}  
A_3 & \text{ if `$disc(f(x)$` square in `$F$`} \\  
S_3 & \text{ otherwise }  
\end{cases}  
$$

*Example*   
`$f(x)=x^3-3x+1 \in \Q[x]$`. `$f(x)$` is irreducible by Mod-2 test.  
Since `$\Q$` is perfect, `$f(x)$` is separable. `$disc(f(x))=-4(-3)^2-27(1)^2=4(27)-27=27(4-1)=27(3)=3^4=9^2$`  
`$Gal(f(x))=A_3$`

**Quartics**  
Let `$f(x)\in F[x]$` be a separable, irreducible, monic, quartic.  
Say  
`$$f(x)=x^4+\alpha x^3+\beta x^2+\gamma x + \delta$$`

Assume `$Char(F)\neq2$`. By making the substitution `$x \mapsto x-\frac{\alpha}{4}$`, we may assume that   
`$\underbrace{f(x)=x^4+bx^2+cx+d}_{\textbf{depressed quartic}}$`

We know `$G=Gal(f(x))$` is a transitive subgroup of `$S_4$` with `$4 \mid |G|$`. 

The options are: `$S_4, A_4, D_4, V\iso \Z_2 \times \Z_2, \Z_4$`

*Remark*  
`$V = \{e, (1 2)(3 4), (1 3)(2 4), (1 4)(2 3)\}$`  
Let `$u = \alpha_1 \alpha_2 + \alpha_3 \alpha_4$`, `$v=\alpha_1 \alpha_3+\alpha_2 \alpha_4$`, `$w=\alpha_1\alpha_4+\alpha_2\alpha_3$`  
where `$\alpha_1, \alpha_2, \alpha_3, \alpha_4$` are the roots of `$f(x)$`

Let `$K$` be the splitting field of `$f(x)$` over `$F$`. i.e. `$K=F(\alpha_1, \alpha_2, \alpha_3, \alpha_4)$`  
and let `$L=F(u, v, w)$`. 

`$\tf F \sub L \sub K$`  
Note:  
1. `$Gal(K/F)=Gal(f(x)), K/F$` galois.   
2. `$L/F$` Galois....  
 `$Res f(x) := (x-u)(x-v)(x-w) = x^3-bx^2-4dx+4bd-c^2 \in F[x]$`  
 This is called the **resolvent cubic**   
3. `$Gal(Res(f(x))=Gal(L/F) \iso Gal(K/F) / Gal(K/L)=G/(G \cap V)$`  
 Let `$m=|Gal(Res(f(x))| = \frac{|G|}{|G \cap V|}$` 

 #### Insert table  
For `$m \in \{1, 3, 6\}$`, `$G$` is uniquely determined.

Assume `$m=2$`, i.e. `$Gal (Resf(x))\iso \Z_2$`. Say `$u \in F$`, `$v, w \notin F$`. 

Note: `$L=F(v, w)$`. Moreover, `$G \iso D_4$` or `$\Z_4$`  
Both `$D_4$` and `$\Z_4$` contain a 4-cycle which fix   
`$$u=\alpha_1\alpha_2+\alpha_3\alpha_4$$`
*Why?* `$F=FixGal(K/F)=Fix G$`

`$\tf \sigma = (1 3 2 4) \in G$`  
`$\implies \sigma^2 = (1 2)(3 4) \in G$`

Consider :  
1. `$x^2-ux+d \in F[x] = (x-\alpha_1\alpha_2)(x-\alpha_3\alpha_4)$`  
2. `$x^2+(b-u) \in F[x] = (x-(\alpha_1+\alpha_2))(x-(\alpha_3+\alpha_4))$`

**Prop**  
`$G = <\sigma>\iso \Z_4$` `$\iff$` (1) and (2) split over `$L$`.

*Proof:*  
`$(\implies)$` Suppose `$Gal(f(x)) = <\sigma>$`. Then `$Gal(K/L)=<\sigma> \cap V = <\sigma^2>$`  
But `$\alpha_1 \alpha_2, \alpha_3 \alpha_4, \alpha_1+\alpha_2, \alpha_3+\alpha_4 \in Fix<\sigma^2>=Fix(K/L)=L$`

(`$\impliedby$`) Suppose `$\alpha_1 \alpha_2, \alpha_3 \alpha_4, \alpha_1+\alpha_2, \alpha_3+\alpha_4 \in L$`  
Since `$\alpha_1, \alpha_2 \in L(\alpha_1)$`  
and `$(\alpha_1-\alpha_2)(\alpha_3-\alpha_4)=v-w \in L$`  
`$\implies \alpha_3-\alpha_4 \in L(\alpha_1) \implies \alpha_3, \alpha_4 \in L(\alpha_1)$`, `$charF\neq 2$`

`$\tf K=F(\alpha_1, \cdots, \alpha_4)=L(\alpha_1)$`

Since `$\alpha_1$` is a root of `$x^2-(\alpha_1+\alpha_2)x+\alpha_1\alpha_2 \in L[x]$`

`$[K:L]=[L(\alpha_1):L] \leq 2$`

However, `$[L:F]=m=2$`  
`$\implies [K:F] \leq 4$`

But, `$[K:F]=|G| \geq 4$`  
`$\implies [K:F]=4 \implies |G|=4$` `$\implies G \iso \Z_4$` `$\qed$`

*Recall* `$char F \neq 2$`  
`$f(x)=x^4+bx^2+cx+d$`, irreducible separable  
`$Res f(x)=x^3-bx^2-4dx+4bd-c^2$`  
`$G=Gal(f(x))$`, `$m = |Gal Res f(x)|$`

$$  
\begin{array}{c | c c c c c}  
G & S_4 & A_4 & D_4 & V & \Z_4 \\   
\hline   
G \cap V & V & V & V & V & \Z_2 \\  
\hline  
m & 6 & 3 & 2 & 1 & 2  
\end{array}  
$$

if `$m=2$`, and `$u \in F$` (root of `$Res$`), then `$G=\Z_4$` `$\iff$`   
(1) `$x^2-ux+d$`, (2) `$x^2+(b-u)$` split over `$L=sf Res f(x)$`

*Example*  
`$f(x)=x^4-2x-2 \in \Q[x]$`. By 2-Eis, `$f(x)$` is irreducible. Since `$\Q$` is perfect, `$f(x)$` separable.

`$[b=0, c=-2, d=-2]$`. `$Resf(x)=x^3+8x-4$`  
[HW: No rational roots `$\implies$` irreducible ]

`$disc(Res(f(x))=-4(8)^3-27(-4)^2 < 0$`, therefore `$discResf(x)$` is not a square in `$\Q$`, and so `$Gal(Res(f(x))) = S_3$`

`$\tf m=6$` so `$Gal(f(x))=S_4$`

*Example* `$f(x)=x^4+5x+5 \in \Q[x]$`   
by `$5$`-Eis, `$f(x)$` is irreducible. Since `$\Q$` is perfect, `$f(x)$` is separable.   
[`$b=0, c=5, d=5$`]  
`$Resf(x)=x^3-20x-25$`  
Note `$5$` is a root, through poly long division,  
`$Res f(x)=(x-5)(\underbrace{x^2+5x+5}_{\text{irred, 5-eis}})$`  
`$\tf m=2$`, so let `$u=5$`.   
roots of quadratic: `$$\frac{-5 \pm \sqrt{25-20}}{2} = \frac{-5\pm \sqrt{5}}{2}$$`
if `$L$` is the spliting field of `$Res f(x)$`, `$L=\Q(\sqrt{5})$`

Then, we consider:  
1. `$x^2-5x+5$`, roots: `$\frac{5\pm\sqrt{5}}{2} \in L$`  
2. `$x^2-5$`, roots are: `$\pm \sqrt{5} \in L$`

`$\tf$` (1) and (2) split over `$L$`, and so `$G=\Z_4$`. //

### Chapter 11 - Solvability by Radicals

*Recall*

**Definition[Solvable Groups]**  
A group `$G$` is **solvable** if there exists:  
`$$\{e\} = H_0 \tleq H_1 \tleq H_2 \tleq \cdots \tleq H_n=G$$`
such that `$H_{i+1}/H_{i}$` is abelian. 

*Example* `$\{e\} \tleq <r> \tleq D_4$` solvable

*Example* `$S_4 \tgeq A_4 \tgeq V \tgeq \{e\}$`

*Remark* if `$G$` is simple then `$G$` is solvable `$\iff$` `$G$` is abelian (`$G \iso \Z_p)$`

*Example* `$A_5$` is not solvable --> simple, non-abelian.

*Recall*  
If `$G$` is solvable and `$H \leq G$`, then `$H$` is solvable.

**Proposition**`$G$` solvable, `$N \tleq G$`. Then `$G/N$` is solvable.  
*Why?* `$\{e\} = H_0 \tleq H_1 \tleq \cdots \tleq H_n=G$`  
`$\bar{\{e\}} = \bar{H_0} \tleq \bar{H_1} \tleq \cdots \tleq \bar{H_n}=\bar{G}$`  
`$\bar{H_i}=H_i N / N$`

[3rd Iso Theorem] `$\overline{H_{i+1}}/\overline{H_i} \iso H_{i+1}/H_i$` abelian.

**Proposition** `$N \tleq G$`  
Then, `$G$` is solvable `$\iff$` `$N$` and `$G/N$` are solvable.

*Why?*   
`$\implies$` Done  
`$\impliedby$` `$\overline{\{e\}}=\bar{H_0} = ..$`  
`$\overline{H_i}=H_i/N$`, `$N \sub H_i$`, `$\overline{H_{i+1}}/\overline{H_i}$` abelian

Note: `$H_0 = N$`  
`$$\{e\} = K_0 \tleq K_1 \tleq \cdots \tleq K_m=N=H_0$$`
`$$\tleq H_1 \tleq H_2 \cdots \tleq G$$`
Note:  
`$H_{i+1}/H_{i}\iso\overline{H_{i+1}}/\overline{H_i}$` [3rd Iso Theorem]

`$K_{i+1}/K_i$` abelian by solvability of `$N$`, `$H_0=k_m$`  
`$\qed$`

*Recall*  
`$G$` solvable `$\iff$` `$N, G/N$` solvable.

*Example* `$|G|=p^n$`

`$Z(G) \neq \{e\}$` solvable. b/c abelian groups solvable  
`$G / Z(G)$` solvable (induction)  
`$\implies G$` solvable.

**Investigation**  
`$A, B, C$` groups, `$A \tleq B \tleq C$`, `$\underbrace{C/A \text{ abelian}}_{A \tleq C}$`.

Let `$b_1, b_2 \in B \sub C$`. `$\tf$` `$(b_1A)(b_2A)=(b_2A)(b_1A)$`  
`$\implies B/A$` abelian.

Take `$c_1, c_2 \in C$`, we investigate Do `$c_1 B, c_2 B$` commute?

We know `$(c_1A)(c_2 A)=(c_2 A)(c_1 A)$` `$\implies$` `$c_1c_2A=c_2c_1A$` `$\implies$` `$c_1^{-1}c_2^{-1}c_1c_2A=A$`  
`$\implies c_1^{-1}c_2^{-1}c_1c_2 \in A \sub B$`

`$\implies (c_1B)(c_2B)=(c_2B)(c_1B)$` `$\implies C/B$` is abelian.

Suppose `$A \tleq C$` and there does not exist `$B$` such that `$A \tleq B \tleq C$`.  
--> no `$B$` in between `$A$` and `$C$`  
and assume `$C/A$` abelian. `$\tf$` `$C/A$` simple, abelian.  
`$\implies C/A \iso \Z_p$`

Suppose `$G$` is *finite* and solvable. By refining the chain as much as possible:  
`$$\{e\} =H_0 \tleq H_1 \tleq \cdots \tleq H_m=G$$`
`$H_{i+1}/H_i$` cyclic, prime order.

**Solvability by Radicals**

*Idea:* Solving a polynomial by radicals means (informally) expressing its roots using arithmetic + radicals (nth roots).  
In 1824, Abel proved that `$f(x)$` is solvable by radicals when `$\deg f(x) \leq 4$` and `$char \neq 2, 3$`. He proved there exists quintics are not solvable by radicals.

#### Big assumption from now on: All fields have `$char=0$`

**Definition [Simple Radical Extensions]** We say `$K/F$` is a **simple radical extension** iff `$\exists \alpha \in K$`, `$\exists n \in \N$` such that `$K=F(\alpha), \alpha^n \in F$`  
--> the one thing you adjoined is an n-th root of something in the base field

**Definition [Radical Tower]** A **radical tower** over `$F$` is a tower of fields `$K_m / K_{m-1} \cdots / K_1/K_0=F$` such that `$K_{i+1}/K_i$` simple radical.

**Definition [Radical Extension]** We say `$K/F$` is **radical** if there exists a radical tower from `$F$` to `$K$` (i.e. `$K_m=K$`)

**Definition [Solvable by Radicals]** We say `$f(x) \in F[x]$` is **solvable by radicals** if its splitting field is contained in a radical extension of `$F$`. 

*Example* `$K=\Q(\sqrt[3]{2}, \zeta_8)$`. Clearly,  
`$K \sup \Q(\sqrt[3]{2}) \sup \Q$`  
So `$K/\Q$` is radical.

*Example* `$\Q(\sqrt{2+\sqrt{2}}) \sup \Q(\sqrt{2}) \sup \Q$`

**Definition [Cyclic Extensions]** We say `$K/F$` is **cyclic** iff `$K/F$` finite, Galois and `$Gal(K/F)$` is cyclic.

**Proposition** Suppose `$F$` contains a primitive nth root of unity, `$\zeta$`.

If `$K=F(\alpha), \alpha^n \in F$`, then `$K/F$` is cyclic.

*Proof*  
The roots of `$f(x)=(x^n-\alpha^n)$` are `$\alpha, \zeta \alpha, \cdots, \zeta^{n-1}\alpha \in K$`

`$\tf$` `$K$` is the splitting field of the separable polynomial `$f(x)$`. Hence, `$K/F$` is Galois, 

For all `$\varphi \in Gal(K/F)$`, there exists a unique `$0 \leq i \leq n-1$` such that `$\varphi(\alpha)=\zeta^i \alpha$`

Consider `$\psi: Gal(K/F) \to \Z_n$` given by `$\psi(\varphi)=i$` as above.

*Claim* `$\psi$` is an injective group homomorphism.

Take `$\varphi_1, \varphi_2 \in Gal(K/F)$` such that `$\varphi_1(\alpha)=\zeta^i \alpha$` and `$\varphi_2(\alpha)=\zeta^j \alpha$` 

$\tf (\varphi_1 \circ \varphi_2)(\alpha) = \varphi_1(\zeta^j \alpha) = \zeta^j \varphi(\alpha)  
=$  
`$\zeta^{i+j} \alpha \implies \psi(\varphi_1 \circ \varphi_2) = i+j=\psi(\alpha_1)+\psi(\alpha_2)$`

Now, `$\varphi \in \ker \varphi$` `$\iff \psi(\varphi)=0 \iff \varphi(\alpha)=\alpha \iff \varphi = \text{ id }$`

`$\tf \psi$` is injective. Hence, `$Gal(K/F)$` is isomorphic to a subgroup of `$Z_n$` and so is cyclic.

**Definition**  `$\{\sigma_1, \sigma_2, \cdots, \sigma_n\} \in Aut(K)$`  
We say `$\{\sigma_1, \sigma_2, \cdots, \sigma_n\}$` is **linearly independent** over `$K$` iff `$a_1 \sigma_1 + \cdots + a_n \sigma_n = 0 \implies a_1 = a_2 = \cdots = a_n = 0, (a_i \in K)$`

**Lemma** `$[K:F]<\infty$`, then `$G=Gal(K/F)$` is linearly independent over `$K$`. 

*Proof*   
Let `$\{\sigma_1, \cdots, \sigma_n\} \sub G$` be a minimal linearly dependent set. --> if you threw out a `$\sigma_i$`, we get a lin ind set.

This means `$\exists a_i \in K^\times$` such that `$a_1 \sigma_1 + \cdots + a_n \sigma_n = 0$`  
--> by the minimality assumption, if u had `$a_1=0$`, you could have thrown out `$a_1$`.

Since `$a_1 \neq 0$` and `$\sigma_1 \neq 0$`, `$n > 1$`. 

Since `$n \geq 2$`, `$\exists \beta \in K$` such that `$\sigma_1(\beta)\neq\sigma_2(\beta)$`

For all `$\alpha \in K$`,   
1. `$a_1\sigma_1(\alpha)\sigma_1(\beta)+a_2\sigma_2(\alpha)\sigma_2(\beta) +\cdots+a_n\sigma_n(\alpha)\sigma_n(\beta)=0$`  
2. `$a_1\sigma_1(\alpha)\sigma_1(\beta)+a_2\sigma_2(\alpha)\sigma_1(\beta)+\cdots+\sigma_n(\alpha)\sigma_1(\beta)=0$`  
subtract (1) and (2)  
$[\underbrace{a_2(\sigma_2(\beta))-\sigma_1(  
\beta))}_{\neq 0}\sigma_2(\alpha)+\cdots+a_n(\sigma_n(\beta)-\sigma_1(\beta))\sigma_n(\alpha)]=0$

hence `$\{\sigma_2, \cdots, \sigma_n\}$` linearly dependent. Contradiction, `$\qed$`

**Proposition** Assume `$F$` contains a primitive `$n$`th root of unity, and `$K/F$` is cyclic of degree `$n$`. Then, `$K$` is a simple radical extension of `$F$`.

*Proof* Let `$G=Gal(K/F)$`, so that `$|G|=[K:F]=n$`. Say `$G=<\sigma>$`

For any `$\alpha \in K^\times$`, let `$g(\alpha)=\alpha+\zeta \sigma(\alpha)+\zeta^2\sigma^2(\alpha)+\cdots+\zeta^{n-1}\sigma^{n-1}(\alpha)$`  
where `$\zeta \in F$` is a primitive `$n$`th root of unity.

*Note:*  
0. Since `$G$` is LI over `$K$`, `$\forall \alpha \neq 0$`, `$g(\alpha)=0$`  
1. `$\sigma(g(\alpha))=\sigma(\alpha)+\zeta\sigma^2(\alpha)+\cdots+\zeta^{n-1}\alpha=\zeta^{-1}g(\alpha)$`  
2. `$\sigma(g(\alpha)^n)=\sigma(g(\alpha))^n=[\zeta^{-1}g(\alpha)]^n=g(\alpha)^n$`  
`$\tf g(\alpha) \notin F$` and `$g(\alpha)^n \in F$`, `$F=FixG$`

Fix `$\alpha \in K^\times$`. 

For `$1 \leq i \leq n-1$`, `$\sigma^i(g(\alpha))=\underbrace{\zeta^{-i}}_{\neq 1}g(\alpha) \neq g(\alpha)$`

If `$\{1\} \neq H \leq G$`, then `$g(\alpha) \notin FixH$`. (Why? `$H=<\sigma^i>$`)

`$\tf F \subset E \subseteq K$` and `$g(\alpha) \in E$`, then `$E=K$`.

`$K=F(g(\alpha))$` and `$g(\alpha)^n \in F$`, `$\qed$`

*Remark* `$F$` field.  
`$W_n = \underbrace{\{z \in \bar{F}: z^n=1 \}}_{\text{ finite }} \leq \bar{F}^\times$`  
From before, `$W_n$` is cyclic. 

We say `$\alpha \in \bar{F}^\times$` is a primitive `$n$`th root of unity iff `$W_n=<\alpha>$`

Let `$\phi_n(x)=\Pi_{\text {prim nth root } \alpha}(x-\alpha) \in $`bar{F}`$[x]$`

For a primitive `$n$`th ROU, `$\alpha$`, `$F(\alpha)$` is the s.f. of `$x^n-1$`

Hence, `$F(\alpha)/F$` is normal = Galois.

`$\phi_n(x) \in FixGal(F(\alpha)/F)[x] = F[x]$`

**Lemma**  
`$[K:F] < \infty$`, `$K/E/F$`  
`$K/E$` simple radical, `$E/F$` Galois. There exists `$L/K$` such that `$L/F$` Galois and `$L/E$` is radical.

Moreover, `$Gal(L/E)$` is solvable.

*Proof*  
Suppose `$K=E(\alpha)$` where `$\alpha^n = \beta \in E$`, and `$G=Gal(E/F)=\{\sigma_1, \sigma_2, \cdots, \sigma_r\}$`

Consider `$f(x)= \phi_n(x) \Pi_{i=1}^r (x^n - \sigma_i(\beta))$`

Let `$L$` be the splitting field of `$f(x)$` over `$K$`

Note: `$f(x) \in Fix G[x] = F[x]$` since `$E/F$` Galois.

Claim 1: `$L/F$` Galois.

Well,   
`$L = K(\text{ roots of f }) = K(\alpha, \text{ other roots}) = E(\alpha) \text{ other roots} = E(\text{roots of f})$`   
and so `$L$` is the splitting field `$f(x)$` over `$E$`.  
Since `$E/F$` Galois, `$E$` is the splitting field of some `$h(x) \in F[x]$` over `$F$`.

Hence `$L$` is the splitting field of `$f(x)h(x)$` over `$F$` 

Since `$char(F)=0$`, `$L/F$` Galois. //

Claim 2: `$L/E$` is radical. Let `$\zeta$` be any root of `$\phi_n(x)$` in `$L$`.   
By the extension lemma, extend each `$\sigma_i$` to `$\sigma_i \in Gal(L/F)$`  
Say `$\sigma_1 = \text{ id }$`.

Since `$\sigma_i(\alpha)^n = \sigma_i(\beta)$`, `$\sigma_i(\alpha)$` is a root of `$f(x)$`

`$\implies \sigma_i(\alpha)=\zeta^j \text{ or } \zeta^j \sigma_l(\alpha)$`

Therefore `$E \sub \E(\zeta) \sub E(\zeta, \sigma_1(\alpha)) \sub E(\zeta, \sigma_1(\alpha), \sigma_2(\alpha)) \sub \cdots$`  
$\sub E(\zeta, \sigma_1(\alpha), \sigma_2(\alpha), \cdots, \sigma_r(  
\alpha))=L$

`$\implies$` `$L/E$` radical.

Claim 3: `$Gal(L/E)$` solvable.

Let `$G_i = Gal(L/E_i)$` where `$E_0 = E(\zeta)$` and `$E_r=E(\zeta, \sigma_1(\alpha), \cdots, \sigma_r(\alpha))$`

`$\implies \{1\} \leq G_r \leq G_{r-1} \leq \cdots G_2 \leq G_1 \leq G_0 \leq \underbrace{Gal(L/E)}_{G'}$`

1. We have `$E(\zeta)/E$` is Galois (s.f. of `$\phi_n(x)$`) and `$Gal(E(\zeta)/E) \iso \Z_n^\times$`  
	`$\underbrace{Gal(L/E(\zeta))}_{G_0} \tleq \underbrace{Gal(L/E)}_{G'}$`  
and `$Gal(L/E) / Gal(L/E(\zeta)) = G'/G_0 \iso \Z_n^\times \text{ abelian }$`

2. We have `$E_{i+1} = E_i(\sigma_i(\alpha))$`, `$\zeta \in E_i$`

	and so `$E_{i+1}/E$` is simple radical, and hence cyclic. (prev propositions)

	`$Gal(L/E_{i+1}) \tleq Gal(L/E_i)$`   
	`$G_{i+1} \tleq G_i$` , and `$G_i/G_{i+1}$` cyclic.

	Hence `$Gal(L/E)$` is solvable. `$\qed$`

**Proposition [Best of Both Worlds]** `$[K:F] < \infty, K/E/F$`  
If `$K/E$` is simple radical, `$E/F$` Galois, then `$\exists L/K$` such that `$L/E$` radical, `$L/F$` Galois, `$Gal(L/E)$` solvable.

Inductively, we get the same result when `$K/E$` is radical.

**Corollary**   
If `$K/F$` is radical, then there exists an extension `$L/K$` such that `$L/F$` is radical and Galois and the `$Gal(L/F)$` is solvable.  
*Proof* `$E=F$`. `$\qed$`

**Theorem [Galois' Theorem]**  
Let `$f(x) \in F[x]$` be non-constant. Then `$f(x)$` is solvable by radicals over `$F$` iff `$Gal(f(x))$` is solvable.

*Proof*  
`$(\implies)$` By deleting repeated irreducible factors, we may assume `$f(x)$` is separable.

Suppose `$f(x)$` is solvable by radicals. Let `$E$` be the splitting field of `$f(x)$` over `$F$` and let `$K/F$` be radical such that `$E \sub K$`. 

By the corollary, `$\exists \ L/F$` radical and Galois, such that `$Gal(L/F)$` is solvable.

Since `$E/F$` is normal, `$Gal(L/E) \tleq Gal(L/F)$` and   
`$Gal(E/F) \iso \underbrace{Gal(L/F) / Gal(L/E)}_{\text{solvable}}$`  
`$\qed$`

**Investigation**

`$S_5$` ,  `$H = <(1 2), (1 2 3 4 5)>$`  
`$(1 2 3 4 5)(1 2)(5 4 3 2 1) = (2 3) \in H$`  
`$(1 2 3 4 5)(2 3)(5 4 3 2 1) = (3 4) \in H$`  
`$(4 5), (5 1) \in H$`

By instead conjugating by powers of `$(1 2 3 4 5)$` (e.g. `$(1 3 5 2 4)$`):  
`$\forall \ \tau$` transposition, `$\tau \in H$`

`$\tf H =S_5$`

*Remark*:  
In general, if `$p$` is prime, `$\tau \in S_p$` is a transposition, and `$\sigma \in S_p$` is a `$p$`-cycle, then `$<\tau, \sigma> = S_p$`  
--> why `$p$` prime? Because otherwise, powers of `$p$`-cycles aren't `$p$`-cycles.

**Proposition** Let `$f(x) \in \Q[x]$` be irreducible with prime degree `$p$`. If `$f(x)$` contains exactly `$2$` non-real roots, then `$Gal(f(x))=S_p$`

*Why?* `$H=Gal(f(x))$`

`$|H|=[K:\Q]$`, `$K$` = splitting field of `$f(x)$`  
`$=[K:\Q(\alpha)]\underbrace{[\Q(\alpha):\Q]}_{p}$`, `$f(\alpha)=0$`  
`$\implies p \in |H|$`  
`$\implies \exists$` p-cycle `$\sigma \in H$`

Consider `$\varphi : \C \to \C$`, `$\varphi(z)=\bar{z}$`  
By the normality theorem, `$\varphi |_K \in Gal(f(x))$`

By assumption, `$\varphi \sim \tau$`, `$\tau$` is a transposition.

`$\tf$` `$\tau, \sigma \in H$`,`$\implies H=S_p$`

*Example* `$f(x)=x^5+2x^3-24x-2 \in \Q[x]$`

`$f(x)$` is irreducible by `$2$`-Eis. 

Claim: `$f(x)$` is not solvable by radicals.

`$f(-100) < 0$`  
`$f(-1)  > 0$`  
`$f(1) < 0$`  
`$f(100) > 0$`

by the Intermediate Value Theorem, `$f(x)$` has at least 3 real roots.

Let `$\alpha_1, \alpha_2, \alpha_3, \alpha_4, \alpha_5$` be the roots of `$f(x)$`.   
`$\sum \alpha_i = -[x^4]f(x)=0$`  
`$\sum \alpha_{i \leq j} \alpha_i \alpha_j = [x^3]f(x) = 2$`

`$\sum \alpha_i^2 = (\sum \alpha_i)^2 - 2 \sum\limits_{i < j} \alpha_i \alpha_j = -4$`

Therefore, not all roots of `$f(x)$` are real.

By the conjugate root theorem (M135), `$f(z)=0, f(\bar{z})=0$`, `$f(x)$` has exactly two non-real roots.

Hence, `$Gal(f(x))=S_5$`. Since `$S_5$` is not solvable (contains `$A_5 \leq S_5$` ), `$f(x)$` is not solvable by radicals.

































### Bonus Material - The Fundamental Theorem of Algebra

**Theorem [Fundamental Theorem of Algebra]**  
`$\C$` is algebraically closed.

*Proof*  
Suppose there exists `$L/\C$` algebraic, and `$\alpha \in L \setminus \C$`. Since `$\C/\R$` is algebraic, `$L/\R$` is algebraic.

Let `$f(x)$` be the minimal polynomial of `$\alpha$` over `$\R$`. 

Consider the splitting field `$K$` of `$f(x)$` over `$\C$`. 

Then `$K$` is the splitting field of `$f(x)(x^2+1)$` over `$\R$`. 

`$\implies K/\R$` is Galois. Let `$G = Gal(K/\R)$`, and say `$|G|=2^{j} m$` where `$2 \nmid m$`.

Since `$[C:\R]=2 |G|$`, `$j \geq 1$`. 

For a Sylow-2 subgroup of `$G$`, call it `$H$`, consider `$E=Fix H$`. 

We know: `$[K:E] = |H|=2^j$`. `$\implies [E:\R]=m$`

For `$\beta \in E$`, `$\deg (\beta) \mid m$`, and so by Calculus,  `$\implies \deg(\beta)=1$`  
--> because odd degree polynomials always have a real root

`$\tf$` `$m=1$`, `$\implies |G|=2^j$`

Let `$G' = Gal(K/\C)$` so that `$G' \leq G$`. 

So by good ol' Lagrange's Theorem, `$|G'|=2^{\l}$`

Consider `$N \leq G'$` with `$|N|=2^{l-1}$`

Since `$[G':N]=2$`, `$N \tleq G'$`.  For `$E'=Fix N$`, `$[K:E']=|N|=2^{l-1}$`

`$\tf [E':\C]=2$`

This contradicts the quadratic formula. All degree 2 elements of `$E'$` can't have a minimal polynomial (b/c there aint no irreducible quadratics). `$\qed$`







