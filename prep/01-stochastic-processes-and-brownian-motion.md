# Stochastic Processes and Brownian Motion

This chapter covers syllabus sections **1. Stochastic Processes** and **2. Basics of Brownian Motion**. It follows the lecturer's handwritten notes (`h26_lectures_1`, `h26_lectures_2`) and their numbering. Baldi Chapters 2 and 3 are the secondary reference: Baldi's "Theorem 2.1" is our Theorem 1.15, Baldi's "Proposition 3.1" is our Proposition 2.3, and so on.

A note on numbering. In the handwritten notes the proposition inside the sketch of proof of Theorem 1.20 and the remark after that proof are both labelled 1.21. The theorem on Lévy's modulus of continuity is listed in the final syllabus as Theorem 2.12 (the handwriting can also be read as 2.11). This file uses the syllabus labels.

## 1. Exam relevance

| Item | Tag | Likelihood | Why |
|---|---|---|---|
| All definitions (process, filtrations, modification, indistinguishable, measurable, progressive, usual conditions, f.d.d., stopping time, F_tau, BM, m-dim BM, variation) | S | Very high | "Define X" questions are cheap to set. Modification vs indistinguishable and adapted vs progressive are the classic concept checks. |
| Example 1.5 (modification but not indistinguishable) | S | High | The standard counterexample. Know it by heart. |
| Prop 1.9 (right-continuous adapted implies progressive) | S&P | High | Short and clean, an ideal 15-minute "state and prove". |
| Thm 1.15 / Cor 1.16 (Kolmogorov continuity) | S | High | Used constantly. Typical task: apply it to BM or to a Gaussian process. |
| Example 1.17 (BM has a continuous, gamma-Hölder modification for gamma < 1/2) | S | High | The standard application of Thm 1.15. |
| Prop 1.19 + Carathéodory criterion | S&P | High | Short proof. You must state Carathéodory's criterion precisely. |
| Thm 1.20 (Daniell–Kolmogorov) | S | Medium | Statement with hypotheses (complete separable metric space, consistency). |
| Example 1.22 (Gaussian processes, positive definite kernels) | S | Medium | Needed to construct BM. Combines with Thm 1.20. |
| Prop 1.25 (stopping time implies optional; equivalent if right-continuous) | P | High | Very short proof. A safe exam question. |
| Prop 1.27 (exit times from open/closed sets are stopping times) | P | Medium–high | Part (a) proved in the notes. Part (b) was "Exercise", so it is a natural exam question. |
| Prop 1.28 (properties of stopping times and F_tau) | P | High | Four short items. Very exam-friendly. |
| Prop 1.29 (X_tau is F_tau-measurable) | P | High | Explains why progressive measurability matters. |
| Prop 2.3 (BM as a Gaussian process) | S&P | Very high | The central characterization. Used in almost every "show that X is a BM" exercise. |
| Prop 2.4 (invariance: shift, symmetry, scaling, time inversion) | P | Very high | Proof plus continuity of time inversion at 0. Also a source of exercises. |
| Lemma 2.8 (independence via pi-systems) | S | Medium | A tool in many proofs. |
| Remark 2.9, Remark 2.10 (formulas) | S | High (as tools) | Needed in computations. |
| Thm 2.12 (Lévy modulus) | S | Medium | State it precisely. |
| Cor 2.13 (no Hölder paths with gamma >= 1/2) | S&P | High | A short proof built on Thm 2.12. |
| Prop 2.15 (L^2 quadratic variation; infinite variation) | S&P | Very high | The most likely proof question of section 2. The computation recurs in Itô calculus. |
| Thm 2.16 (LIL) | S | Medium–high | Statement, plus how (b), (c), (d) follow from (a). Applications in exercises. |
| Remark 2.17 (consequences of LIL) | S | Medium | Recurrence, oscillation. |
| Lemma 2.18, Thm 2.19 (strong Markov / stopping theorem for BM) | S | Medium | State precisely, especially "a.s. finite stopping time" and "independent of F_tau". |
| Remark 2.7 (augmented filtration) | excluded | Low | Excluded by the syllabus. |

**Where the points are.** For the section 1–2 part of the exam, expect most likely one proof from {Prop 1.9, Prop 1.19, Props 1.25/1.27/1.28/1.29, Prop 2.3, Prop 2.4, Cor 2.13, Prop 2.15}, plus a computational "show this is a BM / compute this covariance" problem.

## 2. Core definitions and facts

### 2.1 Stochastic processes (notes Section 1.1)

**Definition 1.1 (Baldi's definition).** A *stochastic process* is an object
$$
X=\big(\Omega,\mathcal F,(\mathcal F_t)_{t\in T},(X_t)_{t\in T},P\big)
$$
where

- $(\Omega,\mathcal F,P)$ is a probability space;
- $T\subset\mathbb R^+$ is the time set;
- $(\mathcal F_t)_{t\in T}$ is a *filtration*, i.e. an increasing family of sub-$\sigma$-algebras of $\mathcal F$: $\mathcal F_s\subset\mathcal F_t$ if $s\le t$;
- $(X_t)_{t\in T}$ is a family of random variables on $(\Omega,\mathcal F)$ with values in a measurable space $(E,\mathcal E)$, and it is *adapted*: $X_t$ is $\mathcal F_t$-measurable for every $t\in T$.

**Usual definition.** A stochastic process $X=(X_t)_{t\in T}$ is a family, indexed by $T\subset\mathbb R^+$, of random variables with values in a measurable space $(E,\mathcal E)$. Baldi's definition is the precise one. The usual one is what people actually write.

**Facts and terminology.**

- **Natural filtration.** If $s\le t$, then $X_s$ is $\mathcal F_s\subset\mathcal F_t$-measurable. Hence $\mathcal G_t:=\sigma(X_s,\ s\le t)\subset\mathcal F_t$. $(\mathcal G_t)_t$ is the *natural filtration* of $X$, written $\mathcal F^X_t:=\mathcal G_t$. It is the smallest filtration to which $X$ is adapted.
- **Interpretation.** $\mathcal F_t$ contains the information generated by $X$ up to time $t$ (and possibly more).
- **$\mathcal F_\infty$.** $\bigcup_t\mathcal F_t$ is in general **not** a $\sigma$-algebra. $\mathcal F_\infty:=\bigvee_{t\in T}\mathcal F_t$ is the smallest $\sigma$-algebra containing $\bigcup_t\mathcal F_t$. It can be strictly smaller than $\mathcal F$.
- **Augmented natural filtration.** $\overline{\mathcal G}_t:=\sigma(\mathcal G_t,\mathcal N)$, where $\mathcal N=\{A\in\mathcal F: P(A)=0\}$ are the negligible events.
- **State space.** The measurable space $E$, mostly $(\mathbb R^m,\mathcal B(\mathbb R^m))$.
- **Path space.** A process is a map $X:\Omega\to E^T$, $\omega\mapsto X_\cdot(\omega)=(t\mapsto X_t(\omega))$, so $\Omega$ can be viewed as a subset of $E^T$ (all functions $T\to E$). $t\mapsto X_t(\omega)$ is the *path* (trajectory) of $\omega$.

### 2.2 Notions of equality between processes (notes Section 1.2)

**Definition 1.2 (equivalent).** $X$ and $X'$, possibly defined on different probability spaces, are *equivalent* if for all $t_1,\dots,t_m\in T$
$$
(X_{t_1},\dots,X_{t_m})\stackrel{d}{=}(X'_{t_1},\dots,X'_{t_m}),
$$
i.e. they have the same finite-dimensional distributions.

From now on both processes live on the same probability space.

**Definition 1.3 (modification / version).** $X$ is a *modification* (or *version*) of $X'$ if
$$
P(X_t=X'_t)=1\quad\text{for every }t\in T.
$$

**Definition 1.4 (indistinguishable).** $X$ and $X'$ are *indistinguishable* if
$$
P(X_t=X'_t\ \text{for all }t\in T)=1.
$$

The quantifier position matters. For a modification the null set $\{X_t\neq X'_t\}$ may depend on $t$. For indistinguishability there is a single null set. We have
$$
\text{indistinguishable}\ \Longrightarrow\ \text{modification}\ \Longrightarrow\ \text{equivalent}.
$$
(The second implication: $\{(X_{t_1},\dots,X_{t_n})\neq(X'_{t_1},\dots,X'_{t_n})\}=\bigcup_i\{X_{t_i}\neq X'_{t_i}\}$ is a finite union of null sets.)

**Example 1.5.** $\Omega=[0,1]$, $\mathcal F=\mathcal B([0,1])$, $P=\lambda$ (Lebesgue measure), $T=[0,1]$. Let
$$
X_t(\omega)=\mathbf 1_{\{\omega\}}(t)=\mathbf 1_{\{t=\omega\}},\qquad X'_t\equiv 0.
$$
$X'$ is a modification of $X$, since $\{X_t\neq X'_t\}=\{t\}$ and $P(\{t\})=\lambda(\{t\})=0$. But they are not indistinguishable, since $\{\omega: X_t(\omega)=X'_t(\omega)\ \forall t\}=\emptyset$ (for each $\omega$, $X_\omega(\omega)=1\neq0$). Note also that $X'$ is continuous while no path of $X$ is continuous. **Continuity is lost (or gained) when modifying a process.**

From now on $E$ is a topological space with its Borel $\sigma$-algebra $\mathcal B(E)$, and $T$ is an interval of $\mathbb R^+$.

**Definition 1.6 (continuous).** $X$ is *continuous* (resp. *a.s. continuous*) if for every $\omega$ (resp. for a.e. $\omega$) the map $t\mapsto X_t(\omega)$ is continuous. *Right continuous* and *a.s. right continuous* are defined in the same way.

**Fact (Baldi Ex. 2.1).** If $X,X'$ are modifications of each other and both are a.s. (right-)continuous, they are indistinguishable. Proof in Exercise 1 below.

### 2.3 Measurability (notes Section 1.2, continued)

**Definition 1.7 (measurable).** $X$ is *(jointly) measurable* if
$$
X:T\times\Omega\to E,\qquad (t,\omega)\mapsto X_t(\omega)
$$
is $(\mathcal B(T)\otimes\mathcal F,\ \mathcal B(E))$-measurable.

**Definition 1.8 (progressively measurable).** $X$ is *progressively measurable* if for every $t\in T$ the map
$$
X|_{[0,t]}:[0,t]\times\Omega\to E,\qquad (s,\omega)\mapsto X_s(\omega)
$$
is $(\mathcal B([0,t])\otimes\mathcal F_t,\ \mathcal B(E))$-measurable. This definition depends on the filtration $\mathbb F=(\mathcal F_t)_t$.

**Facts.** Progressive implies adapted: for fixed $t$, $\omega\mapsto X_t(\omega)$ is the section at $s=t$ of an $\mathcal B([0,t])\otimes\mathcal F_t$-measurable map, hence $\mathcal F_t$-measurable. Progressive implies measurable when $T=\mathbb R^+$: $\{(s,\omega):X_s(\omega)\in\Gamma\}=\bigcup_n\{(s,\omega)\in[0,n]\times\Omega: X_s(\omega)\in\Gamma\}$, and each set in the union lies in $\mathcal B([0,n])\otimes\mathcal F_n\subset\mathcal B(\mathbb R^+)\otimes\mathcal F$.

**Proposition 1.9.** A right-continuous (adapted) process is progressively measurable. Proof in Section 4.

**Example 1.10 (why measurability of $X$ is needed).** Let $\tau\ge0$ be a random variable. Is $X_\tau:\omega\mapsto X_{\tau(\omega)}(\omega)$ a random variable? If $X$ is measurable, then $X_\tau$ is the composition of the measurable maps $\omega\mapsto(\tau(\omega),\omega)$ and $(t,\omega)\mapsto X_t(\omega)$, hence measurable. Without joint measurability there is no reason for this.

**Example 1.11 (why progressive measurability is needed).** One often considers
$$
Y_t(\omega)=\int_0^t X_s(\omega)\,ds
$$
(assuming $s\mapsto X_s$ is integrable a.s.). Is $Y$ adapted? If $X$ is progressively measurable, then $(s,\omega)\mapsto X_s(\omega)$ on $[0,t]\times\Omega$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable, and Fubini's theorem gives that $\omega\mapsto\int_0^tX_s(\omega)\,ds=Y_t$ is $\mathcal F_t$-measurable. So $Y$ is adapted, and being continuous, it is progressively measurable by Prop 1.9. Mere joint measurability plus adaptedness would only give $\mathcal F$-measurability of $Y_t$ via Fubini.

### 2.4 Assumptions on the filtration (notes Section 1.3)

Define $\mathcal F_{t+}:=\bigcap_{\varepsilon>0}\mathcal F_{t+\varepsilon}$. It is a $\sigma$-algebra (an intersection of $\sigma$-algebras), and $\mathcal F_t\subset\mathcal F_{t+}$.

**Definition 1.12.** $(\mathcal F_t)$ is *right-continuous* if $\mathcal F_{t+}=\mathcal F_t$ for every $t$.

**Definition 1.13 (usual conditions).** $(\mathcal F_t)$ satisfies the *usual conditions* if (i) it is right-continuous, and (ii) for every $t$, $\mathcal F_t$ contains the negligible events of $\mathcal F$.

**Example 1.14.** Let $X$ be a process and $(Y_t)_t$ random variables with $X_t=Y_t$ a.s. for every $t$. In general this does **not** imply that $Y$ is a stochastic process in Baldi's sense, i.e. $\mathcal F_t$-adapted: $Y_t$ may fail to be $\mathcal F_t$-measurable because the negligible event $N_t=\{X_t\neq Y_t\}$ need not belong to $\mathcal F_t$. If $(\mathcal F_t)$ satisfies the usual conditions this problem vanishes: modifications of adapted processes stay adapted. In particular an a.s. continuous process always has a continuous modification (set it equal to $X$ off the null set of discontinuous paths and to a constant on that set; the null set is in every $\mathcal F_t$).

### 2.5 Kolmogorov's continuity theorem (notes Section 1.4)

**Theorem 1.15** and **Corollary 1.16**: see Section 3.

**Example 1.17 (BM has a continuous modification).** $B=(\Omega,\mathcal F,(\mathcal F_t)_{t\ge0},(B_t)_{t\ge0},P)$ is a BM if $B_0=0$ a.s., $B_t-B_s$ is independent of $\mathcal F_s$, and $B_t-B_s\sim N(0,t-s)$ for $0\le s\le t$. Then $B_t-B_s\stackrel d=(t-s)^{1/2}Z$ with $Z\sim N(0,1)$, so
$$
E\big[|B_t-B_s|^\beta\big]=|t-s|^{\beta/2}E\big[|Z|^\beta\big]=c_\beta\,|t-s|^{1+(\beta/2-1)}.
$$
Since $E|Z|^\beta<\infty$ for every $\beta>0$, take $\beta>2$ and $\alpha=\beta/2-1>0$ in Cor 1.16. Then $B$ has a continuous modification that is Hölder continuous with exponent $\gamma$ for every $\gamma<\alpha/\beta=\tfrac12-\tfrac1\beta$. Since $\beta$ is arbitrary, this holds for every $\gamma<\tfrac12$.

### 2.6 Construction of stochastic processes (notes Section 1.5)

**Definition 1.18 (finite-dimensional distributions).** The f.d.d. of a process $X$ with values in $(E,\mathcal B(E))$ are the probability measures $\mu_\pi$, $\pi=(t_1,\dots,t_n)$, $t_1<\dots<t_n$, where $\mu_\pi$ is the law of the random vector $X_\pi=(X_{t_1},\dots,X_{t_n})$ on $E^n$. Two processes are equivalent iff they have the same f.d.d.

**Proposition 1.19** and **Carathéodory's criterion**: see Sections 3 and 4.

**The converse problem.** Given $E$, $T$, and a family $(\mu_\pi)_{\pi\in\Pi}$ of probabilities ($\Pi$ = all $n$-tuples of distinct elements of $T$, $n\in\mathbb N$), is there an $E$-valued process with these f.d.d.? For general $E$ the answer is negative. If $E$ is nice and the family is consistent, it is positive.

**Assumption C (consistency).** A family $(\mu_J)_{J\subset T,\ \#J<\infty}$ of probability distributions ($\mu_J$ on $E^{\#J}$) is *consistent* if for all finite $K\subset J\subset T$
$$
\mu_K(B)=\mu_J\circ p_{J,K}^{-1}(B),\qquad B\in\mathcal B(E)^{\#K},
$$
where $p_{J,K}:E^{\#J}\to E^{\#K}$ is the natural projection.

*Baldi's version.* If $\pi=(t_1,\dots,t_n)$, $\pi'=(t_1,\dots,t_{i-1},t_{i+1},\dots,t_n)$ and $p_i(x_1,\dots,x_n)=(x_1,\dots,x_{i-1},x_{i+1},\dots,x_n)$, then $\mu_{\pi'}=\mu_\pi\circ p_i^{-1}$.

*Øksendal's version.* For all $t_1,\dots,t_n\in T$, $n\in\mathbb N$, $B_1,\dots,B_n\in\mathcal B(E)$:

- $\mu_{t_{\sigma(1)},\dots,t_{\sigma(n)}}(B_1\times\dots\times B_n)=\mu_{t_1,\dots,t_n}(B_{\sigma^{-1}(1)}\times\dots\times B_{\sigma^{-1}(n)})$ for all permutations $\sigma$;
- $\mu_{t_1,\dots,t_n}(B_1\times\dots\times B_n)=\mu_{t_1,\dots,t_n,t_{n+1},\dots,t_{n+m}}(B_1\times\dots\times B_n\times E\times\dots\times E)$ ($m$ copies of $E$) for all $m\in\mathbb N$.

**Theorem 1.20 (Daniell 1918, Kolmogorov 1933)**: see Section 3.

**Sketch of proof of Theorem 1.20 (for understanding; not required).** Take $\Omega=E^T=\{\omega:T\to E\}$ and the class of cylinder sets with rectangular base
$$
\mathcal C=\{A\subset\Omega:\ A=\{\omega:(\omega(t_1),\dots,\omega(t_n))\in B_1\times\dots\times B_n\}\},
$$
which generates an algebra on which $\tilde P(A):=\mu_{t_1,\dots,t_n}(B_1\times\dots\times B_n)$ is well defined (by consistency), finitely additive, and $\tilde P(\Omega)=1$. One shows (Karatzas–Shreve, pp. 51–52) that $\tilde P$ is $\sigma$-additive using:

> **Proposition 1.21 (in the sketch).** If $P_0$ is a finitely additive probability on an algebra $\mathcal G$ of subsets of $\Omega$, and $P_0(E_n)\downarrow0$ whenever $E_n\in\mathcal G$, $E_n\downarrow\emptyset$, then $P_0$ is $\sigma$-additive on $\mathcal G$.

Carathéodory's extension theorem extends $\tilde P$ to a probability $P$ on $\mathcal F=\sigma(\mathcal C)$. Define the coordinate process $X_t(\omega)=\omega(t)$. Then $\{X_t\in B\}\in\mathcal C\subset\mathcal F$, so $X_t$ is a random variable, and
$$
P\Big(\bigcap_{j=1}^n\{X_{t_j}\in B_j\}\Big)=\tilde P\Big(\Big\{\omega:\bigcap_{j=1}^n\{\omega(t_j)\in B_j\}\Big\}\Big)=\mu_{t_1,\dots,t_n}(B_1\times\dots\times B_n).
$$

**Remark 1.21.**

- $\sigma(\mathcal C)$ is denoted $\mathcal B(E)^T$. It is the smallest $\sigma$-algebra on $E^T$ making all coordinate projections measurable.
- Let $\mathcal C_\infty=\{\omega\in E^T:(\omega(t_1),\omega(t_2),\dots)\in B_1\times B_2\times\cdots\}$ be the cylinders with countably infinite base. Then every set of $\mathcal B(E)^T$ is of this form (it depends on countably many coordinates only).
- So $\mathcal B(E)^T$ is a "small" $\sigma$-algebra. It does **not** contain $C(T;E)\subset E^T$: otherwise one could decide whether a function is continuous from its values at countably many points, which is false (think of the Dirichlet function $\mathbf 1_{\mathbb Q}(t)$, $t\in[0,1]$, which agrees with the continuous function $1$ on the rationals).
- Hence Theorem 1.20 alone cannot construct a process with continuous paths. With Theorem 1.15 we can then find a continuous version (e.g. for BM).
- Other theorems, with a similar measure-theoretic flavour, build the process directly on $C(T;E)$.

**Example 1.22 (Gaussian processes).** An $\mathbb R^m$-valued process $(X_t)_t$ is *Gaussian* iff its f.d.d. are Gaussian. Define

- the *mean function* $b_t=E[X_t]$;
- the *covariance function* $K^{ij}_{s,t}=\operatorname{Cov}(X_i(s),X_j(t))=E[(X_i(s)-b^i_s)(X_j(t)-b^j_t)]$, $1\le i,j\le m$.

These two functions completely determine the f.d.d. For instance, $(X_s,X_t)$ is Gaussian with mean $(b_s,b_t)$ and $2m\times2m$ covariance matrix $\begin{pmatrix}K_{s,s}&K_{s,t}\\K_{t,s}&K_{t,t}\end{pmatrix}$. The same structure holds for $(X_{t_1},\dots,X_{t_n})$.

Conversely, take $m=1$. A real function $C(s,t)$ is a *positive (definite) kernel* if for every $t_1,\dots,t_n\in\mathbb R^+$ and $\xi_1,\dots,\xi_n\in\mathbb R$
$$
\sum_{i,j=1}^nC(t_i,t_j)\xi_i\xi_j\ge0,
$$
i.e. the matrix $(C(t_i,t_j))_{ij}$ is positive semi-definite. Every covariance function is a positive definite kernel, since $(K_{t_i,t_j})_{ij}$ is a covariance matrix. Conversely, if $K$ is a positive definite kernel (symmetric), let $\mu_\pi$ be the centered Gaussian law with covariance matrix $\Gamma_{ij}=K_{t_i,t_j}$. Consistency (Baldi's version): $\mu_\pi\circ p_i^{-1}$ is Gaussian (the image of a Gaussian law under a linear map) with covariance matrix $\Gamma'$, obtained from $\Gamma$ by deleting the $i$-th row and column. That is exactly $\mu_{\pi'}$. By Theorem 1.20 there is a centered Gaussian process $X$ with covariance $K$, and $Y_t=X_t+b_t$ has mean $b$ and covariance $K$.

### 2.7 Stopping times (notes Section 1.6)

A *random time* is a measurable map $\sigma:\Omega\to[0,+\infty]$.

**Definition 1.23.** Let $(\mathcal F_t)$ be a filtration. A random variable $\tau:\Omega\to T\cup\{+\infty\}$ is a *stopping time* if
$$
\{\tau\le t\}\in\mathcal F_t\quad\text{for all }t\in T.
$$
The $\sigma$-algebra of events prior to $\tau$ is
$$
\mathcal F_\tau=\{A\in\mathcal F_\infty:\ A\cap\{\tau\le t\}\in\mathcal F_t\ \ \forall t\in T\},\qquad \mathcal F_\infty=\bigvee_t\mathcal F_t.
$$
If $\{\tau<t\}\in\mathcal F_t$ for all $t\in T$, $\tau$ is an *optional time*.

**Remark 1.24.**

- $\tau$ may take the value $+\infty$. (Then $X_\tau$ is not always well defined: $X_\infty$ may not exist.)
- $\{\tau\le t\}\in\mathcal F_t$ means that at time $t$ we can decide whether $\tau\le t$ has occurred.
- A typical example is the first time the path of a process "touches" a set.
- A random time that is **not** a stopping time: the last time the path visits a set.
- $\mathcal F_\tau$ is intuitively the $\sigma$-algebra of events for which, at time $\tau$, we can decide whether they have occurred.

**Proposition 1.25.** Every stopping time is an optional time. If $(\mathcal F_t)$ is right-continuous, $\tau$ is an optional time iff it is a stopping time. (Proof in Section 4.)

**Example 1.26 (exit and entry times).** Let $(X_t)_{t\in\mathbb R^+}$ be $\mathbb R^d$-valued, adapted, with a.s. right-continuous paths, and $\Gamma\in\mathcal B(\mathbb R^d)$. The random time
$$
\tau_\Gamma(\omega):=\inf\{t\ge0: X_t(\omega)\notin\Gamma\}\qquad(\inf\emptyset=+\infty)
$$
is the *exit time* of $\Gamma$ by $X$, and $\sigma_\Gamma:=\tau_{\Gamma^c}=\inf\{t\ge0:X_t\in\Gamma\}$ is the *entry* (or *hitting*) time of $\Gamma$ by $X$.

**Proposition 1.27.** $E$ a metric space, $X$ an $E$-valued continuous adapted process. (a) If $A$ is open, $\tau_A$ is a stopping time. (b) If $F$ is closed and $(\mathcal F_t)$ is right-continuous, $\tau_F$ is a stopping time. (Proof in Section 4.) *Surprisingly, a more general result holds:* for any measurable $A$, $\tau_A$ is a stopping time (under the usual conditions; this is the "début theorem", not examinable).

**Proposition 1.28.** Let $\sigma,\tau$ be stopping times. Then (a) $\tau$ is $\mathcal F_\tau$-measurable; (b) $\sigma\vee\tau$ and $\sigma\wedge\tau$ are stopping times; (c) if $\sigma\le\tau$ then $\mathcal F_\sigma\subset\mathcal F_\tau$; (d) $\mathcal F_{\sigma\wedge\tau}=\mathcal F_\sigma\cap\mathcal F_\tau$. (Proof in Section 4.)

**Fact.** If $t\in\mathbb R^+$, the constant $\sigma\equiv t$ is a stopping time ($\{\sigma\le s\}$ is $\emptyset$ or $\Omega$). Hence if $\tau$ is a stopping time, $\tau\wedge t$ is a **bounded** stopping time, by Prop 1.28(b).

**Proposition 1.29.** If $\tau$ is an a.s. finite stopping time and $X$ is progressively measurable, then $X_\tau$ is an $\mathcal F_\tau$-measurable random variable. (Proof in Section 4.)

### 2.8 Brownian motion: definition and Gaussian structure

**Definition 2.1.** A real-valued process $B=(\Omega,\mathcal F,(\mathcal F_t)_{t\ge0},(B_t)_{t\ge0},P)$ is a (standard) *Brownian motion* if

1. $B_0=0$ a.s.;
2. for all $0\le s\le t$, $B_t-B_s$ is independent of $\mathcal F_s$;
3. for all $0\le s\le t$, $B_t-B_s\sim N(0,t-s)$.

Recall that $B$ is adapted (Baldi's definition 1.1).

**Remark 2.2.**

a) (ii) implies $B_t-B_s$ is independent of $B_u$ for all $0\le u\le s$, because $B_u$ is $\mathcal F_s$-measurable. Indeed $B_t-B_s$ is independent of $\sigma(B_u,\ u\le s)$: the increments after $s$ are independent of the path up to time $s$.

b) $B$ is a Gaussian process. Let $\alpha_1,\dots,\alpha_m\in\mathbb R$, $0\le t_1<\dots<t_m$. We show by induction on $m$ that $\alpha_1B_{t_1}+\dots+\alpha_mB_{t_m}$ is Gaussian. For $m=1$, $\alpha B_{t_1}\sim N(0,\alpha^2t_1)$. For the step,
$$
\alpha_1B_{t_1}+\dots+\alpha_mB_{t_m}=\underbrace{\big(\alpha_1B_{t_1}+\dots+(\alpha_{m-1}+\alpha_m)B_{t_{m-1}}\big)}_{A}+\underbrace{\alpha_m\big(B_{t_m}-B_{t_{m-1}}\big)}_{B'} .
$$
$A$ is Gaussian by the induction hypothesis, $B'$ is Gaussian by (iii), and $A$ is independent of $B'$ by (a) ($A$ is $\mathcal F_{t_{m-1}}$-measurable). A sum of independent Gaussians is Gaussian.

c) For $0\le t_1<\dots<t_m$ the increments $B_{t_k}-B_{t_{k-1}}$, $k=1,\dots,m$ ($t_0=0$), are independent and Gaussian, hence jointly Gaussian and pairwise uncorrelated.

d) If $B$ is an $(\mathcal F_t)$-BM, then $\mathcal G_t=\sigma(B_s,\ s\le t)\subset\mathcal F_t$. Moreover, $B$ is then also an $(\mathcal F'_t)$-BM for any filtration with $\mathcal G_t\subset\mathcal F'_t\subset\mathcal F_t$, because $B_t-B_s$ independent of $\mathcal F_s$ implies $B_t-B_s$ independent of $\mathcal F'_s$. $B$ is a *natural Brownian motion* if $\mathcal F_t=\mathcal G_t$.

**Proposition 2.3 (BM as a Gaussian process).** If $B$ is a BM then (1) $B_0=0$ a.s.; (2) for all $0\le t_1<\dots<t_m$, $(B_{t_1},\dots,B_{t_m})$ is an $m$-dimensional **centered** normal vector; (3) $E[B_sB_t]=s\wedge t$. Conversely, (1), (2), (3) imply that $B$ is a **natural** BM. (Proof in Section 4.)

**Existence of BM.** By Example 1.22 it suffices to check that $K(s,t)=s\wedge t$ is a positive definite kernel, i.e. that for $t_1\le\dots\le t_m$ the matrix $\Gamma_{ij}=t_i\wedge t_j$ is positive semi-definite. Let $Z_1,\dots,Z_m$ be independent, centered Gaussian, with $\operatorname{Var}(Z_i)=t_i-t_{i-1}$ ($t_0=0$), and $X_i=Z_1+\dots+Z_i$. For $i\le j$,
$$
\operatorname{Cov}(X_i,X_j)=\sum_{k=1}^i\operatorname{Var}(Z_k)+\sum_{k\neq l}\operatorname{Cov}(Z_k,Z_l)=t_1+(t_2-t_1)+\dots+(t_i-t_{i-1})=t_i=t_i\wedge t_j .
$$
So $\Gamma$ is a covariance matrix, hence positive semi-definite. By Theorem 1.20 a centered Gaussian process with covariance $s\wedge t$ exists, and by Prop 2.3 it is a natural BM. By Example 1.17 it has a continuous modification.

**Proposition 2.4 (invariance properties).** Let $B$ be an $(\mathcal F_t)$-BM. Then

1. $X_t=B_{t+s}-B_s$ ($s\ge0$ fixed) is a BM w.r.t. $(\mathcal F_{t+s})_{t\ge0}$;
2. $Y_t=-B_t$ is a BM w.r.t. $(\mathcal F_t)_{t\ge0}$;
3. $M_t=cB_{t/c^2}$ ($c\neq0$) is a BM w.r.t. $(\mathcal F_{t/c^2})_{t\ge0}$ (*Brownian scaling*);
4. $Z_t=tB_{1/t}$ for $t>0$, $Z_0=0$ is a BM w.r.t. its natural filtration $(\mathcal F^Z_t)_{t\ge0}$ (*time inversion*).

(Proof in Section 4.)

**Definition 2.5 ($m$-dimensional BM).** An $\mathbb R^m$-valued process $X=(\Omega,\mathcal F,(\mathcal F_t)_{t\ge0},(X_t)_{t\ge0},P)$ is an $m$-dimensional Brownian motion if (a) $X_0=0$; (b) for $0\le s\le t$, $X_t-X_s$ is independent of $\mathcal F_s$; (c) for $0\le s\le t$, $X_t-X_s\sim N(0,(t-s)I_m)$.

**Remark 2.6.**

a) Each component $(\Omega,\mathcal F,(\mathcal F_t),(X_i(t))_{t\ge0},P)$, $i=1,\dots,m$, is a real BM.

b) The $\sigma$-algebras $\sigma(X_i(t):t\ge0)$, $i=1,\dots,m$, are independent. Since $X$ is a Gaussian process (as in Remark 2.2 b), it is enough to check $E[X_i(t)X_j(s)]=0$ for $s\le t$, $i\neq j$:
$$
E[X_i(t)X_j(s)]=E\big[(X_i(t)-X_i(s))X_j(s)\big]+E[X_i(s)X_j(s)]=E[X_i(t)-X_i(s)]\,E[X_j(s)]+0=0,
$$
using that $X_j(s)$ is $\mathcal F_s$-measurable, $X_i(t)-X_i(s)$ is independent of $\mathcal F_s$ and centered, and $X(s)\sim N(0,sI_m)$ has uncorrelated components. So the components of an $m$-dimensional BM are **independent** real BMs.

c) If $z\in\mathbb R^m$, $|z|=1$, then $B_t:=\langle z,X_t\rangle$ is a real BM. Indeed $B_t-B_s=\langle z,X_t-X_s\rangle$ is independent of $\mathcal F_s$. It is Gaussian (a linear function of a Gaussian vector) with variance $(t-s)z^Tz=(t-s)|z|^2=t-s$, and $B_0=0$. (Checking (1)–(3) of Prop 2.3 would only give a natural BM, which is weaker.)

**Convention.** From now on, "Brownian motion" means a Brownian motion **with continuous paths** (one exists by Example 1.17).

**Continuity of time inversion at 0.** In Prop 2.4, $X$, $Y$, $M$ are obviously continuous if $B$ is. $Z$ is continuous on $(0,\infty)$, and continuity at 0 needs an argument (see the proof of Prop 2.4 in Section 4).

*(Remark 2.7, on the augmented natural filtration, is excluded from the syllabus. The fact to remember: a BM stays a BM if the negligible sets are added to the filtration.)*

**Lemma 2.8 (independence).** Let $\mathcal F_1,\mathcal F_2$ be sub-$\sigma$-algebras of $\mathcal F$, and $\mathcal C_1\subset\mathcal F_1$, $\mathcal C_2\subset\mathcal F_2$ classes generating $\mathcal F_1$ and $\mathcal F_2$ respectively, each stable under finite intersections. Then
$$
\mathcal F_1\text{ independent of }\mathcal F_2\iff P(A_1\cap A_2)=P(A_1)P(A_2)\quad\forall A_1\in\mathcal C_1,\ A_2\in\mathcal C_2 .
$$

**Remark 2.9.** If $B$ is an $(\mathcal F_t)$-BM, Lemma 2.8 gives that $\mathcal F_s$ is independent of $\sigma(B_t-B_s,\ t\ge s)$ (the whole future increment process). This is useful for showing, e.g., that random variables like $Y=\int_s^b(B_u-B_s)\,du$, $b>s$, are independent of $\mathcal F_s$.

**Remark 2.10 (useful Brownian formulas).** With $Z\sim N(0,1)$:

a) $B_t\stackrel d=\sqrt t\,Z$;

b) $E[e^{\theta B_t}]=\exp(\tfrac12t\theta^2)$, $\theta\in\mathbb R$;

c) $E[e^{\theta B_t^2}]=(1-2t\theta)^{-1/2}$ if $t\theta<\tfrac12$, and $=+\infty$ if $t\theta\ge\tfrac12$.

Further standard facts used constantly: $E[Z^{2k}]=(2k-1)!!$ (so $E Z^2=1$, $EZ^4=3$, $EZ^6=15$), odd moments vanish, $E|Z|=\sqrt{2/\pi}$, and Gaussian integration by parts $E[Zg(Z)]=E[g'(Z)]$.

*Derivation of (c):* $E[e^{\theta tZ^2}]=\int_{\mathbb R}\frac{1}{\sqrt{2\pi}}e^{-\frac12(1-2\theta t)z^2}dz=(1-2\theta t)^{-1/2}$ if $1-2\theta t>0$; otherwise the integrand does not decay and the integral is $+\infty$.

### 2.9 Regularity of the paths

BM admits a continuous version that is $\gamma$-Hölder for all $\gamma<\tfrac12$. For an interval $I\subset\mathbb R$ and continuous $f:I\to\mathbb R$, the *modulus of continuity* is
$$
w(\delta)=w_{I,f}(\delta)=\sup_{x,y\in I,\ |x-y|\le\delta}|f(x)-f(y)| .
$$
Regularity is determined by the behaviour of $w(\delta)$ as $\delta\to0+$:

- $f$ is uniformly continuous iff $\lim_{\delta\to0+}w(\delta)=0$;
- $f$ is Hölder continuous with exponent $\alpha$ iff $w(\delta)\le c\delta^\alpha$ for some $c>0$;
- $f$ is Lipschitz iff $w(\delta)\le c\delta$ for some $c>0$.

**Theorem 2.12 (P. Lévy's modulus of continuity)**: see Section 3.

**Remark (after Theorem 2.12).** If $w_{[0,T],X_\cdot(\omega)}$ is the modulus of continuity of $t\mapsto X_t(\omega)$ on $[0,T]$, then Theorem 2.12 says $\lim_{\delta\to0+}\frac{w(\delta)}{(2\delta\log(1/\delta))^{1/2}}=1$ a.s. Since then $w(\delta)/\delta^{1/2}\to+\infty$, the paths of BM cannot be Hölder continuous with exponent $\tfrac12$. More precisely: Corollary 2.13.

**Definition 2.14 (variation).** For $f:\mathbb R\to\mathbb R$, its *variation* on $[a,b]$ is
$$
V_f([a,b])=\sup_\pi\sum_{i=0}^{n-1}|f(t_{i+1})-f(t_i)|,
$$
the supremum over all partitions $\pi=\{a=t_0<t_1<\dots<t_n=b\}$. $f$ has *finite variation* if $V_f([a,b])<\infty$ for all $a,b$. It has *bounded variation* if $V_f(\mathbb R):=\lim_{a\to\infty}V_f([-a,a])<\infty$.

If $f$ is Lipschitz with constant $L$, then $\sum_i|f(t_{i+1})-f(t_i)|\le L\sum_i(t_{i+1}-t_i)=L(b-a)$, so $f$ has finite variation. Hence $C^1$ functions have finite variation on bounded intervals, and monotone functions have finite variation too ($V_f([a,b])=|f(b)-f(a)|$).

**Proposition 2.15**: see Sections 3 and 4.

### 2.10 Asymptotics and the stopping theorem

**Theorem 2.16 (LIL)**: see Section 3.

**Remark 2.17.**

- (c) and (d) imply that there are sequences $t_n\uparrow\infty$, $s_n\uparrow\infty$ with $X_{t_n}\ge(1-\varepsilon)\sqrt{2t_n\log\log t_n}$ and $X_{s_n}\le-(1-\varepsilon)\sqrt{2s_n\log\log s_n}$. So as $t\to\infty$, $X$ takes arbitrarily large positive and negative values infinitely many times: it oscillates more and more widely. By continuity (intermediate value theorem), the paths of $X$ visit every real number infinitely many times a.s. (*recurrence*).
- (c) and (d) also say how fast BM moves away from 0: for $\varepsilon>0$ there is $t_0=t_0(\omega)$ with $|X_t(\omega)|\le(1+\varepsilon)\sqrt{2t\log\log t}$ for all $t\ge t_0$. In particular $X_t/t\to0$ a.s.
- Similar inequalities follow from (a), (b) for the behaviour near 0. One deduces that on $[0,\varepsilon]$, for every $\varepsilon>0$, the path crosses 0 infinitely many times with probability 1.

**Lemma 2.18** and **Theorem 2.19 (stopping theorem / strong Markov)**: see Section 3.

## 3. Theorems: statements

Exam-ready statements of every syllabus result in sections 1–2. (S&P) and (P) items are marked. Their proofs are in Section 4.

**Theorem 1.15 (Kolmogorov's continuity theorem) (S).** Let $D\subset\mathbb R^m$ be an open set and $(X_y)_{y\in D}$ a family of $d$-dimensional random vectors on $(\Omega,\mathcal F,P)$. Suppose there exist $\alpha>0$, $\beta>0$, $c>0$ such that
$$
E\big[|X_y-X_z|^\beta\big]\le c\,|y-z|^{m+\alpha}\qquad\forall y,z\in D .
$$
Then there exists a family $(\tilde X_y)_{y\in D}$ of $\mathbb R^d$-valued random variables with $X_y=\tilde X_y$ a.s. for every $y\in D$ (a modification), such that for every $\omega\in\Omega$ the map $y\mapsto\tilde X_y(\omega)$ is continuous, and in fact Hölder continuous with exponent $\gamma$ for every $\gamma<\alpha/\beta$ on every compact subset of $D$.

**Corollary 1.16 (time-indexed version) (S).** Let $X$ be an $\mathbb R^d$-valued process such that there exist $\alpha>0$, $\beta>0$, $c>0$ with
$$
E\big[|X_t-X_s|^\beta\big]\le c\,|t-s|^{1+\alpha}.
$$
Then there is a continuous modification $\tilde X$ of $X$. Moreover, for every $\gamma<\alpha/\beta$, the paths of $\tilde X$ are $\gamma$-Hölder continuous on every bounded interval.

> **Pitfall:** the exponent on the right is $m+\alpha$ (dimension of the parameter set plus a strictly positive $\alpha$), not $\alpha$. For time ($m=1$) you need $1+\alpha$ with $\alpha>0$. $E|B_t-B_s|^2=|t-s|$ is **not** enough. The Poisson process satisfies $E|N_t-N_s|=\lambda|t-s|$ and has no continuous modification.

**Proposition 1.19 (S&P).** Let $X=(X_t)_{t\in T}$ be a family of random variables on a measurable space $(\Omega,\mathcal F)$ and $P,P'$ two probabilities on $(\Omega,\mathcal F)$ under which $X$ has the same finite-dimensional distributions. Then $P$ and $P'$ coincide on $\sigma(X_t;\ t\in T)$.

(The notes phrase it as: "Let $X$ and $X'$ be two processes defined on the same probability space and having the same f.d.d. Then $P$ and $P'$ coincide on $\sigma(X_t;t\in T)$.")

**Carathéodory's criterion (statement required by the syllabus).** Let $(E,\mathcal E)$ be a measurable space and $\mu_1,\mu_2$ two finite measures on $(E,\mathcal E)$. Let $\mathcal S\subset\mathcal E$ be a family of subsets of $E$, stable under finite intersections, with $\sigma(\mathcal S)=\mathcal E$. If $\mu_1(E)=\mu_2(E)$ and $\mu_1,\mu_2$ coincide on $\mathcal S$, then they coincide on $\mathcal E$.

**Theorem 1.20 (Daniell–Kolmogorov extension) (S).** Let $(\mu_J)_{J\subset T,\ \#J<\infty}$ be a family of finite-dimensional distributions on $E$, a **complete separable metric space**, satisfying Assumption C (consistency). Then there exist a probability space $(\Omega,\mathcal F,P)$ and a stochastic process $(X_t)_{t\in T}$, $X_t:\Omega\to E$ $(\mathcal F,\mathcal B(E))$-measurable, such that
$$
\mu_{t_1,\dots,t_k}(B_1\times\dots\times B_k)=P(X_{t_1}\in B_1,\dots,X_{t_k}\in B_k)
$$
for all $t_i\in T$, $k\in\mathbb N$ and Borel sets $B_i$. One can take $\Omega=E^T$, $X_t(\omega)=\omega(t)$, $\mathcal F=\mathcal B(E)^T$, and then $P$ is unique (by Prop 1.19).

**Proposition 1.9 (S&P).** Let $X$ be a right-continuous adapted process with values in a metric space $E$ (e.g. $\mathbb R^m$). Then $X$ is progressively measurable.

**Proposition 1.25 (P).** If $\tau$ is a stopping time, then $\tau$ is an optional time. If $(\mathcal F_t)$ is right-continuous, then $\tau$ is an optional time iff $\tau$ is a stopping time.

**Proposition 1.27 (P).** Let $E$ be a metric space and $X$ an $E$-valued continuous adapted process, with $\tau_A=\inf\{t\ge0:X_t\notin A\}$.
(a) If $A$ is open, then $\tau_A$ is a stopping time.
(b) If $F$ is closed and $(\mathcal F_t)$ is right-continuous, then $\tau_F$ is a stopping time.

**Proposition 1.28 (P).** Let $\sigma,\tau$ be stopping times. Then
(a) $\tau$ is $\mathcal F_\tau$-measurable;
(b) $\sigma\vee\tau$ and $\sigma\wedge\tau$ are stopping times;
(c) if $\sigma\le\tau$, then $\mathcal F_\sigma\subset\mathcal F_\tau$;
(d) $\mathcal F_{\sigma\wedge\tau}=\mathcal F_\sigma\cap\mathcal F_\tau$.

**Proposition 1.29 (P).** If $\tau$ is an a.s. finite stopping time and $X$ is a progressively measurable process, then $X_\tau$ is an $\mathcal F_\tau$-measurable random variable.

**Proposition 2.3 (S&P).** If $B$ is a Brownian motion then
1. $B_0=0$ a.s.;
2. for all $0\le t_1<\dots<t_m$, $(B_{t_1},\dots,B_{t_m})$ is an $m$-dimensional centered normal random vector;
3. $E[B_sB_t]=s\wedge t$ for all $s,t\ge0$.

Conversely, if a real process $B$ satisfies 1, 2, 3, then $B$ is a natural Brownian motion (a BM w.r.t. $\mathcal G_t=\sigma(B_u,\ u\le t)$).

**Proposition 2.4 (P).** Let $B$ be an $(\mathcal F_t)$-Brownian motion. Then $X_t=B_{t+s}-B_s$ ($s\ge0$ fixed), $Y_t=-B_t$, $M_t=cB_{t/c^2}$ ($c\neq0$) and $Z_t=tB_{1/t}$ ($t>0$), $Z_0=0$, are Brownian motions with respect to $(\mathcal F_{t+s})_t$, $(\mathcal F_t)_t$, $(\mathcal F_{t/c^2})_t$ and $(\mathcal F^Z_t)_t$ respectively. If $B$ is continuous, all four are continuous (for $Z$ after discarding a null set).

**Lemma 2.8 (S).** As stated in Section 2.8.

**Theorem 2.12 (P. Lévy's modulus of continuity) (S).** Let $X$ be a real-valued Brownian motion. Then for every $T>0$
$$
P\left(\lim_{\delta\to0+}\frac{w_{[0,T],X}(\delta)}{\big(2\delta\log(1/\delta)\big)^{1/2}}=1\right)=1,
$$
where $w_{[0,T],X}(\delta)=\sup_{s,t\in[0,T],\,|t-s|\le\delta}|X_t-X_s|$.

**Corollary 2.13 (S&P).** Outside a set of probability 0, no path of a Brownian motion is Hölder continuous with exponent $\gamma\ge\tfrac12$ on any time interval $I\subset\mathbb R^+$ with non-empty interior.

**Proposition 2.15 (S&P).** Let $X$ be a real Brownian motion, $\pi=\{s=t_0<t_1<\dots<t_m=t\}$ a partition of $[s,t]$ with mesh $|\pi|=\max_k(t_{k+1}-t_k)$, and
$$
S_\pi=\sum_{k=0}^{m-1}|X_{t_{k+1}}-X_{t_k}|^2 .
$$
Then
$$
L^2\text{-}\lim_{|\pi|\to0+}S_\pi=t-s .
$$
In particular, a.s. the paths of a Brownian motion do not have finite variation on any time interval.

**Theorem 2.16 (law of the iterated logarithm) (S).** Let $X$ be a Brownian motion. Then
$$
\begin{aligned}
&\text{(a)}\quad P\Big(\limsup_{t\to0+}\frac{X_t}{(2t\log\log(1/t))^{1/2}}=1\Big)=1, &&\text{(b)}\quad P\Big(\liminf_{t\to0+}\frac{X_t}{(2t\log\log(1/t))^{1/2}}=-1\Big)=1,\\
&\text{(c)}\quad P\Big(\limsup_{s\to+\infty}\frac{X_s}{(2s\log\log s)^{1/2}}=1\Big)=1, &&\text{(d)}\quad P\Big(\liminf_{s\to+\infty}\frac{X_s}{(2s\log\log s)^{1/2}}=-1\Big)=1.
\end{aligned}
$$

**Lemma 2.18 (S).** Let $\tau$ be a stopping time. Then there exist stopping times $(\tau_n)_{n\ge1}$ with $\tau_{n+1}\le\tau_n$, each taking a discrete set of values, such that $\tau_n\downarrow\tau$. Moreover $\{\tau_n=+\infty\}=\{\tau=+\infty\}$ for all $n$. (Construction: $\tau_n=0$ on $\{\tau=0\}$, $\tau_n=\frac{k+1}{2^n}$ on $\{\frac k{2^n}<\tau\le\frac{k+1}{2^n}\}$, $\tau_n=+\infty$ on $\{\tau=+\infty\}$.)

**Theorem 2.19 (stopping theorem / strong Markov property of BM) (S).** Let $X=(\Omega,\mathcal F,(\mathcal F_t),(X_t),P)$ be an $m$-dimensional (continuous) Brownian motion and $\tau$ an a.s. finite stopping time with respect to $(\mathcal F_t)$. Then
$$
Y_t=X_{t+\tau}-X_\tau,\qquad t\ge0,
$$
is a Brownian motion independent of $\mathcal F_\tau$.

## 4. Proofs

Every (P) and (S&P) item of sections 1–2 has a proof below, in the order of the notes. Each proof follows the lecturer's handwritten notes, with gaps filled in.

### 4.1 Proposition 1.9 (S&P): right-continuous adapted implies progressively measurable

**Statement.** Let $X$ be an adapted process with values in a metric space $E$ (e.g. $\mathbb R^m$) such that every path $t\mapsto X_t(\omega)$ is right-continuous. Then $X$ is progressively measurable.

**Proof roadmap.**
1. Fix $t$. Approximate $X$ on $[0,t]$ by a process $X^{(n)}$ that is piecewise constant on dyadic intervals and takes the value at the **right** endpoint.
2. Show $X^{(n)}$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable: its preimages are finite unions of rectangles.
3. Right-continuity gives $X^{(n)}_s(\omega)\to X_s(\omega)$ for every $(s,\omega)$.
4. A pointwise limit of measurable maps into a metric space is measurable.

**Proof.** Fix $t\in T$. For $n\ge1$ and $s\in[0,t]$ define
$$
X^{(n)}_s=\begin{cases}X_{\frac{k+1}{2^n}t}&\text{if } s\in\big[\tfrac{k}{2^n}t,\tfrac{k+1}{2^n}t\big),\ k=0,1,\dots,2^n-1,\\ X_t&\text{if } s=t.\end{cases}
$$
We can write $X^{(n)}_s=X_{s_n}$, where $s_n=\frac{k+1}{2^n}t$ if $s\in[\frac k{2^n}t,\frac{k+1}{2^n}t)$, and $s_n=t$ if $s=t$. Then $s_n\ge s$, $|s_n-s|\le t2^{-n}$, and $s_n\downarrow s$ as $n\to\infty$. Since $X$ is right-continuous, for every $s\le t$ and every $\omega$,
$$
X^{(n)}_s(\omega)=X_{s_n}(\omega)\xrightarrow[n\to\infty]{}X_s(\omega).
$$

*Each $X^{(n)}$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable.* Let $\Gamma\in\mathcal B(E)$. Then
$$
\{(s,\omega)\in[0,t]\times\Omega:\ X^{(n)}_s(\omega)\in\Gamma\}=\bigcup_{k=0}^{2^n-1}\Big(\big[\tfrac k{2^n}t,\tfrac{k+1}{2^n}t\big)\times\{X_{\frac{k+1}{2^n}t}\in\Gamma\}\Big)\ \cup\ \big(\{t\}\times\{X_t\in\Gamma\}\big).
$$
Each time-interval is in $\mathcal B([0,t])$. Since $\frac{k+1}{2^n}t\le t$ and $X$ is adapted, $\{X_{\frac{k+1}{2^n}t}\in\Gamma\}\in\mathcal F_{\frac{k+1}{2^n}t}\subset\mathcal F_t$. So the right-hand side is a finite union of measurable rectangles and belongs to $\mathcal B([0,t])\otimes\mathcal F_t$.

*Conclusion.* The map $(s,\omega)\mapsto X_s(\omega)$ on $[0,t]\times\Omega$ is the pointwise limit of the $\mathcal B([0,t])\otimes\mathcal F_t$-measurable maps $(s,\omega)\mapsto X^{(n)}_s(\omega)$. A pointwise limit of measurable functions with values in a metric space is measurable. Hence $X|_{[0,t]\times\Omega}$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable. Since $t$ was arbitrary, $X$ is progressively measurable. $\blacksquare$

*Why the limit is measurable (if asked).* For $E$ metric and $F\subset E$ closed, with $F_k=\{x:d(x,F)<1/k\}$, we have $\lim_nf_n(x)\in F$ iff $\forall k\ \exists N\ \forall n\ge N:\ f_n(x)\in F_k$. So $f^{-1}(F)=\bigcap_k\bigcup_N\bigcap_{n\ge N}f_n^{-1}(F_k)$ is measurable. Closed sets generate $\mathcal B(E)$.

**What graders look for / pitfalls.**
- Using the **right** endpoint $\frac{k+1}{2^n}t$, not the left one. With right-continuity you need $s_n\downarrow s$. A left-endpoint approximation converges only for left-continuous processes (see Exercise 4).
- Checking that the right endpoint is still $\le t$, so the event is in $\mathcal F_t$. **This is where adaptedness is used.** Do not forget to say so.
- Treating the point $s=t$ separately (the dyadic intervals are half-open).
- Saying explicitly that "pointwise limit of measurable maps is measurable" needs a metric (or metrizable) state space.
- If $X$ is only **a.s.** right-continuous, the argument needs the null set to be in $\mathcal F_t$, i.e. the usual conditions.

**Memorize-this skeleton.**
$$
X^{(n)}_s=X_{\frac{k+1}{2^n}t}\ \text{on}\ \big[\tfrac k{2^n}t,\tfrac{k+1}{2^n}t\big),\quad X^{(n)}_t=X_t;\qquad \{X^{(n)}\in\Gamma\}=\bigcup_k[\cdot,\cdot)\times\{X_{\frac{k+1}{2^n}t}\in\Gamma\}\cup\{t\}\times\{X_t\in\Gamma\}\in\mathcal B([0,t])\otimes\mathcal F_t;
$$
right-continuity gives $X^{(n)}\to X$ pointwise, so the limit is measurable.

### 4.2 Proposition 1.19 (S&P): same f.d.d. implies same law on sigma(X)

**Statement.** Let $(X_t)_{t\in T}$ be $E$-valued random variables on $(\Omega,\mathcal F)$, and $P,P'$ probabilities on $(\Omega,\mathcal F)$ under which $X$ has the same f.d.d. Then $P=P'$ on $\sigma(X_t,\ t\in T)$.

**Carathéodory's criterion (state it!).** Let $(E,\mathcal E)$ be a measurable space and $\mu_1,\mu_2$ finite measures on it. Let $\mathcal S\subset\mathcal E$ be stable under finite intersections with $\sigma(\mathcal S)=\mathcal E$. If $\mu_1(E)=\mu_2(E)$ and $\mu_1=\mu_2$ on $\mathcal S$, then $\mu_1=\mu_2$ on $\mathcal E$.

**Proof roadmap.**
1. Write down the class $\mathcal C$ of "finite-dimensional cylinder events" $\{X_{t_1}\in\Gamma_1,\dots,X_{t_n}\in\Gamma_n\}$.
2. $P$ and $P'$ agree on $\mathcal C$ (same f.d.d.) and on $\Omega$.
3. $\mathcal C$ is stable under finite intersections and generates $\sigma(X_t,t\in T)$.
4. Apply Carathéodory's criterion.

**Proof.** Let
$$
\mathcal C=\big\{\{X_{t_1}\in\Gamma_1,\dots,X_{t_n}\in\Gamma_n\}:\ n\ge1,\ t_1,\dots,t_n\in T,\ \Gamma_1,\dots,\Gamma_n\in\mathcal B(E)\big\}.
$$

*Agreement on $\mathcal C$.* With $\pi=(t_1,\dots,t_n)$ and $\mu_\pi$ the common f.d.d.,
$$
P(X_{t_1}\in\Gamma_1,\dots,X_{t_n}\in\Gamma_n)=\mu_\pi(\Gamma_1\times\dots\times\Gamma_n)=P'(X_{t_1}\in\Gamma_1,\dots,X_{t_n}\in\Gamma_n).
$$
(If the $t_i$ are not ordered, reorder them. If some $t_i$ coincide, intersect the corresponding $\Gamma$'s.) Also $\Omega=\{X_{t_1}\in E\}\in\mathcal C$, so $P(\Omega)=P'(\Omega)=1$.

*Stability under intersections.* Given $C=\{X_{t_i}\in\Gamma_i,\ i\le n\}$ and $C'=\{X_{s_j}\in\Gamma'_j,\ j\le k\}$, let $\{u_1,\dots,u_r\}=\{t_i\}\cup\{s_j\}$. For each $u_l$ let $A_l$ be the intersection of all $\Gamma_i$ with $t_i=u_l$ and all $\Gamma'_j$ with $s_j=u_l$ (with $E$ if there are none). Then $C\cap C'=\{X_{u_1}\in A_1,\dots,X_{u_r}\in A_r\}\in\mathcal C$.

*Generation.* Each $X_t$ is $\sigma(\mathcal C)$-measurable, since $\{X_t\in\Gamma\}\in\mathcal C$. Hence $\sigma(X_t,t\in T)\subset\sigma(\mathcal C)$. Conversely, every element of $\mathcal C$ is a finite intersection of sets $\{X_{t_i}\in\Gamma_i\}\in\sigma(X_t,t\in T)$, so $\sigma(\mathcal C)\subset\sigma(X_t,t\in T)$.

*Conclusion.* Apply Carathéodory's criterion on the measurable space $(\Omega,\sigma(X_t,t\in T))$ to the finite measures $P,P'$ restricted to it, with $\mathcal S=\mathcal C$. Then $P=P'$ on $\sigma(X_t,t\in T)$. $\blacksquare$

*(Optional) Proof of Carathéodory's criterion via Dynkin.* $\mathcal D=\{A\in\mathcal E:\mu_1(A)=\mu_2(A)\}$ contains $E$, is closed under proper differences ($A\subset B$, both in $\mathcal D$, gives $\mu_i(B\setminus A)=\mu_i(B)-\mu_i(A)$, finite measures), and is closed under increasing unions (continuity from below). So $\mathcal D$ is a Dynkin system containing the $\pi$-system $\mathcal S$. By Dynkin's $\pi$–$\lambda$ theorem, $\mathcal D\supset\sigma(\mathcal S)=\mathcal E$.

**What graders look for / pitfalls.**
- **Stating Carathéodory precisely**: finite measures, *equal total mass*, a class *stable under finite intersections* that *generates* the $\sigma$-algebra. The total-mass condition is essential (it is automatic here since both are probabilities, and $\Omega\in\mathcal C$ anyway).
- Proving (not just asserting) that $\mathcal C$ is a $\pi$-system and generates $\sigma(X_t,t\in T)$.
- The conclusion is on $\sigma(X_t,t\in T)$, **not** on all of $\mathcal F$.
- Consequence to mention: the law of a process on $(E^T,\mathcal B(E)^T)$ is determined by its f.d.d. This gives uniqueness in Theorem 1.20.

**Memorize-this skeleton.** Cylinders $\{X_{t_1}\in\Gamma_1,\dots,X_{t_n}\in\Gamma_n\}$ form a $\pi$-system generating $\sigma(X)$. $P=P'$ there because both equal $\mu_\pi(\Gamma_1\times\dots\times\Gamma_n)$. Carathéodory (finite measures, same mass, agree on a generating $\pi$-system) gives $P=P'$ on $\sigma(X)$.

### 4.3 Proposition 1.25 (P): stopping vs optional times

**Proof roadmap.**
1. Stopping implies optional: write $\{\tau<t\}$ as a countable union of $\{\tau\le t-1/n\}$.
2. Optional plus right-continuity implies stopping: write $\{\tau\le t\}$ as a countable intersection of $\{\tau<t+1/n\}$, show it lies in every $\mathcal F_{t+1/k}$, hence in $\mathcal F_{t+}=\mathcal F_t$.

**Proof.** *Stopping implies optional.* Let $\tau$ be a stopping time and $t\in T$ (for $t=0$, $\{\tau<0\}=\emptyset\in\mathcal F_0$). Then
$$
\{\tau<t\}=\bigcup_{n\ge1}\{\tau\le t-\tfrac1n\}.
$$
For $t-\frac1n\ge0$, $\{\tau\le t-\frac1n\}\in\mathcal F_{t-1/n}\subset\mathcal F_t$. For $t-\frac1n<0$ the set is empty. A countable union of $\mathcal F_t$-sets is in $\mathcal F_t$, so $\{\tau<t\}\in\mathcal F_t$.

*Optional and right-continuous imply stopping.* Assume $\{\tau<s\}\in\mathcal F_s$ for all $s$ and $\mathcal F_{t+}=\mathcal F_t$. For every $k\in\mathbb N$,
$$
\{\tau\le t\}=\bigcap_{n\ge1}\{\tau<t+\tfrac1n\}=\bigcap_{n\ge k}\{\tau<t+\tfrac1n\}
$$
(the sets decrease in $n$). For $n\ge k$, $\{\tau<t+\frac1n\}\in\mathcal F_{t+1/n}\subset\mathcal F_{t+1/k}$. Hence $\{\tau\le t\}\in\mathcal F_{t+1/k}$ for every $k$, so
$$
\{\tau\le t\}\in\bigcap_{k\ge1}\mathcal F_{t+1/k}=\mathcal F_{t+}=\mathcal F_t,
$$
using right-continuity in the last step. ($\bigcap_k\mathcal F_{t+1/k}=\bigcap_{\varepsilon>0}\mathcal F_{t+\varepsilon}$ by monotonicity.) So $\tau$ is a stopping time. $\blacksquare$

**What graders look for / pitfalls.**
- The trick "drop the first $k-1$ sets of a decreasing intersection" is what puts $\{\tau\le t\}$ in $\mathcal F_{t+1/k}$. Do not claim $\{\tau<t+\frac1n\}\in\mathcal F_t$, which is false in general.
- Point out exactly where right-continuity is used.
- In general (no right-continuity) an optional time need not be a stopping time. Example: $X_t=\xi t$ with $\xi=\pm1$, natural filtration, and $\tau=\inf\{t:X_t>0\}$ (Exercise 7).

**Memorize-this skeleton.** $\{\tau<t\}=\bigcup_n\{\tau\le t-\frac1n\}\in\mathcal F_t$. Conversely $\{\tau\le t\}=\bigcap_{n\ge k}\{\tau<t+\frac1n\}\in\mathcal F_{t+1/k}$ for all $k$, so it lies in $\mathcal F_{t+}=\mathcal F_t$.

### 4.4 Proposition 1.27 (P): exit times from open and closed sets

Recall $\tau_A=\inf\{t\ge0:X_t\notin A\}$, $X$ continuous, adapted, with values in a metric space $(E,d)$, and $d(x,B)=\inf_{y\in B}d(x,y)$ (with $d(x,\emptyset)=+\infty$).

**Proof roadmap.**
1. (a) Write $\{\tau_A>t\}$ as a countable union over $n$ of countable intersections over rational times of $\{d(X_r,A^c)>1/n\}$.
2. Use continuity of paths to go from rational times to all times. Use compactness of $X([0,t])$ for the converse inclusion.
3. Take complements.
4. (b) Show $\{\tau_F<t\}=\bigcup_{r\in\mathbb Q,r<t}\{X_r\notin F\}\in\mathcal F_t$, so $\tau_F$ is optional. Then apply Prop 1.25.

**Proof of (a).** Let $A$ be open, $t\ge0$, and $D_t=(\mathbb Q\cap[0,t])\cup\{t\}$ (countable and dense in $[0,t]$, containing $t$). We claim
$$
\{\tau_A>t\}=\bigcup_{n=1}^\infty\ \bigcap_{r\in D_t}\big\{d(X_r,A^c)>\tfrac1n\big\}. \qquad(\ast)
$$
The right-hand side is in $\mathcal F_t$. Each $X_r$, $r\le t$, is $\mathcal F_t$-measurable (adapted) and $x\mapsto d(x,A^c)$ is continuous, so $\{d(X_r,A^c)>\frac1n\}\in\mathcal F_r\subset\mathcal F_t$. The unions and intersections are countable.

"$\supset$": Let $\omega$ be in the right-hand side. For some $n$, $d(X_r(\omega),A^c)>\frac1n$ for all $r\in D_t$. Since $s\mapsto d(X_s(\omega),A^c)$ is continuous and $D_t$ is dense in $[0,t]$, $d(X_s(\omega),A^c)\ge\frac1n$ for all $s\in[0,t]$. So $X_s(\omega)\in A$ for all $s\le t$. Moreover $X_t(\omega)\in A$, $A$ is open and the path is continuous, so there is $\eta>0$ with $X_s(\omega)\in A$ for $s\in[t,t+\eta)$. Hence $\tau_A(\omega)\ge t+\eta>t$.

"$\subset$": Let $\tau_A(\omega)>t$. Then $X_s(\omega)\in A$ for all $s\in[0,t]$. The image $K=\{X_s(\omega):s\in[0,t]\}$ is compact (continuous image of a compact set) and contained in the open set $A$, i.e. disjoint from the closed set $A^c$. The continuous function $x\mapsto d(x,A^c)$ is strictly positive on $K$ and attains its minimum there, so $\min_{s\le t}d(X_s(\omega),A^c)=:\delta>0$. Choose $n$ with $\frac1n<\delta$. Then $\omega$ is in the right-hand side.

Hence $\{\tau_A\le t\}=\{\tau_A>t\}^c\in\mathcal F_t$ for every $t$, so $\tau_A$ is a stopping time. $\blacksquare$

**Proof of (b)** (left as an exercise in the notes). Let $F$ be closed, so $F^c$ is open, and $t>0$. We claim
$$
\{\tau_F<t\}=\bigcup_{r\in\mathbb Q\cap[0,t)}\{X_r\notin F\}.
$$
"$\supset$": If $X_r(\omega)\notin F$ for some $r<t$, then $\tau_F(\omega)\le r<t$.
"$\subset$": If $\tau_F(\omega)<t$, by the definition of the infimum there is $s<t$ with $X_s(\omega)\notin F$, i.e. $X_s(\omega)\in F^c$, which is open. By continuity, $X_r(\omega)\in F^c$ for all $r$ in a neighbourhood of $s$, in particular for some rational $r\in[0,t)$ (if $s=0$, take small $r>0$; if $s>0$, take $r<s$ close to $s$).
Each $\{X_r\notin F\}\in\mathcal F_r\subset\mathcal F_t$, so $\{\tau_F<t\}\in\mathcal F_t$. For $t=0$, $\{\tau_F<0\}=\emptyset$. Thus $\tau_F$ is an optional time. Since $(\mathcal F_t)$ is right-continuous, Prop 1.25 shows that $\tau_F$ is a stopping time. $\blacksquare$

**What graders look for / pitfalls.**
- In (a), the role of **openness of $A$**: (i) the distance to the closed set $A^c$ is strictly positive on the compact image, and (ii) after time $t$ the path stays in $A$ for a while, so $\tau_A>t$ and not just $\ge t$.
- Including $t$ itself (or arguing by continuity) in the countable time set. The notes use $r\in\mathbb Q$, $r<t$, and continuity gives the value at $t$. Writing $D_t$ avoids the degenerate case $t=0$.
- In (b) you only get $\{\tau_F<t\}\in\mathcal F_t$, never $\{\tau_F\le t\}$ directly. That is why right-continuity is needed. The counterexample of Exercise 7 shows it cannot be dropped.
- Don't confuse exit time and entry time: $\tau_F=$ exit time of $F$ $=$ entry time of the open set $F^c$.

**Memorize-this skeleton.** (a) $\{\tau_A>t\}=\bigcup_n\bigcap_{r\in\mathbb Q\cap[0,t]\cup\{t\}}\{d(X_r,A^c)>\frac1n\}$, using continuity, compactness and openness. (b) $\{\tau_F<t\}=\bigcup_{r\in\mathbb Q,r<t}\{X_r\in F^c\}$, so $\tau_F$ is optional, hence a stopping time by right-continuity and Prop 1.25.

### 4.5 Proposition 1.28 (P): properties of stopping times

**Proof roadmap.**
1. (a) Check $\{\tau\le s\}\in\mathcal F_\tau$ by splitting into the cases $t\le s$ and $t>s$.
2. (b) $\{\sigma\wedge\tau\le t\}$ is a union and $\{\sigma\vee\tau\le t\}$ an intersection of $\mathcal F_t$-sets.
3. (c) $A\cap\{\tau\le t\}=(A\cap\{\sigma\le t\})\cap\{\tau\le t\}$.
4. (d) "$\subset$" by (c). "$\supset$" by splitting $\{\sigma\wedge\tau\le t\}$ into a union.

**Proof.** *(a)* The half-lines $(-\infty,s]$ generate $\mathcal B(\overline{\mathbb R})$ (together with $\{+\infty\}=\bigcap_n\{\tau\le n\}^c$), so it suffices to show $\{\tau\le s\}\in\mathcal F_\tau$ for all $s\ge0$. First, $\{\tau\le s\}\in\mathcal F_s\subset\mathcal F_\infty$. Next, for every $t$:
- if $t\le s$: $\{\tau\le s\}\cap\{\tau\le t\}=\{\tau\le t\}\in\mathcal F_t$;
- if $t>s$: $\{\tau\le s\}\cap\{\tau\le t\}=\{\tau\le s\}\in\mathcal F_s\subset\mathcal F_t$.

So $\{\tau\le s\}\in\mathcal F_\tau$ and $\tau$ is $\mathcal F_\tau$-measurable.

*(b)*
$$
\{\sigma\wedge\tau\le t\}=\{\sigma\le t\}\cup\{\tau\le t\}\in\mathcal F_t,\qquad \{\sigma\vee\tau\le t\}=\{\sigma\le t\}\cap\{\tau\le t\}\in\mathcal F_t .
$$

*(c)* Let $\sigma\le\tau$ and $A\in\mathcal F_\sigma$. Then $A\in\mathcal F_\infty$ and $A\cap\{\sigma\le t\}\in\mathcal F_t$ for all $t$. Since $\sigma\le\tau$, $\{\tau\le t\}\subset\{\sigma\le t\}$, so
$$
A\cap\{\tau\le t\}=\underbrace{A\cap\{\sigma\le t\}}_{\in\mathcal F_t}\cap\underbrace{\{\tau\le t\}}_{\in\mathcal F_t}\in\mathcal F_t .
$$
Hence $A\in\mathcal F_\tau$.

*(d)* "$\subset$": $\sigma\wedge\tau$ is a stopping time by (b), and $\sigma\wedge\tau\le\sigma$, $\sigma\wedge\tau\le\tau$. By (c), $\mathcal F_{\sigma\wedge\tau}\subset\mathcal F_\sigma$ and $\mathcal F_{\sigma\wedge\tau}\subset\mathcal F_\tau$.
"$\supset$": Let $A\in\mathcal F_\sigma\cap\mathcal F_\tau$. Then $A\in\mathcal F_\infty$, $A\cap\{\tau\le t\}\in\mathcal F_t$ and $A\cap\{\sigma\le t\}\in\mathcal F_t$. So
$$
A\cap\{\sigma\wedge\tau\le t\}=A\cap\big(\{\sigma\le t\}\cup\{\tau\le t\}\big)=\underbrace{(A\cap\{\sigma\le t\})}_{\in\mathcal F_t}\cup\underbrace{(A\cap\{\tau\le t\})}_{\in\mathcal F_t}\in\mathcal F_t,
$$
i.e. $A\in\mathcal F_{\sigma\wedge\tau}$. $\blacksquare$

**What graders look for / pitfalls.**
- In (a), remember the requirement $A\in\mathcal F_\infty$ in the definition of $\mathcal F_\tau$, and do both cases $t\le s$, $t>s$.
- In (c), the inclusion $\{\tau\le t\}\subset\{\sigma\le t\}$ (it goes this way because $\sigma\le\tau$).
- In (d), the hard inclusion is "$\supset$", which uses $\{\sigma\wedge\tau\le t\}=\{\sigma\le t\}\cup\{\tau\le t\}$.
- A common wrong claim: $\{\sigma\vee\tau\le t\}=\{\sigma\le t\}\cup\{\tau\le t\}$. Union and intersection are the other way round.
- Useful corollary: constant times are stopping times, so $\tau\wedge t$ is a bounded stopping time.

**Memorize-this skeleton.** (a) $\{\tau\le s\}\cap\{\tau\le t\}=\{\tau\le s\wedge t\}\in\mathcal F_{s\wedge t}\subset\mathcal F_t$. (b) $\wedge$ is a union, $\vee$ an intersection. (c) $A\cap\{\tau\le t\}=A\cap\{\sigma\le t\}\cap\{\tau\le t\}$. (d) "$\subset$" by (c), "$\supset$" by $A\cap\{\sigma\wedge\tau\le t\}=(A\cap\{\sigma\le t\})\cup(A\cap\{\tau\le t\})$.

### 4.6 Proposition 1.29 (P): X_tau is F_tau-measurable

**Statement.** $\tau$ an a.s. finite stopping time, $X$ progressively measurable with values in $(E,\mathcal E)$. Then $X_\tau$ is $\mathcal F_\tau$-measurable.

(On the null set $\{\tau=\infty\}$, define $X_\tau$ by an arbitrary constant. For this to be harmless one assumes either $\tau<\infty$ everywhere, or that the null set belongs to $\mathcal F_0$, e.g. under the usual conditions.)

**Proof roadmap.**
1. Show $\{X_\tau\in\Gamma\}\in\mathcal F_\infty$ (Example 1.10: progressive implies measurable).
2. Localize: $\{\tau\le t\}\cap\{X_\tau\in\Gamma\}=\{\tau\le t\}\cap\{X_{\tau\wedge t}\in\Gamma\}$.
3. $\tau\wedge t$ is $\mathcal F_t$-measurable, so $\omega\mapsto(\tau\wedge t(\omega),\omega)$ is measurable into $([0,t]\times\Omega,\mathcal B([0,t])\otimes\mathcal F_t)$.
4. Compose with the progressive map $(u,\omega)\mapsto X_u(\omega)$ to get $X_{\tau\wedge t}$ $\mathcal F_t$-measurable.

**Proof.** We prove $\{X_\tau\in\Gamma\}\in\mathcal F_\tau$ for all $\Gamma\in\mathcal E$.

*Step 1: $\{X_\tau\in\Gamma\}\in\mathcal F_\infty$.* A progressively measurable process is $\mathcal B(\mathbb R^+)\otimes\mathcal F_\infty$-measurable (the preimage is $\bigcup_n\{(s,\omega)\in[0,n]\times\Omega:X_s(\omega)\in\Gamma\}$, a union of $\mathcal B([0,n])\otimes\mathcal F_n$-sets). As $\tau$ is $\mathcal F_\infty$-measurable, $X_\tau$ is the composition of $\omega\mapsto(\tau(\omega),\omega)$, which is $(\mathcal F_\infty,\mathcal B(\mathbb R^+)\otimes\mathcal F_\infty)$-measurable, with $(u,\omega)\mapsto X_u(\omega)$. Hence it is $\mathcal F_\infty$-measurable (Example 1.10).

*Step 2: localization.* For every $t\ge0$,
$$
\{\tau\le t\}\cap\{X_\tau\in\Gamma\}=\{\tau\le t\}\cap\{X_{\tau\wedge t}\in\Gamma\},
$$
since $\tau=\tau\wedge t$ on $\{\tau\le t\}$.

*Step 3: $\tau\wedge t$ is $\mathcal F_t$-measurable.* For $s\ge0$:
$$
\{\tau\wedge t\le s\}=\begin{cases}\Omega&s\ge t,\\ \{\tau\le s\}\in\mathcal F_s\subset\mathcal F_t&s<t.\end{cases}
$$
In both cases the set is in $\mathcal F_t$.

*Step 4: $X_{\tau\wedge t}$ is $\mathcal F_t$-measurable.* $X_{\tau\wedge t}$ is the composition of
$$
\omega\mapsto\big(\omega,(\tau\wedge t)(\omega)\big)\quad\big(\mathcal F_t,\ \mathcal F_t\otimes\mathcal B([0,t])\big)\text{-measurable}
$$
(on a generating rectangle $A\times B$ with $A\in\mathcal F_t$, $B\in\mathcal B([0,t])$, the preimage is $A\cap\{\tau\wedge t\in B\}\in\mathcal F_t$ by Step 3), and
$$
(\omega,u)\mapsto X_u(\omega)\quad\big(\mathcal F_t\otimes\mathcal B([0,t]),\ \mathcal B(E)\big)\text{-measurable},
$$
which is exactly progressive measurability of $X$.

*Conclusion.* $\{\tau\le t\}\cap\{X_\tau\in\Gamma\}=\{\tau\le t\}\cap\{X_{\tau\wedge t}\in\Gamma\}$ is an intersection of two $\mathcal F_t$-events, for every $t\ge0$. Together with Step 1, $\{X_\tau\in\Gamma\}\in\mathcal F_\tau$. $\blacksquare$

**What graders look for / pitfalls.**
- Do not forget Step 1 ($\in\mathcal F_\infty$). It is part of the definition of $\mathcal F_\tau$.
- The key idea is the **localization** $\tau\to\tau\wedge t$, so that only $X|_{[0,t]\times\Omega}$ is involved, and that is where **progressive** (not just joint) measurability is used.
- Justify that $\omega\mapsto(\omega,\tau\wedge t(\omega))$ is measurable by checking rectangles.
- Typical application: for continuous adapted $X$ (progressive by Prop 1.9), $X_\tau$ is $\mathcal F_\tau$-measurable, e.g. $B_\tau$ in Theorem 2.19.

**Memorize-this skeleton.** $\{\tau\le t\}\cap\{X_\tau\in\Gamma\}=\{\tau\le t\}\cap\{X_{\tau\wedge t}\in\Gamma\}$. $\tau\wedge t$ is $\mathcal F_t$-measurable, so $\omega\mapsto(\omega,\tau\wedge t)$ is $(\mathcal F_t,\mathcal F_t\otimes\mathcal B[0,t])$-measurable. Progressive measurability makes $X_{\tau\wedge t}$ $\mathcal F_t$-measurable. Add $\mathcal F_\infty$-measurability from Example 1.10.

### 4.7 Proposition 2.3 (S&P): BM as a Gaussian process

**Proof roadmap.**
1. ($\Rightarrow$) (1) is given. (2) is Remark 2.2 b): induction using independent increments. (3): split $B_t=(B_t-B_s)+B_s$.
2. ($\Leftarrow$) (i) is given. (iii): $B_t-B_s$ is Gaussian (a linear function of $(B_s,B_t)$), centered, with variance $t+s-2s$.
3. (ii): in a Gaussian family, uncorrelated means independent. $E[(B_t-B_s)B_u]=0$ for $u\le s$, then use $\pi$-systems (Lemma 2.8) to get independence from $\sigma(B_u,u\le s)$.

**Proof.** *($\Rightarrow$)* Let $B$ be an $(\mathcal F_t)$-BM. (1) is (i) of Def 2.1.

(2): First, every linear combination $\sum_{i=1}^m\alpha_iB_{t_i}$ is Gaussian, by induction on $m$. The case $m=1$: $\alpha_1B_{t_1}\sim N(0,\alpha_1^2t_1)$, since $B_{t_1}=B_{t_1}-B_0$ a.s. Induction step:
$$
\sum_{i=1}^m\alpha_iB_{t_i}=\underbrace{\Big(\sum_{i=1}^{m-2}\alpha_iB_{t_i}+(\alpha_{m-1}+\alpha_m)B_{t_{m-1}}\Big)}_{=:A}+\underbrace{\alpha_m(B_{t_m}-B_{t_{m-1}})}_{=:C}.
$$
$A$ is Gaussian by the induction hypothesis and is $\mathcal F_{t_{m-1}}$-measurable. $C$ is Gaussian by (iii) and independent of $\mathcal F_{t_{m-1}}$ by (ii), hence independent of $A$. A sum of two independent Gaussian random variables is Gaussian (multiply the characteristic functions). Since every linear combination is Gaussian, $(B_{t_1},\dots,B_{t_m})$ is a Gaussian vector. It is centered because $E[B_t]=E[B_t-B_0]=0$.

(3): Let $s\le t$. $B_t-B_s$ and $B_s$ are independent (by (ii), $B_s$ being $\mathcal F_s$-measurable) and centered, so
$$
E[B_tB_s]=E[(B_t-B_s)B_s]+E[B_s^2]=E[B_t-B_s]\,E[B_s]+s=0+s=s=s\wedge t .
$$
By symmetry in $s,t$, $E[B_sB_t]=s\wedge t$ in general.

*($\Leftarrow$)* Let $B$ satisfy (1), (2), (3), and $\mathcal G_t=\sigma(B_u,u\le t)$. $B$ is $(\mathcal G_t)$-adapted, and (i) of Def 2.1 is (1).

(iii): Let $0\le s<t$. $B_t-B_s=(-1,1)\cdot(B_s,B_t)^T$ is Gaussian, being a linear function of the Gaussian vector $(B_s,B_t)$. It is centered since $B_s$ and $B_t$ are. Its variance is
$$
E[(B_t-B_s)^2]=E[B_t^2]+E[B_s^2]-2E[B_tB_s]=t+s-2s=t-s .
$$
So $B_t-B_s\sim N(0,t-s)$.

(ii): We must show $B_t-B_s$ is independent of $\mathcal G_s$. Fix $0\le u_1<\dots<u_k\le s$. The vector $(B_t-B_s,B_{u_1},\dots,B_{u_k})$ is Gaussian, as a linear image of the Gaussian vector $(B_{u_1},\dots,B_{u_k},B_s,B_t)$, and
$$
\operatorname{Cov}(B_t-B_s,B_{u_j})=E[B_tB_{u_j}]-E[B_sB_{u_j}]=t\wedge u_j-s\wedge u_j=u_j-u_j=0 .
$$
In a Gaussian vector, a block uncorrelated with the rest is independent of it (the covariance matrix is block diagonal, so the characteristic function factorizes). Hence $B_t-B_s$ is independent of $(B_{u_1},\dots,B_{u_k})$, i.e.
$$
P\big(\{B_t-B_s\in\Gamma\}\cap\{B_{u_1}\in\Gamma_1,\dots,B_{u_k}\in\Gamma_k\}\big)=P(B_t-B_s\in\Gamma)\,P(B_{u_1}\in\Gamma_1,\dots,B_{u_k}\in\Gamma_k).
$$
The class $\mathcal C=\{\{B_{u_1}\in\Gamma_1,\dots,B_{u_k}\in\Gamma_k\}:k\ge1,\ u_j\le s,\ \Gamma_j\in\mathcal B(\mathbb R)\}$ is stable under finite intersections and generates $\mathcal G_s$ (as in the proof of Prop 1.19). $\sigma(B_t-B_s)$ is generated by the $\pi$-system $\{\{B_t-B_s\in\Gamma\}\}$. By Lemma 2.8, $\sigma(B_t-B_s)$ and $\mathcal G_s$ are independent. So $B$ is a $(\mathcal G_t)$-BM, i.e. a natural BM. $\blacksquare$

**What graders look for / pitfalls.**
- "Centered" is part of (2). Without it you cannot deduce $E[B_t-B_s]=0$.
- The converse gives only a **natural** BM. You cannot get independence from a larger filtration $\mathcal F_s$, about which (1)–(3) say nothing.
- The step "uncorrelated implies independent" requires **joint** Gaussianity. Say why the vector is jointly Gaussian (a linear image of a Gaussian vector).
- Independence from a single $B_u$ is not enough. You need independence from the whole $\sigma$-algebra $\mathcal G_s$, via finite vectors plus a $\pi$-system argument (Lemma 2.8).
- In the forward direction, a "sum of Gaussians is Gaussian" claim needs **independence** (or joint Gaussianity). Don't skip it.
- Continuity is not part of Prop 2.3. With the convention that BM is continuous, one must check continuity separately when applying the converse (often via Kolmogorov or by construction).

**Memorize-this skeleton.** ($\Rightarrow$) Write $\sum\alpha_iB_{t_i}=A+\alpha_m(B_{t_m}-B_{t_{m-1}})$ with independent parts, so it is Gaussian. Then $E[B_tB_s]=E[(B_t-B_s)B_s]+E[B_s^2]=s$. ($\Leftarrow$) $\operatorname{Var}(B_t-B_s)=t+s-2s$, and $\operatorname{Cov}(B_t-B_s,B_u)=u-u=0$ for $u\le s$. Joint Gaussianity gives independence from finite vectors, and Lemma 2.8 gives independence from $\mathcal G_s$.

### 4.8 Proposition 2.4 (P): invariance properties of BM

**Proof roadmap.**
1. (i)–(iii): check Def 2.1 directly: start at 0, adaptedness, independence of increments from the new filtration, Gaussian increments with the right variance.
2. (iv): use the converse of Prop 2.3: $Z_0=0$, $Z$ is a centered Gaussian process (linear image of $B$), and the covariance is $st(\frac1t\wedge\frac1s)=s\wedge t$.
3. Continuity of $Z$ at 0: $Z$ and $B$ have the same f.d.d., and "$\lim_{t\to0+,t\in\mathbb Q}=0$" is an event determined by countably many coordinates.

**Proof.** *(i) $X_t=B_{t+s}-B_s$, filtration $\mathcal F'_t=\mathcal F_{t+s}$.* $(\mathcal F_{t+s})_t$ is a filtration. $X_t$ is $\mathcal F_{t+s}$-measurable (adapted). $X_0=B_s-B_s=0$. For $0\le u\le t$,
$$
X_t-X_u=B_{t+s}-B_{u+s},
$$
which is independent of $\mathcal F_{u+s}=\mathcal F'_u$ by (ii) for $B$, and $\sim N(0,(t+s)-(u+s))=N(0,t-u)$ by (iii) for $B$.

*(ii) $Y_t=-B_t$, filtration $\mathcal F_t$.* $Y_0=0$ and $Y$ is adapted. $Y_t-Y_u=-(B_t-B_u)$ is independent of $\mathcal F_u$, and it is $N(0,t-u)$-distributed since the centered normal law is symmetric.

*(iii) $M_t=cB_{t/c^2}$, filtration $\mathcal F'_t=\mathcal F_{t/c^2}$.* Since $t\mapsto t/c^2$ is increasing, $(\mathcal F_{t/c^2})_t$ is a filtration, and $M_t$ is $\mathcal F_{t/c^2}$-measurable. $M_0=cB_0=0$. For $u\le t$,
$$
M_t-M_u=c\big(B_{t/c^2}-B_{u/c^2}\big)
$$
is independent of $\mathcal F_{u/c^2}=\mathcal F'_u$, and is Gaussian, centered, with variance $c^2\big(\frac t{c^2}-\frac u{c^2}\big)=t-u$.

*(iv) $Z_t=tB_{1/t}$ ($t>0$), $Z_0=0$.* We check (1)–(3) of Prop 2.3.
1. $Z_0=0$ by definition.
2. For $0<t_1<\dots<t_n$, $(Z_{t_1},\dots,Z_{t_n})=\operatorname{diag}(t_1,\dots,t_n)\,(B_{1/t_1},\dots,B_{1/t_n})^T$ is a linear transformation of the centered Gaussian vector $(B_{1/t_1},\dots,B_{1/t_n})$ (Prop 2.3 for $B$; the order of the times is irrelevant). Hence it is centered Gaussian. If some $t_i=0$, the component $Z_0=0$ is a degenerate Gaussian, and the vector is still centered Gaussian.
3. For $0<s<t$: $\frac1t<\frac1s$, so
$$
E[Z_tZ_s]=st\,E[B_{1/t}B_{1/s}]=st\Big(\frac1t\wedge\frac1s\Big)=st\cdot\frac1t=s=s\wedge t,
$$
and trivially $E[Z_0Z_t]=0=0\wedge t$.

By Prop 2.3, $Z$ is a natural BM, i.e. a BM w.r.t. $(\mathcal F^Z_t)$.

*Continuity.* If $B$ is continuous, then $X$, $Y$, $M$ are continuous, being continuous transformations of continuous paths. $Z$ is continuous on $(0,\infty)$ as a product of continuous functions. At $t=0$: $Z$ and $B$ are equivalent (same f.d.d., both centered Gaussian with covariance $s\wedge t$). Consider the event
$$
\Big\{\lim_{t\to0+,\,t\in\mathbb Q}Z_t=0\Big\}=\bigcap_{m\ge1}\bigcup_{k\ge1}\bigcap_{q\in\mathbb Q\cap(0,1/k)}\big\{|Z_q|\le\tfrac1m\big\}.
$$
Enumerating $\mathbb Q\cap(0,1/k)$ as $q_1,q_2,\dots$, $P\big(\bigcap_{q}\{|Z_q|\le\frac1m\}\big)=\lim_NP\big(|Z_{q_1}|\le\frac1m,\dots,|Z_{q_N}|\le\frac1m\big)$ is a limit of f.d.d. probabilities. Then take monotone limits in $k$ and $m$. So the probability of this event is the same for $Z$ as for $B$ (Baldi Exercise 2.4 b). For $B$, continuity at 0 gives probability 1. Hence a.s. $\lim_{t\to0+,t\in\mathbb Q}Z_t=0$. Since $Z$ is continuous on $(0,\infty)$, the limit along rationals equals the full limit: given $\varepsilon$, if $|Z_q|\le\varepsilon$ for all rational $q<\delta$, then by continuity $|Z_t|\le\varepsilon$ for all $t\in(0,\delta)$. So $\lim_{t\to0+}Z_t=0$ a.s., and $Z$ is a.s. continuous on $[0,\infty)$ (redefine it as $0$ on the exceptional null set, or use the usual conditions). $\blacksquare$

**What graders look for / pitfalls.**
- State the **filtration** in each case: $\mathcal F_{t+s}$, $\mathcal F_t$, $\mathcal F_{t/c^2}$, and the natural filtration of $Z$. For (iv) you get only a natural BM: the converse of Prop 2.3 yields independence from $\mathcal F^Z_s$ only. There is no natural filtration built from the original $(\mathcal F_t)$ to which $Z$ is adapted with independent increments ($Z_s$ depends on $B_{1/s}$, i.e. on the "future" of $B$ for small $s$).
- In (iii), the variance computation $c^2\cdot\frac{t-u}{c^2}$.
- In (iv), the covariance computation: $E[B_{1/t}B_{1/s}]=\frac1t$ when $s<t$, because $\frac1t<\frac1s$. Getting the minimum wrong is the classic slip.
- Continuity at 0 for $Z$ is **not** automatic. Mention the f.d.d.-plus-countably-many-times argument. (With the LIL you could also argue via $B_s/s\to0$ as $s\to\infty$, but that is circular in the notes, where LIL (c) is derived from (a) via time inversion.)

**Memorize-this skeleton.** (i)–(iii): $X_t-X_u=B_{t+s}-B_{u+s}$ is independent of $\mathcal F_{u+s}$ and $N(0,t-u)$. $-(B_t-B_u)$ is symmetric. $c(B_{t/c^2}-B_{u/c^2})$ is independent of $\mathcal F_{u/c^2}$ with variance $t-u$. (iv): $Z$ is centered Gaussian with $E[Z_tZ_s]=st(\frac1t\wedge\frac1s)=s\wedge t$, so a natural BM by Prop 2.3. For continuity at 0, use the same f.d.d. as $B$ and $\{\lim_{\mathbb Q\ni t\to0}Z_t=0\}$ to get probability 1.

### 4.9 Corollary 2.13 (S&P): no Hölder-1/2 paths

**Statement.** Outside a null set, no path of a BM $X$ is Hölder continuous with exponent $\gamma\ge\frac12$ on any interval $I\subset\mathbb R^+$ with non-empty interior.

**Proof roadmap.**
1. For rationals $0\le q<r$, apply Theorem 2.12 to the BM $(X_{t+q}-X_q)_t$ on $[0,r-q]$ (Prop 2.4 (i)).
2. Collect the countably many null sets into one null set $N$.
3. Any interval with non-empty interior contains some $[q,r]$ with rational endpoints. Hölder-$\gamma$ there with $\gamma\ge\frac12$ would force the Lévy ratio to $0$, a contradiction.

**Proof.** For $q,r\in\mathbb Q^+$, $q<r$, the process $(X_{t+q}-X_q)_{t\ge0}$ is a BM (Prop 2.4 (i)). Theorem 2.12 with $T=r-q$ gives
$$
(\ast)\qquad\lim_{\delta\to0+}\ \sup_{\substack{q\le s<t\le r\\ |t-s|\le\delta}}\frac{|X_t-X_s|}{\big(2\delta\log(1/\delta)\big)^{1/2}}=1\quad\text{a.s.}
$$
(Here $|X_t-X_s|=|(X_{t-q+q}-X_q)-(X_{s-q+q}-X_q)|$, so the modulus of the shifted BM on $[0,r-q]$ is the modulus of $X$ on $[q,r]$.) Let $N_{q,r}$ be the null set where $(\ast)$ fails, and $N=\bigcup_{q<r,\ q,r\in\mathbb Q^+}N_{q,r}$. $N$ is negligible as a countable union of null sets.

Let $\omega\notin N$ and suppose that for some interval $I$ with non-empty interior, some $\gamma\ge\frac12$ and some $C<\infty$,
$$
|X_t(\omega)-X_s(\omega)|\le C|t-s|^\gamma\qquad\forall s,t\in I .
$$
Since $\mathring I\neq\emptyset$, $I$ contains an interval $[q,r]$ with $q<r$ rational. For $0<\delta<1$,
$$
\sup_{\substack{q\le s<t\le r\\|t-s|\le\delta}}\frac{|X_t(\omega)-X_s(\omega)|}{(2\delta\log(1/\delta))^{1/2}}\le\frac{C\delta^\gamma}{(2\delta\log(1/\delta))^{1/2}}=\frac{C\,\delta^{\gamma-1/2}}{(2\log(1/\delta))^{1/2}}\le\frac{C}{(2\log(1/\delta))^{1/2}}\xrightarrow[\delta\to0+]{}0,
$$
using $\delta^{\gamma-1/2}\le1$ for $\delta<1$, $\gamma\ge\frac12$. This contradicts $(\ast)$, which holds since $\omega\notin N_{q,r}$. Hence for $\omega\notin N$ no such $I$, $\gamma$, $C$ exist. $\blacksquare$

**What graders look for / pitfalls.**
- The **single** null set: Theorem 2.12 gives a null set for each fixed interval. The corollary is about *all* intervals at once, so you need the countable union over rational endpoints. This is the main point of the proof.
- Use the shift invariance (Prop 2.4 (i)) to move Theorem 2.12, which is stated on $[0,T]$, to $[q,r]$.
- Handle $\gamma>\frac12$ and $\gamma=\frac12$ together: for $\gamma=\frac12$ the ratio is $C/\sqrt{2\log(1/\delta)}\to0$, thanks to the log factor.
- Contrast: Kolmogorov (Example 1.17) gives Hölder for all $\gamma<\frac12$. The corollary shows this is sharp.

**Memorize-this skeleton.** Shifted BM plus Lévy on $[q,r]$ gives ratio $\to1$ off $N_{q,r}$. Take $N=\bigcup_{q,r\in\mathbb Q}N_{q,r}$. Hölder-$\gamma$ with $\gamma\ge\frac12$ on $I\supset[q,r]$ gives ratio $\le C\delta^{\gamma-1/2}/\sqrt{2\log(1/\delta)}\to0$, a contradiction.

### 4.10 Proposition 2.15 (S&P): quadratic variation in L^2; infinite variation

**Proof roadmap.**
1. Write $S_\pi-(t-s)=\sum_k\big[(\Delta_kX)^2-\Delta_kt\big]$, a sum of independent centered terms.
2. The cross terms vanish, so $E[(S_\pi-(t-s))^2]=\sum_k(\Delta_kt)^2E[(Z^2-1)^2]=2\sum_k(\Delta_kt)^2\le2|\pi|(t-s)\to0$.
3. Infinite variation: $S_\pi\le\max_k|\Delta_kX|\cdot\sum_k|\Delta_kX|$. Uniform continuity makes the max go to 0. If the variation were finite, $S_\pi\to0$, contradicting $S_{\pi_n}\to t-s>0$ a.s. along a subsequence.
4. Countable union over rational intervals.

**Proof.** Write $\Delta_kX=X_{t_{k+1}}-X_{t_k}$ and $\Delta_kt=t_{k+1}-t_k$. Since $\sum_{k=0}^{m-1}\Delta_kt=t-s$,
$$
S_\pi-(t-s)=\sum_{k=0}^{m-1}\big((\Delta_kX)^2-\Delta_kt\big)=:\sum_{k=0}^{m-1}Y_k .
$$
We prove $E[(S_\pi-(t-s))^2]\to0$ as $|\pi|\to0$.

*The $Y_k$ are independent and centered.* The increments $\Delta_0X,\dots,\Delta_{m-1}X$ are independent (Remark 2.2 c), hence so are the $Y_k$, which are functions of them. Also $E[Y_k]=E[(\Delta_kX)^2]-\Delta_kt=0$ since $\Delta_kX\sim N(0,\Delta_kt)$. Each $Y_k\in L^2$ (Gaussian moments). Hence for $k\neq h$,
$$
E[Y_kY_h]=E[Y_k]E[Y_h]=0 .
$$

*Diagonal terms.* Therefore
$$
E\big[(S_\pi-(t-s))^2\big]=\sum_{k=0}^{m-1}E[Y_k^2]=\sum_{k=0}^{m-1}(\Delta_kt)^2\,E\Big[\Big(\frac{(\Delta_kX)^2}{\Delta_kt}-1\Big)^2\Big].
$$
Since $\Delta_kX/\sqrt{\Delta_kt}=:C\sim N(0,1)$,
$$
E[(C^2-1)^2]=E[C^4]-2E[C^2]+1=3-2+1=2 .
$$
Hence
$$
E\big[(S_\pi-(t-s))^2\big]=2\sum_{k=0}^{m-1}(\Delta_kt)^2\le2|\pi|\sum_{k=0}^{m-1}\Delta_kt=2|\pi|(t-s)\xrightarrow[|\pi|\to0+]{}0 .
$$
This proves $L^2\text{-}\lim_{|\pi|\to0}S_\pi=t-s$.

*Infinite variation.* For every partition,
$$
(\ast)\qquad S_\pi=\sum_{k=0}^{m-1}|\Delta_kX|^2\le\Big(\max_{0\le i\le m-1}|\Delta_iX|\Big)\sum_{k=0}^{m-1}|\Delta_kX|\le\Big(\max_{i}|\Delta_iX|\Big)\,V_X([s,t]).
$$
Since the paths are continuous, hence uniformly continuous on $[s,t]$, $\max_i|\Delta_iX(\omega)|\le w_{[s,t],X(\omega)}(|\pi|)\to0$ as $|\pi|\to0$, for every $\omega$.

Fix a sequence of partitions $\pi_n$ of $[s,t]$ with $|\pi_n|\to0$. $L^2$ convergence implies convergence in probability, hence a.s. convergence along a subsequence: $S_{\pi_{n_j}}\to t-s$ a.s. Let $\Omega_0$ be this full-measure event. If $\omega\in\Omega_0$ had $V_{X(\omega)}([s,t])<\infty$, then by $(\ast)$, $S_{\pi_{n_j}}(\omega)\to0\neq t-s$, a contradiction. So $V_X([s,t])=+\infty$ a.s.

Let $N_{s,t}$ be the corresponding null set, for rational $s<t$, and $N=\bigcup_{s<t\in\mathbb Q^+}N_{s,t}$. Every interval with non-empty interior contains a rational $[s,t]$, and the variation is monotone in the interval. So for $\omega\notin N$ the path has infinite variation on every non-degenerate interval. $\blacksquare$

**What graders look for / pitfalls.**
- **Independence of increments** to kill the cross terms. Say explicitly that $E[Y_k]=0$; independence alone is not enough.
- The fourth moment $E[C^4]=3$, hence $E[(C^2-1)^2]=2$. A wrong constant is a common slip, though any finite constant would do.
- The final bound $\sum(\Delta_kt)^2\le|\pi|\sum\Delta_kt$.
- In the second part, $L^2$ convergence gives **a.s. convergence only along a subsequence**. You must pass to a subsequence before arguing pathwise.
- "Any time interval": you need the countable union over rational endpoints.
- Do not claim $S_\pi\to t-s$ a.s. for arbitrary partitions with $|\pi|\to0$. That is false in general. It holds for nested or fast-shrinking partitions (e.g. dyadic, see Exercise 14).

**Memorize-this skeleton.**
$$
E\big[(S_\pi-(t-s))^2\big]=\sum_kE\big[((\Delta_kX)^2-\Delta_kt)^2\big]=\sum_k(\Delta_kt)^2E[(C^2-1)^2]=2\sum_k(\Delta_kt)^2\le2|\pi|(t-s)\to0 .
$$
Then $S_\pi\le\max|\Delta X|\cdot V$. A subsequence converges a.s. to $t-s>0$, while $\max|\Delta X|\to0$, so $V=\infty$.

### 4.11 Bonus: LIL (b), (c), (d) from (a) (Theorem 2.16, as in the notes)

Not a (P) item, but the notes do it and it is a nice short exam sub-question.

*(a) implies (c).* By Prop 2.4 (iv), $Z_t=tX_{1/t}$ is a BM. Apply (a) to $Z$:
$$
1=\limsup_{t\to0+}\frac{tX_{1/t}}{(2t\log\log(1/t))^{1/2}}=\limsup_{t\to0+}\frac{\sqrt t\,X_{1/t}}{(2\log\log(1/t))^{1/2}}=\limsup_{s\to+\infty}\frac{X_s}{(2s\log\log s)^{1/2}}\quad\text{a.s.},
$$
substituting $s=1/t$, so that $\sqrt t=s^{-1/2}$.

*(a) implies (b), and (c) implies (d).* Apply (a), resp. (c), to the BM $-X$ (Prop 2.4 (ii)), using $\limsup(-f)=-\liminf f$. For (d) one can equally apply (a) to $-tX_{1/t}$.

The proof of (a) is technical and skipped in the course (see Baldi).

## 5. Exercises

Difficulty: ★ = routine, ★★ = standard exam level, ★★★ = hard. Times are rough estimates for writing a complete solution under exam conditions.

Notation: $Z\sim N(0,1)$, $\Phi$ is its distribution function, and $B$ is a real (continuous) Brownian motion unless stated otherwise.

### Exercise 1 (★, 10 min): modification vs indistinguishable (Baldi 2.1, Example 1.5)

Let $X,Y$ be processes on the same probability space, indexed by an interval $T\subset\mathbb R^+$.
(a) Show that if $Y$ is a modification of $X$, then $X$ and $Y$ are equivalent.
(b) Show that if $Y$ is a modification of $X$ and both are a.s. right-continuous, then they are indistinguishable.
(c) Give an example of a modification that is not indistinguishable, and explain which hypothesis of (b) fails.

**Strategy.** (a) Finite unions of null sets are null. (b) Reduce "for all $t$" to "for all $t$ in a countable dense set" by (right-)continuity. (c) Example 1.5.

**Full solution.** (a) Fix $t_1,\dots,t_n\in T$ and $A\in\mathcal B(E^n)$. Then
$$
\big\{(X_{t_1},\dots,X_{t_n})\neq(Y_{t_1},\dots,Y_{t_n})\big\}=\bigcup_{i=1}^n\{X_{t_i}\neq Y_{t_i}\}=:N
$$
is a finite union of null sets, so $P(N)=0$. The events $\{(X_{t_i})_i\in A\}$ and $\{(Y_{t_i})_i\in A\}$ coincide outside $N$, so they have the same probability. Hence the f.d.d. coincide.

(b) Let $D=(T\cap\mathbb Q)\cup\{\sup T\}$ if $\sup T\in T$, and $D=T\cap\mathbb Q$ otherwise. $D$ is countable. Let $N_0$ be the null set off which both $X$ and $Y$ have right-continuous paths, and $N=N_0\cup\bigcup_{q\in D}\{X_q\neq Y_q\}$. $N$ is null as a countable union of null sets. For $\omega\notin N$ and $t\in T$, $t<\sup T$, take $q_n\in D$ with $q_n\downarrow t$. Then $X_t(\omega)=\lim X_{q_n}(\omega)=\lim Y_{q_n}(\omega)=Y_t(\omega)$. If $t=\sup T\in T$, then $t\in D$. So $\{X_t=Y_t\ \forall t\}\supset N^c$, and $P(X_t=Y_t\ \forall t)=1$.

(c) Example 1.5: $\Omega=[0,1]$, $P=\lambda$, $X_t(\omega)=\mathbf 1_{\{t=\omega\}}$, $Y_t\equiv0$. Then $P(X_t\neq Y_t)=\lambda(\{t\})=0$ for every $t$, but $\{X_t=Y_t\ \forall t\}=\emptyset$. The hypothesis that fails is (right-)continuity of $X$: every path of $X$ jumps at $t=\omega$.

**Common pitfalls.** Writing $P(\bigcap_{t\in T}\{X_t=Y_t\})=1$ "because each event has probability 1": an uncountable intersection of full-measure events need not have full measure (it need not even be measurable). Forgetting the endpoint $\sup T$ when only right-continuity is assumed.

### Exercise 2 (★, 10 min): countably many times suffice (Baldi 2.2)

Let $(X_t)_{0\le t\le T}$ be a real continuous process and $D$ a dense subset of $[0,T]$.
(a) Show $\sigma(X_t,\ t\le T)=\sigma(X_t,\ t\in D)$.
(b) What changes if $X$ is only right-continuous?

**Strategy.** Both inclusions. Limits of measurable functions are measurable.

**Full solution.** (a) "$\supset$": each $X_s$, $s\in D$, is $\sigma(X_t,t\le T)$-measurable, and $\sigma(X_t,t\in D)$ is the smallest $\sigma$-algebra making these measurable. "$\subset$": it suffices that each $X_t$, $t\le T$, is $\sigma(X_s,s\in D)$-measurable. Take $s_n\in D$ with $s_n\to t$ (density). By continuity $X_t=\lim_nX_{s_n}$ pointwise, a limit of $\sigma(X_s,s\in D)$-measurable random variables, hence measurable.
(b) The same argument works with $s_n\downarrow t$, $s_n\in D$, for every $t<T$, but there is no $s\in D$ with $s>T$. So one must additionally assume $T\in D$.

**Common pitfalls.** Approaching from the left when only right-continuity is available.

### Exercise 3 (★, 10 min): measurability basics (Baldi 2.3, Example 1.11)

Let $X$ be progressively measurable with values in $(E,\mathcal E)$.
(a) Show that $X$ is adapted, and (for $T=\mathbb R^+$) jointly measurable.
(b) Let $\Phi:E\to G$ be measurable. Show $\Phi(X_t)$ is progressively measurable.
(c) Let $E=\mathbb R$ and $X$ bounded. Show that $Y_t=\int_0^tX_s\,ds$ is adapted and progressively measurable.

**Strategy.** Sections of product-measurable maps are measurable. Compositions of measurable maps are measurable. Fubini. Prop 1.9.

**Full solution.** (a) Fix $t$. The map $(s,\omega)\mapsto X_s(\omega)$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable on $[0,t]\times\Omega$. For fixed $s=t$ the section $\omega\mapsto X_t(\omega)$ is $\mathcal F_t$-measurable (sections of product-measurable functions are measurable). So $X$ is adapted. Joint measurability: for $\Gamma\in\mathcal E$,
$$
\{(s,\omega)\in\mathbb R^+\times\Omega:X_s(\omega)\in\Gamma\}=\bigcup_{n\ge1}\{(s,\omega)\in[0,n]\times\Omega:X_s(\omega)\in\Gamma\},
$$
and each set lies in $\mathcal B([0,n])\otimes\mathcal F_n\subset\mathcal B(\mathbb R^+)\otimes\mathcal F$.

(b) For each $u$, $(t,\omega)\mapsto\Phi(X_t(\omega))$ on $[0,u]\times\Omega$ is the composition of the $(\mathcal B([0,u])\otimes\mathcal F_u,\mathcal E)$-measurable map $(t,\omega)\mapsto X_t(\omega)$ with the $(\mathcal E,\mathcal G)$-measurable $\Phi$, hence $(\mathcal B([0,u])\otimes\mathcal F_u,\mathcal G)$-measurable.

(c) Fix $t$. $(s,\omega)\mapsto X_s(\omega)$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable and bounded, so by Fubini's theorem (on $([0,t]\times\Omega,\mathcal B([0,t])\otimes\mathcal F_t,\lambda\otimes P)$) the map $\omega\mapsto\int_0^tX_s(\omega)\,ds$ is $\mathcal F_t$-measurable. Thus $Y$ is adapted. Its paths are continuous ($|Y_t-Y_u|\le\|X\|_\infty|t-u|$), so $Y$ is progressively measurable by Prop 1.9.

**Common pitfalls.** In (c), using only joint measurability of $X$. Fubini then gives $\mathcal F$-measurability of $Y_t$, not $\mathcal F_t$-measurability.

### Exercise 4 (★★, 15 min): left-continuous adapted implies progressive

Let $X$ be an $\mathbb R^m$-valued adapted process with left-continuous paths. Show that $X$ is progressively measurable.

**Strategy.** Copy the proof of Prop 1.9 with **left** endpoints.

**Full solution.** Fix $t$. For $s\in[0,t]$ define $X^{(n)}_0=X_0$ and
$$
X^{(n)}_s=X_{\frac{k}{2^n}t}\quad\text{if }s\in\big(\tfrac k{2^n}t,\tfrac{k+1}{2^n}t\big],\ k=0,\dots,2^n-1 .
$$
Then $X^{(n)}_s=X_{s_n}$ with $s_n<s$ (for $s>0$), $s-s_n\le t2^{-n}$, so $s_n\uparrow s$, and left-continuity gives $X^{(n)}_s(\omega)\to X_s(\omega)$ for all $(s,\omega)$ (trivially for $s=0$). For $\Gamma\in\mathcal B(\mathbb R^m)$,
$$
\{(s,\omega)\in[0,t]\times\Omega:X^{(n)}_s(\omega)\in\Gamma\}=\big(\{0\}\times\{X_0\in\Gamma\}\big)\cup\bigcup_{k=0}^{2^n-1}\Big(\big(\tfrac k{2^n}t,\tfrac{k+1}{2^n}t\big]\times\{X_{\frac k{2^n}t}\in\Gamma\}\Big)\in\mathcal B([0,t])\otimes\mathcal F_t,
$$
since $\frac k{2^n}t\le t$ and $X$ is adapted. The pointwise limit $X|_{[0,t]\times\Omega}$ is therefore $\mathcal B([0,t])\otimes\mathcal F_t$-measurable. $\blacksquare$

**Common pitfalls.** Using right endpoints here: $X_{\frac{k+1}{2^n}t}$ would converge to $X_{s+}$, which need not equal $X_s$ for a left-continuous process.

### Exercise 5 (★★, 20 min): white noise is not measurable (Baldi 2.5)

Let $(X_t)_{t\in[0,1]}$ be a family of identically distributed, centered, square-integrable random variables with $X_s$ and $X_t$ independent for $s\neq t$ ("white noise"). Suppose $X$ is (jointly) measurable.
(a) Show $\int_a^b\int_a^bE[X_sX_t]\,ds\,dt=0$ for $0\le a\le b\le1$.
(b) Show $E\big[(\int_a^bX_s\,ds)^2\big]=0$.
(c) Deduce that for a.e. $\omega$, $X_t(\omega)=0$ for a.e. $t$. So a measurable white noise is trivial.

**Strategy.** Off the diagonal, $E[X_sX_t]=0$, and the diagonal has Lebesgue measure 0. Joint measurability allows Fubini. Use countably many rational intervals.

**Full solution.** Let $c=E[X_t^2]$, the same for all $t$.
(a) For $s\neq t$, $E[X_sX_t]=E[X_s]E[X_t]=0$. So $(s,t)\mapsto E[X_sX_t]$ vanishes outside the diagonal $\{s=t\}$, which has $\lambda^2$-measure 0. Hence the integral is 0.
(b) First, integrability: $E|X_sX_t|\le\sqrt{E X_s^2\,E X_t^2}=c$, so by Tonelli
$$
E\int_a^b\int_a^b|X_sX_t|\,ds\,dt\le c(b-a)^2<\infty .
$$
Also, $E\int_a^b|X_s|\,ds\le\sqrt c(b-a)<\infty$, so $\int_a^bX_s\,ds$ is a.s. well defined. Measurability of $(s,t,\omega)\mapsto X_s(\omega)X_t(\omega)$ follows from joint measurability of $X$. By Fubini and (a),
$$
E\Big[\Big(\int_a^bX_s\,ds\Big)^2\Big]=E\Big[\int_a^b\int_a^bX_sX_t\,ds\,dt\Big]=\int_a^b\int_a^bE[X_sX_t]\,ds\,dt=0 .
$$
(c) By (b), $\int_a^bX_s\,ds=0$ a.s., off a null set $N_{a,b}$ that depends on $(a,b)$. Let $N=\bigcup_{a<b\in\mathbb Q\cap[0,1]}N_{a,b}$ (null, plus the null set where $s\mapsto X_s(\omega)$ is not integrable). For $\omega\notin N$, the integrable function $f=X_\cdot(\omega)$ has $\int_a^bf=0$ for all rational $a<b$, hence (by approximation) for all intervals. Its integral over every Borel set is then 0 (Dynkin / Carathéodory: the finite signed measures $\int_Af^+$ and $\int_Af^-$ agree on intervals), so $f=0$ a.e. $\blacksquare$

**Common pitfalls.** Using a null set depending on $(a,b)$ and concluding for all intervals at once without the countable union. Forgetting to justify Fubini (integrability).

### Exercise 6 (★★, 15 min): stopping time toolbox

Let $(\mathcal F_t)$ be a filtration and $\tau$ a stopping time.
(a) Show that $\mathcal F_\tau$ is a $\sigma$-algebra.
(b) If $\tau\equiv s$ is constant, show $\mathcal F_\tau=\mathcal F_s$.
(c) Show that $\tau+c$ is a stopping time for every constant $c\ge0$.
(d) For $A\in\mathcal F_\tau$, let $\tau_A=\tau$ on $A$ and $\tau_A=+\infty$ on $A^c$. Show $\tau_A$ is a stopping time.

**Strategy.** Apply the definitions directly.

**Full solution.** (a) $\Omega\in\mathcal F_\infty$ and $\Omega\cap\{\tau\le t\}=\{\tau\le t\}\in\mathcal F_t$, so $\Omega\in\mathcal F_\tau$. If $A\in\mathcal F_\tau$: $A^c\in\mathcal F_\infty$ and
$$
A^c\cap\{\tau\le t\}=\{\tau\le t\}\setminus\big(A\cap\{\tau\le t\}\big)\in\mathcal F_t .
$$
If $A_n\in\mathcal F_\tau$: $\bigcup A_n\in\mathcal F_\infty$ and $(\bigcup_nA_n)\cap\{\tau\le t\}=\bigcup_n(A_n\cap\{\tau\le t\})\in\mathcal F_t$.

(b) $A\cap\{s\le t\}$ equals $A$ if $t\ge s$, and $\emptyset$ if $t<s$. So $A\in\mathcal F_\tau$ iff $A\in\mathcal F_\infty$ and $A\in\mathcal F_t$ for all $t\ge s$, iff $A\in\mathcal F_s$ (as $\mathcal F_s\subset\mathcal F_t$ for $t\ge s$, and $\mathcal F_s\subset\mathcal F_\infty$).

(c) $\{\tau+c\le t\}=\{\tau\le t-c\}$, which is in $\mathcal F_{t-c}\subset\mathcal F_t$ if $t\ge c$, and equals $\emptyset$ if $t<c$.

(d) $\{\tau_A\le t\}=A\cap\{\tau\le t\}\in\mathcal F_t$, since $A\in\mathcal F_\tau$.

**Common pitfalls.** In (c), $\tau-c$ is in general **not** a stopping time: you would need to know the future. In (a), forgetting the condition $A\in\mathcal F_\infty$.

### Exercise 7 (★★, 15 min): an optional time that is not a stopping time

Let $\xi$ satisfy $P(\xi=1)=P(\xi=-1)=\frac12$, $X_t=\xi t$ for $t\ge0$, and $(\mathcal F_t)$ the natural filtration of $X$. Let $\tau=\inf\{t\ge0:X_t>0\}$.
(a) Compute $\mathcal F_t$ and $\mathcal F_{0+}$. Is the filtration right-continuous?
(b) Show that $\tau$ is an optional time but not a stopping time.
(c) Which hypothesis of Prop 1.27 fails?

**Strategy.** Compute everything explicitly. $\tau$ only takes the values $0$ and $\infty$.

**Full solution.** (a) $\mathcal F_0=\sigma(X_0)=\sigma(0)=\{\emptyset,\Omega\}$. For $t>0$, $\sigma(X_s,s\le t)=\sigma(\xi)$, since $\xi=X_t/t$. So $\mathcal F_t=\sigma(\xi)=\{\emptyset,\Omega,\{\xi=1\},\{\xi=-1\}\}$ for $t>0$, and $\mathcal F_{0+}=\bigcap_{\varepsilon>0}\mathcal F_\varepsilon=\sigma(\xi)\neq\mathcal F_0$. The filtration is not right-continuous at 0.
(b) On $\{\xi=1\}$, $X_t=t>0$ for all $t>0$, so $\tau=\inf(0,\infty)=0$. On $\{\xi=-1\}$, $X_t\le0$ for all $t$, so $\tau=+\infty$. Then $\{\tau\le0\}=\{\xi=1\}\notin\mathcal F_0$: not a stopping time. But $\{\tau<0\}=\emptyset$ and $\{\tau<t\}=\{\xi=1\}\in\mathcal F_t$ for $t>0$: optional.
(c) $\tau$ is the exit time of the closed set $F=(-\infty,0]$ (equivalently the entry time of the open set $(0,\infty)$). $X$ is continuous and adapted, but the filtration is not right-continuous, so Prop 1.27(b) does not apply, and indeed the conclusion fails. Consistent with Prop 1.25, $\tau$ is a stopping time for the right-continuous filtration $(\mathcal F_{t+})$.

**Common pitfalls.** Claiming $\tau>0$ on $\{\xi=1\}$: the infimum of $(0,\infty)$ is $0$, even though $X_0=0$ is not $>0$.

### Exercise 8 (★★, 20 min): applying Kolmogorov's criterion, and when it fails

(a) Let $X$ be a real centered Gaussian process with $E[(X_t-X_s)^2]\le c|t-s|^a$ for some $a>0$, $c>0$. Show that $X$ has a continuous modification that is $\gamma$-Hölder on bounded intervals for every $\gamma<a/2$.
(b) Apply (a) to BM. Which $\beta$ gives which $\gamma$? Why is $\beta=2$ not enough?
(c) Let $N$ be a Poisson process with rate $\lambda>0$ ($N_0=0$, independent increments, $N_t-N_s\sim\text{Poisson}(\lambda(t-s))$). Show that $E|N_t-N_s|^\beta\le c|t-s|^{1+\alpha}$ fails for every $\beta>0$, $\alpha>0$, and that $N$ has no continuous modification.

**Strategy.** Gaussian increments have all moments, controlled by the variance. Then use Cor 1.16 with large $\beta$. For Poisson, look at $P(N_t-N_s\ge1)\approx\lambda|t-s|$.

**Full solution.** (a) $X_t-X_s$ is a linear function of the Gaussian vector $(X_s,X_t)$, hence centered Gaussian with variance $\sigma^2_{s,t}\le c|t-s|^a$. So $X_t-X_s\stackrel d=\sigma_{s,t}Z$ and for $p\ge1$
$$
E|X_t-X_s|^{2p}=\sigma_{s,t}^{2p}E|Z|^{2p}\le c^p\,E|Z|^{2p}\,|t-s|^{ap}.
$$
Choose $p$ with $ap>1$ and set $\beta=2p$, $\alpha=ap-1>0$. Cor 1.16 gives a continuous modification, $\gamma$-Hölder for $\gamma<\frac{\alpha}{\beta}=\frac{ap-1}{2p}=\frac a2-\frac1{2p}$. Letting $p\to\infty$: every $\gamma<a/2$.

(b) For BM, $E(B_t-B_s)^2=|t-s|$, so $a=1$ and $\gamma<\frac12$. Concretely, $E|B_t-B_s|^4=3|t-s|^2$ gives $\beta=4$, $\alpha=1$, $\gamma<\frac14$. With general $\beta>2$, $\gamma<\frac12-\frac1\beta$. With $\beta=2$: $E|B_t-B_s|^2=|t-s|^{1+0}$, so $\alpha=0$, which is not allowed (the theorem needs $\alpha>0$).

(c) For $h=|t-s|$ and any $\beta>0$, since $|N_t-N_s|$ is a nonnegative integer,
$$
E|N_t-N_s|^\beta\ge P(N_t-N_s\ge1)=1-e^{-\lambda h}\ge\frac{\lambda h}2\quad\text{for small }h,
$$
whereas $ch^{1+\alpha}=o(h)$. So the bound fails. No continuous modification: suppose $\tilde N$ were one. Then a.s. $\tilde N_q=N_q$ for all rational $q\in[0,1]$ (countably many null sets). So a.s. $t\mapsto\tilde N_t$ is continuous on $[0,1]$ and integer-valued on the dense set $\mathbb Q\cap[0,1]$. Its image $\tilde N([0,1])$ is an interval (intermediate value theorem) in which the integer set $\tilde N(\mathbb Q\cap[0,1])$ is dense, so the interval is a single point. Hence $\tilde N_1=\tilde N_0=N_0=0$ a.s. But $\tilde N_1=N_1$ a.s. and $P(N_1\ge1)=1-e^{-\lambda}>0$, a contradiction.

**Common pitfalls.** Applying Kolmogorov with $\beta=2$ for BM. Forgetting that the theorem only gives a **modification** (not that the original process is continuous).

### Exercise 9 (★, 15 min): Gaussian computations (Baldi 3.1, extended)

Let $0\le s\le t$. Compute (a) $E[B_sB_t^2]$; (b) $E[B_s^2B_t^2]$ and $\operatorname{Cov}(B_s^2,B_t^2)$; (c) $E[B_se^{B_s}]$; (d) $E[B_se^{B_t}]$, and $E[B_te^{B_s}]$.

**Strategy.** "Separate position and increment": $B_t=(B_t-B_s)+B_s$ with independent parts. Gaussian moments: $EZ^2=1$, $EZ^4=3$, odd moments 0. Gaussian integration by parts: $E[Xg(X)]=\sigma^2E[g'(X)]$ for $X\sim N(0,\sigma^2)$.

**Full solution.** Write $D=B_t-B_s\sim N(0,t-s)$, independent of $B_s\sim N(0,s)$.
(a) $E[B_s(D+B_s)^2]=E[B_s]E[D^2]+2E[B_s^2]E[D]+E[B_s^3]=0+0+0=0$. (Alternatively: $(B_s,B_t)\stackrel d=(-B_s,-B_t)$ since $-B$ is a BM, so $E[B_sB_t^2]=-E[B_sB_t^2]$.)
(b)
$$
E[B_s^2B_t^2]=E[B_s^2D^2]+2E[B_s^3D]+E[B_s^4]=s(t-s)+0+3s^2=st+2s^2,
$$
so $\operatorname{Cov}(B_s^2,B_t^2)=st+2s^2-st=2s^2=2(s\wedge t)^2$.
(c) With $g(x)=e^x$: $E[B_se^{B_s}]=sE[e^{B_s}]=se^{s/2}$ (Remark 2.10 b). Directly: $E[\sqrt sZe^{\sqrt sZ}]=\frac{\sqrt s}{\sqrt{2\pi}}\int ze^{\sqrt sz-z^2/2}dz$, and integrating by parts gives $\frac{s}{\sqrt{2\pi}}\int e^{\sqrt sz-z^2/2}dz=se^{s/2}$.
(d) $E[B_se^{B_t}]=E[B_se^{B_s}]E[e^{D}]=se^{s/2}e^{(t-s)/2}=se^{t/2}$. And
$$
E[B_te^{B_s}]=E[De^{B_s}]+E[B_se^{B_s}]=0+se^{s/2}=se^{s/2}.
$$
In general, $E[B_ue^{B_v}]=(u\wedge v)e^{v/2}$.

**Common pitfalls.** Forgetting the cross term $2E[B_s^3D]$ (it is 0, but it must be justified by independence and $E D=0$). Using $E Z^4=1$ instead of 3.

### Exercise 10 (★, 10 min): limits and exponential moments (Baldi 3.2, 3.3)

(a) Compute $\lim_{t\to\infty}P(B_t\le a)$ and $\lim_{t\to\infty}E[B_t\mathbf 1_{\{B_t\le a\}}]$.
(b) Compute $\lim_{t\to\infty}\sqrt t\,E[B_t^2e^{-B_t^2}]$.
(c) For which $\theta$ is $E[e^{\theta B_t^2}]<\infty$? Compute it.

**Strategy.** Scale: $B_t\stackrel d=\sqrt tZ$. Compute Gaussian integrals by completing the square.

**Full solution.** (a) $P(B_t\le a)=P(Z\le a/\sqrt t)=\Phi(a/\sqrt t)\to\Phi(0)=\frac12$. Next,
$$
E[B_t\mathbf 1_{\{B_t\le a\}}]=\int_{-\infty}^a\frac{x}{\sqrt{2\pi t}}e^{-x^2/(2t)}dx=\Big[-\frac{t}{\sqrt{2\pi t}}e^{-x^2/(2t)}\Big]_{-\infty}^a=-\sqrt{\frac t{2\pi}}\,e^{-a^2/(2t)}\xrightarrow[t\to\infty]{}-\infty .
$$
(b) $E[B_t^2e^{-B_t^2}]=E[tZ^2e^{-tZ^2}]=t\int\frac{z^2}{\sqrt{2\pi}}e^{-\frac{(2t+1)z^2}{2}}dz$. With $\sigma^2=\frac1{2t+1}$, $\int\frac{z^2}{\sqrt{2\pi}}e^{-z^2/(2\sigma^2)}dz=\sigma\cdot\sigma^2=\sigma^3$. So
$$
\sqrt t\,E[B_t^2e^{-B_t^2}]=\frac{t^{3/2}}{(2t+1)^{3/2}}\to2^{-3/2}=\frac1{\sqrt8}.
$$
(c) $E[e^{\theta tZ^2}]=\int\frac1{\sqrt{2\pi}}e^{-\frac12(1-2\theta t)z^2}dz=(1-2\theta t)^{-1/2}$ iff $\theta t<\frac12$. Otherwise it is $+\infty$ (Remark 2.10 c).

**Common pitfalls.** In (b), $\int z^2\phi_\sigma(z)dz=\sigma^2$ for the *normalized* $N(0,\sigma^2)$ density $\phi_\sigma$. Here the prefactor is $1/\sqrt{2\pi}$, not $1/\sqrt{2\pi\sigma^2}$, which brings in the extra factor $\sigma$.

### Exercise 11 (★★, 15 min): a two-time probability (Baldi 3.6)

(a) Show that for $0<s<t$ the joint density of $(B_s,B_t)$ is
$$
f_{s,t}(x,y)=\frac1{\sqrt{2\pi s}}e^{-\frac{x^2}{2s}}\cdot\frac1{\sqrt{2\pi(t-s)}}e^{-\frac{(y-x)^2}{2(t-s)}}.
$$
(b) Show $P(B_s<0,B_{2s}>0)=\frac18$.

**Strategy.** (a) Change of variables from the independent pair $(B_s,B_t-B_s)$. (b) Write it in terms of two independent standard normals and use the rotational invariance of the 2D standard Gaussian.

**Full solution.** (a) $(U,V)=(B_s,B_t-B_s)$ has independent components with density $\phi_s(u)\phi_{t-s}(v)$, where $\phi_r(x)=(2\pi r)^{-1/2}e^{-x^2/(2r)}$. The map $(u,v)\mapsto(x,y)=(u,u+v)$ is linear with Jacobian 1 and inverse $(x,y)\mapsto(x,y-x)$. So $(B_s,B_t)$ has density $\phi_s(x)\phi_{t-s}(y-x)$, as claimed.
(b) $B_s=\sqrt sX$, $B_{2s}-B_s=\sqrt sY$ with $X,Y$ independent $N(0,1)$. Then
$$
P(B_s<0,B_{2s}>0)=P(X<0,\ X+Y>0).
$$
The pair $(X,Y)$ has a rotation-invariant density $\frac1{2\pi}e^{-(x^2+y^2)/2}$, so the probability of a sector with vertex at 0 equals (angle)$/2\pi$. In polar angle $\theta$: $\{x<0\}=\{\theta\in(\frac\pi2,\frac{3\pi}2)\}$ and $\{x+y>0\}=\{\theta\in(-\frac\pi4,\frac{3\pi}4)\}$. The intersection is $\theta\in(\frac\pi2,\frac{3\pi}4)$, of angle $\frac\pi4$. Hence the probability is $\frac{\pi/4}{2\pi}=\frac18$.

(Check via (a): with $\Phi_s$ the $N(0,s)$ distribution function, $P=\int_{-\infty}^0\phi_s(x)\,P(B_{2s}-B_s>-x)\,dx=\int_{-\infty}^0\phi_s(x)\Phi_s(x)\,dx=\frac12\Phi_s(0)^2=\frac18$.)

**Common pitfalls.** Treating $B_s$ and $B_{2s}$ as independent (that would give $\frac14$).

### Exercise 12 (★★, 20 min): scaling and time inversion in action

(a) Show that $\sup_{0\le s\le t}B_s\stackrel d=\sqrt t\,\sup_{0\le u\le1}B_u$. Deduce $E[\sup_{s\le t}B_s]=\sqrt t\,E[\sup_{u\le1}B_u]$.
(b) For $a>0$ let $\tau_a=\inf\{t:B_t=a\}$. Show $\tau_a\stackrel d=a^2\tau_1$.
(c) Show $\lim_{s\to\infty}B_s/s=0$ a.s.

**Strategy.** Use Prop 2.4 (iii) with a well-chosen $c$, and (iv). The law of a functional of a continuous path that depends on countably many coordinates is determined by the f.d.d. (Prop 1.19).

**Full solution.** (a) By Prop 2.4 (iii) with $c=t^{-1/2}$, $W_u=t^{-1/2}B_{tu}$ is a (continuous) BM. Then
$$
\sup_{0\le s\le t}B_s=\sup_{0\le u\le1}B_{tu}=\sqrt t\sup_{0\le u\le1}W_u .
$$
By continuity, $\sup_{u\le1}W_u=\sup_{u\in\mathbb Q\cap[0,1]}W_u$ is a measurable function of countably many coordinates. Its law is determined by the f.d.d., which are the same for $W$ and $B$ (via $P(\sup_{q\in\{q_1,\dots,q_n\}}W_q\le x)\downarrow P(\sup_{q\in\mathbb Q\cap[0,1]}W_q\le x)$). Hence $\sup_{u\le1}W_u\stackrel d=\sup_{u\le1}B_u$, and the claim and the identity for expectations follow (both sides may be computed in $[0,\infty]$).
(b) Let $M_u=a^{-1}B_{a^2u}$, a BM (Prop 2.4 (iii) with $c=1/a$). Then
$$
\tau_a=\inf\{t:B_t=a\}=\inf\{a^2u:B_{a^2u}=a\}=a^2\inf\{u:M_u=1\}=a^2\tau_1^M .
$$
For each $t$, $\{\tau^M_1\le t\}=\{\sup_{u\le t}M_u\ge1\}$ by continuity (and $M_0=0<1$), an event of the countably-many-coordinates type. So $\tau_1^M\stackrel d=\tau_1^B$, and $\tau_a\stackrel d=a^2\tau_1$.
(c) By Prop 2.4 (iv), $Z_t=tB_{1/t}$ is a BM, continuous at 0 a.s. (Section 4.8). With $s=1/t$,
$$
\frac{B_s}{s}=\frac1sB_s=tB_{1/t}=Z_t\xrightarrow[t\to0+]{}Z_0=0\quad\text{a.s.}
$$
So $B_s/s\to0$ as $s\to\infty$, a.s. (the strong law of large numbers for BM).

**Common pitfalls.** In (a), equality in law of suprema needs the countable-time/continuity argument. Merely having the same one-dimensional marginals is not enough.

### Exercise 13 (★★, 25 min): the Ornstein–Uhlenbeck process (Baldi 3.7)

Let $X_t=e^{-t}B_{e^{2t}}$, $t\in\mathbb R$.
(a) Show $X$ is a centered Gaussian process with $\operatorname{Cov}(X_s,X_t)=e^{-|t-s|}$.
(b) Show $X$ is stationary: $(X_{t_1+h},\dots,X_{t_m+h})\stackrel d=(X_{t_1},\dots,X_{t_m})$.
(c) Show that $K(s,t)=e^{-|t-s|}$ is a positive definite kernel.
(d) Conversely, let $X$ be any centered Gaussian process with covariance $e^{-|t-s|}$. Show $W_u=\sqrt u\,X_{\frac12\log u}$ ($u>0$), $W_0=0$, is a natural BM, and that $X$ has a continuous modification.

**Strategy.** The Gaussian-process check (Prop 2.3 / Example 1.22). Covariance computations. Kolmogorov via Exercise 8(a).

**Full solution.** (a) $(X_{t_1},\dots,X_{t_m})=\operatorname{diag}(e^{-t_i})(B_{e^{2t_1}},\dots,B_{e^{2t_m}})$ is a linear image of a centered Gaussian vector, hence centered Gaussian. For $s\le t$,
$$
\operatorname{Cov}(X_s,X_t)=e^{-t-s}E[B_{e^{2s}}B_{e^{2t}}]=e^{-t-s}e^{2s}=e^{-(t-s)}=e^{-|t-s|}.
$$
(b) Both vectors are centered Gaussian, with covariance matrices $e^{-|(t_i+h)-(t_j+h)|}=e^{-|t_i-t_j|}$. They are equal, so the laws are equal.
(c) $K$ is the covariance function of the process $X$ in (a), so $(K(t_i,t_j))_{ij}$ is a covariance matrix and hence positive semi-definite.
(d) $W$ is a centered Gaussian process (a linear image of $X$ at the times $\frac12\log u_i$; $W_0=0$ is degenerate). For $0<v\le u$:
$$
E[W_uW_v]=\sqrt{uv}\,e^{-|\frac12\log u-\frac12\log v|}=\sqrt{uv}\,e^{-\frac12\log(u/v)}=\sqrt{uv}\sqrt{\frac vu}=v=u\wedge v .
$$
By Prop 2.3, $W$ is a natural BM. Continuity: $X_t-X_s$ is centered Gaussian with
$$
E[(X_t-X_s)^2]=2-2e^{-|t-s|}\le2|t-s|,
$$
using $1-e^{-x}\le x$ for $x\ge0$. By Exercise 8(a) with $a=1$, $X$ has a continuous modification (Hölder of every order $<\frac12$). Alternatively, if $\tilde W$ is a continuous modification of $W$, then $\tilde X_t=e^{-t}\tilde W_{e^{2t}}$ is a continuous modification of $X$, since $X_t=e^{-t}W_{e^{2t}}$.

**Common pitfalls.** In (d), the absolute value in $|\frac12\log u-\frac12\log v|$: for $v\le u$ it equals $\frac12\log(u/v)$. In the continuity part, quoting Kolmogorov with only the second moment ($\alpha=0$).

### Exercise 14 (★★, 25 min): quadratic variation, dyadic partitions, and a first Itô sum

Let $\pi_n=\{kt2^{-n}:k=0,\dots,2^n\}$ be the dyadic partitions of $[0,t]$, $S_n=\sum_k(\Delta_kB)^2$ and $\Delta_kB=B_{(k+1)t2^{-n}}-B_{kt2^{-n}}$.
(a) For a general partition $\pi$ of $[s,t]$, compute $E[S_\pi]$ and $\operatorname{Var}(S_\pi)$ exactly.
(b) Show $S_n\to t$ **almost surely**.
(c) Show $\sum_k|\Delta_kB|^3\to0$ in $L^1$, and $E\sum_k|\Delta_kB|\to\infty$.
(d) Show that in $L^2$
$$
\sum_kB_{t_k}(B_{t_{k+1}}-B_{t_k})\xrightarrow[|\pi|\to0]{}\frac12\big(B_t^2-t\big)\qquad(\pi\text{ partition of }[0,t]).
$$

**Strategy.** Independence of increments, Gaussian moments, Chebyshev plus Borel–Cantelli. The algebraic identity $a(b-a)=\frac12(b^2-a^2)-\frac12(b-a)^2$.

**Full solution.** (a) $E[S_\pi]=\sum_k\Delta_kt=t-s$. By independence, $\operatorname{Var}(S_\pi)=\sum_k\operatorname{Var}((\Delta_kB)^2)=\sum_k(\Delta_kt)^2\operatorname{Var}(Z^2)=2\sum_k(\Delta_kt)^2$, since $\operatorname{Var}(Z^2)=3-1=2$.
(b) Here $\Delta_kt=t2^{-n}$, so $\operatorname{Var}(S_n)=2\cdot2^n\cdot t^24^{-n}=2t^22^{-n}$. By Chebyshev, for $\varepsilon>0$,
$$
P(|S_n-t|>\varepsilon)\le\frac{2t^2}{\varepsilon^22^n},\qquad\sum_n\frac{2t^2}{\varepsilon^22^n}<\infty .
$$
By Borel–Cantelli, a.s. $|S_n-t|\le\varepsilon$ eventually. Taking $\varepsilon=1/j$, $j\in\mathbb N$ (countably many), $S_n\to t$ a.s.
(c) $E|\Delta_kB|^3=(\Delta_kt)^{3/2}E|Z|^3$, so
$$
E\sum_k|\Delta_kB|^3=E|Z|^3\sum_k(\Delta_kt)^{3/2}\le E|Z|^3|\pi|^{1/2}\sum_k\Delta_kt=E|Z|^3\,|\pi|^{1/2}\,t\to0 .
$$
For the first variation along dyadic partitions: $E\sum_k|\Delta_kB|=2^n\sqrt{t2^{-n}}\,E|Z|=\sqrt{\frac{2t}\pi}\,2^{n/2}\to\infty$. (This is consistent with Prop 2.15.)
(d) With $a=B_{t_k}$, $b=B_{t_{k+1}}$: $a(b-a)=\frac12(b^2-a^2)-\frac12(b-a)^2$. Summing, the first part telescopes:
$$
\sum_kB_{t_k}\Delta_kB=\frac12(B_t^2-B_0^2)-\frac12S_\pi=\frac12B_t^2-\frac12S_\pi .
$$
Hence $\big\|\sum_kB_{t_k}\Delta_kB-\frac12(B_t^2-t)\big\|_{L^2}=\frac12\|S_\pi-t\|_{L^2}\to0$ by Prop 2.15. (This is the Itô integral $\int_0^tB\,dB=\frac12B_t^2-\frac12t$. The "$-\frac12t$" is the quadratic variation correction.)

**Common pitfalls.** Claiming a.s. convergence for arbitrary partitions: the summability $\sum_n|\pi_n|<\infty$ is what makes Borel–Cantelli work. In (d), forgetting $B_0=0$.

### Exercise 15 (★★, 15 min): the Brownian bridge

Let $X_t=B_t-tB_1$, $t\in[0,1]$.
(a) Show $X$ is a centered Gaussian process with $\operatorname{Cov}(X_s,X_t)=s(1-t)$ for $s\le t$.
(b) Show $X$ is independent of $B_1$ (i.e. $\sigma(X_t,t\le1)$ is independent of $\sigma(B_1)$).
(c) Is $X$ a Brownian motion?

**Strategy.** A linear image of a Gaussian process is Gaussian. In a Gaussian family, uncorrelated means independent, plus a $\pi$-system argument.

**Full solution.** (a) $(X_{t_1},\dots,X_{t_m})$ is a linear image of the centered Gaussian vector $(B_{t_1},\dots,B_{t_m},B_1)$, hence centered Gaussian. For $s\le t\le1$,
$$
\operatorname{Cov}(X_s,X_t)=E[B_sB_t]-tE[B_sB_1]-sE[B_1B_t]+stE[B_1^2]=s-ts-st+st=s-st=s(1-t).
$$
(b) $(X_{t_1},\dots,X_{t_m},B_1)$ is jointly Gaussian, and $\operatorname{Cov}(X_{t_i},B_1)=t_i-t_i\cdot1=0$. So $(X_{t_1},\dots,X_{t_m})$ is independent of $B_1$. The events $\{X_{t_1}\in\Gamma_1,\dots,X_{t_m}\in\Gamma_m\}$ form a $\pi$-system generating $\sigma(X_t,t\le1)$, so Lemma 2.8 gives the independence.
(c) No: $\operatorname{Var}(X_1)=1\cdot(1-1)=0\neq1$. Equivalently, the covariance $s(1-t)\neq s\wedge t$.

**Common pitfalls.** Claiming independence from uncorrelatedness without joint Gaussianity.

### Exercise 16 (★★, 20 min): correlated Brownian motion (Baldi 3.8)

Let $\rho\in[-1,1]$ and $B=(B_1,B_2)$ a 2-dimensional BM.
(a) Let $X_2=B_2$ and $X_1=\sqrt{1-\rho^2}\,B_1+\rho B_2$. Show $X_1,X_2$ are real BMs, $X=(X_1,X_2)$ is a Gaussian process, and $\operatorname{Cov}(X_1(t),X_2(s))=\rho(s\wedge t)$.
(b) Conversely, let $X$ be a Gaussian process such that $X_1,X_2$ are real BMs with $\operatorname{Cov}(X_1(t),X_2(s))=\rho(s\wedge t)$, $|\rho|<1$. Define $W_2=X_2$ and $W_1=\frac{1}{\sqrt{1-\rho^2}}(X_1-\rho X_2)$. Show $W=(W_1,W_2)$ is a 2-dimensional (natural) BM.

**Strategy.** Linear images of Gaussian processes. Compute covariances. For a 2-dimensional BM, show that the components are independent real BMs via Gaussian uncorrelatedness.

**Full solution.** (a) $X$ is a linear image of the Gaussian process $B$ (by Remark 2.6, the components of $B$ are independent real BMs, so $(B_1(t_i),B_2(t_i))_i$ is a Gaussian vector). Hence $X$ is a centered Gaussian process. $X_2=B_2$ is a BM. For $X_1$: $X_1(0)=0$, it is continuous, and
$$
E[X_1(t)X_1(s)]=(1-\rho^2)(s\wedge t)+\rho^2(s\wedge t)+2\rho\sqrt{1-\rho^2}\,E[B_1(t)B_2(s)]=s\wedge t,
$$
using the independence of $B_1,B_2$. By Prop 2.3, $X_1$ is a BM. Also $E[X_1(t)X_2(s)]=\sqrt{1-\rho^2}\cdot0+\rho E[B_2(t)B_2(s)]=\rho(s\wedge t)$.
(b) $W$ is a centered Gaussian process (a linear image of $X$). For $s\le t$:
$$
\begin{aligned}
E[W_1(t)W_1(s)]&=\frac1{1-\rho^2}\Big(E[X_1(t)X_1(s)]-\rho E[X_1(t)X_2(s)]-\rho E[X_2(t)X_1(s)]+\rho^2E[X_2(t)X_2(s)]\Big)\\
&=\frac{s}{1-\rho^2}\big(1-\rho^2-\rho^2+\rho^2\big)=s,\\
E[W_1(t)W_2(s)]&=\frac1{\sqrt{1-\rho^2}}\Big(E[X_1(t)X_2(s)]-\rho E[X_2(t)X_2(s)]\Big)=\frac{\rho s-\rho s}{\sqrt{1-\rho^2}}=0 ,
\end{aligned}
$$
and similarly $E[W_1(s)W_2(t)]=0$. So $W_1,W_2$ are real natural BMs (Prop 2.3) and $\operatorname{Cov}(W_i(t),W_j(u))=\delta_{ij}(t\wedge u)$. Let $\mathcal G_s=\sigma(W(u),u\le s)$. For $u\le s\le t$, $\operatorname{Cov}(W_i(t)-W_i(s),W_j(u))=\delta_{ij}(u-u)=0$. By joint Gaussianity, $W(t)-W(s)$ is independent of every finite vector $(W(u_1),\dots,W(u_k))$, $u_l\le s$, hence of $\mathcal G_s$ (Lemma 2.8). Also $W(t)-W(s)$ is centered Gaussian with covariance matrix $(t-s)I_2$ and $W(0)=0$. So $W$ is a 2-dimensional BM w.r.t. $(\mathcal G_t)$.

**Common pitfalls.** Forgetting that $|\rho|<1$ is needed to divide by $\sqrt{1-\rho^2}$. Checking only that each $W_i$ is a BM: a 2-dimensional BM also needs independence of the components (equivalently, the $N(0,(t-s)I_2)$ increments).

### Exercise 17 (★, 10 min): linear images of m-dimensional BM (Baldi 3.9, Remark 2.6)

Let $B$ be an $m$-dimensional $(\mathcal F_t)$-BM and $A$ an $m\times m$ matrix.
(a) Show $X_t=AB_t$ is an $m$-dimensional $(\mathcal F_t)$-BM iff $A$ is orthogonal.
(b) Show that for $z\in\mathbb R^m\setminus\{0\}$, $\frac1{|z|}\langle z,B_t\rangle$ is a real $(\mathcal F_t)$-BM.

**Strategy.** Increments of $X$ are linear images of increments of $B$. The covariance of $A Y$ is $A\,\mathrm{Cov}(Y)A^T$.

**Full solution.** (a) $X_0=0$, $X$ is adapted, and $X_t-X_s=A(B_t-B_s)$ is independent of $\mathcal F_s$ (a function of $B_t-B_s$). It is centered Gaussian with covariance $A(t-s)I_mA^T=(t-s)AA^T$. This equals $(t-s)I_m$ iff $AA^T=I_m$, i.e. $A$ is orthogonal. Conversely, if $X$ is a BM, then $\operatorname{Cov}(X_1)=AA^T$ must be $I_m$.
(b) Let $u=z/|z|$, $|u|=1$. $\langle u,B_t\rangle-\langle u,B_s\rangle=\langle u,B_t-B_s\rangle$ is independent of $\mathcal F_s$ and centered Gaussian with variance $(t-s)u^Tu=t-s$ (Remark 2.6 c).

**Common pitfalls.** Writing $\operatorname{Cov}(AY)=A^TA\,\mathrm{Cov}(Y)$ or similar. The correct formula is $A\,\mathrm{Cov}(Y)A^T$.

### Exercise 18 (★★★, 35 min): a BM in its own filtration but not in a larger one (Baldi 3.12)

Let $B$ be an $(\mathcal F_t)$-BM and $Z_t=B_t-\int_0^t\frac{B_u}u\,du$.
(a) Show the integral converges a.s. and $Z$ is a BM w.r.t. its natural filtration $(\mathcal G_t)$.
(b) Show $Z$ is $(\mathcal F_t)$-adapted but **not** an $(\mathcal F_t)$-BM.
(c) Show that $B_t$ is independent of $\mathcal G_t$ for every $t$.

**Strategy.** Integrability from $E|B_u|=\sqrt{2u/\pi}$. Gaussianity as a limit of Gaussian Riemann sums. Covariance by Fubini. For (b), test independence of $Z_t-Z_s$ against the $\mathcal F_s$-measurable $B_s$.

**Full solution.** (a) *Convergence.* $E\int_0^t\frac{|B_u|}u\,du=\int_0^t\frac{\sqrt{2u/\pi}}u\,du=\sqrt{2/\pi}\int_0^tu^{-1/2}du<\infty$ (Tonelli). So $\int_0^t\frac{|B_u|}u\,du<\infty$ a.s., and the integral converges absolutely a.s.

*Gaussian.* For $\varepsilon>0$ let $Z^\varepsilon_t=B_t-\int_\varepsilon^t\frac{B_u}u\,du$ for $t\ge\varepsilon$ ($Z^\varepsilon_t=B_t$ for $t<\varepsilon$). The integral over $[\varepsilon,t]$ of the continuous function $B_u/u$ is a pointwise limit of Riemann sums, which are linear combinations of $B$ at finitely many times. So for fixed $t_1,\dots,t_m$, $(Z^\varepsilon_{t_i})_i$ is a pointwise limit of centered Gaussian vectors. As $\varepsilon\to0$, $Z^\varepsilon_{t_i}\to Z_{t_i}$ a.s. An a.s. (hence in law) limit of centered Gaussian vectors is centered Gaussian (characteristic functions $e^{-\frac12\theta^T\Gamma_n\theta}$ converge, which forces $\Gamma_n\to\Gamma$). So $Z$ is a centered Gaussian process with $Z_0=0$.

*Covariance.* For $0<s\le t$, by Fubini (justified by $E[|B_uB_v|]\le\sqrt{uv}$ and $\int_0^t\int_0^s\frac{\sqrt{uv}}{uv}\,dv\,du<\infty$):
$$
E[Z_sZ_t]=E[B_sB_t]-\int_0^s\frac{E[B_tB_v]}v\,dv-\int_0^t\frac{E[B_sB_u]}u\,du+\int_0^s\!\!\int_0^t\frac{E[B_vB_u]}{uv}\,du\,dv .
$$
The terms:
$$
\int_0^s\frac{v}{v}dv=s,\qquad\int_0^t\frac{s\wedge u}u\,du=\int_0^s1\,du+\int_s^t\frac su\,du=s+s\log\frac ts,
$$
and, for $v\le s\le t$, $\int_0^t\frac{u\wedge v}{uv}\,du=\int_0^v\frac1v\,du+\int_v^t\frac1u\,du=1+\log t-\log v$, so
$$
\int_0^s(1+\log t-\log v)\,dv=s+s\log t-(s\log s-s)=2s+s\log\frac ts .
$$
Altogether $E[Z_sZ_t]=s-s-\big(s+s\log\frac ts\big)+2s+s\log\frac ts=s=s\wedge t$. By Prop 2.3, $Z$ is a natural BM. (It is continuous since $t\mapsto\int_0^tB_u/u\,du$ is continuous where the integral converges.)

(b) $Z_t$ is $\mathcal F_t$-measurable: $B_t$ is, and $\int_0^tB_u/u\,du$ is a limit of Riemann sums of $\mathcal F_t$-measurable variables (or use Example 1.11). If $Z$ were an $(\mathcal F_t)$-BM, then for $0<s<t$, $Z_t-Z_s$ would be independent of the $\mathcal F_s$-measurable $B_s$, so $E[(Z_t-Z_s)B_s]=E[Z_t-Z_s]E[B_s]=0$. But
$$
E[(Z_t-Z_s)B_s]=E[(B_t-B_s)B_s]-\int_s^t\frac{E[B_uB_s]}u\,du=0-\int_s^t\frac su\,du=-s\log\frac ts\neq0 .
$$
(c) $(B_t,Z_{s_1},\dots,Z_{s_k})$ is jointly Gaussian (same limit argument), and for $s\le t$
$$
E[Z_sB_t]=E[B_sB_t]-\int_0^s\frac{E[B_uB_t]}u\,du=s-\int_0^s1\,du=0 .
$$
So $B_t$ is independent of each $(Z_{s_1},\dots,Z_{s_k})$, $s_i\le t$, hence of $\mathcal G_t$ by Lemma 2.8.

**Common pitfalls.** Forgetting to justify Fubini (integrability near $0$). Splitting $\int_0^t\frac{s\wedge u}{u}du$ incorrectly. In (b), proving "not a BM" by showing something about $Z$ alone: $Z$ **is** a BM in law, so the obstruction must involve the larger filtration.

### Exercise 19 (★★, 15 min): enlarging the filtration by an independent sigma-algebra (Baldi 3.5)

Let $B$ be an $(\mathcal F_t)$-BM and $\mathcal G$ a $\sigma$-algebra independent of $\mathcal F_\infty$. Let $\tilde{\mathcal F}_t=\mathcal F_t\vee\mathcal G$. Show $B$ is an $(\tilde{\mathcal F}_t)$-BM.

**Strategy.** The class $\{A\cap G\}$ is a $\pi$-system generating $\tilde{\mathcal F}_s$. Then apply Lemma 2.8.

**Full solution.** Adaptedness, $B_0=0$ and the Gaussian increments are unchanged. Fix $s\le t$. Let $\mathcal C=\{A\cap G:A\in\mathcal F_s,G\in\mathcal G\}$. It is stable under intersections ($(A\cap G)\cap(A'\cap G')=(A\cap A')\cap(G\cap G')$). It contains $\mathcal F_s$ ($G=\Omega$) and $\mathcal G$ ($A=\Omega$), and is contained in $\mathcal F_s\vee\mathcal G$, so $\sigma(\mathcal C)=\tilde{\mathcal F}_s$. For $\Gamma\in\mathcal B(\mathbb R)$, $A\in\mathcal F_s$, $G\in\mathcal G$: $\{B_t-B_s\in\Gamma\}\cap A\in\mathcal F_t\subset\mathcal F_\infty$ is independent of $G$, and $\{B_t-B_s\in\Gamma\}$ is independent of $A$, so
$$
P(\{B_t-B_s\in\Gamma\}\cap A\cap G)=P(\{B_t-B_s\in\Gamma\}\cap A)P(G)=P(B_t-B_s\in\Gamma)P(A)P(G)=P(B_t-B_s\in\Gamma)P(A\cap G),
$$
where the last step uses that $A\in\mathcal F_\infty$ and $G$ are independent. By Lemma 2.8, $B_t-B_s$ is independent of $\tilde{\mathcal F}_s$.

**Common pitfalls.** Checking only events of $\mathcal F_s$ and of $\mathcal G$ separately: $\mathcal F_s\cup\mathcal G$ is not a $\pi$-system.

### Exercise 20 (★★, 15 min): independence of a future functional (Remark 2.9)

Let $B$ be an $(\mathcal F_t)$-BM, $0\le s<b$, and $Y=\int_s^b(B_u-B_s)\,du$. Show $Y$ is independent of $\mathcal F_s$ and $Y\sim N\big(0,\frac{(b-s)^3}3\big)$.

**Strategy.** $Y$ is a function of the future increment process, so Remark 2.9 applies. The law: Gaussian limit of Riemann sums; variance by Fubini.

**Full solution.** $W_h=B_{s+h}-B_s$ is a BM (Prop 2.4 i), and $Y=\int_0^{b-s}W_h\,dh$ is the pointwise limit of Riemann sums $\sum_iW_{h_i}\Delta h_i$ (continuous paths). So $Y$ is $\sigma(B_u-B_s,u\ge s)$-measurable, and by Remark 2.9 it is independent of $\mathcal F_s$. The Riemann sums are centered Gaussian, and their a.s. limit $Y$ is centered Gaussian. Its variance, by Fubini ($E|W_hW_k|\le\sqrt{hk}$ is integrable), with $L=b-s$:
$$
E[Y^2]=\int_0^L\!\!\int_0^LE[W_hW_k]\,dh\,dk=\int_0^L\!\!\int_0^L(h\wedge k)\,dh\,dk=2\int_0^L\!\!\int_0^kh\,dh\,dk=2\int_0^L\frac{k^2}2\,dk=\frac{L^3}3 .
$$

**Common pitfalls.** Arguing independence only from $B_u-B_s$ being independent of $\mathcal F_s$ for each $u$ separately: you need the joint statement of Remark 2.9 for the whole family.

### Exercise 21 (★★, 20 min): consequences of the LIL (Baldi 3.13, 3.14)

(a) Show that for all $a>0$, $T>0$: $P(B_t\le a\sqrt t\ \text{for all}\ t\le T)=0$.
(b) Let $X_t=e^{bt+\sigma B_t}$, $\sigma>0$. Study $\lim_{t\to\infty}X_t$ a.s. according to $b$, and $\lim_{t\to\infty}E[X_t]$. Comment.
(c) Show that a.s. $B$ visits every real level infinitely often, and has infinitely many zeros in $[0,\varepsilon]$ for every $\varepsilon>0$.

**Strategy.** Compare the given growth with $\sqrt{2t\log\log(1/t)}$ or $\sqrt{2t\log\log t}$. Use $B_t/t\to0$ (Exercise 12 c). Use $E e^{\sigma B_t}=e^{\sigma^2t/2}$.

**Full solution.** (a) By LIL (a), a.s. there exist $t_n\downarrow0$ with $B_{t_n}\ge\frac12\sqrt{2t_n\log\log(1/t_n)}$. Since $\sqrt{\log\log(1/t_n)}\to\infty$, eventually $\frac12\sqrt{2\log\log(1/t_n)}>a$, i.e. $B_{t_n}>a\sqrt{t_n}$ with $t_n\le T$. So the event has probability 0.
(b) $bt+\sigma B_t=t\big(b+\sigma\frac{B_t}t\big)$ and $B_t/t\to0$ a.s. If $b>0$, the exponent $\to+\infty$ and $X_t\to+\infty$ a.s. If $b<0$, $X_t\to0$ a.s. If $b=0$, by LIL (c), (d): $\limsup B_t=+\infty$ and $\liminf B_t=-\infty$, so $\limsup X_t=+\infty$, $\liminf X_t=0$, and there is no limit. Expectations: $E[X_t]=e^{bt}E[e^{\sigma B_t}]=e^{(b+\sigma^2/2)t}$, which tends to $+\infty$ if $b>-\sigma^2/2$, to $1$ if $b=-\sigma^2/2$, and to $0$ if $b<-\sigma^2/2$. *Comment:* for $-\sigma^2/2<b<0$, $X_t\to0$ a.s. but $E[X_t]\to\infty$. So a.s. convergence does not imply convergence of expectations (no uniform integrability).
(c) By LIL (c), (d) there are $t_n\to\infty$ with $B_{t_n}\to+\infty$ and $s_n\to\infty$ with $B_{s_n}\to-\infty$. By the intermediate value theorem, every level $x$ is crossed between consecutive large positive and negative excursions, infinitely often. Near 0: by LIL (a), (b), in every $[0,\varepsilon]$ there are times with $B>0$ and times with $B<0$, accumulating at 0. By continuity there are zeros between them, hence infinitely many zeros in $[0,\varepsilon]$.

**Common pitfalls.** In (b) with $b<0$, saying "$X_t\to0$ hence $E X_t\to0$".

### Exercise 22 (★★★, 30 min): using the strong Markov property (Theorem 2.19, Prop 1.29)

Let $B$ be a real BM and $\tau=\inf\{t\ge0:|B_t|\ge1\}$, the exit time of $(-1,1)$.
(a) Show $\tau$ is an a.s. finite stopping time, $|B_\tau|=1$, and $P(B_\tau=1)=\frac12$.
(b) Show that $B_\tau$ is $\mathcal F_\tau$-measurable, and compute $E[B_{\tau+t}^2]$ for $t\ge0$.
(c) Compute $P(B_{\tau+t}>1)$.

**Strategy.** Prop 1.27(a) for an open set. LIL for finiteness. Symmetry $B\to-B$. Prop 1.29 for measurability. Theorem 2.19: $Y_t=B_{\tau+t}-B_\tau$ is a BM independent of $\mathcal F_\tau$.

**Full solution.** (a) $\tau=\tau_A$ with $A=(-1,1)$ open and $B$ continuous and adapted, so $\tau$ is a stopping time by Prop 1.27(a). By LIL (c), $\limsup_{t\to\infty}B_t=+\infty$ a.s., so a.s. some $t$ has $B_t\ge1$, and $\tau<\infty$ a.s. By continuity $|B_\tau|=1$ on $\{\tau<\infty\}$ ($|B_t|<1$ for $t<\tau$, and $|B_\tau|\ge1$ by right-continuity at the infimum and closedness of $\{|x|\ge1\}$). The exit time of $-B$ from $(-1,1)$ is the same $\tau$, and $-B$ is a BM with the same law (as a continuous process) as $B$. Hence $P(B_\tau=1)=P(-B_\tau=1)=P(B_\tau=-1)$, and both equal $\frac12$.
(b) $B$ is continuous and adapted, hence progressive (Prop 1.9), so $B_\tau$ is $\mathcal F_\tau$-measurable (Prop 1.29). By Theorem 2.19, $Y_t=B_{\tau+t}-B_\tau$ is a BM independent of $\mathcal F_\tau$, hence independent of $B_\tau$. Then
$$
E[B_{\tau+t}^2]=E[(B_\tau+Y_t)^2]=E[B_\tau^2]+2E[B_\tau]E[Y_t]+E[Y_t^2]=1+0+t=1+t .
$$
(c) Using independence of $B_\tau$ and $Y_t\sim N(0,t)$:
$$
P(B_{\tau+t}>1)=P(B_\tau=1)P(Y_t>0)+P(B_\tau=-1)P(Y_t>2)=\frac14+\frac12\Big(1-\Phi\big(\tfrac2{\sqrt t}\big)\Big).
$$

**Common pitfalls.** Using Theorem 2.19 without checking that $\tau$ is an **a.s. finite stopping time**. Forgetting that independence of $Y$ from $\mathcal F_\tau$ only helps once you know $B_\tau\in\mathcal F_\tau$ (Prop 1.29).

### Exercise 23 (★, 10 min): BM or not?

Decide whether each process is a BM (in its natural filtration), with $B,W$ independent BMs.
(a) $X_t=B_{2t}-B_t$. (b) $X_t=aB_t+bW_t$ with $a^2+b^2=1$. (c) $X_t=\sqrt2\,B_{t/2}$. (d) $X_t=tB_1$. (e) $X_t=B_t+t$.

**Strategy.** All are Gaussian processes (linear images, plus a deterministic drift in (e)). Check $X_0=0$, the mean, and the covariance $s\wedge t$ (Prop 2.3), plus continuity.

**Full solution.** (a) Centered Gaussian, $X_0=0$, $\operatorname{Var}(X_t)=2t+t-2t=t$. But for $s<t$:
$$
E[X_sX_t]=E[B_{2s}B_{2t}]-E[B_{2s}B_t]-E[B_sB_{2t}]+E[B_sB_t]=2s-(2s\wedge t)-s+s=2s-(2s\wedge t).
$$
If $2s\le t$ this is $0\neq s$. **Not** a BM (increments over disjoint far-apart intervals are uncorrelated, e.g. $X_1$ and $X_3$ are independent).
(b) $(B,W)$ is a 2-dimensional BM, so $X=\langle(a,b),(B,W)\rangle$ is a BM by Remark 2.6 c, since $|(a,b)|=1$. Directly: $E[X_sX_t]=(a^2+b^2)(s\wedge t)=s\wedge t$. **BM.**
(c) Scaling with $c=\sqrt2$: $cB_{t/c^2}=\sqrt2B_{t/2}$. **BM** (Prop 2.4 iii).
(d) Centered Gaussian, $E[X_sX_t]=st\neq s\wedge t$ (e.g. $s=t=4$: $16\neq4$). **Not** a BM.
(e) $E[X_t]=t\neq0$. **Not** a BM (it is a BM with drift).

**Common pitfalls.** Checking only $\operatorname{Var}(X_t)=t$: (a) has the right variance but is not a BM. One-dimensional marginals do not determine the process.

### Exercise 24 (★★★, 20 min): the stopped process is progressive

Let $X$ be progressively measurable and $\tau$ a stopping time. Show that the stopped process $X^\tau_t:=X_{\tau\wedge t}$ is progressively measurable. Deduce that $X_{\tau\wedge t}$ is $\mathcal F_t$-measurable for each $t$.

**Strategy.** Write $X^\tau|_{[0,t]\times\Omega}=X|_{[0,t]\times\Omega}\circ\varphi$ with $\varphi(s,\omega)=(\tau(\omega)\wedge s,\omega)$, and show $\varphi$ is measurable from $\mathcal B([0,t])\otimes\mathcal F_t$ to itself.

**Full solution.** Fix $t$ and let $\varphi:[0,t]\times\Omega\to[0,t]\times\Omega$, $\varphi(s,\omega)=(\tau(\omega)\wedge s,\omega)$. It suffices to check preimages of rectangles $A\times F$, $A\in\mathcal B([0,t])$, $F\in\mathcal F_t$: $\varphi^{-1}(A\times F)=\{(s,\omega):\tau(\omega)\wedge s\in A\}\cap([0,t]\times F)$. So it suffices that $g(s,\omega)=\tau(\omega)\wedge s$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable. For $r<t$:
$$
\{(s,\omega)\in[0,t]\times\Omega:\tau(\omega)\wedge s\le r\}=\big([0,r]\times\Omega\big)\cup\big([0,t]\times\{\tau\le r\}\big),
$$
and $\{\tau\le r\}\in\mathcal F_r\subset\mathcal F_t$. For $r\ge t$ the set is everything. So $g$ is measurable, hence so is $\varphi$. Since $X|_{[0,t]\times\Omega}$ is $(\mathcal B([0,t])\otimes\mathcal F_t,\mathcal B(E))$-measurable, the composition $(s,\omega)\mapsto X_{\tau(\omega)\wedge s}(\omega)$ is too. So $X^\tau$ is progressive. By Exercise 3(a) it is adapted, i.e. $X_{\tau\wedge t}$ is $\mathcal F_t$-measurable.

**Common pitfalls.** Trying to prove measurability of $X^\tau$ via joint measurability of $X$ only. The point is that everything stays inside $[0,t]\times\Omega$ with $\mathcal F_t$.

### Exercise 25 (★, 10 min): the discrete approximation of a stopping time (Lemma 2.18)

Let $\tau$ be a stopping time and $\tau_n=\frac{k+1}{2^n}$ on $\{\frac k{2^n}<\tau\le\frac{k+1}{2^n}\}$, $\tau_n=0$ on $\{\tau=0\}$, $\tau_n=\infty$ on $\{\tau=\infty\}$. Show: (a) $\tau_n$ is a stopping time; (b) $\tau\le\tau_n\le\tau+2^{-n}$ and $\tau_{n+1}\le\tau_n$; (c) $\mathcal F_\tau\subset\mathcal F_{\tau_n}$.

**Strategy.** $\tau_n$ is the smallest point of the grid $2^{-n}\mathbb N$ that is $\ge\tau$.

**Full solution.** (a) $\tau_n$ takes values in $2^{-n}\mathbb N\cup\{\infty\}$, and for $j\in\mathbb N$, $\{\tau_n\le j2^{-n}\}=\{\tau\le j2^{-n}\}$. Hence for $t\ge0$, with $j=\lfloor2^nt\rfloor$,
$$
\{\tau_n\le t\}=\{\tau_n\le j2^{-n}\}=\{\tau\le j2^{-n}\}\in\mathcal F_{j2^{-n}}\subset\mathcal F_t .
$$
(b) On $\{\frac k{2^n}<\tau\le\frac{k+1}{2^n}\}$: $\tau\le\tau_n=\frac{k+1}{2^n}<\tau+2^{-n}$. Since the grid $2^{-n}\mathbb N$ is contained in the grid $2^{-(n+1)}\mathbb N$, the smallest grid point $\ge\tau$ can only decrease when the grid is refined: $\tau_{n+1}\le\tau_n$. Hence $\tau_n\downarrow\tau$.
(c) $\tau\le\tau_n$ and Prop 1.28(c).

**Common pitfalls.** Rounding **down** ($\frac k{2^n}$) instead of up: $\lfloor2^n\tau\rfloor2^{-n}$ is generally **not** a stopping time, since it "anticipates".

### Exercise 26 (★, 10 min): Gaussian computations in dimension m

Let $B$ be an $m$-dimensional BM. Compute (a) $E|B_t|^2$ and $E|B_t|^4$; (b) $P(|B_t|\le r)$ for $m=2$; (c) $E[\langle a,B_t\rangle\langle b,B_s\rangle]$ for $a,b\in\mathbb R^m$.

**Strategy.** The components are independent real BMs (Remark 2.6 b). Polar coordinates for $m=2$.

**Full solution.** (a) $E|B_t|^2=\sum_iE[B_i(t)^2]=mt$. Also
$$
E|B_t|^4=E\Big(\sum_iB_i^2\Big)^2=\sum_iE B_i^4+\sum_{i\neq j}EB_i^2EB_j^2=3mt^2+m(m-1)t^2=m(m+2)t^2 .
$$
(b) The density of $B_t$ is $\frac1{2\pi t}e^{-|x|^2/(2t)}$, so
$$
P(|B_t|\le r)=\int_0^r\frac1{2\pi t}e^{-\rho^2/(2t)}\,2\pi\rho\,d\rho=1-e^{-r^2/(2t)}.
$$
(c) $E[\langle a,B_t\rangle\langle b,B_s\rangle]=\sum_{i,j}a_ib_jE[B_i(t)B_j(s)]=\sum_ia_ib_i(s\wedge t)=\langle a,b\rangle(s\wedge t)$.

**Common pitfalls.** Forgetting the cross terms $i\neq j$ in $E|B_t|^4$.

## 6. Predicted exam questions

Ranked from most to least likely. Each has a one-line answer outline.

1. **State and prove Prop 2.15 (quadratic variation in $L^2$) and deduce infinite variation.** Outline: $S_\pi-(t-s)=\sum Y_k$ with independent centered $Y_k$, so $E[\cdot^2]=2\sum(\Delta t)^2\le2|\pi|(t-s)$. Then $S_\pi\le\max|\Delta X|\cdot V$, take a subsequence, and get a contradiction.
2. **State and prove Prop 2.3 (BM as a centered Gaussian process with covariance $s\wedge t$).** Outline: induction for Gaussianity, the covariance split. For the converse: variance $t-s$, and uncorrelated increments plus joint Gaussianity give independence, upgraded by Lemma 2.8.
3. **Prove Prop 2.4, especially time inversion (including continuity at 0).** Outline: check Def 2.1 for shift, symmetry and scaling. For $Z$: Prop 2.3 with $st(\frac1t\wedge\frac1s)=s\wedge t$, then continuity at 0 via same f.d.d. and countable times.
4. **"Show that $X$ is a Brownian motion"** for a given Gaussian construction (scaling, time inversion, $\langle z,B\rangle$, correlated BM, OU transform). Outline: linear image means Gaussian. Check $X_0=0$, centered, covariance $s\wedge t$, and continuity.
5. **State and prove Prop 1.9.** Outline: right-endpoint dyadic approximation $X^{(n)}$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable (adaptedness, right endpoint $\le t$). Right-continuity gives pointwise convergence, so the limit is measurable.
6. **Prove Prop 1.28 (a)–(d).** Outline: case split $t\le s$ / $t>s$. $\wedge$ is a union, $\vee$ an intersection. $\{\tau\le t\}\subset\{\sigma\le t\}$. Union decomposition for (d).
7. **Prove Prop 1.29 ($X_\tau$ is $\mathcal F_\tau$-measurable).** Outline: $\mathcal F_\infty$-measurability, then localize to $\tau\wedge t$ and use the composition $\omega\mapsto(\omega,\tau\wedge t)$ with the progressive map.
8. **State Carathéodory's criterion and prove Prop 1.19.** Outline: cylinder events form a $\pi$-system generating $\sigma(X)$, $P=P'$ on it, then Carathéodory.
9. **Prove Prop 1.25 and/or Prop 1.27 (a), (b).** Outline: countable unions/intersections over $t\pm\frac1n$. Openness, compactness and continuity for (a). Rational times plus Prop 1.25 for (b).
10. **State Kolmogorov's continuity theorem and apply it to BM** (which exponents; why $\gamma<\frac12$). Outline: $E|B_t-B_s|^\beta=c_\beta|t-s|^{\beta/2}$, $\alpha=\beta/2-1$, $\gamma<\frac12-\frac1\beta$.
11. **State Lévy's modulus and prove Cor 2.13.** Outline: shifted BM on $[q,r]$, a countable union of null sets, and Hölder-$\gamma\ge\frac12$ gives ratio $\to0$, a contradiction.
12. **Define modification and indistinguishability; give Example 1.5; show the two coincide for continuous processes.** Outline: Exercise 1.
13. **Define progressive measurability; explain why it is needed (Examples 1.10, 1.11).** Outline: $\int_0^tX_s\,ds$ is $\mathcal F_t$-measurable via Fubini on $\mathcal B([0,t])\otimes\mathcal F_t$; $X_\tau$ is $\mathcal F_\tau$-measurable.
14. **State the LIL and deduce (c) from (a)**, or a consequence (recurrence, $B_t/t\to0$, zeros near 0). Outline: time inversion with $s=1/t$.
15. **State Daniell–Kolmogorov and use it to construct BM / a Gaussian process.** Outline: complete separable metric $E$ plus consistency. $t_i\wedge t_j$ is positive semi-definite (independent increments construction), and Gaussian marginals are consistent under projections.
16. **State the strong Markov property (Thm 2.19) and use it in a computation.** Outline: Exercise 22. Hypotheses: a.s. finite stopping time; conclusion: BM independent of $\mathcal F_\tau$.
17. **Covariance and moment computations** ($E[B_s^2B_t^2]$, $E[B_se^{B_t}]$, $P(B_s<0,B_{2s}>0)$, $E e^{\theta B_t^2}$). Outline: Exercises 9–11.
18. **Define usual conditions and explain Example 1.14.** Outline: the null set $\{X_t\neq Y_t\}$ need not be in $\mathcal F_t$; with complete $\mathcal F_t$, modifications stay adapted.

## 7. Flashcards

1. Modification vs indistinguishable? → Modification: $P(X_t=Y_t)=1$ for each $t$. Indistinguishable: $P(X_t=Y_t\ \forall t)=1$.
2. Example of a modification that is not indistinguishable? → $\Omega=[0,1]$, $P=\lambda$, $X_t(\omega)=\mathbf 1_{\{t=\omega\}}$, $Y\equiv0$.
3. When does modification imply indistinguishable? → When both processes are a.s. right-continuous (or continuous).
4. Progressive measurability? → For all $t$, $(s,\omega)\mapsto X_s(\omega)$ on $[0,t]\times\Omega$ is $\mathcal B([0,t])\otimes\mathcal F_t$-measurable.
5. Sufficient condition for progressive (Prop 1.9)? → Adapted and right-continuous (left-continuous also works).
6. Why progressive? → It makes $\int_0^tX_s\,ds$ adapted and $X_\tau$ $\mathcal F_\tau$-measurable.
7. Usual conditions? → $\mathcal F_{t+}=\mathcal F_t$ for all $t$, and $\mathcal F_0$ (hence every $\mathcal F_t$) contains all $P$-null sets.
8. Kolmogorov's criterion (time)? → $E|X_t-X_s|^\beta\le c|t-s|^{1+\alpha}$ with $\alpha,\beta>0$ gives a continuous modification, $\gamma$-Hölder for $\gamma<\alpha/\beta$.
9. Kolmogorov for BM? → $E|B_t-B_s|^\beta=c_\beta|t-s|^{\beta/2}$, so $\gamma<\frac12-\frac1\beta$ for every $\beta$, i.e. every $\gamma<\frac12$.
10. Carathéodory's criterion? → Two finite measures with equal total mass agreeing on a $\pi$-system that generates $\mathcal E$ agree on $\mathcal E$.
11. Daniell–Kolmogorov hypotheses? → $E$ complete separable metric space, and the f.d.d. family is consistent.
12. Why can't Daniell–Kolmogorov give continuous paths? → $C(T;E)\notin\mathcal B(E)^T$: events of $\mathcal B(E)^T$ depend on countably many coordinates only.
13. Stopping time vs optional time? → $\{\tau\le t\}\in\mathcal F_t$ vs $\{\tau<t\}\in\mathcal F_t$. They are equivalent if the filtration is right-continuous.
14. $\mathcal F_\tau$? → $\{A\in\mathcal F_\infty:A\cap\{\tau\le t\}\in\mathcal F_t\ \forall t\}$.
15. Exit time of an open set for a continuous process? → A stopping time (no extra assumption). For a closed set, you need a right-continuous filtration.
16. $\{\sigma\wedge\tau\le t\}$ and $\{\sigma\vee\tau\le t\}$? → The union, resp. the intersection, of $\{\sigma\le t\}$ and $\{\tau\le t\}$.
17. $\mathcal F_{\sigma\wedge\tau}$? → $\mathcal F_\sigma\cap\mathcal F_\tau$.
18. Def of BM? → $B_0=0$; $B_t-B_s$ independent of $\mathcal F_s$; $B_t-B_s\sim N(0,t-s)$ (and continuous paths by convention).
19. Gaussian characterization (Prop 2.3)? → Centered Gaussian, $B_0=0$, $E[B_sB_t]=s\wedge t$. The converse gives a natural BM.
20. Four invariances? → $B_{t+s}-B_s$, $-B_t$, $cB_{t/c^2}$, $tB_{1/t}$.
21. Filtration for the scaled BM $cB_{t/c^2}$? → $(\mathcal F_{t/c^2})_t$.
22. $E[B_s^2B_t^2]$ for $s\le t$? → $st+2s^2$.
23. $E[e^{\theta B_t}]$ and $E[e^{\theta B_t^2}]$? → $e^{\theta^2t/2}$; $(1-2\theta t)^{-1/2}$ if $\theta t<\frac12$, else $+\infty$.
24. Lévy's modulus? → $\lim_{\delta\to0}w_{[0,T]}(\delta)/\sqrt{2\delta\log(1/\delta)}=1$ a.s.
25. Hölder regularity of BM? → $\gamma$-Hölder for every $\gamma<\frac12$. A.s. nowhere Hölder for $\gamma\ge\frac12$ on any interval.
26. $E[(S_\pi-(t-s))^2]$? → $2\sum_k(\Delta_kt)^2\le2|\pi|(t-s)$.
27. Variation of Brownian paths? → Infinite on every interval, a.s.
28. LIL at infinity? → $\limsup_{t\to\infty}B_t/\sqrt{2t\log\log t}=1$, $\liminf=-1$ a.s.
29. Strong Markov (Thm 2.19)? → For an a.s. finite stopping time $\tau$, $B_{\tau+t}-B_\tau$ is a BM independent of $\mathcal F_\tau$.
30. Discrete approximation of $\tau$ (Lemma 2.18)? → $\tau_n=\frac{k+1}{2^n}$ on $\{\frac k{2^n}<\tau\le\frac{k+1}{2^n}\}$; $\tau_n\downarrow\tau$, with discrete values.
