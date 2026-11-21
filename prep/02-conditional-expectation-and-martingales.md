# Conditional Expectation and Martingales

This chapter covers syllabus sections **3. Conditional Expectation** (slides 3, Baldi Ch. 4) and **4. Martingales** (slides 4, Baldi Ch. 5). All numbering follows the course slides and handwritten notes. Baldi numbers are given in brackets where useful.

> **Numbering warning.** The handwritten notes for Chapter 3 call the existence/uniqueness result "Definition and Theorem 3.1" and the testing remark "Remark 3.2". In the slides (and the final syllabus) these are **Definition and Theorem 3.4** and **Remark 3.5**. (The notes' "Remark 3.2" is a monotone-class argument that proves both Remark 3.5, testing against bounded $W$, and Remark 3.6, verifying on a $\pi$-system. Know both.) The notes for Chapter 4 head the upcrossing proof "Proposition 4.12"; in the slides it is **Proposition 4.11**. Always use the slide numbers on the exam.

## 1. Exam relevance

Syllabus rule for Section 3: "All the results in the slides (S) and what is proven in my handwritten notes (P)". For Section 4: "Everything in the slides" plus the listed proofs.

| Item | Tag | Likelihood | Why |
|---|---|---|---|
| Def. and Thm 3.4: existence and uniqueness of conditional expectation | S&P (proved in notes) | High | Foundational; short Radon-Nikodym proof; ideal "state and prove" |
| Remark 3.5: testing against bounded measurable W | S&P (proved in notes, monotone class) | Medium | Used in every other proof; proof is a clean monotone class argument |
| Remark 3.6: verifying via a pi-system | S | Medium | Used to check a candidate conditional expectation |
| Prop. 3.7 (a)-(f): basic properties | S; (d), (e), (f) S&P | High | (d) take out what is known, (e) tower, (f) independence: proved in notes |
| Prop. 3.8: conditional Beppo Levi, Fatou, Lebesgue, Jensen | S | Medium | Jensen is used constantly for submartingales |
| Def. 3.9, Remark 3.10 (contraction, L2 projection) | S | Medium | Conceptual short questions |
| Examples 3.11-3.13, Remark 3.14 | S | Low-Medium | Short computations |
| Lemma 3.15: freezing lemma | S | High (as a tool) | Every BM conditional computation uses it |
| Example 3.16: Brownian transition expectations, Markov property | S&P (proved in notes) | High | Proved in notes via freezing lemma |
| Example 3.17: BM at an independent random time | S&P (proved in notes) | Medium-High | Proved in notes via freezing lemma + Fubini |
| Remark 3.18, Example 3.19: time integrals | S | Medium | Typical computation |
| Def. 3.20, Example 3.21: conditional laws, densities | S | Medium | Definitions |
| Prop. 3.22, 3.23: Gaussian conditioning | S | High (as a tool) | Computational exercises (estimation, Brownian bridge) |
| Def. 4.1, Example 4.2, convex transforms, Def. 4.3 | S | Very high | Martingale checks are certain to appear |
| Def. 4.4, Thm 4.5: Doob decomposition | **S&P** | Very high | Short proof; also computational (compensator of M squared, 2022 assignment Ex. 4) |
| Stopped martingale is a martingale | **P** | Very high | Explicitly listed; 5-line proof |
| Thm 4.6 + Cor. 4.7: stopping theorem (discrete) | **S&P** | Very high | Explicitly listed; central tool |
| Remark 4.8, Baldi Ex. 5.1 and 5.6: characterization of martingales | **S&P (exercise with solution)** | High | Explicitly listed twice in the syllabus |
| Thm 4.9: maximal inequalities | S | Medium | Used for Doob-type bounds |
| Def. 4.10, Prop. 4.11: upcrossings | S | Medium | Statement needed for Thm 4.12 |
| Thm 4.12: a.s. convergence of supermartingales | **S&P** | High | Classic proof via upcrossings |
| Cor. 4.13, Remark 4.14 | S | Medium | Nonnegative supermartingales converge |
| Example 4.15: exit of symmetric random walk | S | High | Typical optional stopping exercise |
| Def. 4.16, Thm 4.17: Doob's inequality | **S&P** | High | Proof reduces to Lemma 4.18 |
| Lemma 4.18: finite horizon Doob | S (proof in notes) | Medium | Learn the proof anyway: it is the content of Thm 4.17 |
| Thm 4.19: convergence in Lp, p > 1 | **S&P** | High | Short proof using Thm 4.12 + Doob + DCT |
| Def. 4.20 - Prop. 4.27: uniform integrability | S | High (conceptual) | UI examples and counterexamples |
| Thms 4.28-4.30, 4.32: continuous time versions | S | Medium | Statements; 4.28 proved in notes |
| Example 4.31: exponential BM martingale | S | High | Classic: converges a.s. to 0, not UI |
| Thm 4.33, Cor. 4.34: continuous-time stopping theorem | S | Very high (as tool) | Needed for every BM exit problem |
| Example 4.35: Brownian exit probabilities | S | Very high | Classic exercise; also E[tau] = ab |
| Thm 4.36: right-continuous modification | S | Low | Note the correction of Baldi |
| Thm 4.37: finite-variation martingales are constant | **S&P (bounded variation case)** | High | Short proof, nice exam item |
| Thm 4.38, Def. 4.39, Rem. 4.40, Ex. 4.41: associated increasing process | S | High | Needed for Ch. 5-6 |
| Thm 4.42: characterization of BM | **S&P** | High | Very short proof; uses Baldi Ex. 4.5 |

## 2. Core definitions and facts

Throughout, $(\Omega,\mathcal F,P)$ is a probability space and $\mathcal D\subset\mathcal F$ a sub-$\sigma$-algebra.

### 2.1 Elementary conditioning

**Definition 3.1 (Conditioning on an event).** If $A\in\mathcal F$ with $P(A)>0$, then $P_A(B)=P(A\cap B)/P(A)$, $B\in\mathcal F$, is a probability measure: the conditional probability given $A$.

**Definition 3.2 (Conditioning on a discrete r.v.).** Let $X$ be real and $Z$ take values in a countable $E$ with $P(Z=z)>0$ for all $z\in E$. Then
$$
n(z,A)=P(X\in A\mid Z=z)=\frac{P(X\in A,\ Z=z)}{P(Z=z)}
$$
is the conditional law of $X$ given $Z=z$, and
$$
E[X\mid Z=z]=\int_{\mathbb R}x\,n(z,dx)=\frac{E[X\mathbf 1_{\{Z=z\}}]}{P(Z=z)} .
$$

**Key observation (slide 5).** With $h(z)=E[X\mid Z=z]$, the r.v. $h(Z)$ is $\sigma(Z)$-measurable and for every $B\subset E$
$$
\int_{\{Z\in B\}}h(Z)\,dP=\sum_{z\in B}E[X\mathbf 1_{\{Z=z\}}]=\int_{\{Z\in B\}}X\,dP .
$$
Since every $D\in\sigma(Z)$ has the form $\{Z\in B\}$, this integral identity is what defines conditioning on a general $\sigma$-algebra.

### 2.2 Conditional expectation

**Definition 3.3 (Lower semi-integrable).** $X$ is l.s.i. if $E[X^-]<\infty$; then $E[X]\in(-\infty,+\infty]$ is well defined.

**Definition and Theorem 3.4 (Conditional expectation).** Let $X$ be real l.s.i. The conditional expectation $E[X\mid\mathcal D]$ is the equivalence class of $\mathcal D$-measurable l.s.i. r.v.'s $Z$ such that
$$
\int_D Z\,dP=\int_D X\,dP\qquad\text{for every }D\in\mathcal D .
$$
Such $Z$ exists and is unique up to a.s. equality. If $X$ is integrable then $Z$ is integrable (hence a.s. finite).

**Remark 3.5 (Testing).** If $Z=E[X\mid\mathcal D]$ then $E[ZW]=E[XW]$ for every bounded nonnegative $\mathcal D$-measurable $W$; if $X$ is integrable, for every bounded $\mathcal D$-measurable $W$.

**Conditioning on a r.v.** For $Y$ with values in $(E,\mathcal E)$, $E[X\mid Y]:=E[X\mid\sigma(Y)]=g(Y)$ for a measurable $g$ (Doob's measurability criterion). $g(y)=E[X\mid Y=y]$ is defined only $\mu_Y$-a.e. For integrable $X$ it is characterized by $E[X\varphi(Y)]=E[g(Y)\varphi(Y)]$ for all bounded measurable $\varphi$.

**Remark 3.6 (Verifying).** To prove $Z=E[X\mid\mathcal D]$: check (i) the integrability, (ii) $Z$ is $\mathcal D$-measurable, (iii) $E[Z\mathbf 1_D]=E[X\mathbf 1_D]$ for $D\in\mathcal D$. In (iii) it suffices to test $D\in\mathcal C$, a class with $\Omega\in\mathcal C$, stable under finite intersections, $\sigma(\mathcal C)=\mathcal D$.

**Proposition 3.7 (Basic properties).** $X,X_1,X_2$ integrable, $\alpha,\beta\in\mathbb R$:

- (a) $E[\alpha X_1+\beta X_2\mid\mathcal D]=\alpha E[X_1\mid\mathcal D]+\beta E[X_2\mid\mathcal D]$.
- (b) $X\ge 0$ a.s. $\Rightarrow$ $E[X\mid\mathcal D]\ge 0$ a.s.
- (c) $E[E[X\mid\mathcal D]]=E[X]$.
- (d) $Z$ bounded and $\mathcal D$-measurable $\Rightarrow$ $E[ZX\mid\mathcal D]=ZE[X\mid\mathcal D]$.
- (e) $\mathcal D\subset\mathcal D'$ $\Rightarrow$ $E[E[X\mid\mathcal D']\mid\mathcal D]=E[X\mid\mathcal D]$ (tower property).
- (f) $X$ independent of $\mathcal D$ $\Rightarrow$ $E[X\mid\mathcal D]=E[X]$.

For l.s.i. variables the same holds with $\alpha,\beta\ge 0$ in (a) and $Z\ge 0$ bounded in (d).

> **Useful extension of (d).** If $Z$ is $\mathcal D$-measurable and $ZX$ and $X$ are integrable (e.g. $Z, X\in L^2$), then still $E[ZX\mid\mathcal D]=ZE[X\mid\mathcal D]$ (truncate $Z$ and use conditional DCT). We use this freely for Brownian polynomials.

**Proposition 3.8 (Conditional convergence theorems).** $X,X_n$ real l.s.i.

- (a) Beppo Levi: $X_n\uparrow X$ a.s. $\Rightarrow$ $E[X_n\mid\mathcal D]\uparrow E[X\mid\mathcal D]$ a.s.
- (b) Fatou: $X=\liminf X_n$, $X_n\ge Z$ with $Z$ integrable $\Rightarrow$ $E[X\mid\mathcal D]\le\liminf E[X_n\mid\mathcal D]$ a.s.
- (c) Lebesgue: $X_n\to X$ a.s., $|X_n|\le Z\in L^1$ $\Rightarrow$ $E[X_n\mid\mathcal D]\to E[X\mid\mathcal D]$ a.s.
- (d) Jensen: $Y$ integrable, $\Phi:\mathbb R\to\mathbb R\cup\{+\infty\}$ convex l.s.c. $\Rightarrow$ $\Phi(Y)$ l.s.i. and $E[\Phi(Y)\mid\mathcal D]\ge\Phi(E[Y\mid\mathcal D])$ a.s.

**Definition 3.9.** $P(A\mid\mathcal D):=E[\mathbf 1_A\mid\mathcal D]$. In general $A\mapsto P(A\mid\mathcal D)(\omega)$ is **not** a probability measure (the exceptional null sets depend on the countable family of sets and there are uncountably many families). On a standard Borel (e.g. Polish) space a regular version exists.

**Remark 3.10 (Operator view).**

- $X=X'$ a.s. $\Rightarrow$ $E[X\mid\mathcal D]=E[X'\mid\mathcal D]$ a.s.
- For $1\le p<\infty$: $E[\,|E[X\mid\mathcal D]|^p]\le E[|X|^p]$, i.e. $\|E[X\mid\mathcal D]\|_p\le\|X\|_p$ (Jensen with $|x|^p$). So $X_n\to X$ in $L^p$ implies $E[X_n\mid\mathcal D]\to E[X\mid\mathcal D]$ in $L^p$. The range is $L^p(\mathcal D)$.
- For $X\in L^2$, $Z=E[X\mid\mathcal D]$ is the orthogonal projection onto $L^2(\mathcal D)$: $E[(X-Z)W]=0$ for $W\in L^2(\mathcal D)$, and
$$
\|X-W\|_2^2=\|X-Z\|_2^2+\|Z-W\|_2^2\ \ge\ \|X-Z\|_2^2,\qquad W\in L^2(\mathcal D).
$$
So $Z$ is the unique best $L^2$ predictor of $X$ among $\mathcal D$-measurable square integrable r.v.'s.

**Example 3.11.** $\mathcal D=\{\emptyset,\Omega\}$: $E[X\mid\mathcal D]=E[X]$.

**Example 3.12.** $0<P(A)<1$, $\mathcal D=\{\emptyset,A,A^c,\Omega\}$:
$$
E[X\mid\mathcal D]=\frac{E[X\mathbf 1_A]}{P(A)}\mathbf 1_A+\frac{E[X\mathbf 1_{A^c}]}{P(A^c)}\mathbf 1_{A^c}.
$$
More generally, if $\mathcal D$ is generated by a countable partition $(A_i)$ with $P(A_i)>0$, then $E[X\mid\mathcal D]=\sum_i\frac{E[X\mathbf 1_{A_i}]}{P(A_i)}\mathbf 1_{A_i}$.

**Example 3.13.** For a Brownian motion $(\Omega,\mathcal F,(\mathcal F_t),(B_t),P)$ and $s\le t$: $E[B_t\mid\mathcal F_s]=B_s$.
(Proof: $B_t=B_s+(B_t-B_s)$, the first term is $\mathcal F_s$-measurable, the second is independent of $\mathcal F_s$ with mean $0$.)

**Remark 3.14 (Null sets).** If $\mathcal D=\sigma(\mathcal D_0,\mathcal N)$ with $\mathcal N$ the negligible sets, then $E[X\mid\mathcal D]=E[X\mid\mathcal D_0]$ a.s. (Every $D\in\mathcal D$ differs from some $D_0\in\mathcal D_0$ by a null set, so the test identities coincide.)

**Two elementary computations.** $X$ $\mathcal D$-measurable $\Rightarrow$ $E[X\mid\mathcal D]=X$. $X$ independent of $\mathcal D$ $\Rightarrow$ $E[X\mid\mathcal D]=E[X]$.

**Lemma 3.15 (Freezing lemma).** Let $\mathcal G,\mathcal D\subset\mathcal F$ be independent $\sigma$-algebras, $X$ $\mathcal D$-measurable with values in $(E,\mathcal E)$, and $\psi:E\times\Omega\to\mathbb R$ $\mathcal E\otimes\mathcal G$-measurable with $\omega\mapsto\psi(X(\omega),\omega)$ integrable. Then
$$
E[\psi(X,\cdot)\mid\mathcal D]=\Phi(X),\qquad\Phi(x)=E[\psi(x,\cdot)].
$$
$\Phi$ need only be defined for $\mu_X$-a.e. $x$.

**Recipe ("freeze what you know, integrate what is independent").** To compute $E[f(B_s,B_t-B_s)\mid\mathcal F_s]$: replace $B_s$ by a constant $x$, compute $\Phi(x)=E[f(x,B_t-B_s)]$ using $B_t-B_s\sim N(0,t-s)$, then plug in $x=B_s$.

**Example 3.16 (Brownian transition expectations).** $B$ an $m$-dimensional $(\mathcal F_t)$-BM, $f$ bounded Borel, $s<t$:
$$
E[f(B_t)\mid\mathcal F_s]=\Phi(B_s)=E[f(B_t)\mid B_s],\qquad
\Phi(x)=E[f(x+B_t-B_s)]=\frac{1}{(2\pi(t-s))^{m/2}}\int_{\mathbb R^m}f(y)e^{-\frac{|y-x|^2}{2(t-s)}}\,dy .
$$
This is the Markov property of BM.

**Example 3.17 (BM at an independent random time).** $B$ $m$-dim BM, $\tau>0$ a.s. independent of $B$ with law $\mu$. Then $B_\tau$ has density and characteristic function
$$
g(x)=\int_0^\infty\frac{1}{(2\pi t)^{m/2}}e^{-\frac{|x|^2}{2t}}\,\mu(dt),\qquad
E[e^{i\langle\lambda,B_\tau\rangle}]=\int_0^\infty e^{-\frac12 t|\lambda|^2}\,\mu(dt).
$$

**Remark 3.18 (Time integrals).** If $X$ is measurable with $E[\int_0^T|X_t|\,dt]<\infty$, then
$$
E\Big[\int_0^T X_t\,dt\ \Big|\ \mathcal D\Big]=\int_0^T E[X_t\mid\mathcal D]\,dt,
$$
provided one uses a version of $t\mapsto E[X_t\mid\mathcal D]$ for which the integral makes sense and is $\mathcal D$-measurable (e.g. a continuous version). Versions chosen separately at each $t$ are not enough.

**Example 3.19.** For BM and $s\le t$: $E[B_u\mid\mathcal F_s]=B_{s\wedge u}$ and
$$
E\Big[\int_0^t B_u\,du\ \Big|\ \mathcal F_s\Big]=\int_0^s B_u\,du+(t-s)B_s .
$$

### 2.3 Conditional laws

**Definition 3.20 (Conditional law).** $Y$ with values in $(G,\mathcal G)$, $X$ in $(E,\mathcal E)$, $\mu_Y$ the law of $Y$. A family $(n(y,dx))_{y\in G}$ of probabilities on $E$ is a conditional law of $X$ given $Y$ if (i) $y\mapsto n(y,A)$ is $\mathcal G$-measurable for each $A\in\mathcal E$, and (ii) $P(X\in A,Y\in B)=\int_B n(y,A)\,\mu_Y(dy)$ for $A\in\mathcal E$, $B\in\mathcal G$.

Consequences: $E[f(X)\varphi(Y)]=\int_G\big(\int_E f(x)\,n(y,dx)\big)\varphi(y)\,\mu_Y(dy)$ and $E[f(X)\mid Y]=\int_E f(x)\,n(Y,dx)$ a.s. for bounded (or integrable) $f(X)$.

**Example 3.21 (Joint density).** If $(X,Y)$ has density $h(x,y)$, $h_Y(y)=\int h(x,y)\,dx$, $Q=\{h_Y=0\}$, then $P(Y\in Q)=0$ and $h(x;y)=h(x,y)/h_Y(y)$ for $y\notin Q$ (arbitrary fixed density for $y\in Q$) is a conditional density; $E[f(X)\mid Y=y]=\int f(x)h(x;y)\,dx$ for $\mu_Y$-a.e. $y$.

**Gaussian setting.** $(X,Y)\in\mathbb R^k\times\mathbb R^p$ jointly Gaussian with means $m_X,m_Y$, covariances $C_X,C_Y$, $C_{XY}=E[(X-m_X)(Y-m_Y)^*]=C_{YX}^*$, and $C_Y$ strictly positive definite. (The joint covariance may be singular.)

**Proposition 3.22 (Gaussian conditional distribution).** A conditional law of $X$ given $Y=y$ is
$$
N\big(m_X+C_{XY}C_Y^{-1}(y-m_Y),\ C_X-C_{XY}C_Y^{-1}C_{XY}^*\big),\qquad
E[X\mid Y]=m_X+C_{XY}C_Y^{-1}(Y-m_Y).
$$
With $A=C_{XY}C_Y^{-1}$, $X-AY$ and $Y$ are independent and the conditional law is the law of $Ay+(X-AY)$. Only the mean depends on $y$.

**Proposition 3.23 (Scalar case).** $X,Y$ jointly Gaussian real, $\operatorname{Var}(Y)>0$:
$$
E[X\mid Y]=m_X+\frac{\operatorname{Cov}(X,Y)}{\operatorname{Var}(Y)}(Y-m_Y),\qquad
\text{conditional variance}=\operatorname{Var}(X)-\frac{\operatorname{Cov}(X,Y)^2}{\operatorname{Var}(Y)}\le\operatorname{Var}(X).
$$

### 2.4 Martingales: definitions

**Definition 4.1.** Let $T\subset\mathbb R_+$. An adapted real process $M=(\Omega,\mathcal F,(\mathcal F_t)_{t\in T},(M_t)_{t\in T},P)$ with $M_t\in L^1$ for all $t$ is a **martingale** / **supermartingale** / **submartingale** if for all $s\le t$
$$
E[M_t\mid\mathcal F_s]=M_s\quad/\quad E[M_t\mid\mathcal F_s]\le M_s\quad/\quad E[M_t\mid\mathcal F_s]\ge M_s .
$$
No filtration specified = natural filtration.

> **Three things to check, always:** (1) adaptedness, (2) integrability of every $M_t$, (3) the conditional inequality/equality. Graders deduct for forgetting (1) or (2).

Mnemonic: a **super**martingale is a **super**-fair game for the house: it decreases on average. Expectations: martingale $E[M_t]$ constant; supermartingale non-increasing; submartingale non-decreasing.

**Example 4.2.** (a) Partial sums $Y_n=X_1+\dots+X_n$ of independent integrable centered r.v.'s, for $\mathcal F_n=\sigma(X_1,\dots,X_n)$. (b) $X_n=E[X\mid\mathcal F_n]$ for $X\in L^1$ (closed martingale; tower property). (c) BM $B$ is an $(\mathcal F_t)$-martingale.

**Linear combinations and convex transformations.**

- Linear combinations of martingales are martingales; nonnegative combinations of super- (sub-) martingales are super- (sub-) martingales; $M$ super $\iff$ $-M$ sub.
- If $\Phi(M_t)\in L^1$ for all $t$: $M$ martingale and $\Phi$ convex $\Rightarrow$ $\Phi(M)$ submartingale; $M$ submartingale and $\Phi$ convex **increasing** $\Rightarrow$ $\Phi(M)$ submartingale. (Proof: conditional Jensen: $E[\Phi(M_t)\mid\mathcal F_s]\ge\Phi(E[M_t\mid\mathcal F_s])$, which equals $\Phi(M_s)$, resp. is $\ge\Phi(M_s)$ because $\Phi$ is increasing.)
- In particular $|M|$, $M^+$, and (if $M\in L^p$) $|M|^p$ are submartingales when $M$ is a martingale.

**Definition 4.3.** $M$ is in $L^p$ if $M_t\in L^p$ for every $t$; square integrable if $p=2$. (Not the same as *bounded* in $L^p$, Definition 4.16.)

- $M$ martingale in $L^p$ ($p\ge1$) $\Rightarrow$ $|M|^p$ submartingale.
- For a general submartingale, $|M|$ and $M^2$ need not be submartingales. Counterexample: the deterministic increasing sequence $M_n=n-10$ is a submartingale, but $|M_n|$ and $M_n^2$ decrease for $n\le 10$.
- $M$ nonnegative square integrable submartingale $\Rightarrow$ $M^2$ submartingale ($x\mapsto x^2$ is convex and increasing on $[0,\infty)$).

### 2.5 Discrete time

**Definition 4.4.** $(A_n)_n$ is an **increasing predictable process** if $A_0=0$, $A_n\le A_{n+1}$ a.s., and $A_{n+1}$ is $\mathcal F_n$-measurable. For a submartingale $X$, $A_0=0$, $A_{n+1}=A_n+E[X_{n+1}\mid\mathcal F_n]-X_n$ defines one, i.e.
$$
A_n=\sum_{k=1}^n\big(E[X_k\mid\mathcal F_{k-1}]-X_{k-1}\big)=\sum_{k=1}^n E[X_k-X_{k-1}\mid\mathcal F_{k-1}] .
$$

**Theorem 4.5 (Doob decomposition).** Every submartingale has a unique decomposition $X_n=M_n+A_n$ with $M$ a martingale and $A$ increasing predictable. $A$ is the **compensator** of $X$. If $M$ is a square integrable martingale, the compensator of $M^2$ is the **associated increasing process** $\langle M\rangle$ of $M$, and
$$
\langle M\rangle_n=\sum_{k=1}^n E[(M_k-M_{k-1})^2\mid\mathcal F_{k-1}]
$$
(because $E[M_k^2-M_{k-1}^2\mid\mathcal F_{k-1}]=E[(M_k-M_{k-1})^2\mid\mathcal F_{k-1}]$, cross term vanishes by the martingale property).

**Stopping times and stopped processes.** $\tau:\Omega\to\mathbb N\cup\{\infty\}$ is a stopping time if $\{\tau\le n\}\in\mathcal F_n$ for all $n$ (equivalently $\{\tau=n\}\in\mathcal F_n$). $\mathcal F_\tau=\{A\in\mathcal F:A\cap\{\tau\le n\}\in\mathcal F_n\ \forall n\}$. If $X$ is adapted and $\tau<\infty$, then $X_\tau$ is $\mathcal F_\tau$-measurable; $\tau_1\le\tau_2$ implies $\mathcal F_{\tau_1}\subset\mathcal F_{\tau_2}$.
The stopped process is $X^\tau_n=X_{n\wedge\tau}$. **If $X$ is a martingale (super-, sub-), so is $X^\tau$, for the same filtration, with no boundedness assumption on $\tau$.**

**Theorem 4.6 (Stopping theorem).** $X$ supermartingale, $\tau_1\le\tau_2$ a.s. bounded stopping times. Then $X_{\tau_1},X_{\tau_2}\in L^1$ and $E[X_{\tau_2}\mid\mathcal F_{\tau_1}]\le X_{\tau_1}$.

**Corollary 4.7.** For a martingale and bounded $\tau_1\le\tau_2$: $E[X_{\tau_2}\mid\mathcal F_{\tau_1}]=X_{\tau_1}$. Boundedness cannot in general be replaced by a.s. finiteness.

**Remark 4.8.** For a martingale, $E[X_\tau]=E[X_0]$ for every bounded stopping time $\tau$. Conversely, an adapted integrable process with $E[X_\tau]=E[X_0]$ for all bounded stopping times is a martingale (Baldi Exercise 5.6).

**Theorem 4.9 (Maximal inequalities).** $X$ supermartingale, $\lambda>0$, $k\in\mathbb N$:
$$
\lambda P\Big(\sup_{0\le i\le k}X_i\ge\lambda\Big)\le E[X_0]+E[X_k^-],\qquad
\lambda P\Big(\inf_{0\le i\le k}X_i\le-\lambda\Big)\le-E\Big[X_k\mathbf 1_{\{\inf_{0\le i\le k}X_i\le-\lambda\}}\Big]\le E[|X_k|].
$$
Applied to the supermartingale $-|M|$ (or $-|M|^p$) for a martingale $M$: $\lambda P(\max_{i\le k}|M_i|\ge\lambda)\le E[|M_k|]$ and $\lambda^pP(\max_{i\le k}|M_i|\ge\lambda)\le E[|M_k|^p]$.

**Definition 4.10 (Upcrossings).** For $a<b$, $(X_n(\omega))$ makes an upcrossing of $[a,b]$ during $[i,j]$ if $X_i<a$, $X_j>b$, $X_m\le b$ for $i<m<j$. $\gamma^k_{a,b}(\omega)$ = number of completed upcrossings by time $k$.

**Proposition 4.11 (Upcrossing inequality).** $X$ supermartingale, $a<b$, $k\in\mathbb N$:
$$
(b-a)E[\gamma^k_{a,b}]\le E[(X_k-a)^-].
$$

**Theorem 4.12 (a.s. convergence).** $X$ supermartingale with $\sup_n E[X_n^-]<\infty$. Then $X_n$ converges a.s. to a finite limit.

**Corollary 4.13.** Every nonnegative supermartingale converges a.s. to a finite limit.

**Remark 4.14.** For a supermartingale, $\sup_nE[X_n^-]<\infty\iff\sup_nE[|X_n|]<\infty$. (Since $E[X_n]\le E[X_0]$: $E|X_n|=E[X_n]+2E[X_n^-]\le E[X_0]+2E[X_n^-]$.)

**Example 4.15 (Symmetric random walk exit).** $Z_n$ i.i.d. $\pm1$ w.p. $\frac12$, $X_n=Z_1+\dots+Z_n$, $\tau=\inf\{n:X_n\ge b\text{ or }X_n\le-a\}$ ($a,b$ positive integers). Then $X^\tau$ is a bounded martingale, $\tau<\infty$ a.s., $X_\tau\in\{-a,b\}$, $E[X_\tau]=0$ and
$$
P(X_\tau=b)=\frac{a}{a+b},\qquad P(X_\tau=-a)=\frac{b}{a+b}.
$$
(Solved in full in Exercise M5.)

**Stopping at unbounded times.** Apply the stopping theorem at $\tau\wedge n$ (bounded), then let $n\to\infty$ with a convergence theorem (dominated convergence if $X^\tau$ is bounded, monotone convergence for increasing quantities like $\tau\wedge n$, UI in general).

**Definition 4.16.** $M$ is bounded in $L^p$ if $\sup_nE[|M_n|^p]<\infty$.

**Theorem 4.17 (Doob's inequality).** $M$ martingale bounded in $L^p$, $p>1$, $M^*=\sup_n|M_n|$, $q=p/(p-1)$. Then $M^*\in L^p$ and $\|M^*\|_p\le q\sup_n\|M_n\|_p$.

**Lemma 4.18 (Finite horizon).** $X$ nonnegative submartingale, $p>1$, $n\in\mathbb N$:
$$
E\Big[\Big(\max_{0\le i\le n}X_i\Big)^p\Big]\le\Big(\frac{p}{p-1}\Big)^pE[X_n^p]
$$
(in the extended sense if the right side is infinite).

**Theorem 4.19 (Convergence in $L^p$).** For $p>1$, a martingale is bounded in $L^p$ iff it converges a.s. and in $L^p$ (to some $M_\infty\in L^p$). For $p=1$ this fails; one needs uniform integrability.

### 2.6 Uniform integrability

**Definition 4.20.** A family $\mathcal H$ of r.v.'s is uniformly integrable (UI) if
$$
\lim_{c\to+\infty}\sup_{Y\in\mathcal H}E\big[|Y|\mathbf 1_{\{|Y|>c\}}\big]=0 .
$$

**Example 4.21.** A single integrable r.v. is UI; a family dominated by one integrable $Z$ is UI.

**Theorem 4.22.** If $Y_n\to Y$ a.s., then [$Y\in L^1$ and $Y_n\to Y$ in $L^1$] $\iff$ $(Y_n)$ is UI. Every UI family is bounded in $L^1$.

**Proposition 4.23.** $\mathcal H$ is UI iff (a) $\sup_{Y\in\mathcal H}E|Y|<\infty$ and (b) for every $\varepsilon>0$ there is $\delta_\varepsilon>0$ with $E[|Y|\mathbf 1_A]\le\varepsilon$ for all $Y\in\mathcal H$ and all $A$ with $P(A)\le\delta_\varepsilon$.

**Proposition 4.24 (de la Vallee-Poussin).** $\mathcal H\subset L^1$ is UI iff there is a nonnegative increasing convex $g$ with $g(t)/t\to+\infty$ and $\sup_{Y\in\mathcal H}E[g(|Y|)]<\infty$. In particular, bounded in $L^p$ for some $p>1$ $\Rightarrow$ UI.
(Quick proof of the special case: $E[|Y|\mathbf 1_{\{|Y|>c\}}]\le E[|Y|^p]/c^{p-1}$.)

**Proposition 4.25.** For $Y\in L^1$, $\{E[Y\mid\mathcal G]:\mathcal G\subset\mathcal F\text{ sub-}\sigma\text{-algebra}\}$ is UI. In particular $(E[Y\mid\mathcal F_n])_n$ is a UI martingale.

**Theorem 4.26 (UI martingales).** For a martingale $(M_n)$ the following are equivalent: (a) $M_n$ converges in $L^1$; (b) $(M_n)$ is UI; (c) $M_n=E[Y\mid\mathcal F_n]$ for some $Y\in L^1$. Then $M_n$ also converges a.s.

**Proposition 4.27.** For $Y\in L^1$ and $\mathcal F_\infty=\sigma(\bigcup_n\mathcal F_n)$: $E[Y\mid\mathcal F_n]\to E[Y\mid\mathcal F_\infty]$ a.s. and in $L^1$.

### 2.7 Continuous time

For a supermartingale $M$ and deterministic $t_0<\dots<t_n$, $(M_{t_k})_k$ is a discrete supermartingale for $(\mathcal F_{t_k})_k$. Discrete results transfer under path regularity (right continuity), by taking finite sets increasing to a countable dense set.

**Theorem 4.28 (Maximal inequalities).** $M$ right- or left-continuous supermartingale, $T,\lambda>0$:
$$
\lambda P\Big(\sup_{0\le t\le T}M_t\ge\lambda\Big)\le E[M_0]+E[M_T^-],\qquad
\lambda P\Big(\inf_{0\le t\le T}M_t\le-\lambda\Big)\le-E\Big[M_T\mathbf 1_{\{\inf_{0\le t\le T}M_t\le-\lambda\}}\Big]\le E[|M_T|].
$$

**Theorem 4.29 (a.s. convergence).** $X$ right-continuous supermartingale, $[a,b[\subset\mathbb R_+$ ($b=+\infty$ allowed), $\sup_{t\in[a,b[}E[X_t^-]<\infty$ $\Rightarrow$ $\lim_{t\to b-}X_t$ exists a.s.

**Theorem 4.30 (UI, continuous time).** For a right-continuous martingale on $\mathbb R_+$, equivalent: (1) UI; (2) $M_t=E[Y\mid\mathcal F_t]$ for some $Y\in L^1$; (3) $M_t$ converges a.s. and in $L^1$ as $t\to\infty$.

**Example 4.31 (Exponential BM martingale).** $X_t=\exp(\lambda B_t-\frac{\lambda^2}{2}t)$ is a positive $(\mathcal F_t)$-martingale; $\lim_{t\to\infty}X_t$ exists a.s. and is finite (in fact $=0$ for $\lambda\ne0$); $X$ is not UI (for $\lambda\neq 0$). See Exercise M13.

**Theorem 4.32 (Doob's inequality).** $M$ right-continuous martingale bounded in $L^p$, $p>1$, $M^*=\sup_{t\ge0}|M_t|$: $M^*\in L^p$ and $\|M^*\|_p\le q\sup_t\|M_t\|_p$.

**Theorem 4.33 (Stopping theorem).** $M$ right-continuous martingale, $\tau_1\le\tau_2$ stopping times, $\tau_2$ a.s. bounded: $E[M_{\tau_2}\mid\mathcal F_{\tau_1}]=M_{\tau_1}$. Analogous for sub/supermartingales.

**Corollary 4.34.** $M$ right-continuous martingale, $\tau$ any stopping time $\Rightarrow$ $(M_{t\wedge\tau})_t$ is an $(\mathcal F_t)$-martingale.

**Example 4.35 (Brownian exit).** $\tau$ = exit time of $B$ from $]-a,b[$, $a,b>0$: $\tau<\infty$ a.s., $B_\tau\in\{-a,b\}$, $E[B_\tau]=0$, $P(B_\tau=-a)=\frac{b}{a+b}$, $P(B_\tau=b)=\frac{a}{a+b}$. (Also $E[\tau]=ab$; Exercise M6.)

**Theorem 4.36 (Right-continuous modification).** Under the standard hypotheses ($(\mathcal F_t)$ right-continuous and augmented by the null sets of $\mathcal F_\infty$), a supermartingale $M$ has a right-continuous modification iff $t\mapsto E[M_t]$ is right-continuous. (Baldi erroneously requires continuity.)

**Theorem 4.37 (Finite-variation martingales).** A square integrable continuous martingale with finite variation is a.s. constant: $P(M_t=M_0\ \forall t\ge0)=1$. Consequently a square integrable process with differentiable or locally Lipschitz paths is a martingale only if its paths are a.s. constant.

**Theorem 4.38 (Associated increasing process).** $M$ square integrable continuous martingale, $(\mathcal F_t)$ satisfying the usual conditions. There is a unique (up to indistinguishability) increasing continuous process $A$, $A_0=0$, such that $M_t^2-A_t$ is an $(\mathcal F_t)$-martingale. For partitions $\pi=\{0=t_0<\dots<t_m=t\}$,
$$
A_t=\lim_{|\pi|\to0}\sum_{k=0}^{m-1}(M_{t_{k+1}}-M_{t_k})^2\qquad\text{in probability}.
$$

**Definition 4.39.** $A=:\langle M\rangle$, the associated increasing process; $M^2-\langle M\rangle$ is a martingale. By the quadratic variation formula it does not depend on the filtration. It is the continuous-time analogue of the compensator of $M^2$.

**Remark 4.40.** For a stopping time $\tau$: $\langle M^\tau\rangle_t=\langle M\rangle_{t\wedge\tau}$.

**Example 4.41.** For BM, $\langle B\rangle_t=t$, so $B_t^2-t$ is a martingale.

**Theorem 4.42 (Characterization of BM).** Let $X$ be an $m$-dimensional continuous adapted process with $X_0=0$ a.s. such that for every $\lambda\in\mathbb R^m$
$$
Y_t=\exp\Big(i\langle\lambda,X_t\rangle+\frac12|\lambda|^2t\Big)
$$
is an $(\mathcal F_t)$-martingale. Then $X$ is an $(\mathcal F_t)$-Brownian motion.

> **About "Levy's characterization".** In other textbooks (and later in this course, via Ito's formula) Levy's theorem reads: *a continuous (local) martingale $X$ with $X_0=0$ and $\langle X\rangle_t=t$ (i.e. $X_t^2-t$ a (local) martingale) is a BM.* Theorem 4.42 is the version proved in Chapter 4; Ito's formula turns the condition $\langle X\rangle_t=t$ into the exponential martingale condition of Thm 4.42.

**Definition of an $(\mathcal F_t)$-BM (Definition 2.1 of the course).** $B$ is adapted, continuous, $B_0=0$ a.s., and for $s\le t$: $B_t-B_s$ is independent of $\mathcal F_s$ and $B_t-B_s\sim N(0,(t-s)I_m)$.

## 3. Theorems: statements (exam-ready)

This section collects the precise statements of every syllabus item that is S&P or P, in the form you should write them on the exam. (All (S) items are stated precisely in Section 2.)

**Def. and Thm 3.4.** Let $X$ be a real r.v. with $E[X^-]<\infty$ and $\mathcal D\subset\mathcal F$ a sub-$\sigma$-algebra. There exists a $\mathcal D$-measurable l.s.i. r.v. $Z$ with $\int_DZ\,dP=\int_DX\,dP$ for all $D\in\mathcal D$, and it is unique up to a.s. equality. If $X\in L^1$ then $Z\in L^1$. The class of such $Z$ is denoted $E[X\mid\mathcal D]$.

**Remark 3.5.** If $X\in L^1$ and $Z=E[X\mid\mathcal D]$, then $E[WX]=E[WZ]$ for every bounded $\mathcal D$-measurable $W$.

**Prop. 3.7 (d), (e), (f).** For $X\in L^1$: (d) if $Z$ is bounded and $\mathcal D$-measurable, $E[ZX\mid\mathcal D]=ZE[X\mid\mathcal D]$; (e) if $\mathcal D\subset\mathcal D'$, $E[E[X\mid\mathcal D']\mid\mathcal D]=E[X\mid\mathcal D]$; (f) if $X$ is independent of $\mathcal D$, $E[X\mid\mathcal D]=E[X]$.

**Example 3.16.** If $B$ is an $m$-dim $(\mathcal F_t)$-BM, $f$ bounded Borel and $s<t$, then $E[f(B_t)\mid\mathcal F_s]=E[f(B_t)\mid B_s]=\Phi(B_s)$ with $\Phi(x)=E[f(x+B_t-B_s)]$.

**Example 3.17.** If $\tau>0$ is independent of the $m$-dim BM $B$ with law $\mu$, then $B_\tau$ has density $g(x)=\int_0^\infty(2\pi t)^{-m/2}e^{-|x|^2/(2t)}\mu(dt)$ and characteristic function $\int_0^\infty e^{-t|\lambda|^2/2}\mu(dt)$.

**Thm 4.5 (Doob).** Let $(X_n)_{n\ge0}$ be an $(\mathcal F_n)$-submartingale. There exist a martingale $(M_n)$ and an increasing predictable process $(A_n)$ ($A_0=0$, $A_n\le A_{n+1}$, $A_{n+1}$ $\mathcal F_n$-measurable) such that $X_n=M_n+A_n$; the decomposition is unique (a.s.).

**Stopped martingale.** If $(X_n)$ is an $(\mathcal F_n)$-martingale (resp. super-, submartingale) and $\tau$ is any stopping time, then $X^\tau_n=X_{n\wedge\tau}$ is an $(\mathcal F_n)$-martingale (resp. super-, submartingale).

**Thm 4.6.** Let $(X_n)$ be an $(\mathcal F_n)$-supermartingale and $\tau_1\le\tau_2$ stopping times with $\tau_2\le K$ a.s. for some $K\in\mathbb N$. Then $X_{\tau_1},X_{\tau_2}\in L^1$ and $E[X_{\tau_2}\mid\mathcal F_{\tau_1}]\le X_{\tau_1}$ a.s. For martingales, equality.

**Baldi Ex. 5.1.** A supermartingale with $t\mapsto E[X_t]$ constant is a martingale.

**Baldi Ex. 5.6.** (a) If $s\le t$ and $A\in\mathcal F_s$, then $\tau=s\mathbf 1_A+t\mathbf 1_{A^c}$ is a stopping time. (b) An integrable right-continuous adapted process $X$ is a martingale iff $E[X_\tau]=E[X_0]$ for every bounded stopping time $\tau$.

**Thm 4.12.** Let $X$ be a supermartingale with $\sup_nE[X_n^-]<\infty$. Then $X_n\to X_\infty$ a.s. with $X_\infty$ finite a.s. (indeed $X_\infty\in L^1$).

**Thm 4.17.** Let $M$ be a martingale with $\sup_n\|M_n\|_p<\infty$, $p>1$. Then $M^*=\sup_n|M_n|\in L^p$ and $\|M^*\|_p\le\frac{p}{p-1}\sup_n\|M_n\|_p$.

**Thm 4.19.** Let $p>1$ and $M$ a martingale. Then $\sup_nE|M_n|^p<\infty$ iff there is $M_\infty\in L^p$ with $M_n\to M_\infty$ a.s. and in $L^p$.

**Thm 4.37.** Let $M$ be a continuous square integrable $(\mathcal F_t)$-martingale whose paths have finite variation on every bounded interval. Then $P(M_t=M_0\ \forall t\ge0)=1$.

**Thm 4.42.** As stated above.

## 4. Proofs

Each proof has: roadmap, full proof (following the lecturer's notes), what graders look for, and a memorize-this skeleton.

### 4.1 Definition and Theorem 3.4: existence and uniqueness of $E[X\mid\mathcal D]$ (P, notes)

**Proof roadmap.**

- Step 1: $X\ge0$ integrable: $Q(B)=\int_BX\,dP$ is a finite measure on $(\Omega,\mathcal D)$, $Q\ll P|_{\mathcal D}$; Radon-Nikodym gives $Z$.
- Step 2: $X\ge 0$ l.s.i. (possibly non-integrable): monotone limit of $E[X\wedge n\mid\mathcal D]$.
- Step 3: general l.s.i. $X$: $E[X^+\mid\mathcal D]-E[X^-\mid\mathcal D]$, no $\infty-\infty$ since $X^-\in L^1$.
- Step 4: uniqueness: test on $B=\{Z_1>Z_2\}\in\mathcal D$.

**Proof.**

*Existence, $X\ge0$ integrable.* On the measurable space $(\Omega,\mathcal D)$ define
$$
Q(B)=\int_BX\,dP,\qquad B\in\mathcal D .
$$
$Q$ is a finite positive measure ($\sigma$-additivity by monotone convergence, $Q(\Omega)=E[X]<\infty$), and $Q\ll P|_{\mathcal D}$: if $B\in\mathcal D$ and $P(B)=0$ then $Q(B)=0$. By the Radon-Nikodym theorem applied on $(\Omega,\mathcal D)$ there exists a $\mathcal D$-measurable $Z\ge0$ with
$$
Q(B)=\int_BZ\,dP\qquad\forall B\in\mathcal D,
$$
i.e. $\int_BZ\,dP=\int_BX\,dP$ for all $B\in\mathcal D$, so $Z\in E[X\mid\mathcal D]$. Since $Q$ is finite, $E[Z]=Q(\Omega)<\infty$, so $Z$ is integrable. (Note that it is essential that the density is taken w.r.t. $P$ restricted to $\mathcal D$: this is what makes $Z$ $\mathcal D$-measurable. $X$ itself is a density of $Q$ w.r.t. $P$ on $\mathcal F$, but it is not $\mathcal D$-measurable.)

*Existence, $X\ge0$ not integrable.* Let $Z_n$ be a version of $E[X\wedge n\mid\mathcal D]$. By positivity (if $Y_1\le Y_2$ then $E[Y_1\mid\mathcal D]\le E[Y_2\mid\mathcal D]$, see the uniqueness argument) $Z_n$ is a.s. increasing; put $Z=\lim_nZ_n\in[0,\infty]$, $\mathcal D$-measurable. For $D\in\mathcal D$, by monotone convergence twice,
$$
\int_DZ\,dP=\lim_n\int_DZ_n\,dP=\lim_n\int_DX\wedge n\,dP=\int_DX\,dP .
$$

*Existence, general l.s.i. $X$.* Write $X=X^+-X^-$ and set
$$
E[X\mid\mathcal D]:=E[X^+\mid\mathcal D]-E[X^-\mid\mathcal D].
$$
Since $X^-$ is integrable, $E[X^-\mid\mathcal D]$ is integrable and a.s. finite, so $\infty-\infty$ cannot occur; the difference is $\mathcal D$-measurable, l.s.i. (its negative part is at most $E[X^-\mid\mathcal D]\in L^1$), and for $D\in\mathcal D$
$$
\int_D\big(E[X^+\mid\mathcal D]-E[X^-\mid\mathcal D]\big)dP=\int_DX^+dP-\int_DX^-dP=\int_DX\,dP ,
$$
where the subtraction is legitimate because the second integral is finite. If $X\in L^1$, both pieces are integrable, so is $Z$.

*Uniqueness, $X$ integrable.* Let $Z_1,Z_2\in E[X\mid\mathcal D]$ (both integrable). The event $B=\{Z_1>Z_2\}$ is in $\mathcal D$, and
$$
\int_B(Z_1-Z_2)\,dP=\int_BX\,dP-\int_BX\,dP=0 .
$$
Since $Z_1-Z_2>0$ on $B$, this forces $P(B)=0$, i.e. $Z_2\ge Z_1$ a.s. By symmetry $Z_1=Z_2$ a.s.

*Uniqueness, $X$ only l.s.i.* (Approximate $B$ by sets where the integrals are finite.) Let $B_n=\{Z_1>Z_2,\ Z_2\le n\}\in\mathcal D$. Then $\int_{B_n}Z_2\,dP\in(-\infty,n]$ is finite (the lower bound because $Z_2^-\in L^1$), hence $\int_{B_n}Z_1\,dP=\int_{B_n}X\,dP=\int_{B_n}Z_2\,dP$ is finite too, and $\int_{B_n}(Z_1-Z_2)\,dP=0$ with a strictly positive integrand: $P(B_n)=0$. Since $\{Z_1>Z_2\}\subset\{Z_2<\infty\}=\bigcup_n\{Z_2\le n\}$, we get $P(Z_1>Z_2)=0$, and by symmetry $Z_1=Z_2$ a.s.

Integrability bound (bonus): if $X\in L^1$ and $Z=E[X\mid\mathcal D]$ then, with $D=\{Z>0\}\in\mathcal D$,
$$
E|Z|=\int_DZ-\int_{D^c}Z=\int_DX-\int_{D^c}X\le E|X| .
$$
$\square$

**What graders look for / pitfalls.**

- Radon-Nikodym must be applied on $(\Omega,\mathcal D)$, not on $(\Omega,\mathcal F)$; say explicitly why $Q\ll P$ on $\mathcal D$.
- Say why there is no $\infty-\infty$ in the general case ($X^-\in L^1$).
- In uniqueness, the set $\{Z_1>Z_2\}$ must be shown to be in $\mathcal D$ (both are $\mathcal D$-measurable).
- For non-integrable $X\ge 0$ the measure $Q$ need not be $\sigma$-finite; use truncation $X\wedge n$ (or say "assume integrable" if the question allows it).

**Memorize-this skeleton.** $X\ge0$: $Q(B)=\int_BX\,dP$ on $\mathcal D$, $Q\ll P$, RN $\Rightarrow$ $Z=dQ/dP|_{\mathcal D}$. General: $E[X^+\mid\mathcal D]-E[X^-\mid\mathcal D]$. Uniqueness: $B=\{Z_1>Z_2\}\in\mathcal D$, $\int_B(Z_1-Z_2)=0\Rightarrow P(B)=0$.

### 4.2 Remark 3.5: testing against bounded $\mathcal D$-measurable $W$ (P, notes)

**Proof roadmap.**

- Step 1: State the monotone class theorem (Baldi Thm 1.4).
- Step 2: $\mathcal H=\{W$ bounded $\mathcal D$-measurable$:E[WX]=E[WZ]\}$ is a vector space containing $1$ and $\mathbf 1_D$, $D\in\mathcal D$.
- Step 3: $\mathcal H$ is stable under bounded increasing limits (dominated convergence).
- Step 4: conclude $\mathcal H$ = all bounded $\mathcal D$-measurable r.v.'s.

**Monotone class theorem (Baldi Thm 1.4).** Let $\mathcal C$ be a class of subsets of $E$ stable under finite intersections and $\mathcal H$ a vector space of bounded functions with: (i) if $(f_n)\subset\mathcal H$ is increasing and all $f_n\le g$ for some $g\in\mathcal H$, then $\sup_nf_n\in\mathcal H$; (ii) $1\in\mathcal H$ and $\mathbf 1_C\in\mathcal H$ for $C\in\mathcal C$. Then $\mathcal H$ contains every bounded $\sigma(\mathcal C)$-measurable function.

**Proof.** Let $X\in L^1$, $Z=E[X\mid\mathcal D]$ (integrable by Thm 3.4). Let $\mathcal H$ be the set of bounded $\mathcal D$-measurable $W$ with $E[WX]=E[WZ]$. By linearity of the expectation (all products are integrable as $W$ is bounded and $X,Z\in L^1$), $\mathcal H$ is a vector space. Take $\mathcal C=\mathcal D$ (stable under intersections, $\sigma(\mathcal C)=\mathcal D$). By definition of conditional expectation, $E[\mathbf 1_DX]=E[\mathbf 1_DZ]$ for $D\in\mathcal D$, and $1=\mathbf 1_\Omega$; so (ii) holds.

For (i): let $W_n\in\mathcal H$ be increasing with $W_n\le W^*\in\mathcal H$ and $W_n\uparrow W$. Then $W_1\le W_n\le W^*$, so $|W_n|\le|W_1|+|W^*|\le c$ for a constant $c$; $W$ is bounded and $\mathcal D$-measurable, and $|W_nX|\le c|X|\in L^1$, $|W_nZ|\le c|Z|\in L^1$. Dominated convergence gives
$$
E[WX]=\lim_nE[W_nX]=\lim_nE[W_nZ]=E[WZ],
$$
so $W\in\mathcal H$. The monotone class theorem yields that $\mathcal H$ contains all bounded $\mathcal D$-measurable r.v.'s. $\square$

For l.s.i. $X$ and $W\ge0$ bounded, use simple functions $W_n\uparrow W$ and monotone convergence (applied separately to $X^+$ and $X^-$).

**Remark 3.6** is proved the same way with $\mathcal C$ the given $\pi$-system: if $E[Z\mathbf 1_C]=E[X\mathbf 1_C]$ for all $C\in\mathcal C$, the monotone class theorem gives $E[ZW]=E[XW]$ for all bounded $\sigma(\mathcal C)$-measurable $W$, in particular for $W=\mathbf 1_D$, $D\in\mathcal D$.

**What graders look for.** State the monotone class theorem with its hypotheses; check the domination for DCT; note that $\mathcal H$ is a vector space because $X,Z\in L^1$.

**Skeleton.** $\mathcal H=\{W:E[WX]=E[WZ]\}$; contains $\mathbf 1_D$ (definition), closed under bounded monotone limits (DCT) $\Rightarrow$ monotone class $\Rightarrow$ all bounded $\mathcal D$-measurable $W$.

### 4.3 Proposition 3.7 (d), (e), (f) (P, notes)

**Proof roadmap.** For each property: name the candidate, check it is integrable and $\mathcal D$-measurable, and verify the test identity $E[W\cdot\text{candidate}]=E[W\cdot\text{target}]$ for bounded $\mathcal D$-measurable $W$ (Remark 3.5).

**Proof of (d).** Candidate: $ZE[X\mid\mathcal D]$. It is $\mathcal D$-measurable (product of $\mathcal D$-measurable r.v.'s) and integrable ($|Z|\le c$ and $E[X\mid\mathcal D]\in L^1$). For $W$ bounded $\mathcal D$-measurable, $WZ$ is bounded and $\mathcal D$-measurable, so by Remark 3.5
$$
E\big[W\,ZE[X\mid\mathcal D]\big]=E\big[(WZ)\,E[X\mid\mathcal D]\big]=E[(WZ)X]=E[W\,(ZX)] .
$$
Hence $ZE[X\mid\mathcal D]=E[ZX\mid\mathcal D]$. $\square$

**Proof of (e).** Candidate: $E[X\mid\mathcal D]$, which is $\mathcal D$-measurable and integrable. For $W$ bounded $\mathcal D$-measurable: since $\mathcal D\subset\mathcal D'$, $W$ is also bounded and $\mathcal D'$-measurable, so
$$
E\big[W\,E[X\mid\mathcal D']\big]\overset{(d)}{=}E\big[E[WX\mid\mathcal D']\big]\overset{(c)}{=}E[WX]\overset{(c)}{=}E\big[E[WX\mid\mathcal D]\big]\overset{(d)}{=}E\big[W\,E[X\mid\mathcal D]\big].
$$
So $E[X\mid\mathcal D]$ satisfies the defining property of $E\big[E[X\mid\mathcal D']\,\big|\,\mathcal D\big]$. $\square$

(Equivalently, by Remark 3.5 directly: $E[WE[X\mid\mathcal D']]=E[WX]=E[WE[X\mid\mathcal D]]$.)

**Proof of (f).** Candidate: the constant $E[X]$, measurable w.r.t. the trivial $\sigma$-algebra $\{\emptyset,\Omega\}\subset\mathcal D$, hence $\mathcal D$-measurable, and integrable. If $W$ is bounded $\mathcal D$-measurable, then $W$ is independent of $X$, so
$$
E[WX]=E[W]E[X]=E\big[W\,E[X]\big].
$$
$\square$

**Proofs of (a), (b), (c) (bonus, one line each).** (a): $\alpha E[X_1\mid\mathcal D]+\beta E[X_2\mid\mathcal D]$ is $\mathcal D$-measurable, integrable and satisfies the test identity by linearity of the integral. (b): $B=\{E[X\mid\mathcal D]<0\}\in\mathcal D$, $0\ge\int_BE[X\mid\mathcal D]\,dP=\int_BX\,dP\ge0$, so $P(B)=0$. (c): take $D=\Omega$.

**Pitfalls.** In (d), $WZ$ must be bounded for Remark 3.5: this is why $Z$ is assumed bounded. In (e) the tower property goes "small $\sigma$-algebra wins"; $E[E[X\mid\mathcal D]\mid\mathcal D']=E[X\mid\mathcal D]$ also holds (trivially, as $E[X\mid\mathcal D]$ is $\mathcal D'$-measurable). In (f), say that $W$ is independent of $X$ because $W$ is $\mathcal D$-measurable.

**Skeleton.** Candidate $\to$ measurable + integrable $\to$ $E[W\cdot]$ test with Remark 3.5. (d): $WZ$ is a test function. (e): $W$ is $\mathcal D'$-measurable, so both sides equal $E[WX]$. (f): independence factorizes $E[WX]$.

### 4.4 Example 3.16: Brownian transition expectations and Markov property (P, notes)

**Proof roadmap.**

- Step 1: Write $f(B_t)=f(B_s+(B_t-B_s))$; $B_s$ is $\mathcal F_s$-measurable, $B_t-B_s$ is independent of $\mathcal F_s$.
- Step 2: Freezing lemma with $\psi(x,\omega)=f(x+B_t(\omega)-B_s(\omega))$.
- Step 3: $\Phi(B_s)$ is $\sigma(B_s)$-measurable; tower property gives $E[f(B_t)\mid B_s]=\Phi(B_s)$.
- Step 4: compute $\Phi$ from the Gaussian density.

**Proof.** Let $\mathcal G=\sigma(B_t-B_s)$, which is independent of $\mathcal D=\mathcal F_s$ (definition of $(\mathcal F_t)$-BM). Define $\psi(x,\omega)=f(x+B_t(\omega)-B_s(\omega))$, $x\in\mathbb R^m$; $\psi$ is $\mathcal B(\mathbb R^m)\otimes\mathcal G$-measurable (composition of the Borel $f$ with the measurable map $(x,\omega)\mapsto x+B_t(\omega)-B_s(\omega)$) and bounded. $B_s$ is $\mathcal F_s$-measurable. The freezing lemma gives
$$
E[f(B_t)\mid\mathcal F_s]=E[\psi(B_s,\cdot)\mid\mathcal F_s]=\Phi(B_s),\qquad\Phi(x)=E[\psi(x,\cdot)]=E[f(x+B_t-B_s)] .
$$
Since $\Phi(B_s)$ is $\sigma(B_s)$-measurable and $\sigma(B_s)\subset\mathcal F_s$,
$$
E[f(B_t)\mid B_s]\overset{3.7(e)}{=}E\big[E[f(B_t)\mid\mathcal F_s]\,\big|\,B_s\big]=E[\Phi(B_s)\mid B_s]=\Phi(B_s) .
$$
So $E[f(B_t)\mid\mathcal F_s]=E[f(B_t)\mid B_s]$: the conditional law of the future given the whole past depends only on the present (Markov property). Finally $x+B_t-B_s\sim N(x,(t-s)I_m)$, hence
$$
\Phi(x)=\frac{1}{(2\pi(t-s))^{m/2}}\int_{\mathbb R^m}f(y)\exp\Big(-\frac{|y-x|^2}{2(t-s)}\Big)dy .
$$
$\square$

**Pitfalls.** Do not write "$E[f(B_t)\mid\mathcal F_s]=E[f(B_t)]$": $B_t$ is *not* independent of $\mathcal F_s$, only the increment is. The freezing lemma requires the frozen variable to be $\mathcal D$-measurable and the remaining randomness to be independent of $\mathcal D$; state both.

**Skeleton.** $f(B_t)=f(B_s+\Delta)$, $\Delta\perp\mathcal F_s$ $\Rightarrow$ freeze $B_s=x$, $\Phi(x)=E f(x+\Delta)$ $\Rightarrow$ $\Phi(B_s)$; tower for $\sigma(B_s)$.

### 4.5 Example 3.17: BM at an independent random time (P, notes)

**Proof roadmap.**

- Step 1: $P(B_\tau\in A)=E[E[\mathbf 1_A(B_\tau)\mid\sigma(\tau)]]$.
- Step 2: freezing lemma with $\mathcal D=\sigma(\tau)$, $\mathcal G=\mathcal F^B_\infty$, $\psi(t,\omega)=\mathbf 1_A(B_t(\omega))$.
- Step 3: integrate $\Phi(\tau)$ w.r.t. the law $\mu$ of $\tau$; Fubini swaps the integrals and exhibits the density.
- Step 4: same with $\psi(t,\omega)=e^{i\langle\theta,B_t(\omega)\rangle}$ for the characteristic function.

**Proof.** $\sigma(\tau)$ is independent of $\mathcal G=\sigma(B_u,u\ge0)$. The map $\psi(t,\omega)=\mathbf 1_A(B_t(\omega))$ is $\mathcal B(\mathbb R_+)\otimes\mathcal G$-measurable (because $(t,\omega)\mapsto B_t(\omega)$ is jointly measurable, BM being continuous), bounded, and $\mathbf 1_A(B_{\tau(\omega)}(\omega))=\psi(\tau(\omega),\omega)$. For $A\in\mathcal B(\mathbb R^m)$, the freezing lemma gives
$$
E[\mathbf 1_A(B_\tau)\mid\sigma(\tau)]=\Phi(\tau),\qquad
\Phi(t)=E[\mathbf 1_A(B_t)]=\int_A\frac{1}{(2\pi t)^{m/2}}e^{-\frac{|x|^2}{2t}}\,dx .
$$
Taking expectations and using Fubini (nonnegative integrand),
$$
P(B_\tau\in A)=E[\Phi(\tau)]=\int_0^\infty\Phi(t)\,\mu(dt)=\int_0^\infty\int_A\frac{e^{-\frac{|x|^2}{2t}}}{(2\pi t)^{m/2}}\,dx\,\mu(dt)=\int_A\underbrace{\int_0^\infty\frac{e^{-\frac{|x|^2}{2t}}}{(2\pi t)^{m/2}}\,\mu(dt)}_{=g(x)}\,dx .
$$
As this holds for all Borel $A$, $g$ is the density of $B_\tau$. Similarly with $\psi(t,\omega)=e^{i\langle\theta,B_t(\omega)\rangle}$ (apply the lemma to real and imaginary parts): $\Phi(t)=E[e^{i\langle\theta,B_t\rangle}]=e^{-\frac t2|\theta|^2}$ and
$$
E[e^{i\langle\theta,B_\tau\rangle}]=E[\Phi(\tau)]=\int_0^\infty e^{-\frac t2|\theta|^2}\,\mu(dt).
$$
$\square$

**Pitfalls.** $\tau$ must be independent of the whole path of $B$ (not a stopping time of $B$!). For a hitting time of $B$ the formula is false (e.g. $B_{\tau_a}=a$). Justify Fubini (nonnegativity).

**Skeleton.** Condition on $\sigma(\tau)$, freeze $\tau=t$: $\Phi(t)=P(B_t\in A)$; integrate in $\mu(dt)$; Fubini.

### 4.6 Example 3.19 and Remark 3.18 (bonus: short and examinable)

**Claim.** $E[\int_0^tB_u\,du\mid\mathcal F_s]=\int_0^sB_u\,du+(t-s)B_s$, $s\le t$.

**Proof.** $E[B_u\mid\mathcal F_s]=B_u$ for $u\le s$ (measurable) and $=B_s$ for $u>s$ (Example 3.13); so $u\mapsto B_{s\wedge u}$ is a continuous version. The candidate $Z=\int_0^tB_{s\wedge u}\,du=\int_0^sB_u\,du+(t-s)B_s$ is $\mathcal F_s$-measurable (Riemann sums of $\mathcal F_s$-measurable r.v.'s) and integrable. For bounded $\mathcal F_s$-measurable $W$, by Fubini (justified by $E\int_0^t|WB_u|\,du\le\|W\|_\infty\int_0^t\sqrt u\,du<\infty$):
$$
E\Big[W\int_0^tB_u\,du\Big]=\int_0^tE[WB_u]\,du=\int_0^tE[WB_{s\wedge u}]\,du=E\Big[W\int_0^tB_{s\wedge u}\,du\Big]. \qquad\square
$$

### 4.7 Proposition 3.22: Gaussian conditioning (bonus proof, statement is S)

**Proof.** Put $A=C_{XY}C_Y^{-1}$. $(X-AY,Y)$ is a linear image of $(X,Y)$, hence jointly Gaussian, and
$$
\operatorname{Cov}(X-AY,Y)=C_{XY}-AC_Y=0,
$$
so $X-AY$ and $Y$ are independent. Write $X=AY+(X-AY)$ and apply the freezing lemma with $\psi(y,\omega)=f(Ay+(X-AY)(\omega))$: $E[f(X)\mid Y]=\Phi(Y)$, $\Phi(y)=E[f(Ay+X-AY)]$. Hence the conditional law given $Y=y$ is the law of $Ay+(X-AY)$, which is Gaussian with mean $Ay+m_X-Am_Y$ and covariance
$$
\operatorname{Cov}(X-AY)=C_X-AC_{YX}-C_{XY}A^*+AC_YA^*=C_X-C_{XY}C_Y^{-1}C_{YX}. \qquad\square
$$

### 4.8 Theorem 4.5: Doob decomposition (S&P)

**Proof roadmap.**

- Step 1 (existence): define $A_0=0$, $A_{n+1}=A_n+E[X_{n+1}\mid\mathcal F_n]-X_n$; increasing by the submartingale property, predictable by construction.
- Step 2: $M=X-A$ is a martingale, since $A_{n+1}$ is $\mathcal F_n$-measurable.
- Step 3 (uniqueness): for two decompositions, condition $A'_{n+1}-A'_n=X_{n+1}-X_n-(M'_{n+1}-M'_n)$ on $\mathcal F_n$; induction from $A_0=A'_0=0$.

**Proof.** *Existence.* Let $X$ be an $(\mathcal F_n)$-submartingale and define
$$
A_0=0,\qquad A_{n+1}=A_n+E[X_{n+1}\mid\mathcal F_n]-X_n .
$$
By induction $A_{n+1}$ is $\mathcal F_n$-measurable ($A_n$ is $\mathcal F_{n-1}\subset\mathcal F_n$-measurable, $E[X_{n+1}\mid\mathcal F_n]$ and $X_n$ are $\mathcal F_n$-measurable) and integrable. Since $X$ is a submartingale, $E[X_{n+1}\mid\mathcal F_n]-X_n\ge0$, so $A_{n+1}\ge A_n$. Thus $A$ is an increasing predictable process. Put $M_n=X_n-A_n$ (adapted, integrable). Because $A_{n+1}$ is $\mathcal F_n$-measurable,
$$
E[M_{n+1}\mid\mathcal F_n]=E[X_{n+1}\mid\mathcal F_n]-A_{n+1}=E[X_{n+1}\mid\mathcal F_n]-A_n-E[X_{n+1}\mid\mathcal F_n]+X_n=X_n-A_n=M_n .
$$
So $M$ is a martingale and $X_n=M_n+A_n$. (One-step martingale property implies the multi-step one by the tower property.)

*Uniqueness.* Let $X_n=M'_n+A'_n$ be another such decomposition. Then
$$
A'_{n+1}-A'_n=X_{n+1}-X_n-(M'_{n+1}-M'_n).
$$
Take $E[\,\cdot\mid\mathcal F_n]$: the left side is $\mathcal F_n$-measurable (predictability), and $E[M'_{n+1}-M'_n\mid\mathcal F_n]=0$, so
$$
A'_{n+1}-A'_n=E[X_{n+1}\mid\mathcal F_n]-X_n=A_{n+1}-A_n .
$$
Since $A_0=A'_0=0$, induction gives $A'_n=A_n$ for all $n$, and then $M'_n=X_n-A'_n=M_n$. $\square$

**Remarks.**

- The same proof shows: any *integrable adapted* process has a unique decomposition martingale + predictable process with $A_0=0$ ($A$ increasing iff $X$ is a submartingale; decreasing iff supermartingale).
- For $X=M^2$, $M$ a square integrable martingale: $A_{n+1}-A_n=E[M_{n+1}^2\mid\mathcal F_n]-M_n^2=E[(M_{n+1}-M_n)^2\mid\mathcal F_n]$.

**What graders look for / pitfalls.**

- Predictability means $A_{n+1}$ is $\mathcal F_n$-measurable (not $\mathcal F_{n+1}$). Without predictability, uniqueness fails. Example: $X_n=\xi_1+\dots+\xi_n$ with $\xi_k$ i.i.d. Bernoulli$(p)$. Then $X=0+X$ (constant martingale $0$, increasing *adapted* $A=X$), and also $X_n=(X_n-np)+np$ (Doob: martingale plus predictable $A_n=np$).
- In the uniqueness step, you must use that $A'_{n+1}-A'_n$ is $\mathcal F_n$-measurable to pull it out of the conditional expectation.
- Check integrability of $A_n$ and $M_n$.

**Memorize-this skeleton.** $A_{n+1}-A_n:=E[X_{n+1}\mid\mathcal F_n]-X_n\ge0$; $E[X_{n+1}-A_{n+1}\mid\mathcal F_n]=X_n-A_n$. Uniqueness: condition the increment identity on $\mathcal F_n$, induction from $0$.

### 4.9 The stopped martingale is a martingale (P)

**Proof roadmap.**

- Step 1: $X^\tau_{n+1}-X^\tau_n=(X_{n+1}-X_n)\mathbf 1_{\{\tau\ge n+1\}}$.
- Step 2: $\{\tau\ge n+1\}=\{\tau\le n\}^c\in\mathcal F_n$.
- Step 3: take it out of the conditional expectation. Check adaptedness and integrability.

**Proof.** Let $X$ be an $(\mathcal F_n)$-martingale and $\tau$ a stopping time (possibly taking the value $+\infty$). 

*Adapted and integrable.* $X^\tau_n=X_{n\wedge\tau}=\sum_{k=0}^{n-1}X_k\mathbf 1_{\{\tau=k\}}+X_n\mathbf 1_{\{\tau\ge n\}}$; each term is $\mathcal F_n$-measurable (as $\{\tau=k\}\in\mathcal F_k\subset\mathcal F_n$ and $\{\tau\ge n\}=\{\tau\le n-1\}^c\in\mathcal F_{n-1}$), and $|X^\tau_n|\le\sum_{k=0}^n|X_k|\in L^1$.

*Martingale property.* On $\{\tau\le n\}$ we have $X^\tau_{n+1}=X_\tau=X^\tau_n$, while on $\{\tau\ge n+1\}$ we have $X^\tau_{n+1}=X_{n+1}$ and $X^\tau_n=X_n$. Hence
$$
X^\tau_{n+1}-X^\tau_n=(X^\tau_{n+1}-X^\tau_n)\mathbf 1_{\{\tau\le n\}}+(X^\tau_{n+1}-X^\tau_n)\mathbf 1_{\{\tau\ge n+1\}}=(X_{n+1}-X_n)\mathbf 1_{\{\tau\ge n+1\}} .
$$
Since $\{\tau\ge n+1\}=\{\tau\le n\}^c\in\mathcal F_n$, by Prop. 3.7(d),
$$
E[X^\tau_{n+1}-X^\tau_n\mid\mathcal F_n]=\mathbf 1_{\{\tau\ge n+1\}}E[X_{n+1}-X_n\mid\mathcal F_n]=0 .
$$
So $E[X^\tau_{n+1}\mid\mathcal F_n]=X^\tau_n$, and by the tower property $E[X^\tau_m\mid\mathcal F_n]=X^\tau_n$ for all $m\ge n$. $\square$

For a supermartingale (submartingale) the last display is $\le0$ ($\ge0$) since $\mathbf 1_{\{\tau\ge n+1\}}\ge0$, so stopping preserves these properties.

**Alternative viewpoint (martingale transform).** $X^\tau_n=X_0+\sum_{k=1}^nH_k(X_k-X_{k-1})$ with $H_k=\mathbf 1_{\{\tau\ge k\}}$ bounded predictable; a martingale transform by a bounded predictable process is a martingale.

**Pitfalls.** Forgetting that $\{\tau\ge n+1\}$ is $\mathcal F_n$-measurable (this is exactly where "stopping time" is used). No boundedness of $\tau$ is needed here; boundedness is needed for $E[X_\tau]=E[X_0]$.

**Skeleton.** $\Delta X^\tau_{n+1}=\mathbf 1_{\{\tau>n\}}\Delta X_{n+1}$, $\{\tau>n\}\in\mathcal F_n$, so $E[\Delta X^\tau_{n+1}\mid\mathcal F_n]=\mathbf 1_{\{\tau>n\}}E[\Delta X_{n+1}\mid\mathcal F_n]=0$.

### 4.10 Theorem 4.6: Stopping theorem / Doob's optional sampling (S&P)

**Proof roadmap.**

- Step 1: integrability: $|X_{\tau_i}|\le\sum_{j=0}^K|X_j|$.
- Step 2: special case $\tau_2\equiv K$: for $A\in\mathcal F_{\tau_1}$ split along $\{\tau_1=j\}$ and use $E[X_K\mid\mathcal F_j]\le X_j$.
- Step 3: deduce $E[X_K\mid\mathcal F_{\tau_1}]\le X_{\tau_1}$ from the integral inequality.
- Step 4: general $\tau_2\le K$: apply Step 2 to the stopped supermartingale $X^{\tau_2}$ and the times $\tau_1\le K$.

**Proof.** Let $X$ be a supermartingale, $E[X_{n+1}\mid\mathcal F_n]\le X_n$, and let $K\in\mathbb N$ with $\tau_1\le\tau_2\le K$.

*Integrability.* For $i=1,2$,
$$
|X_{\tau_i}|=\Big|\sum_{j=0}^KX_j\mathbf 1_{\{\tau_i=j\}}\Big|\le\sum_{j=0}^K|X_j|\in L^1 .
$$
Also $X_{\tau_1}$ is $\mathcal F_{\tau_1}$-measurable.

*Case $\tau_2\equiv K$.* Let $A\in\mathcal F_{\tau_1}$. Then $A\cap\{\tau_1=j\}\in\mathcal F_j$ for each $j\le K$. By the supermartingale property, $E[X_K\mid\mathcal F_j]\le X_j$, so
$$
E\big[X_{\tau_1}\mathbf 1_{A\cap\{\tau_1=j\}}\big]=E\big[X_j\mathbf 1_{A\cap\{\tau_1=j\}}\big]\ge E\big[E[X_K\mid\mathcal F_j]\mathbf 1_{A\cap\{\tau_1=j\}}\big]=E\big[X_K\mathbf 1_{A\cap\{\tau_1=j\}}\big] .
$$
Summing over $0\le j\le K$:
$$
E[X_{\tau_1}\mathbf 1_A]=\sum_{j=0}^KE\big[X_j\mathbf 1_{A\cap\{\tau_1=j\}}\big]\ge\sum_{j=0}^KE\big[X_K\mathbf 1_{A\cap\{\tau_1=j\}}\big]=E[X_K\mathbf 1_A]=E[X_{\tau_2}\mathbf 1_A].
$$
Let $Z=E[X_{\tau_2}\mid\mathcal F_{\tau_1}]$. Then $E[Z\mathbf 1_A]=E[X_{\tau_2}\mathbf 1_A]\le E[X_{\tau_1}\mathbf 1_A]$ for every $A\in\mathcal F_{\tau_1}$; choosing $A=\{Z>X_{\tau_1}\}\in\mathcal F_{\tau_1}$ gives $E[(Z-X_{\tau_1})\mathbf 1_A]\le0$ with a positive integrand on $A$, so $P(A)=0$:
$$
E[X_{\tau_2}\mid\mathcal F_{\tau_1}]\le X_{\tau_1} .
$$

*General case.* Let $\tau_2$ be any stopping time with values in $\{0,\dots,K\}$. The stopped process $X^{\tau_2}$ is a supermartingale for $(\mathcal F_n)$ (Section 4.9). Apply the case just proved to $X^{\tau_2}$ with the stopping times $\tau_1\le K$:
$$
E[X^{\tau_2}_K\mid\mathcal F_{\tau_1}]\le X^{\tau_2}_{\tau_1}.
$$
Now $X^{\tau_2}_K=X_{\tau_2\wedge K}=X_{\tau_2}$ and $X^{\tau_2}_{\tau_1}=X_{\tau_2\wedge\tau_1}=X_{\tau_1}$ since $\tau_1\le\tau_2$. Hence $E[X_{\tau_2}\mid\mathcal F_{\tau_1}]\le X_{\tau_1}$. $\square$

**Corollary 4.7.** If $X$ is a martingale, apply the theorem to $X$ and $-X$ (both supermartingales): equality.

**Remark 4.8.** With $\tau_1=0$: $E[X_{\tau}]=E[E[X_\tau\mid\mathcal F_0]]=E[X_0]$ for a martingale and bounded $\tau$.

**Why boundedness matters (counterexample).** Symmetric random walk $X_n$ from $0$, $\tau=\inf\{n:X_n=1\}$: $\tau<\infty$ a.s. (recurrence, or Exercise M5 with $a\to\infty$), but $E[X_\tau]=1\ne0=E[X_0]$.

**What graders look for / pitfalls.**

- Integrability of $X_{\tau_i}$ (uses boundedness).
- $A\cap\{\tau_1=j\}\in\mathcal F_j$ is precisely the definition of $\mathcal F_{\tau_1}$; say it.
- The direction of the inequality: for a supermartingale, the *later* time has the *smaller* conditional expectation.
- The reduction step uses that $X^{\tau_2}$ is a supermartingale and that $X^{\tau_2}_{\tau_1}=X_{\tau_1}$ (needs $\tau_1\le\tau_2$).

**Memorize-this skeleton.** (1) $|X_{\tau}|\le\sum_{j\le K}|X_j|$. (2) $\tau_2=K$: $E[X_{\tau_1}\mathbf 1_{A\cap\{\tau_1=j\}}]=E[X_j\mathbf 1_{\dots}]\ge E[X_K\mathbf 1_{\dots}]$, sum over $j$. (3) General: apply (2) to $X^{\tau_2}$ at times $\tau_1\le K$.

### 4.11 Baldi Exercise 5.1: supermartingale with constant expectation is a martingale (syllabus exercise)

**Statement.** Let $(\Omega,\mathcal F,(\mathcal F_t)_t,(X_t)_t,P)$ be a supermartingale with $E[X_t]=c$ for all $t$. Then $X$ is a martingale.

**Strategy.** A nonnegative r.v. with zero mean is $0$ a.s.

**Solution.** Fix $s<t$. By the supermartingale property, $U:=X_s-E[X_t\mid\mathcal F_s]\ge0$ a.s. Moreover $U$ is integrable and, by Prop. 3.7(c),
$$
E[U]=E[X_s]-E\big[E[X_t\mid\mathcal F_s]\big]=E[X_s]-E[X_t]=c-c=0 .
$$
A nonnegative r.v. with expectation $0$ vanishes a.s. (if $P(U>0)>0$, then $P(U>1/n)>0$ for some $n$ and $E[U]\ge P(U>1/n)/n>0$). Hence $E[X_t\mid\mathcal F_s]=X_s$ a.s. for every $s<t$; adaptedness and integrability are part of the supermartingale hypothesis. $\square$

The same argument shows: a submartingale with constant expectation is a martingale. More generally, a supermartingale $X$ with $E[X_T]=E[X_0]$ for some $T$ is a martingale on $[0,T]$ (since $t\mapsto E[X_t]$ is non-increasing, it is then constant on $[0,T]$).

**Pitfalls.** It is not enough to say "the expectations are equal hence the conditional expectations are equal": you need the sign of $U$.

### 4.12 Baldi Exercise 5.6: martingales via bounded stopping times (syllabus exercise)

**Statement.** (a) Let $(\mathcal F_t)_t$ be a filtration, $s\le t$ and $A\in\mathcal F_s$. Then $\tau=s$ on $A$, $\tau=t$ on $A^c$, is a stopping time. (b) An integrable right-continuous adapted process $X=(\Omega,\mathcal F,(\mathcal F_t),(X_t),P)$ is a martingale iff $E[X_\tau]=E[X_0]$ for every bounded stopping time $\tau$.

**Strategy.** (a) Compute $\{\tau\le u\}$ for all $u$. (b) "$\Rightarrow$": stopping theorem (Thm 4.33) with $\tau_1=0$. "$\Leftarrow$": compare the two-valued time of (a) with the constant time $t$.

**Solution.**

(a) For $u\ge0$:
$$
\{\tau\le u\}=\begin{cases}\emptyset,& u<s,\\ A,& s\le u<t,\\ \Omega,& u\ge t.\end{cases}
$$
In the middle case $A\in\mathcal F_s\subset\mathcal F_u$. So $\{\tau\le u\}\in\mathcal F_u$ for all $u$, i.e. $\tau$ is a stopping time (bounded by $t$).

(b) "$\Rightarrow$". Let $X$ be a right-continuous martingale and $\tau\le K$ a bounded stopping time. By the stopping theorem in continuous time (Thm 4.33) with $\tau_1=0\le\tau_2=\tau$: $E[X_\tau\mid\mathcal F_0]=X_0$; taking expectations, $E[X_\tau]=E[X_0]$. (Here right continuity is used.)

"$\Leftarrow$". Assume $E[X_\tau]=E[X_0]$ for all bounded stopping times. We must show $E[X_t\mathbf 1_A]=E[X_s\mathbf 1_A]$ for all $s<t$, $A\in\mathcal F_s$ (this is the martingale property, since $X_s$ is $\mathcal F_s$-measurable and integrable). Fix such $s,t,A$ and let $\tau=s\mathbf 1_A+t\mathbf 1_{A^c}$, a bounded stopping time by (a); also the constant $t$ is a bounded stopping time. Since $X_\tau=X_s\mathbf 1_A+X_t\mathbf 1_{A^c}$,
$$
E[X_s\mathbf 1_A]+E[X_t\mathbf 1_{A^c}]=E[X_\tau]=E[X_0]=E[X_t]=E[X_t\mathbf 1_A]+E[X_t\mathbf 1_{A^c}] .
$$
Subtracting the finite quantity $E[X_t\mathbf 1_{A^c}]$ gives $E[X_s\mathbf 1_A]=E[X_t\mathbf 1_A]$, i.e. $E[X_t\mid\mathcal F_s]=X_s$. $\square$

**Discrete-time version (Remark 4.8).** An adapted integrable $(X_n)$ with $E[X_\tau]=E[X_0]$ for all bounded stopping times is a martingale: take $A\in\mathcal F_n$, $\tau=n\mathbf 1_A+(n+1)\mathbf 1_{A^c}$ and compare with $\tau\equiv n+1$; you get $E[X_n\mathbf 1_A]=E[X_{n+1}\mathbf 1_A]$.

**Pitfalls.** In "$\Leftarrow$" right continuity is not needed; in "$\Rightarrow$" it is (for Thm 4.33). Do not forget to verify that $\tau$ in (a) is a stopping time for *every* $u$, including $u<s$ and $u\ge t$.

**Skeleton.** $\tau=s$ on $A$, $t$ on $A^c$; $E[X_\tau]=E[X_t]$ $\Rightarrow$ $E[X_s\mathbf 1_A]=E[X_t\mathbf 1_A]$.

### 4.13 Proposition 4.11: upcrossing inequality (statement S; proof in notes, recommended for understanding Thm 4.12)

**Proof (notes).** Fix $a<b$, $k$. Define the bounded stopping times
$$
\begin{aligned}
\tau_1&=\inf\{i\le k:X_i<a\},\qquad \tau_2=\inf\{i:\tau_1<i\le k,\ X_i>b\},\\
\tau_{2m-1}&=\inf\{i:\tau_{2m-2}<i\le k,\ X_i<a\},\qquad \tau_{2m}=\inf\{i:\tau_{2m-1}<i\le k,\ X_i>b\},
\end{aligned}
$$
with $\tau_i=k$ if the set is empty. Then $\tau_1\le\tau_2\le\dots\le k$. Let
$$
\Omega_{2m}=\{\tau_{2m}\le k,\ X_{\tau_{2m}}>b\}=\{\gamma^k_{a,b}\ge m\},\qquad\Omega_{2m-1}=\{\gamma^k_{a,b}\ge m-1,\ X_{\tau_{2m-1}}<a\}.
$$
$\Omega_i\in\mathcal F_{\tau_i}$ and $\Omega_{2m}\subset\Omega_{2m-1}$. On $\Omega_{2m-1}$, $X_{\tau_{2m-1}}<a$; on $\Omega_{2m}$, $X_{\tau_{2m}}>b$; on $\Omega_{2m-1}\setminus\Omega_{2m}$, $\tau_{2m}=k$. By Theorem 4.6 for $\tau_{2m-1}\le\tau_{2m}\le k$ and $\Omega_{2m-1}\in\mathcal F_{\tau_{2m-1}}$:
$$
0\ge E\big[\mathbf 1_{\Omega_{2m-1}}(X_{\tau_{2m-1}}-a)\big]\ge E\big[\mathbf 1_{\Omega_{2m-1}}(X_{\tau_{2m}}-a)\big]\ge(b-a)P(\Omega_{2m})+E\big[\mathbf 1_{\Omega_{2m-1}\setminus\Omega_{2m}}(X_k-a)\big].
$$
Hence $(b-a)P(\gamma^k_{a,b}\ge m)\le E[\mathbf 1_{\Omega_{2m-1}\setminus\Omega_{2m}}(X_k-a)^-]$. Summing over $m\ge1$, using $E[\gamma]=\sum_{m\ge1}P(\gamma\ge m)$ for $\mathbb N$-valued $\gamma$ and that the sets $\Omega_{2m-1}\setminus\Omega_{2m}$ are pairwise disjoint:
$$
(b-a)E[\gamma^k_{a,b}]\le E\Big[\mathbf 1_{\bigcup_m\Omega_{2m-1}\setminus\Omega_{2m}}(X_k-a)^-\Big]\le E[(X_k-a)^-]. \qquad\square
$$

### 4.14 Theorem 4.12: a.s. convergence of supermartingales (S&P)

**Proof roadmap.**

- Step 1: $\gamma_{a,b}=\lim_k\gamma^k_{a,b}$ (total upcrossings); monotone convergence + Prop. 4.11 give $E[\gamma_{a,b}]\le(a^++\sup_nE[X_n^-])/(b-a)<\infty$, so $\gamma_{a,b}<\infty$ a.s.
- Step 2: one null set $N$ for all rational $a<b$.
- Step 3: if the limit does not exist at $\omega\notin N$, pick rationals between $\liminf$ and $\limsup$: infinitely many upcrossings, contradiction. So the limit exists in $[-\infty,+\infty]$.
- Step 4: the limit is finite (Fatou + Remark 4.14).

**Proof.** For $a<b$ let $\gamma_{a,b}(\omega)$ be the total number of upcrossings of $[a,b]$ by the path $(X_n(\omega))_n$; $\gamma^k_{a,b}\uparrow\gamma_{a,b}$ as $k\to\infty$. Since $(x-a)^-\le a^++x^-$, monotone convergence and Prop. 4.11 give
$$
E[\gamma_{a,b}]=\lim_{k\to\infty}E[\gamma^k_{a,b}]\le\frac{1}{b-a}\sup_{n\ge0}E[(X_n-a)^-]\le\frac{1}{b-a}\Big(a^++\sup_{n\ge0}E[X_n^-]\Big)<+\infty .
$$
In particular $\gamma_{a,b}<\infty$ a.s.: there is $N_{a,b}$ with $P(N_{a,b})=0$ and $\gamma_{a,b}<\infty$ off $N_{a,b}$. Let
$$
N=\bigcup_{a,b\in\mathbb Q,\ a<b}N_{a,b},
$$
a countable union, so $P(N)=0$, and $\gamma_{a,b}(\omega)<\infty$ for all rational $a<b$ and all $\omega\in N^c$.

Suppose that for some $\omega\in N^c$ the limit $\lim_nX_n(\omega)$ does not exist (in $[-\infty,+\infty]$). Then
$$
\liminf_{n\to\infty}X_n(\omega)<\limsup_{n\to\infty}X_n(\omega).
$$
Choose rationals $\alpha<\beta$ with $\liminf_nX_n(\omega)<\alpha<\beta<\limsup_nX_n(\omega)$. Then $X_n(\omega)<\alpha$ for infinitely many $n$ and $X_n(\omega)>\beta$ for infinitely many $n$, so the path makes infinitely many upcrossings of $[\alpha,\beta]$: $\gamma_{\alpha,\beta}(\omega)=+\infty$, impossible for $\omega\in N^c$. Hence $X_\infty=\lim_nX_n$ exists a.s. in $[-\infty,+\infty]$.

*Finiteness.* By Remark 4.14, $\sup_nE|X_n|\le E[X_0]+2\sup_nE[X_n^-]<\infty$. By Fatou,
$$
E[|X_\infty|]=E\big[\liminf_n|X_n|\big]\le\liminf_nE[|X_n|]\le\sup_nE[|X_n|]<\infty,
$$
so $|X_\infty|<\infty$ a.s. (and $X_\infty\in L^1$). $\square$

(The notes argue finiteness via $E[\gamma_{a,b}]\to0$ as $b\to\infty$; the Fatou argument above is cleaner and fully rigorous, use it.)

**Corollary 4.13.** If $X\ge0$, then $X_n^-=0$, the hypothesis holds trivially.

**What graders look for / pitfalls.**

- The bound $(X_k-a)^-\le a^++X_k^-$ and the passage $k\to\infty$ by monotone convergence.
- The countable union over **rational** pairs (an uncountable union of null sets need not be null).
- The distinction between "limit exists in $[-\infty,\infty]$" and "limit is finite": the second step needs $L^1$-boundedness.
- Not claiming $L^1$ convergence: that needs UI (Thm 4.26). Counterexample: double-or-nothing martingale (Exercise M10).

**Memorize-this skeleton.** $E\gamma_{a,b}\le\frac{a^++\sup E X_n^-}{b-a}<\infty$ $\Rightarrow$ $\gamma_{a,b}<\infty$ for all rational $a<b$ a.s. $\Rightarrow$ $\liminf=\limsup$ $\Rightarrow$ Fatou: $E|X_\infty|\le\sup E|X_n|<\infty$.

### 4.15 Lemma 4.18: finite horizon Doob inequality (statement S; proof in notes, needed for Thm 4.17)

**Proof roadmap.**

- Step 1: $Y=\max_{0\le i\le n}X_i$; $\tau_\lambda$ = first time $X_i>\lambda$; $\{Y>\lambda\}=\bigcup_k\{\tau_\lambda=k\}$ disjointly.
- Step 2: $Y^p=p\int_0^\infty\lambda^{p-1}\mathbf 1_{\{Y>\lambda\}}d\lambda$.
- Step 3: $\lambda\mathbf 1_{\{\tau_\lambda=k\}}\le X_k\mathbf 1_{\{\tau_\lambda=k\}}$ and submartingale $\Rightarrow$ $\lambda P(Y>\lambda)\le E[X_n\mathbf 1_{\{Y>\lambda\}}]$.
- Step 4: Fubini $\Rightarrow$ $E[Y^p]\le q\,E[X_nY^{p-1}]$; Hölder; divide.

**Proof.** Let $X\ge0$ be a submartingale, $p>1$, $q=p/(p-1)$. If $E[X_n^p]=\infty$ there is nothing to prove, so assume $X_n\in L^p$. Then every $X_i$, $i\le n$, is in $L^p$: $0\le X_i\le E[X_n\mid\mathcal F_i]$, so by conditional Jensen $X_i^p\le E[X_n\mid\mathcal F_i]^p\le E[X_n^p\mid\mathcal F_i]$ and $E[X_i^p]\le E[X_n^p]$. Let $Y=\max_{0\le i\le n}X_i$; then $E[Y^p]\le\sum_{i=0}^nE[X_i^p]<\infty$.

For $\lambda>0$ let $\tau_\lambda=\inf\{i:0\le i\le n,\ X_i>\lambda\}$ ($=n+1$ if the set is empty). Then
$$
\sum_{k=0}^n\mathbf 1_{\{\tau_\lambda=k\}}=\mathbf 1_{\{Y>\lambda\}},
$$
and, for every $p>1$,
$$
Y^p=p\int_0^Y\lambda^{p-1}d\lambda=p\int_0^{\infty}\lambda^{p-1}\mathbf 1_{\{Y>\lambda\}}\,d\lambda=p\int_0^\infty\lambda^{p-1}\sum_{k=0}^n\mathbf 1_{\{\tau_\lambda=k\}}\,d\lambda .
$$
Since $X_k>\lambda$ on $\{\tau_\lambda=k\}$,
$$
\lambda^{p-1}\sum_{k=0}^n\mathbf 1_{\{\tau_\lambda=k\}}\le\lambda^{p-2}\sum_{k=0}^nX_k\mathbf 1_{\{\tau_\lambda=k\}} .
$$
As $\{\tau_\lambda=k\}\in\mathcal F_k$ and $X$ is a submartingale, $E[X_n\mathbf 1_{\{\tau_\lambda=k\}}\mid\mathcal F_k]=\mathbf 1_{\{\tau_\lambda=k\}}E[X_n\mid\mathcal F_k]\ge X_k\mathbf 1_{\{\tau_\lambda=k\}}$, hence $E[X_k\mathbf 1_{\{\tau_\lambda=k\}}]\le E[X_n\mathbf 1_{\{\tau_\lambda=k\}}]$ and
$$
E\Big[\lambda^{p-1}\sum_{k=0}^n\mathbf 1_{\{\tau_\lambda=k\}}\Big]\le E\Big[\lambda^{p-2}X_n\sum_{k=0}^n\mathbf 1_{\{\tau_\lambda=k\}}\Big]=\lambda^{p-2}E\big[X_n\mathbf 1_{\{Y>\lambda\}}\big].
$$
Integrating in $\lambda$ and using Fubini (everything is nonnegative):
$$
\frac1pE[Y^p]\le E\Big[X_n\int_0^\infty\lambda^{p-2}\mathbf 1_{\{Y>\lambda\}}\,d\lambda\Big]=E\Big[X_n\int_0^Y\lambda^{p-2}d\lambda\Big]=\frac{1}{p-1}E[X_nY^{p-1}] .
$$
By Hölder with exponents $p$ and $q$ (note $(p-1)q=p$):
$$
E[Y^p]\le\frac{p}{p-1}E[X_n^p]^{1/p}E[Y^p]^{(p-1)/p}.
$$
If $E[Y^p]=0$ the claim is trivial; otherwise divide by the finite positive number $E[Y^p]^{(p-1)/p}$:
$$
E[Y^p]^{1/p}\le\frac{p}{p-1}E[X_n^p]^{1/p},\qquad\text{i.e.}\qquad E\Big[\max_{0\le i\le n}X_i^p\Big]\le\Big(\frac{p}{p-1}\Big)^pE[X_n^p]. \qquad\square
$$

**Pitfalls.** You may divide only by a *finite* nonzero quantity: this is why $E[Y^p]<\infty$ must be checked first. The submartingale inequality is used in the form $E[X_k\mathbf 1_F]\le E[X_n\mathbf 1_F]$ for $F\in\mathcal F_k$.

### 4.16 Theorem 4.17: Doob's inequality (S&P)

**Proof roadmap.**

- Step 1: $|M|$ is a nonnegative submartingale (Jensen), in $L^p$.
- Step 2: apply Lemma 4.18 for fixed $n$.
- Step 3: $n\mapsto\|M_n\|_p$ is non-decreasing; let $n\to\infty$ by monotone convergence.

**Proof.** Let $M$ be a martingale bounded in $L^p$, $p>1$. Then $X_i:=|M_i|$ is a nonnegative submartingale ($x\mapsto|x|$ convex, conditional Jensen; $|M_i|\in L^p\subset L^1$). Lemma 4.18 gives, for every $n$,
$$
\Big\|\max_{0\le i\le n}|M_i|\Big\|_p\le q\|M_n\|_p=q\max_{k\le n}\|M_k\|_p\le q\sup_k\|M_k\|_p,
$$
where we used that $k\mapsto\|M_k\|_p$ is non-decreasing because $|M|^p$ is a submartingale ($E|M_k|^p\le E|M_{k+1}|^p$). As $n\to\infty$, $\max_{0\le i\le n}|M_i|\uparrow M^*=\sup_n|M_n|$, so by monotone convergence
$$
\|M^*\|_p=\lim_{n\to\infty}\Big\|\max_{0\le i\le n}|M_i|\Big\|_p\le q\sup_n\|M_n\|_p<\infty .
$$
In particular $M^*\in L^p$. $\square$

**What graders look for.** That $|M|$ is a nonnegative submartingale (cite Jensen and integrability); the monotonicity of $\|M_k\|_p$ (or simply bound $\|M_n\|_p\le\sup_k\|M_k\|_p$, which suffices); monotone convergence for the passage to $M^*$. For a full answer, also prove Lemma 4.18 (Section 4.15) if time permits: many graders will consider the lemma the real content.

**Failure for $p=1$.** For the double-or-nothing martingale (Exercise M10), $\sup_nE|M_n|=1$ but $E[M^*]=\infty$.

**Skeleton.** $|M|$ nonneg. submart. $\Rightarrow$ Lemma 4.18: $\|\max_{i\le n}|M_i|\|_p\le q\|M_n\|_p\le q\sup\|M_k\|_p$ $\Rightarrow$ MCT.

### 4.17 Theorem 4.19: convergence in $L^p$, $p>1$ (S&P)

**Proof roadmap.**

- ($\Leftarrow$) Triangle inequality: $\|M_n\|_p\le\|M_n-M_\infty\|_p+\|M_\infty\|_p$.
- ($\Rightarrow$) Step 1: bounded in $L^p$ $\Rightarrow$ $\sup E[M_n^-]\le E[M^*]<\infty$ $\Rightarrow$ a.s. convergence (Thm 4.12).
- Step 2: $|M_\infty|\le M^*\in L^p$ (Doob).
- Step 3: $|M_n-M_\infty|^p\le2^p(M^*)^p$, dominated convergence.

**Proof.** ($\Leftarrow$) Suppose $M_n\to M_\infty$ in $L^p$ with $M_\infty\in L^p$. Choose $n_0$ with $\|M_n-M_\infty\|_p\le1$ for $n>n_0$. Then for $n>n_0$, by Minkowski,
$$
\|M_n\|_p\le\|M_n-M_\infty\|_p+\|M_\infty\|_p\le1+\|M_\infty\|_p,
$$
and for $n\le n_0$, $\|M_n\|_p=\|E[M_{n_0}\mid\mathcal F_n]\|_p\le\|M_{n_0}\|_p<\infty$ (contraction, Remark 3.10). Thus $\sup_n\|M_n\|_p\le\max(\|M_0\|_p,\dots,\|M_{n_0}\|_p,1+\|M_\infty\|_p)<\infty$.

($\Rightarrow$) Suppose $\sup_n\|M_n\|_p<\infty$. Then $\sup_nM_n^-\le\sup_n|M_n|=M^*$, and by Doob's inequality (Thm 4.17) $M^*\in L^p\subset L^1$, so
$$
\sup_nE[M_n^-]\le E[M^*]<\infty .
$$
By Theorem 4.12 (a martingale is a supermartingale), $M_n\to M_\infty$ a.s. Moreover $|M_\infty|=\lim|M_n|\le M^*$, so $M_\infty\in L^p$. For the $L^p$ convergence, $|M_n-M_\infty|^p\to0$ a.s., and using $|x+y|^p\le2^{p-1}(|x|^p+|y|^p)$ (convexity of $|\cdot|^p$),
$$
|M_n-M_\infty|^p\le2^{p-1}\big(|M_n|^p+|M_\infty|^p\big)\le2^p(M^*)^p\in L^1 .
$$
Dominated convergence gives $E[|M_n-M_\infty|^p]\to0$. $\square$

**Complement.** Then $M_n=E[M_\infty\mid\mathcal F_n]$: for $A\in\mathcal F_n$ and $m\ge n$, $E[M_n\mathbf 1_A]=E[M_m\mathbf 1_A]\to E[M_\infty\mathbf 1_A]$ ($L^p$ hence $L^1$ convergence).

**What graders look for / pitfalls.**

- The domination by $(M^*)^p$ is the key: without Doob, a.s. convergence + $L^p$-boundedness gives only $L^r$ convergence for $r<p$.
- For $p=1$ the statement is false (bounded in $L^1$ does not give $L^1$ convergence; need UI).
- Do not forget to show $M_\infty\in L^p$.

**Skeleton.** ($\Leftarrow$) Minkowski. ($\Rightarrow$) $E M_n^-\le E M^*<\infty$ $\Rightarrow$ Thm 4.12 a.s.; $|M_n-M_\infty|^p\le2^p(M^*)^p$, Doob + DCT.

### 4.18 Theorem 4.37: continuous martingales of finite variation are constant (S&P, bounded variation case)

**Proof roadmap.**

- Step 0: replace $M$ by $M-M_0$; assume $M_0=0$.
- Step 1: orthogonality of increments: $E[M_t^2]=\sum_iE[(M_{t_{i+1}}-M_{t_i})^2]$.
- Step 2: $\sum(\Delta M)^2\le\max|\Delta M|\cdot\sum|\Delta M|\le K\max_i|\Delta M_i|$.
- Step 3: continuity + DCT as $|\pi|\to0$: $E[M_t^2]=0$.
- Step 4: rationals + continuity give $P(M_t=0\ \forall t)=1$. (General case: localize with $\tau_K=\inf\{s:V_s\ge K\}$.)

**Proof.** *Reduction.* $M'_t=M_t-M_0$ is again a continuous square integrable martingale with finite variation, and $M$ is constant iff $M'\equiv0$. So assume $M_0=0$.

*Bounded variation case.* Fix $T>0$ and assume that the variation on $[0,T]$ is bounded by a constant:
$$
V_T(\omega)=\sup_\pi\sum_{i=0}^{n-1}|M_{t_{i+1}}(\omega)-M_{t_i}(\omega)|\le K\qquad\forall\omega,
$$
the supremum over partitions $\pi$ of $[0,T]$. Fix $t\le T$ and a partition $\pi=\{0=t_0<t_1<\dots<t_n=t\}$ of $[0,t]$, $|\pi|=\max_i(t_{i+1}-t_i)$. By the martingale property and square integrability,
$$
E[M_{t_{i+1}}M_{t_i}]=E\big[E[M_{t_{i+1}}\mid\mathcal F_{t_i}]M_{t_i}\big]=E[M_{t_i}^2],
$$
so
$$
E[(M_{t_{i+1}}-M_{t_i})^2]=E[M_{t_{i+1}}^2]-2E[M_{t_{i+1}}M_{t_i}]+E[M_{t_i}^2]=E[M_{t_{i+1}}^2]-E[M_{t_i}^2].
$$
Telescoping, with $M_0=0$:
$$
E[M_t^2]=\sum_{i=0}^{n-1}\big(E[M_{t_{i+1}}^2]-E[M_{t_i}^2]\big)=\sum_{i=0}^{n-1}E[(M_{t_{i+1}}-M_{t_i})^2].
$$
Since $(M_{t_{i+1}}-M_{t_i})^2\le|M_{t_{i+1}}-M_{t_i}|\max_{0\le j\le n-1}|M_{t_{j+1}}-M_{t_j}|$,
$$
E[M_t^2]\le E\Big[\max_{0\le j\le n-1}|M_{t_{j+1}}-M_{t_j}|\sum_{i=0}^{n-1}|M_{t_{i+1}}-M_{t_i}|\Big]\le E\Big[V_T\max_j|M_{t_{j+1}}-M_{t_j}|\Big]\le K\,E\Big[\max_j|M_{t_{j+1}}-M_{t_j}|\Big].
$$
Now let $(\pi_k)$ be partitions of $[0,t]$ with $|\pi_k|\to0$. Each path $s\mapsto M_s(\omega)$ is continuous, hence uniformly continuous on $[0,t]$, so $\max_j|M_{t_{j+1}}-M_{t_j}|\to0$ for every $\omega$; also $\max_j|M_{t_{j+1}}-M_{t_j}|\le V_T\le K$. By dominated convergence the right side tends to $0$, so $E[M_t^2]=0$ and $M_t=0$ a.s.

Since $t\in[0,T]$ was arbitrary, $P(M_q=0\ \forall q\in\mathbb Q\cap[0,T])=1$ (countable intersection), and by continuity of paths $P(M_t=0\ \forall t\in[0,T])=1$. Letting $T\to\infty$ along integers gives the claim. $\square$

*General finite variation case (sketch, notes).* Let $V_t=\sup_\pi\sum|M_{t_{i+1}}-M_{t_i}|$ over partitions of $[0,t]$. $V$ is adapted (limit of $\mathcal F_t$-measurable r.v.'s along refining dyadic partitions) and continuous (since $M$ is continuous). For $K>0$, $\tau_K=\inf\{s\ge0:V_s\ge K\}$ is a stopping time; the stopped martingale $M^{\tau_K}_t=M_{t\wedge\tau_K}$ is a continuous martingale (Cor. 4.34), with variation $V_{t\wedge\tau_K}\le K$, and $|M^{\tau_K}_t|\le V_{t\wedge\tau_K}\le K$ so it is bounded, in particular square integrable. By the bounded case $M^{\tau_K}\equiv0$, i.e. $M_t=0$ for $t\le\tau_K$. As $V_T<\infty$ a.s., $\{V_T<K\}\uparrow\Omega$ as $K\to\infty$, and on $\{V_T<K\}$ we have $\tau_K>T$. Hence $M\equiv0$ on $[0,T]$ a.s. for every $T$.

**What graders look for / pitfalls.**

- Explicit use of the martingale property to kill the cross term (orthogonality of increments); this needs square integrability.
- The domination $\max_j|\Delta M_j|\le V_T\le K$ for DCT, and uniform continuity of the path.
- From "$M_t=0$ a.s. for each $t$" to "$P(M_t=0\ \forall t)=1$": rationals + continuity.
- Do not confuse with the quadratic variation: the proof shows $\sum(\Delta M)^2\to0$, i.e. $\langle M\rangle\equiv0$.

**Consequence.** BM does not have finite variation paths (otherwise it would be constant). Similarly $\int_0^tB_s\,ds$ (differentiable paths, nonconstant) is not a martingale.

**Memorize-this skeleton.** $M_0=0$; $E M_t^2=\sum E(\Delta_iM)^2\le E[\max|\Delta M|\cdot V]\le K E\max|\Delta M|\to0$ (continuity, DCT); rationals + continuity.

### 4.19 Theorem 4.42: characterization of Brownian motion (S&P)

**Proof roadmap.**

- Step 1: martingale relation $\Rightarrow$ $E[e^{i\langle\lambda,X_t-X_s\rangle}\mid\mathcal F_s]=e^{-\frac12|\lambda|^2(t-s)}$.
- Step 2: take expectations: $X_t-X_s\sim N(0,(t-s)I)$.
- Step 3: Baldi Ex. 4.5: a conditional characteristic function that is deterministic implies independence: $X_t-X_s\perp\mathcal F_s$.
- Step 4: check Definition 2.1.

**Proof.** Fix $\lambda\in\mathbb R^m$ and $s<t$. $Y^\lambda_t=\exp(i\langle\lambda,X_t\rangle+\frac12|\lambda|^2t)$ satisfies $|Y^\lambda_t|=e^{\frac12|\lambda|^2t}$, so it is bounded for fixed $t$. (Conditional expectations of complex r.v.'s are taken on real and imaginary parts separately; all properties of Prop. 3.7 extend by linearity, including taking out bounded complex measurable factors.) The martingale relation reads
$$
E\Big[\exp\Big(i\langle\lambda,X_t\rangle+\frac12|\lambda|^2t\Big)\Big|\mathcal F_s\Big]=\exp\Big(i\langle\lambda,X_s\rangle+\frac12|\lambda|^2s\Big).
$$
Multiply both sides by the bounded $\mathcal F_s$-measurable factor $\exp(-i\langle\lambda,X_s\rangle-\frac12|\lambda|^2t)$ (here $X_s$ is $\mathcal F_s$-measurable because $X$ is adapted) and take it inside (Prop. 3.7(d)):
$$
E\big[e^{i\langle\lambda,X_t-X_s\rangle}\,\big|\,\mathcal F_s\big]=e^{-\frac12|\lambda|^2(t-s)}\qquad\forall\lambda\in\mathbb R^m .
$$
(Call this identity (4.8).) Taking expectations in (4.8): $E[e^{i\langle\lambda,X_t-X_s\rangle}]=e^{-\frac12|\lambda|^2(t-s)}$ for all $\lambda$, the characteristic function of $N(0,(t-s)I_m)$; by uniqueness of characteristic functions $X_t-X_s\sim N(0,(t-s)I_m)$.

Independence (Baldi Exercise 4.5): (4.8) says $E[e^{i\langle\lambda,X_t-X_s\rangle}\mid\mathcal F_s]=E[e^{i\langle\lambda,X_t-X_s\rangle}]$ for all $\lambda$. Let $W$ be any real $\mathcal F_s$-measurable r.v. and $u\in\mathbb R$. Since $e^{iuW}$ is bounded and $\mathcal F_s$-measurable,
$$
E\big[e^{i\langle\lambda,X_t-X_s\rangle+iuW}\big]=E\big[e^{iuW}E[e^{i\langle\lambda,X_t-X_s\rangle}\mid\mathcal F_s]\big]=E[e^{iuW}]\,E[e^{i\langle\lambda,X_t-X_s\rangle}] .
$$
The joint characteristic function of $(X_t-X_s,W)$ factorizes, so $X_t-X_s$ and $W$ are independent. As $W$ is an arbitrary $\mathcal F_s$-measurable r.v. (take $W=\mathbf 1_F$, $F\in\mathcal F_s$), $X_t-X_s$ is independent of $\mathcal F_s$.

Conclusion: $X$ is continuous, adapted, $X_0=0$ a.s., and for all $s<t$, $X_t-X_s$ is independent of $\mathcal F_s$ with law $N(0,(t-s)I_m)$. These are exactly the conditions of Definition 2.1, so $X$ is an $(\mathcal F_t)$-Brownian motion. $\square$

**Converse (useful).** If $B$ is an $(\mathcal F_t)$-BM, then $Y^\lambda$ is a martingale: $E[e^{i\langle\lambda,B_t\rangle}\mid\mathcal F_s]=e^{i\langle\lambda,B_s\rangle}E[e^{i\langle\lambda,B_t-B_s\rangle}]=e^{i\langle\lambda,B_s\rangle}e^{-\frac12|\lambda|^2(t-s)}$.

**What graders look for / pitfalls.**

- Explicitly derive (4.8) (the "dividing" step is multiplication by a bounded $\mathcal F_s$-measurable factor; the factor is never zero).
- Both conclusions from (4.8): the *law* (take expectation) and the *independence* (Ex. 4.5). Many students forget independence.
- Continuity and $X_0=0$ are hypotheses: mention them when checking Definition 2.1.
- Complex conditional expectation: say it is defined componentwise.

**Memorize-this skeleton.** $E[Y_t\mid\mathcal F_s]=Y_s$ $\Rightarrow$ $E[e^{i\langle\lambda,X_t-X_s\rangle}\mid\mathcal F_s]=e^{-|\lambda|^2(t-s)/2}$ $\Rightarrow$ (expectation) Gaussian law; (factorization with $e^{iuW}$) independence $\Rightarrow$ Def. 2.1.

### 4.20 Bonus proofs from the notes (statements are S)

**Theorem 4.9, first inequality (short proof).** Let $\tau=\inf\{i\le k:X_i\ge\lambda\}\wedge k$ and $A=\{\sup_{i\le k}X_i\ge\lambda\}$. By Thm 4.6 with $0\le\tau\le k$: $E[X_0]\ge E[X_\tau]=E[X_\tau\mathbf 1_A]+E[X_k\mathbf 1_{A^c}]\ge\lambda P(A)-E[X_k^-]$. For the second, $\tau=\inf\{i\le k:X_i\le-\lambda\}\wedge k$, $A=\{\inf_{i\le k}X_i\le-\lambda\}$: $E[X_k]\le E[X_\tau]\le-\lambda P(A)+E[X_k\mathbf 1_{A^c}]$, so $\lambda P(A)\le E[X_k\mathbf 1_{A^c}]-E[X_k]=-E[X_k\mathbf 1_A]$.

**Theorem 4.28 (notes).** For $0=t_0<\dots<t_n=T$, Thm 4.9 applied to the discrete supermartingale $(M_{t_k})_k$ gives $\lambda P(\max_kM_{t_k}\ge\lambda)\le E[M_0]+E[M_T^-]$, a bound independent of the partition. Let $F_n$ be finite sets containing $0$ and $T$ increasing to $D=(\mathbb Q\cap[0,T])\cup\{T\}$. For $0<\lambda'<\lambda$, $\{\sup_DM_t\ge\lambda\}\subset\bigcup_n\{\max_{F_n}M_t>\lambda'\}$ (increasing union), so by continuity of $P$ from below, $\lambda'P(\sup_DM_t\ge\lambda)\le\sup_n\lambda'P(\max_{F_n}M_t\ge\lambda')\le E[M_0]+E[M_T^-]$; let $\lambda'\uparrow\lambda$. By right continuity, $\sup_DM_t=\sup_{[0,T]}M_t$.

**Theorem 4.33 (notes, martingale case).** (i) If $\tau$ takes finitely many values $t_1<\dots<t_m\le b$, Cor. 4.7 for $(M_{t_k})$ gives $E[M_b\mid\mathcal F_\tau]=M_\tau$; hence by Prop. 4.25 the family $\{M_\tau:\tau$ finitely-valued stopping time $\le b\}$ is UI. (ii) Approximate $\tau_1\le\tau_2\le b$ from above by finitely-valued stopping times $\tau^1_n\downarrow\tau_1$, $\tau^2_n\downarrow\tau_2$, $\tau^1_n\le\tau^2_n$ (e.g. dyadic: $\tau_n=\lceil2^n\tau\rceil/2^n$). Cor. 4.7 gives $E[M_{\tau^2_n}\mid\mathcal F_{\tau^1_n}]=M_{\tau^1_n}$; conditioning on $\mathcal F_{\tau_1}\subset\mathcal F_{\tau^1_n}$: $E[M_{\tau^2_n}\mid\mathcal F_{\tau_1}]=E[M_{\tau^1_n}\mid\mathcal F_{\tau_1}]$. (iii) Right continuity gives $M_{\tau^i_n}\to M_{\tau_i}$ a.s., and UI upgrades this to $L^1$; so for bounded $\mathcal F_{\tau_1}$-measurable $W$, $E[WM_{\tau_2}]=\lim E[WM_{\tau^2_n}]=\lim E[WM_{\tau^1_n}]=E[WM_{\tau_1}]$, i.e. $E[M_{\tau_2}\mid\mathcal F_{\tau_1}]=M_{\tau_1}$ ($M_{\tau_1}$ is $\mathcal F_{\tau_1}$-measurable by right continuity and progressive measurability).

## 5. Exercises

Notation: $B$ is a real $(\mathcal F_t)$-Brownian motion unless said otherwise; $\Delta=B_t-B_s$ for $s\le t$ is independent of $\mathcal F_s$ with law $N(0,t-s)$. Useful Gaussian moments: if $G\sim N(0,\sigma^2)$ then $E[G]=E[G^3]=0$, $E[G^2]=\sigma^2$, $E[G^4]=3\sigma^4$, $E[e^{\lambda G}]=e^{\lambda^2\sigma^2/2}$, $E|G|=\sigma\sqrt{2/\pi}$.

### Part A: Conditional expectation

#### Exercise C1 (★, 10 min) - mandatory assignment 2026, Problem 2.1

Compute, for $0\le s<t\le T$,
$$
E\Big[B_T^2\,\frac{B_t-B_s}{t-s}\,B_s^4\ \Big|\ \mathcal F_s\Big].
$$

**Strategy.** Take out what is known ($B_s^4/(t-s)$). Decompose $B_T$ into independent pieces: $B_T=B_s+X+Y$ with $X=B_t-B_s$, $Y=B_T-B_t$. $X,Y$ are independent of each other and of $\mathcal F_s$. Then expand and use the freezing lemma (or Prop. 3.7 (d), (f)).

**Full solution.** All r.v.'s involved are products of Gaussian polynomials, hence integrable, and $B_s^4/(t-s)$ is $\mathcal F_s$-measurable, so (extension of Prop. 3.7(d))
$$
E\Big[B_T^2\frac{B_t-B_s}{t-s}B_s^4\,\Big|\,\mathcal F_s\Big]=\frac{B_s^4}{t-s}E\big[B_T^2X\mid\mathcal F_s\big].
$$
With $B_T=B_s+X+Y$:
$$
B_T^2X=\big(B_s^2+X^2+Y^2+2B_sX+2B_sY+2XY\big)X=B_s^2X+X^3+Y^2X+2B_sX^2+2B_sXY+2X^2Y .
$$
$X$ and $Y$ are independent of $\mathcal F_s$ and independent of each other; by the freezing lemma (freeze $B_s$), term by term:
$$
\begin{aligned}
E[B_s^2X\mid\mathcal F_s]&=B_s^2E[X]=0, & E[X^3\mid\mathcal F_s]&=E[X^3]=0, & E[Y^2X\mid\mathcal F_s]&=E[Y^2]E[X]=0,\\
E[2B_sX^2\mid\mathcal F_s]&=2B_s(t-s), & E[2B_sXY\mid\mathcal F_s]&=2B_sE[X]E[Y]=0, & E[2X^2Y\mid\mathcal F_s]&=2E[X^2]E[Y]=0 .
\end{aligned}
$$
Hence $E[B_T^2X\mid\mathcal F_s]=2(t-s)B_s$ and
$$
E\Big[B_T^2\frac{B_t-B_s}{t-s}B_s^4\,\Big|\,\mathcal F_s\Big]=\frac{B_s^4}{t-s}\cdot2(t-s)B_s=2B_s^5 .
$$
(Without the normalization: $E[B_T^2(B_t-B_s)B_s^4\mid\mathcal F_s]=2(t-s)B_s^5$.)

**Shortcut.** $E[B_T^2X\mid\mathcal F_s]=E\big[E[B_T^2\mid\mathcal F_t]X\mid\mathcal F_s\big]=E[(B_t^2+T-t)X\mid\mathcal F_s]=E[(B_s+X)^2X\mid\mathcal F_s]+0=2B_s(t-s)$.

**Common pitfalls.** Writing $E[B_T^2\mid\mathcal F_s]E[X\mid\mathcal F_s]$ (conditional expectation is not multiplicative for dependent factors). Forgetting the $Y$ piece, or claiming $B_T$ independent of $\mathcal F_s$.

#### Exercise C2 (★, 10 min) - conditional moments of BM

For $s\le t$ compute $E[B_t^2\mid\mathcal F_s]$, $E[B_t^3\mid\mathcal F_s]$, $E[B_t^4\mid\mathcal F_s]$, $E[e^{\lambda B_t}\mid\mathcal F_s]$, $E[B_sB_t\mid\mathcal F_u]$ for $u\le s\le t$, and $E[B_s\mid B_t]$ for $0<s<t$ with the conditional variance.

**Strategy.** Freezing lemma: $B_t=x+\Delta$ with $x=B_s$ frozen. For $E[B_s\mid B_t]$ use the Gaussian formula (Prop. 3.23).

**Full solution.** With $\Phi(x)=E[f(x+\Delta)]$, $\Delta\sim N(0,t-s)$:
$$
\begin{aligned}
E[B_t^2\mid\mathcal F_s]&=B_s^2+(t-s),\\
E[B_t^3\mid\mathcal F_s]&=B_s^3+3B_s^2E[\Delta]+3B_sE[\Delta^2]+E[\Delta^3]=B_s^3+3(t-s)B_s,\\
E[B_t^4\mid\mathcal F_s]&=B_s^4+6B_s^2(t-s)+3(t-s)^2,\\
E[e^{\lambda B_t}\mid\mathcal F_s]&=e^{\lambda B_s}E[e^{\lambda\Delta}]=e^{\lambda B_s+\frac{\lambda^2}{2}(t-s)} .
\end{aligned}
$$
(For the fourth moment: $(x+\Delta)^4=x^4+4x^3\Delta+6x^2\Delta^2+4x\Delta^3+\Delta^4$, odd moments vanish, $E\Delta^4=3(t-s)^2$.)

Tower: $E[B_sB_t\mid\mathcal F_u]=E\big[B_sE[B_t\mid\mathcal F_s]\mid\mathcal F_u\big]=E[B_s^2\mid\mathcal F_u]=B_u^2+s-u$.

$(B_s,B_t)$ is centered Gaussian with $\operatorname{Cov}(B_s,B_t)=s$, $\operatorname{Var}(B_t)=t$. By Prop. 3.23,
$$
E[B_s\mid B_t]=\frac stB_t,\qquad\text{conditional variance}=s-\frac{s^2}{t}=\frac{s(t-s)}{t}.
$$
(Conditional law given $B_t=y$: $N(sy/t,\ s(t-s)/t)$, the Brownian bridge marginal.)

**Common pitfalls.** $E[B_s\mid B_t]\ne B_s$ and $\ne B_t$: here we condition on the *future*. Forgetting the $3(t-s)^2$ term.

#### Exercise C3 (★★, 15 min) - Baldi Exercise 4.9

Compute $E[\int_s^tB_u^2\,du\mid\mathcal F_s]$ and $E[\int_s^tB_u^2\,du\mid B_s]$.

**Strategy.** Split $B_u=B_s+(B_u-B_s)$; exchange conditional expectation and $du$-integral (Remark 3.18, justified by Fubini against bounded $\mathcal F_s$-measurable test functions).

**Full solution.** $B_u^2=B_s^2+2B_s(B_u-B_s)+(B_u-B_s)^2$, so
$$
\int_s^tB_u^2\,du=(t-s)B_s^2+2B_s\int_s^t(B_u-B_s)\,du+\int_s^t(B_u-B_s)^2\,du .
$$
The first term is $\mathcal F_s$-measurable. For $u\ge s$, $E[B_u-B_s\mid\mathcal F_s]=0$ and $E[(B_u-B_s)^2\mid\mathcal F_s]=u-s$; these are continuous (constant) versions in $u$, so by Remark 3.18
$$
E\Big[\int_s^t(B_u-B_s)\,du\,\Big|\,\mathcal F_s\Big]=0,\qquad E\Big[\int_s^t(B_u-B_s)^2\,du\,\Big|\,\mathcal F_s\Big]=\int_s^t(u-s)\,du=\frac{(t-s)^2}{2}.
$$
(The middle term needs Prop. 3.7(d) with the unbounded factor $2B_s$; it is fine since all terms are in $L^2$.) Therefore
$$
E\Big[\int_s^tB_u^2\,du\,\Big|\,\mathcal F_s\Big]=(t-s)B_s^2+\frac{(t-s)^2}{2}.
$$
This is $\sigma(B_s)$-measurable, so by the tower property $E[\int_s^tB_u^2\,du\mid B_s]$ is the same expression.

*Justification of the exchange directly:* for $W$ bounded $\mathcal F_s$-measurable, $E[W\int_s^t(B_u-B_s)^2du]=\int_s^tE[W(B_u-B_s)^2]du=\int_s^tE[W](u-s)du$ by Fubini and independence.

**Common pitfalls.** Writing $E[B_u^2\mid\mathcal F_s]=B_s^2$ (forgetting $+(u-s)$).

#### Exercise C4 (★, 8 min) - conditioning on a partition

A fair die shows $X\in\{1,\dots,6\}$. Let $A=\{X\text{ even}\}$ and $\mathcal D=\sigma(A)$. Compute $E[X\mid\mathcal D]$, $E[X^2\mid\mathcal D]$, and verify $E[E[X\mid\mathcal D]]=E[X]$ and the $L^2$-projection property.

**Strategy.** Example 3.12.

**Full solution.** $E[X\mathbf 1_A]/P(A)=(2+4+6)/3=4$, $E[X\mathbf 1_{A^c}]/P(A^c)=(1+3+5)/3=3$:
$$
E[X\mid\mathcal D]=4\cdot\mathbf 1_A+3\cdot\mathbf 1_{A^c},\qquad E[X^2\mid\mathcal D]=\frac{56}{3}\mathbf 1_A+\frac{35}{3}\mathbf 1_{A^c}.
$$
$E[E[X\mid\mathcal D]]=\frac12\cdot4+\frac12\cdot3=\frac72=E[X]$. Projection: $Z=E[X\mid\mathcal D]$; for $W=a\mathbf 1_A+b\mathbf 1_{A^c}$, $E[(X-Z)W]=a\,E[(X-4)\mathbf 1_A]+b\,E[(X-3)\mathbf 1_{A^c}]=a\cdot0+b\cdot0=0$. Conditional variance on $A$: $56/3-16=8/3$.

**Pitfalls.** $E[X\mid\mathcal D]$ is a *random variable* (constant on each atom), not a number.

#### Exercise C5 (★★, 15 min) - filtering, Baldi Exercise 4.11

$X\sim N(0,1)$ is a signal; one observes $Y=X+W$, $W\sim N(0,\sigma^2)$ independent of $X$. (a) Compute $E[X\mid Y]$ and the conditional variance. (b) With two observations $Y_i=X+W_i$, $i=1,2$, with $X,W_1,W_2$ independent and $W_i\sim N(0,\sigma^2)$, compute $E[X\mid Y_1,Y_2]$ and the conditional variance; compare.

**Strategy.** $(X,Y)$ jointly Gaussian (linear image of independent Gaussians). Apply Prop. 3.23 / 3.22.

**Full solution.** (a) $\operatorname{Cov}(X,Y)=1$, $\operatorname{Var}(Y)=1+\sigma^2$:
$$
E[X\mid Y]=\frac{Y}{1+\sigma^2},\qquad\operatorname{Var}(X\mid Y)=1-\frac{1}{1+\sigma^2}=\frac{\sigma^2}{1+\sigma^2}.
$$
(b) $C_{XY}=(1,1)$, $C_Y=\begin{pmatrix}1+\sigma^2&1\\1&1+\sigma^2\end{pmatrix}$, $\det C_Y=(1+\sigma^2)^2-1=\sigma^2(2+\sigma^2)$,
$$
C_Y^{-1}=\frac{1}{\sigma^2(2+\sigma^2)}\begin{pmatrix}1+\sigma^2&-1\\-1&1+\sigma^2\end{pmatrix},\qquad C_{XY}C_Y^{-1}=\frac{\sigma^2}{\sigma^2(2+\sigma^2)}(1,1)=\frac{(1,1)}{2+\sigma^2}.
$$
Hence
$$
E[X\mid Y_1,Y_2]=\frac{Y_1+Y_2}{2+\sigma^2},\qquad\operatorname{Var}(X\mid Y_1,Y_2)=1-\frac{(1,1)\cdot(1,1)^*}{2+\sigma^2}=1-\frac{2}{2+\sigma^2}=\frac{\sigma^2}{2+\sigma^2}<\frac{\sigma^2}{1+\sigma^2}.
$$
Two observations reduce the conditional variance. (With $n$ observations: $\sigma^2/(n+\sigma^2)\to0$.)

**Pitfalls.** The conditional variance is deterministic (does not depend on the observed values) in the Gaussian case.

#### Exercise C6 (★★, 15 min) - Baldi Exercise 4.13

Find the joint law of $(B_1,I)$, $I=\int_0^1B_s\,ds$, and compute $E[B_1\mid I]$ and $E[I\mid B_1]$ with conditional variances.

**Strategy.** $I$ is an $L^2$-limit of Riemann sums of Gaussian vectors, so $(B_1,I)$ is jointly centered Gaussian. Compute covariances with Fubini.

**Full solution.** $E[I^2]=\int_0^1\int_0^1(s\wedge u)\,ds\,du=2\int_0^1\int_0^us\,ds\,du=2\int_0^1\frac{u^2}{2}du=\frac13$. $E[B_1I]=\int_0^1E[B_1B_s]\,ds=\int_0^1s\,ds=\frac12$. So
$$
(B_1,I)\sim N\Big(0,\begin{pmatrix}1&\frac12\\\frac12&\frac13\end{pmatrix}\Big).
$$
By Prop. 3.23:
$$
E[B_1\mid I]=\frac{1/2}{1/3}I=\frac32I,\quad\operatorname{Var}(B_1\mid I)=1-\frac{1/4}{1/3}=\frac14;\qquad E[I\mid B_1]=\frac12B_1,\quad\operatorname{Var}(I\mid B_1)=\frac13-\frac14=\frac1{12}.
$$
**Pitfalls.** $E[I^2]\ne\int_0^1E[B_s^2]ds$ (that would be $1/2$): you need the double integral of the covariance.

#### Exercise C7 (★★, 15 min) - BM at an exponential time, Baldi Exercise 4.6

Let $\tau\sim\operatorname{Exp}(\lambda)$ be independent of the $m$-dimensional BM $B$. Compute the characteristic function of $B_\tau$; for $m=1$ identify the law.

**Strategy.** Example 3.17 with $\mu(dt)=\lambda e^{-\lambda t}dt$.

**Full solution.**
$$
E[e^{i\langle\theta,B_\tau\rangle}]=\int_0^\infty e^{-\frac t2|\theta|^2}\lambda e^{-\lambda t}\,dt=\frac{\lambda}{\lambda+\frac12|\theta|^2}=\frac{2\lambda}{2\lambda+|\theta|^2}.
$$
A Laplace law with density $\frac\mu2e^{-\mu|x|}$ has characteristic function $\mu\int_0^\infty\cos(\theta x)e^{-\mu x}dx=\frac{\mu^2}{\mu^2+\theta^2}$. With $\mu=\sqrt{2\lambda}$ the two coincide, so for $m=1$, $B_\tau$ has density $\frac{\sqrt{2\lambda}}{2}e^{-\sqrt{2\lambda}|x|}$.

**Pitfalls.** Forgetting the independence hypothesis; using the freezing lemma requires $\tau\perp B$.

#### Exercise C8 (★★, 10 min) - independence pitfalls, Baldi Exercises 4.1-4.2

(a) Show that if $Y$ is independent of $\mathcal G$ and $\mathcal G$-measurable, then $Y$ is a.s. constant. (b) Give $X,\mathcal G,\mathcal D$ with $\mathcal D$ independent of $X$ and of $\mathcal G$ but $E[X\mid\mathcal G\vee\mathcal D]\ne E[X\mid\mathcal G]$.

**Strategy.** (a) $Y$ is independent of itself. (b) Pairwise independence is not joint independence.

**Full solution.** (a) $\{Y\le x\}\in\mathcal G$ and is independent of itself: $P(Y\le x)=P(Y\le x)^2$, so $F_Y(x)\in\{0,1\}$ for every $x$; a distribution function with values in $\{0,1\}$ jumps once, at some $c$, so $Y=c$ a.s.

(b) Let $X,Y$ be i.i.d. with $P(\pm1)=\frac12$, $Z=XY$, $\mathcal G=\sigma(Y)$, $\mathcal D=\sigma(Z)$. $Z$ is $\pm1$ with prob. $\frac12$ and $P(Z=z,X=x)=P(Y=z/x,X=x)=\frac14$, so $Z\perp X$; similarly $Z\perp Y$. But $X=ZY$ is $\mathcal G\vee\mathcal D$-measurable, so $E[X\mid\mathcal G\vee\mathcal D]=X$, while $E[X\mid\mathcal G]=E[X]=0$. (Correct statement, Baldi 4.1(b): if $\mathcal D$ is independent of $\sigma(X)\vee\mathcal G$, then $E[X\mid\mathcal G\vee\mathcal D]=E[X\mid\mathcal G]$; proof by Remark 3.6 with the $\pi$-system $\{G\cap D\}$.)

### Part B: Martingales

#### Exercise M1 (★, 15 min) - martingale or not?

Classify each process (martingale / sub / super / none) w.r.t. $(\mathcal F_t)$: (a) $e^{B_t}$; (b) $B_t^2-t$; (c) $B_t^3-3tB_t$; (d) $B_t^3$; (e) $e^{\lambda B_t-\mu t}$, $\lambda\in\mathbb R,\mu\ge0$; (f) $|B_t|$; (g) $B_t^4-6tB_t^2+3t^2$; (h) $B_t^2$.

**Strategy.** Three checks: adapted (Borel function of $(t,B_t)$), integrable (Gaussian moments), and the conditional expectation via Exercise C2.

**Full solution.** All processes are of the form $f(t,B_t)$ with $f$ continuous, hence adapted, and integrable: polynomial moments of Gaussians are finite and $E[e^{\lambda B_t}]=e^{\lambda^2t/2}$. For $s<t$:

(a) $E[e^{B_t}\mid\mathcal F_s]=e^{B_s}e^{(t-s)/2}>e^{B_s}$: **submartingale**, not a martingale ($E[e^{B_t}]=e^{t/2}$ increases).

(b) $E[B_t^2-t\mid\mathcal F_s]=B_s^2+(t-s)-t=B_s^2-s$: **martingale**.

(c) $E[B_t^3-3tB_t\mid\mathcal F_s]=B_s^3+3(t-s)B_s-3tB_s=B_s^3-3sB_s$: **martingale**.

(d) $E[B_t^3\mid\mathcal F_s]-B_s^3=3(t-s)B_s$, which is positive on $\{B_s>0\}$ and negative on $\{B_s<0\}$ (both of positive probability): **neither**. Note $E[B_t^3]=0$ is constant, yet it is not a martingale (Ex. 5.1 needs the supermartingale property).

(e) $E[e^{\lambda B_t-\mu t}\mid\mathcal F_s]=e^{\lambda B_s-\mu t+\frac{\lambda^2}{2}(t-s)}=e^{\lambda B_s-\mu s}\,e^{(\frac{\lambda^2}{2}-\mu)(t-s)}$: **martingale** iff $\mu=\lambda^2/2$, **supermartingale** iff $\mu\ge\lambda^2/2$, **submartingale** iff $\mu\le\lambda^2/2$.

(f) $|x|$ convex, $B$ a martingale: **submartingale** (Jensen); not a martingale since $E|B_t|=\sqrt{2t/\pi}$ is not constant.

(g) $E[B_t^4-6tB_t^2+3t^2\mid\mathcal F_s]=B_s^4+6(t-s)B_s^2+3(t-s)^2-6t(B_s^2+t-s)+3t^2=B_s^4-6sB_s^2+\big[3(t-s)^2-6t(t-s)+3t^2\big]$, and the bracket equals $3\big((t-s)-t\big)^2=3s^2$: **martingale**.

(h) $E[B_t^2\mid\mathcal F_s]=B_s^2+(t-s)\ge B_s^2$: **submartingale** with compensator $t$ (Example 4.41).

**Common pitfalls.** Concluding "martingale" from constant expectation. Forgetting integrability, especially for exponentials. In (e), the sign of $\lambda$ does not matter, only $\lambda^2$.

> **Pattern.** $H_n(t,x)$ such that $H_n(t,B_t)$ is a martingale: $x$, $x^2-t$, $x^3-3tx$, $x^4-6tx^2+3t^2$ (Hermite polynomials; coefficients of $e^{\lambda x-\lambda^2t/2}=\sum_n\frac{\lambda^n}{n!}H_n(t,x)$).

#### Exercise M2 (★★, 15 min) - Baldi Exercise 5.13

Show that $Y_t=tB_t-\int_0^tB_u\,du$ is a martingale, and that $I_t=\int_0^tB_u\,du$ is not.

**Strategy.** Example 3.19 gives $E[I_t\mid\mathcal F_s]$.

**Full solution.** Adapted: $I_t$ is a limit of Riemann sums of $\mathcal F_t$-measurable r.v.'s. Integrable: $E|I_t|\le\int_0^tE|B_u|du<\infty$, $E|tB_t|<\infty$. For $s<t$, by Example 3.19,
$$
E[Y_t\mid\mathcal F_s]=tB_s-\Big(\int_0^sB_u\,du+(t-s)B_s\Big)=sB_s-\int_0^sB_u\,du=Y_s .
$$
$I$ is not a martingale: $E[I_t\mid\mathcal F_s]-I_s=(t-s)B_s\ne0$. (Alternatively by Thm 4.37: $I$ is continuous, square integrable, with $C^1$ paths, hence finite variation; if it were a martingale it would be constant, $I_t=I_0=0$, contradicting $\operatorname{Var}(I_t)=t^3/3>0$.)

**Pitfalls.** Remember $E[B_u\mid\mathcal F_s]=B_s$ for $u>s$ inside the time integral.

#### Exercise M3 (★★, 25 min) - 2022 assignment, Exercise 4 (finite probability space)

$\Omega=\{\omega_1,\dots,\omega_4\}$, $\mathcal F=2^\Omega$, $P(\omega_1)=\frac19$, $P(\omega_2)=\frac29$, $P(\omega_3)=\frac2{15}$, $P(\omega_4)=\frac8{15}$. Let $M_0=3$; $M_1=5$ on $\{\omega_1,\omega_2\}$, $M_1=2$ on $\{\omega_3,\omega_4\}$; $M_2(\omega_1)=7$, $M_2(\omega_2)=4$, $M_2(\omega_3)=6$, $M_2(\omega_4)=1$.

1. Show $M$ is a martingale for its natural filtration.
2. Find an increasing predictable $A$ with $A_0=0$ such that $M^2-A$ is a martingale.
3. Find a predictable $B$ with $B_0=1$ such that $BM$ is a martingale.
4. Find a predictable $C$ with $C_0=1$ such that $CM^3$ is a martingale.

**Strategy.** Identify the atoms of $\mathcal F_n$ and the conditional probabilities on each atom; conditional expectations are averages over atoms (Example 3.12). Part 2 is the Doob decomposition of $M^2$. Parts 3-4: impose $E[Y_{n+1}\mid\mathcal F_n]=Y_n$ and solve for the $\mathcal F_n$-measurable $B_{n+1}$, $C_{n+1}$.

**Full solution.** *Filtration.* $\mathcal F_0=\{\emptyset,\Omega\}$; $\mathcal F_1=\sigma(M_1)$ has atoms $D_1=\{\omega_1,\omega_2\}$, $D_2=\{\omega_3,\omega_4\}$; $\mathcal F_2=\sigma(M_1,M_2)=2^\Omega$ since $M_2$ takes 4 distinct values. $P(D_1)=\frac19+\frac29=\frac13$, $P(D_2)=\frac2{15}+\frac8{15}=\frac23$. Conditional probabilities: on $D_1$, $P(\omega_1\mid D_1)=\frac13$, $P(\omega_2\mid D_1)=\frac23$; on $D_2$, $P(\omega_3\mid D_2)=\frac{2/15}{2/3}=\frac15$, $P(\omega_4\mid D_2)=\frac45$.

*1. Martingale.* Adapted and integrable (finite space). $E[M_1\mid\mathcal F_0]=E[M_1]=5\cdot\frac13+2\cdot\frac23=3=M_0$. $E[M_2\mid\mathcal F_1]=7\cdot\frac13+4\cdot\frac23=5=M_1$ on $D_1$ and $=6\cdot\frac15+1\cdot\frac45=2=M_1$ on $D_2$. So $M$ is a martingale.

*2. Compensator of $M^2$.* By Doob (Thm 4.5), $A_{n+1}=A_n+E[M_{n+1}^2\mid\mathcal F_n]-M_n^2=A_n+E[(M_{n+1}-M_n)^2\mid\mathcal F_n]$:
$$
A_1=E[(M_1-3)^2]=4\cdot\tfrac13+1\cdot\tfrac23=2 .
$$
On $D_1$: $E[(M_2-5)^2\mid\mathcal F_1]=4\cdot\frac13+1\cdot\frac23=2$; on $D_2$: $E[(M_2-2)^2\mid\mathcal F_1]=16\cdot\frac15+1\cdot\frac45=4$. Hence
$$
A_0=0,\qquad A_1=2,\qquad A_2=\begin{cases}4&\text{on }\{\omega_1,\omega_2\},\\6&\text{on }\{\omega_3,\omega_4\}.\end{cases}
$$
$A$ is increasing, $A_1$ is $\mathcal F_0$-measurable and $A_2$ is $\mathcal F_1$-measurable: predictable. Check: $X=M^2-A$: $X_0=9$, $E[X_1]=E[M_1^2]-2=(25\cdot\frac13+4\cdot\frac23)-2=11-2=9$. On $D_1$: $E[M_2^2\mid\mathcal F_1]-4=(49\cdot\frac13+16\cdot\frac23)-4=27-4=23=25-2=X_1$; on $D_2$: $(36\cdot\frac15+1\cdot\frac45)-6=8-6=2=4-2=X_1$. By uniqueness in Thm 4.5 this $A$ is the only one.

*3.* $B_{n+1}$ is $\mathcal F_n$-measurable, so $E[B_{n+1}M_{n+1}\mid\mathcal F_n]=B_{n+1}E[M_{n+1}\mid\mathcal F_n]=B_{n+1}M_n$. The martingale condition $B_{n+1}M_n=B_nM_n$ and $M_n>0$ give $B_{n+1}=B_n$: $B\equiv1$ is the (unique) answer. (Natural: $M$ is already a martingale.)

*4.* Similarly $C_{n+1}E[M_{n+1}^3\mid\mathcal F_n]=C_nM_n^3$, so $C_{n+1}=C_nM_n^3/E[M_{n+1}^3\mid\mathcal F_n]$ (denominators positive since $M>0$).
$$
E[M_1^3]=125\cdot\tfrac13+8\cdot\tfrac23=\tfrac{141}{3}=47\ \Rightarrow\ C_1=\frac{27}{47}.
$$
On $D_1$: $E[M_2^3\mid\mathcal F_1]=343\cdot\frac13+64\cdot\frac23=\frac{471}{3}=157$, so $C_2=\frac{27}{47}\cdot\frac{125}{157}=\frac{3375}{7379}$. On $D_2$: $E[M_2^3\mid\mathcal F_1]=216\cdot\frac15+1\cdot\frac45=44$, so $C_2=\frac{27}{47}\cdot\frac{8}{44}=\frac{54}{517}$.
$$
C_0=1,\qquad C_1=\frac{27}{47},\qquad C_2=\begin{cases}\dfrac{3375}{7379}&\text{on }\{\omega_1,\omega_2\},\\ \dfrac{54}{517}&\text{on }\{\omega_3,\omega_4\}.\end{cases}
$$
Check on $D_2$: $C_2E[M_2^3\mid\mathcal F_1]=\frac{54}{517}\cdot44=\frac{216}{47}=C_1M_1^3$. On $D_1$: $\frac{3375}{7379}\cdot157=\frac{3375}{47}=C_1\cdot125$.

**Common pitfalls.** Using unconditional probabilities on the atoms of $\mathcal F_1$ (must renormalize: $\frac15,\frac45$, not $\frac2{15},\frac8{15}$). Making $A_2$ depend on $\omega$ within an atom of $\mathcal F_1$ (violates predictability). Arithmetic: double-check $E[M_2^3\mid D_1]=157$.

#### Exercise M4 (★★, 15 min) - Doob decompositions for random walks

Let $S_n=Z_1+\dots+Z_n$, $Z_k$ i.i.d. with $P(Z_k=\pm1)=\frac12$, $\mathcal F_n=\sigma(Z_1,\dots,Z_n)$. (a) Find the Doob decomposition of $S_n^2$. (b) Find the Doob decomposition of $|S_n|$. (c) (Baldi 5.4) Let $X_k$ be independent, mean $0$, variance $\sigma^2$, $M_n=\sum_{k\le n}X_k$, and $Z$ square integrable predictable; show $Y_n=\sum_{k=1}^nZ_kX_k$ is a square integrable martingale and compute $\langle M\rangle$ and $\langle Y\rangle$.

**Strategy.** $A_{n+1}-A_n=E[X_{n+1}\mid\mathcal F_n]-X_n$.

**Full solution.** (a) $E[S_{n+1}^2\mid\mathcal F_n]-S_n^2=E[2S_nZ_{n+1}+Z_{n+1}^2\mid\mathcal F_n]=2S_nE[Z_{n+1}]+1=1$. So $A_n=n$ and $S_n^2=(S_n^2-n)+n$.

(b) $|S_n|$ is a submartingale (convex function of a martingale). If $S_n=j\ne0$: $E[|S_{n+1}|\mid\mathcal F_n]=\frac12|j+1|+\frac12|j-1|=|j|$ (as $|j|\ge1$). If $S_n=0$: $E[|S_{n+1}|\mid\mathcal F_n]=1$. So $E[|S_{n+1}|\mid\mathcal F_n]-|S_n|=\mathbf 1_{\{S_n=0\}}$ and
$$
|S_n|=M_n+A_n,\qquad A_n=\sum_{k=0}^{n-1}\mathbf 1_{\{S_k=0\}}\ \text{(number of visits to 0 before time }n\text{, a discrete local time)}.
$$
(Formally: freezing lemma, $E[|x+Z_{n+1}|]=\frac12(|x+1|+|x-1|)$.)

(c) $Z_k$ is $\mathcal F_{k-1}$-measurable, $X_k$ independent of $\mathcal F_{k-1}$, so $Z_k\perp X_k$ and $E[Z_k^2X_k^2]=E[Z_k^2]\sigma^2<\infty$: $Y_n\in L^2$. $E[Y_{n+1}\mid\mathcal F_n]=Y_n+Z_{n+1}E[X_{n+1}\mid\mathcal F_n]=Y_n+Z_{n+1}E[X_{n+1}]=Y_n$. Compensators: $E[(M_{n+1}-M_n)^2\mid\mathcal F_n]=E[X_{n+1}^2]=\sigma^2$, so $\langle M\rangle_n=n\sigma^2$; $E[(Y_{n+1}-Y_n)^2\mid\mathcal F_n]=Z_{n+1}^2E[X_{n+1}^2]=\sigma^2Z_{n+1}^2$, so $\langle Y\rangle_n=\sigma^2\sum_{k=1}^nZ_k^2$ (predictable!). In particular $E[Y_n^2]=\sigma^2\sum_{k=1}^nE[Z_k^2]$ (discrete Ito isometry).

**Pitfalls.** In (c), $Z_k$ is not bounded, so justify "take out what is known" via square integrability and independence.

#### Exercise M5 (★★, 20 min) - Example 4.15: exit of the symmetric random walk, plus $E[\tau]$

With $S$ as in M4, $a,b\in\mathbb N_{\ge1}$, $\tau=\inf\{n:S_n=b\text{ or }S_n=-a\}$. Show $\tau<\infty$ a.s., compute $P(S_\tau=b)$ and $E[\tau]$.

**Strategy.** Stopped martingales $S^\tau$ and $(S^2-n)^\tau$, stopping theorem at $\tau\wedge n$, then $n\to\infty$ (DCT for bounded quantities, MCT for $\tau\wedge n$).

**Full solution.** *$\tau<\infty$ a.s.* Split time into blocks of length $L=a+b$. If all $L$ steps of a block equal $+1$, the walk (which is in $]-a,b[$ at the start of the block, if not yet stopped) must reach $b$ within the block. Blocks are independent and each is "all $+1$" with probability $\rho=2^{-L}>0$. So $P(\tau>kL)\le(1-\rho)^k\to0$; hence $\tau<\infty$ a.s. (and even $E[\tau]=\sum_nP(\tau>n)\le L\sum_k(1-\rho)^k<\infty$).

*Exit probabilities.* $S^\tau$ is a martingale (stopped martingale), and $|S_{n\wedge\tau}|\le\max(a,b)$ because the walk moves by $\pm1$ and stops on hitting $-a$ or $b$. So $E[S_{n\wedge\tau}]=E[S_0]=0$. As $n\to\infty$, $S_{n\wedge\tau}\to S_\tau$ a.s. (as $\tau<\infty$), and by dominated convergence $E[S_\tau]=0$. With $p=P(S_\tau=b)$ and $S_\tau\in\{-a,b\}$:
$$
bp-a(1-p)=0\ \Longrightarrow\ p=\frac{a}{a+b},\qquad P(S_\tau=-a)=\frac{b}{a+b}.
$$
*Expected exit time.* $S_n^2-n$ is a martingale (M4(a)), so its stopped version is too: $E[S_{n\wedge\tau}^2]=E[n\wedge\tau]$. Left side: $S_{n\wedge\tau}^2\le\max(a,b)^2$, DCT gives $\to E[S_\tau^2]$. Right side: $n\wedge\tau\uparrow\tau$, MCT gives $\to E[\tau]$. Hence
$$
E[\tau]=E[S_\tau^2]=b^2\frac{a}{a+b}+a^2\frac{b}{a+b}=\frac{ab(a+b)}{a+b}=ab .
$$
**Common pitfalls.** Applying the stopping theorem directly to $\tau$ (unbounded) without a limiting argument. Forgetting to prove $\tau<\infty$. Using DCT on $n\wedge\tau$ (it is not dominated a priori; use MCT).

#### Exercise M6 (★★, 20 min) - Example 4.35: Brownian exit from $]-a,b[$

$a,b>0$, $\tau=\inf\{t\ge0:B_t\notin\,]-a,b[\,\}$. Show $\tau<\infty$ a.s. and compute $P(B_\tau=b)$, $E[\tau]$.

**Strategy.** Same as M5 in continuous time; Cor. 4.34 (stopped right-continuous martingales) and Thm 4.33.

**Full solution.** $\tau$ is a stopping time (first exit of a continuous adapted process from an open set = hitting time of a closed set). By continuity, $B_\tau\in\{-a,b\}$ on $\{\tau<\infty\}$.

*$\tau<\infty$ a.s.* $P(\tau>t)\le P(-a<B_t<b)=\int_{-a}^b\frac{e^{-x^2/2t}}{\sqrt{2\pi t}}dx\le\frac{a+b}{\sqrt{2\pi t}}\to0$. (Alternatively from the computation of $E[\tau\wedge t]$ below: $E[\tau\wedge t]=E[B^2_{\tau\wedge t}]\le\max(a,b)^2$, so $E[\tau]<\infty$ by MCT.)

*Exit probabilities.* $(B_{t\wedge\tau})_t$ is a martingale (Cor. 4.34) with $|B_{t\wedge\tau}|\le\max(a,b)$, so $E[B_{t\wedge\tau}]=0$. As $t\to\infty$, $B_{t\wedge\tau}\to B_\tau$ a.s.; DCT gives $E[B_\tau]=0$, i.e. $bp-a(1-p)=0$:
$$
P(B_\tau=b)=\frac{a}{a+b},\qquad P(B_\tau=-a)=\frac{b}{a+b}.
$$
*Expected exit time.* $B_t^2-t$ is a continuous martingale; stopping: $E[B_{t\wedge\tau}^2]=E[t\wedge\tau]$. DCT on the left ($\le\max(a,b)^2$), MCT on the right:
$$
E[\tau]=E[B_\tau^2]=b^2\frac{a}{a+b}+a^2\frac{b}{a+b}=ab .
$$
**Extension (Baldi 5.10 c).** For $m$-dim BM and $\tau$ the exit time from the unit ball, $|B_t|^2-mt$ is a martingale and $E[\tau]=E|B_\tau|^2/m=1/m$.

**Pitfalls.** Same as M5. Also: "$B_\tau\in\{-a,b\}$" uses continuity of paths.

#### Exercise M7 (★★★, 25 min) - BM with drift: exit probabilities and mean exit time

Let $X_t=B_t+\mu t$, $\mu\ne0$, $a,b>0$, $\tau=\inf\{t:X_t\notin\,]-a,b[\,\}$. Compute $P(X_\tau=b)$ and $E[\tau]$.

**Strategy.** Find a function $f$ with $f(X_t)$ a martingale: try $e^{\theta X_t}=e^{\theta B_t+\theta\mu t}$; it is a martingale iff $\theta\mu=-\theta^2/2$, i.e. $\theta=-2\mu$. For $E[\tau]$ use the martingale $X_t-\mu t=B_t$.

**Full solution.** $\tau<\infty$ a.s.: $P(\tau>t)\le P(-a-\mu t<B_t<b-\mu t)\le\frac{a+b}{\sqrt{2\pi t}}\to0$.

$M_t=e^{-2\mu X_t}=\exp(-2\mu B_t-2\mu^2t)=\exp(\theta B_t-\frac{\theta^2}{2}t)$ with $\theta=-2\mu$, an exponential martingale (M1(e)). For $t\le\tau$, $X_t\in[-a,b]$, so $0<M_{t\wedge\tau}\le\max(e^{2\mu a},e^{-2\mu b})$. Hence $E[M_{t\wedge\tau}]=1$, and DCT ($t\to\infty$) gives $E[M_\tau]=1$. With $p=P(X_\tau=b)$:
$$
pe^{-2\mu b}+(1-p)e^{2\mu a}=1\ \Longrightarrow\ p=\frac{e^{2\mu a}-1}{e^{2\mu a}-e^{-2\mu b}} .
$$
Mean exit time: $B_t=X_t-\mu t$ is a martingale, so $E[X_{t\wedge\tau}]=\mu E[t\wedge\tau]$. Left side: $|X_{t\wedge\tau}|\le\max(a,b)$, DCT $\to E[X_\tau]$. Right side: MCT $\to\mu E[\tau]$. Hence
$$
E[\tau]=\frac{E[X_\tau]}{\mu}=\frac{bp-a(1-p)}{\mu}.
$$
Checks: as $\mu\to0$, $p\to\frac{2\mu a}{2\mu a+2\mu b}=\frac{a}{a+b}$ (M6). For $\mu>0$ and $a\to\infty$: $1-p=\frac{1-e^{-2\mu b}}{e^{2\mu a}-e^{-2\mu b}}\to0$ exponentially fast, $a(1-p)\to0$, so $E[\tau]\to b/\mu$ (mean hitting time of $b$ with drift $\mu$).

**Pitfalls.** Using $B_\tau$ instead of $X_\tau$ in the exponential; sign of $\theta$. Do not forget $\tau<\infty$.

#### Exercise M8 (★★★, 25 min) - hitting time of a level: Laplace transform, $E[\tau_a]=\infty$, failure of optional stopping

Let $a>0$ and $\tau_a=\inf\{t:B_t=a\}$. (a) Show $P(\tau_a<\infty)=1$ and $E[e^{-\lambda\tau_a}]=e^{-a\sqrt{2\lambda}}$, $\lambda>0$. (b) Show $E[\tau_a]=\infty$. (c) Show that $E[B_{\tau_a}]\ne E[B_0]$ and explain why this does not contradict Thm 4.33. Is $(B_{t\wedge\tau_a})_t$ UI?

**Strategy.** Exponential martingale $M_t=e^{\theta B_t-\theta^2t/2}$, $\theta>0$, stopped at $\tau_a$: bounded by $e^{\theta a}$.

**Full solution.** (a) $M^{\tau_a}$ is a martingale (Cor. 4.34) and $0<M_{t\wedge\tau_a}\le e^{\theta a}$ since $B_{t\wedge\tau_a}\le a$. As $t\to\infty$: on $\{\tau_a<\infty\}$, $M_{t\wedge\tau_a}\to e^{\theta a-\theta^2\tau_a/2}$; on $\{\tau_a=\infty\}$, $M_t\le e^{\theta a-\theta^2t/2}\to0$. By DCT,
$$
1=E[M_{t\wedge\tau_a}]\to E\big[e^{\theta a-\frac{\theta^2}{2}\tau_a}\mathbf 1_{\{\tau_a<\infty\}}\big],\qquad\text{i.e.}\qquad E\big[e^{-\frac{\theta^2}{2}\tau_a}\mathbf 1_{\{\tau_a<\infty\}}\big]=e^{-\theta a}.
$$
Let $\theta\downarrow0$: by MCT (the integrand increases to $\mathbf 1_{\{\tau_a<\infty\}}$), $P(\tau_a<\infty)=1$. With $\lambda=\theta^2/2$: $E[e^{-\lambda\tau_a}]=e^{-a\sqrt{2\lambda}}$.

(b) $\frac{1-e^{-\lambda\tau_a}}{\lambda}\uparrow\tau_a$ as $\lambda\downarrow0$ (the function $\lambda\mapsto(1-e^{-\lambda x})/\lambda$ is decreasing in $\lambda$), so by MCT
$$
E[\tau_a]=\lim_{\lambda\downarrow0}\frac{1-e^{-a\sqrt{2\lambda}}}{\lambda}=\lim_{\lambda\downarrow0}\frac{a\sqrt{2\lambda}+o(\sqrt\lambda)}{\lambda}=+\infty .
$$
(c) $B_{\tau_a}=a$, so $E[B_{\tau_a}]=a\ne0=E[B_0]$. Thm 4.33 requires $\tau_2$ to be **bounded**; $\tau_a$ is a.s. finite but unbounded (even $E[\tau_a]=\infty$). The stopped martingale $B_{t\wedge\tau_a}$ converges a.s. to $a$ but $E[B_{t\wedge\tau_a}]=0$; so it does not converge in $L^1$ and is **not UI** (Thm 4.30). (Also $\sup_tE[B^-_{t\wedge\tau_a}]<\infty$ since $E B^-_{t\wedge\tau_a}=E B^+_{t\wedge\tau_a}\le a$.)

**Pitfalls.** Forgetting the event $\{\tau_a=\infty\}$ in the limit (or assuming $\tau_a<\infty$ without justification; it can be quoted from the LIL/Ch. 2, but the argument above proves it). Claiming optional stopping for a.s. finite times.

#### Exercise M9 (★★, 20 min) - asymmetric random walk, Baldi Exercise 5.3

$Y_i$ i.i.d., $P(Y_i=1)=p$, $P(Y_i=-1)=q=1-p$, $q>p$. $X_n=Y_1+\dots+Y_n$, $Z_n=(q/p)^{X_n}$. (a) Show $X_n\to-\infty$ a.s. (b) Show $Z$ is a martingale and find $\lim Z_n$. (c) For $\tau=\inf\{n:X_n=b\text{ or }X_n=-a\}$ compute $P(X_\tau=b)$.

**Full solution.** (a) SLLN: $X_n/n\to p-q<0$ a.s., so $X_n\to-\infty$.
(b) Adapted, bounded for fixed $n$. $E[Z_{n+1}\mid\mathcal F_n]=Z_nE[(q/p)^{Y_{n+1}}]=Z_n\big(\frac qp\,p+\frac pq\,q\big)=Z_n(q+p)=Z_n$. Since $q/p>1$ and $X_n\to-\infty$, $Z_n\to0$ a.s. (Note $E[Z_n]=1$: not UI.)
(c) $\tau<\infty$ a.s. by (a) (the walk eventually goes below $-a$). $Z_{n\wedge\tau}\in[(q/p)^{-a},(q/p)^b]$ is a bounded martingale, so $E[Z_\tau]=1$ by DCT. With $r=q/p$ and $\pi=P(X_\tau=b)$: $\pi r^b+(1-\pi)r^{-a}=1$, hence
$$
P(X_\tau=b)=\frac{1-r^{-a}}{r^b-r^{-a}},\qquad r=\frac qp .
$$
**Pitfalls.** $X_n$ is not a martingale here ($E[Y]=p-q$); you need the exponential-type martingale $(q/p)^{X_n}$.

#### Exercise M10 (★★, 20 min) - uniform integrability: examples and counterexamples

(a) Double or nothing: $\xi_k$ i.i.d., $P(\xi_k=2)=P(\xi_k=0)=\frac12$, $M_n=\prod_{k=1}^n\xi_k$, $M_0=1$. Show $M$ is a martingale bounded in $L^1$, converging a.s. to $0$, not UI, and $E[\sup_nM_n]=\infty$.
(b) Show directly that $\{E[Y\mid\mathcal G]:\mathcal G\subset\mathcal F\}$ is UI for $Y\in L^1$ (Prop. 4.25).
(c) Show that a family bounded in $L^2$ is UI.
(d) Is $(B_t)_{t\ge0}$ UI? Is $(B_t)_{t\in[0,T]}$? Is $(B_{t\wedge\tau})_t$ for the exit time $\tau$ of M6?

**Full solution.** (a) $E[M_{n+1}\mid\mathcal F_n]=M_nE[\xi_{n+1}]=M_n$; $E|M_n|=E[M_n]=1$. $M_n=2^n$ with probability $2^{-n}$ and $0$ otherwise; $\{M_n\ne0\}$ decreases with $P\to0$, so $M_n\to0$ a.s. (consistent with Cor. 4.13). If $M$ were UI, by Thm 4.22 $E[M_n]\to E[0]=0$, contradicting $E[M_n]=1$. Directly: for $2^n>c$, $E[M_n\mathbf 1_{\{M_n>c\}}]=1$, so $\sup_nE[M_n\mathbf 1_{\{M_n>c\}}]=1\not\to0$. Finally $\sup_nM_n=2^N$ where $N$ = number of initial $2$'s, $P(N=n)=2^{-(n+1)}$, so $E[\sup_nM_n]=\sum_n2^n2^{-(n+1)}=\infty$: Doob's inequality fails for $p=1$.

(b) Let $Z=E[Y\mid\mathcal G]$. By Jensen $|Z|\le E[|Y|\mid\mathcal G]$, and $\{|Z|>c\}\in\mathcal G$, so
$$
E[|Z|\mathbf 1_{\{|Z|>c\}}]\le E\big[E[|Y|\mid\mathcal G]\mathbf 1_{\{|Z|>c\}}\big]=E[|Y|\mathbf 1_{\{|Z|>c\}}],\qquad P(|Z|>c)\le\frac{E|Z|}{c}\le\frac{E|Y|}{c}.
$$
Since $\{Y\}$ is UI, Prop. 4.23(b) gives: for $\varepsilon>0$ there is $\delta$ with $E[|Y|\mathbf 1_A]\le\varepsilon$ whenever $P(A)\le\delta$. Choose $c\ge E|Y|/\delta$: then $E[|Z|\mathbf 1_{\{|Z|>c\}}]\le\varepsilon$ for every $\mathcal G$. 

(c) On $\{|Y|>c\}$, $|Y|\le Y^2/c$: $\sup_YE[|Y|\mathbf 1_{\{|Y|>c\}}]\le\sup_YE[Y^2]/c\to0$.

(d) $(B_t)_{t\ge0}$ is not UI: $E|B_t|=\sqrt{2t/\pi}$ is unbounded, but UI families are bounded in $L^1$. On $[0,T]$: $B_t=E[B_T\mid\mathcal F_t]$, UI by Prop. 4.25 (also bounded in $L^2$). $(B_{t\wedge\tau})_t$ is bounded by $\max(a,b)$, hence UI (Example 4.21).

**Pitfalls.** Bounded in $L^1$ $\not\Rightarrow$ UI. a.s. convergence + bounded in $L^1$ $\not\Rightarrow$ $L^1$ convergence.

#### Exercise M11 (★★, 15 min) - applications of Doob's inequality

Show for $t,\lambda>0$: (a) $E[\sup_{s\le t}B_s^2]\le4t$ and $E[\sup_{s\le t}|B_s|]\le2\sqrt t$; (b) $P(\sup_{s\le t}|B_s|\ge\lambda)\le t/\lambda^2$; (c) $P(\sup_{s\le t}B_s\ge\lambda)\le e^{-\lambda^2/(2t)}$.

**Strategy.** (a) Thm 4.32 with $p=2$ for the martingale $M_s=B_{s\wedge t}$. (b), (c): maximal inequality Thm 4.28 for suitable supermartingales.

**Full solution.** (a) $M_s=B_{s\wedge t}$ is a continuous martingale (stopped at the deterministic time $t$) with $\sup_sE[M_s^2]=t$. By Thm 4.32 with $p=q=2$: $\|\sup_{s\le t}|B_s|\|_2\le2\sqrt t$, i.e. $E[\sup_{s\le t}B_s^2]\le4t$; by Cauchy-Schwarz $E[\sup_{s\le t}|B_s|]\le2\sqrt t$.

(b) $X_s=-B_s^2$ is a continuous supermartingale ($B^2$ is a submartingale). By the second inequality of Thm 4.28 (slide eq. (4.16)) with level $\lambda^2$: $\lambda^2P(\inf_{s\le t}X_s\le-\lambda^2)\le E|X_t|=t$, and $\{\inf_{s\le t}(-B_s^2)\le-\lambda^2\}=\{\sup_{s\le t}|B_s|\ge\lambda\}$.

(c) For $\theta>0$, $M_s=e^{\theta B_s-\theta^2s/2}$ is a positive continuous martingale, so $-M$ is a supermartingale; by the second inequality of Thm 4.28 (slide eq. (4.16)), $cP(\sup_{s\le t}M_s\ge c)\le E[M_t]=1$. For $s\le t$, $M_s\ge e^{\theta B_s-\theta^2t/2}$, so $\{\sup_{s\le t}B_s\ge\lambda\}\subset\{\sup_{s\le t}M_s\ge e^{\theta\lambda-\theta^2t/2}\}$ and
$$
P\Big(\sup_{s\le t}B_s\ge\lambda\Big)\le e^{-\theta\lambda+\theta^2t/2}.
$$
Minimize over $\theta$: $\theta=\lambda/t$ gives $e^{-\lambda^2/(2t)}$.

**Pitfalls.** Doob's $L^p$ inequality needs $p>1$; for (b) use the weak-type (maximal) inequality instead. In (c) the inclusion uses $\theta>0$ and $s\le t$.

#### Exercise M12 (★★, 15 min) - random series

$\varepsilon_k$ i.i.d. with $P(\varepsilon_k=\pm1)=\frac12$. Show $\sum_{k\ge1}\varepsilon_k/k$ converges a.s. and in $L^2$, and bound $E[\sup_n(\sum_{k\le n}\varepsilon_k/k)^2]$.

**Full solution.** $M_n=\sum_{k=1}^n\varepsilon_k/k$ is a martingale (Example 4.2(a): independent centered summands). By orthogonality, $E[M_n^2]=\sum_{k=1}^nE[\varepsilon_k^2]/k^2=\sum_{k=1}^n1/k^2\le\pi^2/6$. So $M$ is bounded in $L^2$; by Thm 4.19 it converges a.s. and in $L^2$, and by Thm 4.17 $E[\sup_nM_n^2]\le4\cdot\pi^2/6=2\pi^2/3$.

**Pitfalls.** The harmonic series $\sum1/k$ diverges, but random signs give convergence; with $\varepsilon_k/\sqrt k$, $E[M_n^2]=\sum1/k\to\infty$ and Thm 4.19 does not apply.

#### Exercise M13 (★★, 15 min) - Example 4.31: exponential martingale

$X_t=\exp(\lambda B_t-\frac{\lambda^2}{2}t)$, $\lambda\ne0$. Show: martingale; $X_\infty=\lim_tX_t$ exists and equals $0$ a.s.; $X$ is not UI.

**Full solution.** Martingale: M1(e). It is a positive continuous (super)martingale, so by Thm 4.29 $X_\infty$ exists a.s. and is finite. For $0<\alpha<1$,
$$
E[X_t^\alpha]=e^{-\alpha\frac{\lambda^2}{2}t}E[e^{\alpha\lambda B_t}]=e^{-\alpha\frac{\lambda^2}{2}t+\alpha^2\frac{\lambda^2}{2}t}=e^{-\alpha(1-\alpha)\frac{\lambda^2}{2}t}\to0 .
$$
By Fatou, $E[X_\infty^\alpha]\le\liminf_tE[X_t^\alpha]=0$, so $X_\infty=0$ a.s. If $X$ were UI, it would converge in $L^1$ (Thm 4.30), giving $1=E[X_t]\to E[X_\infty]=0$, contradiction. (Alternative for the limit: LIL, $\lambda B_t-\lambda^2t/2\to-\infty$.)

**Pitfalls.** "Converges a.s." does not mean "$E[X_\infty]=\lim E[X_t]$".

#### Exercise M14 (★★, 15 min) - showing a process is a BM with Theorem 4.42

Let $B=(B^1,B^2)$ be a 2-dim $(\mathcal F_t)$-BM. Show that the following are Brownian motions: (a) $W_t=\frac{1}{\sqrt2}(B^1_t+B^2_t)$ w.r.t. $(\mathcal F_t)$; more generally $\langle u,B_t\rangle$ for a unit vector $u$; (b) $OB_t$ for an orthogonal $2\times2$ matrix $O$; (c) $X_t=cB^1_{t/c^2}$, $c>0$, w.r.t. $\mathcal G_t=\mathcal F_{t/c^2}$; (d) show that $\sqrt2B^1_t$ is not a BM.

**Strategy.** All are continuous, adapted, start at $0$. Verify that $Y_t=\exp(i\langle\lambda,X_t\rangle+\frac12|\lambda|^2t)$ is a martingale, using the fact (converse of Thm 4.42) that for an $(\mathcal F_t)$-BM $E[e^{i\langle\mu,B_t-B_s\rangle}\mid\mathcal F_s]=e^{-\frac12|\mu|^2(t-s)}$.

**Full solution.** (a) $Y_t=\exp(i\lambda\langle u,B_t\rangle+\frac12\lambda^2t)$; $|Y_t|$ is bounded for fixed $t$; for $s<t$, with $\mu=\lambda u$,
$$
E[Y_t\mid\mathcal F_s]=e^{i\lambda\langle u,B_s\rangle+\frac12\lambda^2t}\,E\big[e^{i\langle\lambda u,B_t-B_s\rangle}\big]=e^{i\lambda\langle u,B_s\rangle+\frac12\lambda^2t}e^{-\frac12\lambda^2|u|^2(t-s)}=Y_s
$$
since $|u|=1$. By Thm 4.42 $\langle u,B\rangle$ is an $(\mathcal F_t)$-BM; $u=(1,1)/\sqrt2$ gives $W$.

(b) For $\lambda\in\mathbb R^2$, $\langle\lambda,OB_t\rangle=\langle O^*\lambda,B_t\rangle$ and $|O^*\lambda|=|\lambda|$; the same computation with $\mu=O^*\lambda$ shows $Y$ is a martingale.

(c) $X$ is continuous, $\mathcal G_t$-adapted, $X_0=0$. For $s<t$, $E[e^{i\lambda c(B^1_{t/c^2}-B^1_{s/c^2})}\mid\mathcal F_{s/c^2}]=e^{-\frac12\lambda^2c^2(t-s)/c^2}=e^{-\frac12\lambda^2(t-s)}$, which gives the martingale property of $Y_t=e^{i\lambda X_t+\lambda^2t/2}$ w.r.t. $(\mathcal G_t)$.

(d) For $X=\sqrt2B^1$: $E[e^{i\lambda(X_t-X_s)}\mid\mathcal F_s]=e^{-\lambda^2(t-s)}$, so $E[Y_t\mid\mathcal F_s]=Y_se^{-\frac12\lambda^2(t-s)}\ne Y_s$: not a martingale; indeed $X_t\sim N(0,2t)$.

**Pitfalls.** Thm 4.42 needs *every* $\lambda\in\mathbb R^m$ and continuity and $X_0=0$. For (c) the filtration must be time-changed too.

#### Exercise M15 (★, 10 min) - Theorem 4.37 in action

(a) Let $f\in C^1(\mathbb R_+)$ and $Z\in L^2$ be $\mathcal F_0$-measurable with $P(Z\ne0)>0$. Show that $M_t=f(t)Z$ is a martingale iff $f$ is constant. (b) Deduce that BM cannot have paths of finite variation on bounded intervals a.s.

**Full solution.** (a) If $f$ is constant, $M_t=f(0)Z$ is trivially a martingale. Conversely, $M$ is continuous, square integrable, and $t\mapsto f(t)Z(\omega)$ is $C^1$, hence of finite variation on bounded intervals. By Thm 4.37, $M_t=M_0$ for all $t$ a.s., i.e. $(f(t)-f(0))Z=0$ a.s.; on $\{Z\ne0\}$ (positive probability) this forces $f(t)=f(0)$. (Direct check: $E[M_t\mid\mathcal F_s]=f(t)Z$ must equal $f(s)Z$.)
(b) BM is a continuous square integrable martingale with $B_t\ne B_0$ for $t>0$ (since $B_t\sim N(0,t)$); if its paths had finite variation, Thm 4.37 would force $B\equiv0$.

#### Exercise M16 (★★★, 20 min) - zero is absorbing for positive martingales, Baldi Exercise 5.8

(a) $M\ge0$ martingale, $s<t$: show $\{M_s=0\}\subset\{M_t=0\}$ a.s. (b) $M\ge0$ right-continuous martingale with $M_T>0$ a.s.: show $P(M_t>0\ \forall t\le T)=1$.

**Full solution.** (a) $\{M_s=0\}\in\mathcal F_s$, so $E[M_t\mathbf 1_{\{M_s=0\}}]=E[M_s\mathbf 1_{\{M_s=0\}}]=0$. Since $M_t\ge0$, $M_t=0$ a.s. on $\{M_s=0\}$.
(b) Let $\tau=\inf\{t:M_t=0\}$, a stopping time (under the usual conditions). On $\{\tau<\infty\}$ there are $t_n\downarrow\tau$ with $M_{t_n}=0$ (or $M_\tau=0$ directly), so $M_\tau=0$ by right continuity. By Thm 4.33 applied to the bounded stopping times $0\le\tau\wedge T\le T$ (in the form $E[M_{\tau\wedge T}]=E[M_T]$, from $E[M_T\mid\mathcal F_{\tau\wedge T}]=M_{\tau\wedge T}$):
$$
E[M_T]=E[M_{T\wedge\tau}]=E[M_T\mathbf 1_{\{\tau>T\}}]+E[M_\tau\mathbf 1_{\{\tau\le T\}}]=E[M_T\mathbf 1_{\{\tau>T\}}],
$$
so $E[M_T\mathbf 1_{\{\tau\le T\}}]=0$; as $M_T>0$ a.s., $P(\tau\le T)=0$.

**Pitfalls.** The continuous counterexample in Baldi (a process positive at each fixed time but vanishing somewhere on every path) shows that the martingale property is essential.

#### Exercise M17 (★★, 15 min) - Baldi Exercise 5.5

$Y_k$ independent, $P(Y_k=1)=P(Y_k=-1)=2^{-k}$, $P(Y_k=0)=1-2^{1-k}$, $X_n=Y_1+\dots+Y_n$. (a) $X$ is a martingale. (b) Compute $\langle X\rangle$. (c) Does $X$ converge a.s., in $L^1$, in $L^2$?

**Full solution.** (a) $E[Y_k]=0$; sums of independent centered integrable r.v.'s (Example 4.2(a)). (b) $E[(X_n-X_{n-1})^2\mid\mathcal F_{n-1}]=E[Y_n^2]=2^{1-n}$, so $\langle X\rangle_n=\sum_{k=1}^n2^{1-k}=2(1-2^{-n})$, deterministic (independent increments). (c) $E[X_n^2]=\langle X\rangle_n\le2$: bounded in $L^2$, so by Thm 4.19 $X_n$ converges a.s. and in $L^2$, hence in $L^1$. (Also directly: $\sum_kP(Y_k\ne0)=\sum2^{1-k}<\infty$, so by Borel-Cantelli only finitely many $Y_k\ne0$.)

## 6. Predicted exam questions (ranked)

1. **State and prove the stopping theorem (Thm 4.6).** Integrability by $\sum_{j\le K}|X_j|$; case $\tau_2=K$ via $A\cap\{\tau_1=j\}\in\mathcal F_j$; general case via $X^{\tau_2}$.
2. **State and prove Doob's decomposition (Thm 4.5)**, possibly with a computation of the compensator of $M^2$ on a finite space (M3). Define $A_{n+1}-A_n=E[X_{n+1}\mid\mathcal F_n]-X_n$; uniqueness by conditioning increments.
3. **Prove that a stopped martingale is a martingale.** $\Delta X^\tau_{n+1}=\mathbf 1_{\{\tau\ge n+1\}}\Delta X_{n+1}$, $\{\tau\ge n+1\}\in\mathcal F_n$.
4. **Martingale checks for functions of BM** ($e^{B_t}$, $B_t^2-t$, $B_t^3-3tB_t$, $e^{\lambda B_t-\mu t}$). Freezing lemma, moments of $N(0,t-s)$ (M1).
5. **Conditional expectation computation** like $E[B_T^2(B_t-B_s)B_s^4\mid\mathcal F_s]=2(t-s)B_s^5$ (C1).
6. **State and prove Thm 4.12 (a.s. convergence)** with the statement of the upcrossing inequality. Upcrossings finite for rational pairs, Fatou for finiteness.
7. **Brownian exit problem**: $P(B_\tau=b)=a/(a+b)$, $E[\tau]=ab$ (M6); possibly with drift (M7) or Laplace transform of $\tau_a$ (M8).
8. **State and prove Doob's inequality (Thm 4.17)** (+ Lemma 4.18) and **Thm 4.19**. $|M|$ nonnegative submartingale, Lemma 4.18, MCT; domination $2^p(M^*)^p$.
9. **State and prove Thm 4.42** and apply it to show some process is a BM (M14). Conditional ch.f. deterministic $\Rightarrow$ Gaussian increments independent of the past.
10. **State and prove Thm 4.37** (bounded variation case). Orthogonal increments, $\sum(\Delta M)^2\le K\max|\Delta M|\to0$.
11. **Baldi Ex. 5.6 / 5.1**: characterization of martingales via bounded stopping times / constant expectation.
12. **Prove existence and uniqueness of conditional expectation (Thm 3.4)** and/or properties (d), (e), (f) of Prop. 3.7. Radon-Nikodym on $\mathcal D$; test with bounded $W$.
13. **Example 3.16 (Markov property) or Example 3.17 (BM at independent time)**: freezing lemma.
14. **UI**: define, give a martingale converging a.s. but not in $L^1$ (double or nothing, exponential martingale), state Thm 4.26.
15. **Gaussian conditioning**: $E[X\mid Y]$ for jointly Gaussian vectors (C5, C6).
16. **Short conceptual**: why boundedness is needed in optional stopping ($\tau_1$ for SRW, $\tau_a$ for BM); why $p>1$ in Doob ($E\sup M_n=\infty$ for double or nothing); $\langle B\rangle_t=t$.

## 7. Flashcards

1. Definition of $E[X\mid\mathcal D]$? $\to$ The a.s. unique $\mathcal D$-measurable (l.s.i.) $Z$ with $\int_DZ=\int_DX$ for all $D\in\mathcal D$.
2. Existence proof tool? $\to$ Radon-Nikodym for $Q(B)=\int_BX\,dP$ on $(\Omega,\mathcal D)$.
3. Uniqueness trick? $\to$ Integrate $Z_1-Z_2$ over $\{Z_1>Z_2\}\in\mathcal D$.
4. Tower property? $\to$ $\mathcal D\subset\mathcal D'$: $E[E[X\mid\mathcal D']\mid\mathcal D]=E[X\mid\mathcal D]$ (smaller $\sigma$-algebra wins).
5. Freezing lemma in one line? $\to$ $E[\psi(X,\cdot)\mid\mathcal D]=\Phi(X)$, $\Phi(x)=E[\psi(x,\cdot)]$, $X$ $\mathcal D$-measurable, $\psi(x,\cdot)$ independent of $\mathcal D$.
6. $E[X\mid Y]$ for jointly Gaussian scalars? $\to$ $m_X+\frac{\operatorname{Cov}(X,Y)}{\operatorname{Var}Y}(Y-m_Y)$, conditional variance $\operatorname{Var}X-\operatorname{Cov}^2/\operatorname{Var}Y$.
7. $E[B_t^3\mid\mathcal F_s]$? $\to$ $B_s^3+3(t-s)B_s$.
8. $L^2$ interpretation of $E[X\mid\mathcal D]$? $\to$ Orthogonal projection onto $L^2(\mathcal D)$, best predictor.
9. Is $e^{B_t}$ a martingale? $\to$ No, a submartingale; $e^{B_t-t/2}$ is a martingale.
10. Convex function of a martingale? $\to$ Submartingale (if integrable).
11. Doob decomposition increment? $\to$ $A_{n+1}-A_n=E[X_{n+1}\mid\mathcal F_n]-X_n$.
12. Compensator of $M^2$? $\to$ $\langle M\rangle_n=\sum_{k\le n}E[(M_k-M_{k-1})^2\mid\mathcal F_{k-1}]$.
13. Why is $X^\tau$ a martingale? $\to$ $\Delta X^\tau_{n+1}=\mathbf 1_{\{\tau>n\}}\Delta X_{n+1}$ and $\{\tau>n\}\in\mathcal F_n$.
14. Hypotheses of Thm 4.6? $\to$ Supermartingale, stopping times $\tau_1\le\tau_2\le K$ bounded.
15. Counterexample to optional stopping with finite $\tau$? $\to$ SRW or BM hitting $1$: $E[X_\tau]=1\ne0$.
16. Upcrossing inequality? $\to$ $(b-a)E[\gamma^k_{a,b}]\le E[(X_k-a)^-]$ for supermartingales.
17. Condition for a.s. convergence of a supermartingale? $\to$ $\sup_nE[X_n^-]<\infty$ (equivalently bounded in $L^1$).
18. Doob's $L^p$ inequality? $\to$ $\|\sup_n|M_n|\|_p\le\frac{p}{p-1}\sup_n\|M_n\|_p$, $p>1$.
19. Martingale bounded in $L^p$, $p>1$? $\to$ Converges a.s. and in $L^p$.
20. Martingale converges in $L^1$ iff? $\to$ UI iff closed: $M_n=E[Y\mid\mathcal F_n]$.
21. UI definition? $\to$ $\lim_{c\to\infty}\sup_YE[|Y|\mathbf 1_{\{|Y|>c\}}]=0$.
22. Sufficient for UI? $\to$ Dominated by $Z\in L^1$; bounded in $L^p$, $p>1$; conditional expectations of one $Y\in L^1$.
23. Exit probabilities of BM from $]-a,b[$? $\to$ $P(B_\tau=b)=\frac{a}{a+b}$, $E[\tau]=ab$.
24. $E[e^{-\lambda\tau_a}]$ for BM? $\to$ $e^{-a\sqrt{2\lambda}}$; $E[\tau_a]=\infty$.
25. Continuous martingale of finite variation? $\to$ Constant (Thm 4.37).
26. $\langle B\rangle_t$? $\to$ $t$.
27. Thm 4.42 hypothesis? $\to$ Continuous, $X_0=0$, $e^{i\langle\lambda,X_t\rangle+\frac12|\lambda|^2t}$ martingale for all $\lambda$.
28. Key step in Thm 4.42? $\to$ $E[e^{i\langle\lambda,X_t-X_s\rangle}\mid\mathcal F_s]=e^{-\frac12|\lambda|^2(t-s)}$ gives law and independence (Ex. 4.5).
29. Supermartingale with constant mean? $\to$ Martingale (Ex. 5.1).
30. Martingale criterion via stopping times? $\to$ $E[X_\tau]=E[X_0]$ for all bounded $\tau$; use $\tau=s\mathbf 1_A+t\mathbf 1_{A^c}$ (Ex. 5.6).
