# The Stochastic Integral

This chapter covers syllabus section 5, "The stochastic Integral". It follows the lecturer's slides "5. The Stochastic Integral" (based on Baldi Ch. 7) and the handwritten notes "5. The stochastic integral" (14 pages). It also covers the construction of the integral with respect to a general continuous $L^2$ martingale, in the style of the mandatory assignment.

> **Numbering warning.** The handwritten notes and the final syllabus use one numbering, and the slides use another, from 5.28 onwards. The slides insert an extra "Theorem 5.28 (uniform convergence in probability)", so every later slide number is one higher. **This file uses the syllabus/notes numbering** and gives the slide number in brackets.
>
> | Content | Syllabus / notes | Slides |
> |---|---|---|
> | Uniform convergence in probability | (unnumbered) | Thm 5.28 |
> | Left-endpoint Riemann sums | **Prop 5.28** | Prop 5.29 |
> | Progressive measurability remark | Rem 5.29 | Rem 5.30 |
> | Random factor outside the integral | Thm 5.30 | Thm 5.31 |
> | Local martingale (definition) | Def 5.31 | Def 5.32 |
> | Properties of local martingales | Rem 5.32 | Rem 5.33 |
> | Nonnegative local martingales are supermartingales | **Prop 5.33** | Prop 5.34 |
> | When a local martingale is a martingale | Rem 5.34 | Rem 5.35 |
> | Associated increasing process of a continuous local martingale | Prop 5.35 | Prop 5.36 |
> | Increasing process of a stochastic integral | **Prop 5.36** | Prop 5.37 |
> | Covariation of continuous local martingales | Cor 5.37 | Cor 5.38 |
> | Covariation notation | Def 5.38 | Def 5.39 |
>
> Items 5.1–5.27 have the same numbers in both. In Baldi: Prop 7.1 (Gaussian integrals), Thm 7.1 (isometry), Thm 7.3 (martingale property), Thm 7.5 (stopping time), Prop 7.4 (Riemann sums), Prop 7.5 (nonnegative local martingales are supermartingales). The notes give no separate numbers to the intermediate items, so the ones written "Rem 5.29" etc. above are inferred from the offset. If in doubt, give the content as well as the number on the exam.

Throughout, $B=(\Omega,\mathcal F,(\mathcal F_t)_{t\ge0},(B_t)_{t\ge0},P)$ is a real standard Brownian motion. The filtration satisfies the usual conditions, and $B$ is an $(\mathcal F_t)$-Brownian motion: $B$ is adapted and $B_t-B_s$ is independent of $\mathcal F_s$ for $s<t$.

## 1. Exam relevance

| Item | Tag | Likelihood | Why |
|---|---|---|---|
| Def 5.1–5.5 ($M^p$, $M^p_{loc}$, equality $dt\otimes P$-a.e., elementary processes, elementary integral) | def | Very high | Needed for every question. "Define $M^2$ and $M^2_{loc}$" is a typical warm-up. |
| Remark 5.3 (Hilbert space, checking $M^2$ via $\int E[X_s^2]ds$) | S | High | Used in every "is $X\in M^2$?" exercise. |
| Lemma 5.6, conditional moments for elementary integrals | **S&P** | Very high | Short, clean proof. The base of the whole construction. |
| Lemma 5.7, density of elementary processes | S | Medium | Must be quoted correctly inside the proof of Thm 5.9 / Def 5.8. |
| Def 5.8, extension to $M^2$ (well-definedness) | S (in slides) | High | "Construct the Itô integral" is the classic question. Also the content of the assignment, Problem 3. |
| Thm 5.9, Itô isometry and conditional isometry | **S&P** | Very high | The single most likely proof question of the chapter. |
| Remark 5.10, Example 5.11 (products, overlapping intervals) | S | Very high (computations) | Every isometry computation uses them. |
| Remark 5.12, representation | S | Low here | Proved in Ch. 7 (Thm 7.10). |
| Cor 5.13, continuity in the integrand | S | Medium | Used in proofs (5.16, 5.21). |
| Thm 5.14, locality | S | Medium | Used in the proofs of 5.21 and 5.26. Know the statement precisely, including "$A\in\mathcal F$, not necessarily $\mathcal F_a$". |
| Def 5.15, the integral as a process | def | High | |
| Thm 5.16, martingale property and continuity | **S&P** | Very high | Long proof (Borel–Cantelli). A classic. |
| Prop 5.17 maximal estimates, Thm 5.18 uniform $L^2$ convergence | S | Medium | Doob's inequality applied to $I$. |
| Prop 5.19 Gaussian integrals, Remark 5.20 exponential moments | S | Very high (exercises) | Assignment Problem 1.2–1.3 style. |
| Thm 5.21, integration up to a stopping time | S | Medium–high | Used in 5.36 and in Wald-type exercises. |
| Prop 5.22, identities at stopping times | S | Medium | Wald identities. |
| Prop 5.23, intervals where the integrand vanishes | S | Low | |
| Def 5.24, the integral on $M^2_{loc}$ (localization) | def | High | "Extended construction" was an old oral-exam question. |
| Remark 5.25, locality on $M^2_{loc}$ | S | Low–medium | Used in 5.26. |
| Lemma 5.26, probability estimate | **S&P** | High | Short proof, easy marks. |
| Prop 5.27, convergence in probability | **S&P** | High | Five-line proof from 5.26. |
| Prop 5.28, left-endpoint Riemann sums | **S&P** | Very high | Short proof, plus the classic exercise $\int B\,dB$. |
| Thm 5.30, random factor $Z\in\mathcal F_a$ | S | Medium | Pitfall: $Z$ must be $\mathcal F_a$-measurable. |
| Def 5.31, local martingale; the $[0,T]$ subtlety | def | High | Short conceptual questions. |
| Rem 5.32, 5.34 (UI localization, bounded localization, bounded local martingale is a martingale) | S | Medium–high | Conceptual. |
| Prop 5.33, nonnegative local martingale is a supermartingale | **S&P** | Very high | Fatou, three lines. Used again in Girsanov/Novikov (Ch. 6–7). |
| Prop 5.35 (slide 5.36), associated increasing process | S | Medium | |
| Prop 5.36, $\langle I\rangle_t=\int_0^tX_s^2ds$ for $X\in M^2_{loc}$ | **S&P** | High | Localization proof. |
| Cor 5.37, covariation by polarization | S | Medium | Its proof is two lines (in the notes). |
| General $L^2$-martingale integrator (assignment Problem 3) | assignment | High | Explicitly flagged as likely. |

## 2. Core definitions and facts

### 2.1 Spaces of integrands

**Definition 5.1.** Let $p\ge1$. $M^p_{loc}([a,b])$ is the space of real **progressively measurable** processes $X$ with
$$
\int_a^b |X_s|^p\,ds<\infty\quad\text{a.s.}
$$
$M^p([a,b])\subset M^p_{loc}([a,b])$ is the subspace of those with
$$
E\Big[\int_a^b|X_s|^p\,ds\Big]<\infty .
$$
$X\in M^p_{loc}([0,\infty))$ (resp. $M^p([0,\infty))$) means $X\in M^p_{loc}([0,T])$ (resp. $M^p([0,T])$) for every $T>0$.

**Definition 5.2 (identification).** $X$ and $Y$ are identified if $X=Y$ $dt\otimes P$-a.e. on $[a,b]\times\Omega$, equivalently $\int_a^b|X_s-Y_s|\,ds=0$ a.s. (Baldi calls this "indistinguishable". It is weaker than indistinguishability in the sense of processes.)

**Remark 5.3.**

- (a) Every continuous adapted process is progressively measurable, and its paths are bounded on $[a,b]$, so it lies in $M^p_{loc}([a,b])$ for every $p\ge1$. Multiplying by a bounded progressively measurable process preserves $M^p_{loc}$ (and $M^p$).
- (b) If $X\in M^p_{loc}$ (resp. $M^p$) and $\tau$ is a stopping time, then $(X_t\mathbf 1_{\{t<\tau\}})_t\in M^p_{loc}$ (resp. $M^p$), because $t\mapsto\mathbf 1_{\{t<\tau\}}$ is adapted ($\{t<\tau\}=\{\tau\le t\}^c\in\mathcal F_t$), right-continuous and bounded, and
$$
\int_a^b|X_t|^p\mathbf 1_{\{t<\tau\}}\,dt=\int_a^{b\wedge\tau}|X_t|^p\,dt\le\int_a^b|X_t|^p\,dt .
$$
- (c) $M^2([a,b])$ is a Hilbert space with $\langle X,Y\rangle_{M^2}=E\int_a^bX_sY_s\,ds=\int_a^bE[X_sY_s]\,ds$. It is a closed subspace of $L^2([a,b]\times\Omega,dt\otimes P)$.
- (d) By Fubini–Tonelli, $E\int_a^b|X_s|^2ds=\int_a^bE[|X_s|^2]\,ds$. So if $s\mapsto E[X_s^2]$ is continuous (or just bounded) on $[a,b]$, then $X\in M^2([a,b])$, provided $X$ is progressive. In particular $B\in M^2([a,b])$, since $E[B_s^2]=s$.

> **Pitfall:** "Continuous" is not enough for $M^2$. You need $E\int X^2<\infty$. Example: $X_t=e^{B_t^2}$ is continuous and adapted, so it lies in $M^2_{loc}([0,T])$ for every $T$, but it lies in $M^2([0,T])$ only for $T\le 1/4$ (Exercise 7).

### 2.2 Elementary processes and their integral

**Definition 5.4.** Let $a=t_0<t_1<\dots<t_n=b$ be a deterministic partition. An **elementary process** has the form
$$
X_t=\sum_{i=0}^{n-1}\xi_i\mathbf 1_{[t_i,t_{i+1})}(t),\qquad \xi_i\ \text{real and }\mathcal F_{t_i}\text{-measurable}.
$$
It is progressive, hence in $M^p_{loc}$. It lies in $M^p$ iff every $\xi_i\in L^p$, since $E\int_a^b|X_t|^pdt=\sum_iE|\xi_i|^p(t_{i+1}-t_i)$.

**Definition 5.5.** For such $X$,
$$
\int_a^bX_t\,dB_t:=\sum_{i=0}^{n-1}\xi_i\,(B_{t_{i+1}}-B_{t_i}).
$$
This is linear in $X$ and does not depend on the chosen representation (refining the partition does not change the sum).

> **Key point:** $\xi_i$ is evaluated at the **left** endpoint and is $\mathcal F_{t_i}$-measurable, so it is independent of the increment $B_{t_{i+1}}-B_{t_i}$. Every martingale property comes from this.

### 2.3 Approximation operator and density

For $f\in L^p([a,b])$ and the uniform grid $t_i=a+i(b-a)/n$, define
$$
G_nf=\sum_{i=0}^{n-1}f_i\mathbf 1_{[t_i,t_{i+1})},\qquad f_0=0,\quad f_i=\frac{n}{b-a}\int_{t_{i-1}}^{t_i}f(s)\,ds\ (i\ge1).
$$
So $f_i$ is the average of $f$ over the interval **to the left** of $t_i$. Then $\|G_nf\|_{L^p}\le\|f\|_{L^p}$ (by Jensen) and $\|G_nf-f\|_{L^p}\to0$. Applied pathwise to a progressive $X$, $G_nX$ is elementary and **adapted**, because $\int_{t_{i-1}}^{t_i}X_s\,ds$ is $\mathcal F_{t_i}$-measurable.

### 2.4 The integral on $M^2$

**Definition 5.8.** For $X\in M^2([a,b])$, choose elementary $X_n\in M^2([a,b])$ with $E\int_a^b|X_n(s)-X_s|^2ds\to0$ (possible by Lemma 5.7), and set
$$
\int_a^bX_s\,dB_s:=L^2\text{-}\lim_{n\to\infty}\int_a^bX_n(s)\,dB_s .
$$
The limit exists, does not depend on the approximating sequence, and gives the unique continuous linear extension of the elementary integral. It is an isometry $M^2([a,b])\to L^2(\Omega,\mathcal F,P)$. (Proof in Section 4.2.)

**Remark 5.10 (products).** For $X,Y\in M^2([a,b])$,
$$
E\Big[\int_a^bX_s\,dB_s\int_a^bY_s\,dB_s\Big]=\int_a^bE[X_sY_s]\,ds .
$$
Proof: polarization, $xy=\frac14[(x+y)^2-(x-y)^2]$, plus the isometry applied to $X\pm Y$ and linearity.

**Example 5.11.**

- (a) $\int_0^1B_s\,dB_s\ne\frac12B_1^2$, since $E\int_0^1B_s\,dB_s=0$ while $E[\frac12B_1^2]=\frac12$. A correction term is needed (in fact $\int_0^1B\,dB=\frac12(B_1^2-1)$; see Exercise 3).
- (b) $E[\int_0^1B_s\,dB_s\int_0^1B_s^2\,dB_s]=\int_0^1E[B_s^3]\,ds=0$.
- (c) For overlapping intervals, extend each integrand by $0$ to the union:
$$
E\Big[\int_a^bX_s\,dB_s\int_c^dY_s\,dB_s\Big]=\int_{[a,b]\cap[c,d]}E[X_sY_s]\,ds .
$$
So $E[\int_0^2B\,dB\int_1^3B\,dB]=\int_1^2s\,ds=\frac32$. Integrals over disjoint intervals are orthogonal in $L^2$.

**Remark 5.12.** Integrals of $M^2$ processes have mean $0$, so not every $Z\in L^2$ is a stochastic integral. If $(\mathcal F_t)$ is the augmented natural filtration of $B$, every $Z\in L^2(\Omega,\mathcal F_T,P)$ can be written $Z=c+\int_0^TX_s\,dB_s$ with $X\in M^2([0,T])$, and necessarily $c=E[Z]$ (Chapter 7, Thm 7.10).

### 2.5 The integral as a process

**Definition 5.15.** For $X\in M^2([0,T])$,
$$
I_t=\int_0^tX_s\,dB_s:=\int_0^TX_s\mathbf 1_{\{s\le t\}}\,dB_s,\qquad 0\le t\le T .
$$
Then (a) $I_t-I_s=\int_s^tX_u\,dB_u$; (b) $I_t$ is $\mathcal F_t$-measurable; (c) for elementary $X=\sum\xi_i\mathbf 1_{[t_i,t_{i+1})}$, $I_t=\sum_i\xi_i(B_{t_{i+1}\wedge t}-B_{t_i\wedge t})$, which is continuous and adapted.

From Thm 5.16 on, $I$ always denotes the **continuous version**.

**Finite variation.** A continuous square integrable martingale with finite variation is a.s. constant (Thm 4.37). Since $I_0=0$, a stochastic integral with finite variation paths is $\equiv0$. This happens iff $\int_0^TX_s^2ds=0$ a.s., i.e. $X=0$ $dt\otimes P$-a.e.

**Stopping.** For $X\in M^2([0,T])$ and a stopping time $\tau$, $(I_{t\wedge\tau})_t$ is a martingale (stopped martingale), so $E[\int_0^{t\wedge\tau}X_s\,dB_s]=0$. Stopping the integral is the same as putting the integrand to $0$ after $\tau$ (Thm 5.21).

### 2.6 The integral on $M^2_{loc}$ (localization)

For $X\in M^2_{loc}([0,T])$ let
$$
\tau_n=\inf\Big\{t\in[0,T]:\int_0^tX_s^2\,ds>n\Big\}\wedge T,\qquad \inf\emptyset=+\infty .
$$
Set $X_n(t)=X_t\mathbf 1_{\{t<\tau_n\}}$. Since $t\mapsto\int_0^tX_s^2ds$ is continuous, $\int_0^TX_n(t)^2dt=\int_0^{\tau_n}X_s^2ds\le n$, so $X_n\in M^2([0,T])$, and $I_n(t)=\int_0^tX_n(s)\,dB_s$ is defined.

- Since $\int_0^TX^2<\infty$ a.s., we have $\tau_n=T$ for all $n\ge\int_0^TX_s^2ds$. So a.s. $\tau_n=T$ eventually, and $\Omega=\bigcup_n\{\tau_n=T\}$ up to a null set.
- For $n>m$: $\{\tau_n=T\}\supset\{\tau_m=T\}$, and $X_n=X_m$ on $\{\tau_m=T\}$ for all $t$. By locality (Thm 5.14), $I_n=I_m$ a.s. on $\{\tau_m=T\}$.

**Definition 5.24.** For $X\in M^2_{loc}([0,T])$,
$$
\int_0^tX_s\,dB_s:=\lim_{n\to\infty}\int_0^tX_s\mathbf 1_{\{s<\tau_n\}}\,dB_s,\qquad 0\le t\le T .
$$
The limit is a.s. and the sequence is eventually constant on all of $[0,T]$. Consequences:

- The integral is continuous (it agrees with the continuous $I_n$ on $\{\tau_n=T\}$).
- If $X\in M^2$ it agrees with the $L^2$ integral: $E\int_0^T|X_n-X|^2=E\int_{\tau_n}^TX_s^2ds\to0$ by dominated convergence, and Thm 5.18 applies.
- It is linear and consistent across intervals, so it defines $\int_0^tX\,dB$ for all $t\ge0$ when $X\in M^2_{loc}([0,\infty))$.
- In general $\int_0^tX\,dB$ need **not** be integrable. The martingale property is replaced by the local martingale property.

**Remark 5.25.** Locality (Thm 5.14) also holds for $X,Y\in M^2_{loc}([a,b])$.

**Remark 5.29 (slide 5.30), progressive measurability.** The integrand at time $t$ may only use information up to time $t$. This is essential for the mean-zero and martingale properties. Sampling at the right endpoint changes the limit (Baldi Ex. 7.9, Exercise 4 below).

### 2.7 Local martingales

**Definition 5.31 (slide 5.32).** An adapted process $M=(M_t)_{t\ge0}$ is a **local martingale** if there are stopping times $\tau_n\uparrow$ such that (i) $\tau_n\uparrow\infty$ a.s.; (ii) $(M_{t\wedge\tau_n})_{t\ge0}$ is an $(\mathcal F_t)$-martingale for each $n$. Then $(\tau_n)$ **reduces** (localizes) $M$. Every martingale is a local martingale ($\tau_n\equiv\infty$).

**On $[0,T]$.** The naive definition "$\tau_n\uparrow T$ and $M^{\tau_n}$ is a martingale" is **wrong**: $M=\mathbf 1_{[0,T)}$ would qualify with $\tau_n=T-1/n$. The correct version replaces (i) by **(i') $P(\tau_n=T)\to1$**. Equivalently, extend $M_t=M_T$ and $\mathcal F_t=\mathcal F_T$ for $t\ge T$ and use Def 5.31.

**Localization of the stochastic integral.** If $X\in M^2_{loc}([0,\infty))$ and $\tau_n=\inf\{t:\int_0^tX_s^2ds>n\}$, then $\tau_n\uparrow\infty$ and
$$
I_{t\wedge\tau_n}=\int_0^{t\wedge\tau_n}X_s\,dB_s=\int_0^tX_s\mathbf 1_{\{s<\tau_n\}}\,dB_s,
$$
which is a square integrable martingale. Hence **$I$ is a continuous local martingale**.

**Remark 5.32 (slide 5.33), properties.**

- (a) $M_t$ need not be integrable for $t>0$. But $M_0=M_{0\wedge\tau_n}$ is integrable.
- (b) Under the usual conditions a local martingale has a right-continuous modification.
- (c) One can choose the reducing sequence so that every stopped martingale is uniformly integrable: $\sigma_n=\tau_n\wedge n$. Then $M_{t\wedge\sigma_n}=E[M_{\sigma_n}\mid\mathcal F_t]$, which is UI.
- (d) If $M$ is continuous and $|M_0|\le c$, take $\rho_n=\inf\{t:|M_t|\ge n\}$ ($n\ge c$) and $\sigma_n=\tau_n\wedge\rho_n$. Then $|M_{t\wedge\sigma_n}|\le n$: the stopped processes are **bounded** martingales. For general $M_0\in L^1$, apply this to $M-M_0$.

**Remark 5.34 (slide 5.35).** A bounded local martingale is a martingale (dominated convergence in $E[M_{t\wedge\tau_n}\mid\mathcal F_s]=M_{s\wedge\tau_n}$). But uniform integrability of $(M_t)_{t\ge0}$ alone does **not** make a local martingale a martingale (Baldi Ex. 8.10). A sufficient condition is that for each $t$ the family $\{M_{t\wedge\tau}:\tau\text{ stopping time}\}$ is UI (Baldi Ex. 7.15, Exercise 17 below).

**Definition 5.38 (slide 5.39).** $\langle M,N\rangle=\frac14(\langle M+N\rangle-\langle M-N\rangle)$ is continuous, of finite variation, starts at $0$, and need not be increasing. $\langle M,M\rangle=\langle M\rangle$.

## 3. Theorems: statements

These are exam-ready statements of every result in the slides. Items marked **(S&P)** are proved in Section 4.

**Lemma 5.6 (conditional moments for elementary integrals) (S&P).** Let $X=\sum_{i=0}^{n-1}\xi_i\mathbf 1_{[t_i,t_{i+1})}$ be elementary with $X\in M^2([a,b])$, i.e. $\xi_i\in L^2(\Omega,\mathcal F_{t_i},P)$. Then
$$
E\Big[\int_a^bX_t\,dB_t\,\Big|\,\mathcal F_a\Big]=0,\qquad E\Big[\Big(\int_a^bX_t\,dB_t\Big)^2\,\Big|\,\mathcal F_a\Big]=E\Big[\int_a^bX_t^2\,dt\,\Big|\,\mathcal F_a\Big].
$$
In particular $E[(\int_a^bX\,dB)^2]=E\int_a^bX_t^2dt$.

**Lemma 5.7 (approximation by elementary processes) (S).** Let $p\ge1$ and $X\in M^p_{loc}([a,b])$. There are elementary $X_n\in M^p_{loc}([a,b])$ with
$$
\int_a^b|X_t-X_n(t)|^p\,dt\longrightarrow0\quad\text{a.s.}
$$
If $X\in M^p([a,b])$, the $X_n$ can be chosen in $M^p([a,b])$ with $E\int_a^b|X_t-X_n(t)|^pdt\to0$. Moreover $\int_a^b|X_n(t)|^pdt$ can be chosen increasing in $n$. (Take $X_n=G_{2^n}X$.)

**Definition/Proposition 5.8.** The $L^2$-limit in Def 5.8 exists and is independent of the approximating sequence. $X\mapsto\int_a^bX\,dB$ is the unique continuous linear extension of the elementary integral, and an isometry $M^2([a,b])\to L^2(\Omega)$.

**Theorem 5.9 (conditional mean and Itô isometry) (S&P).** If $X\in M^2([a,b])$, then
$$
E\Big[\int_a^bX_t\,dB_t\,\Big|\,\mathcal F_a\Big]=0,\qquad E\Big[\Big(\int_a^bX_t\,dB_t\Big)^2\,\Big|\,\mathcal F_a\Big]=E\Big[\int_a^bX_t^2\,dt\,\Big|\,\mathcal F_a\Big]\quad\text{a.s.}
$$
In particular (Itô isometry)
$$
E\Big[\Big(\int_a^bX_t\,dB_t\Big)^2\Big]=E\Big[\int_a^bX_t^2\,dt\Big].
$$

**Remark 5.10.** $E[\int_a^bX\,dB\int_a^bY\,dB]=\int_a^bE[X_sY_s]\,ds$ for $X,Y\in M^2([a,b])$. More generally the conditional version holds: $E[\int_a^bX\,dB\int_a^bY\,dB\mid\mathcal F_a]=E[\int_a^bX_sY_s\,ds\mid\mathcal F_a]$ (polarization of Thm 5.9).

**Corollary 5.13 (continuity in the integrand) (S).** If $X_n,X\in M^2([a,b])$ (not necessarily elementary) and $E\int_a^b|X_n-X|^2dt\to0$, then $\int_a^bX_n\,dB\to\int_a^bX\,dB$ in $L^2$.

**Theorem 5.14 (locality) (S).** Let $X,Y\in M^2([a,b])$ and $A\in\mathcal F$ (**not necessarily** in $\mathcal F_a$). If $X_t(\omega)=Y_t(\omega)$ for all $t\in[a,b]$ and all $\omega\in A$, then $\int_a^bX\,dB=\int_a^bY\,dB$ a.s. on $A$.

**Theorem 5.16 (martingale property and continuity) (S&P).** If $X\in M^2([0,T])$, then $I_t=\int_0^tX_s\,dB_s$ is a square integrable $(\mathcal F_t)$-martingale with a continuous version. Its associated increasing process is
$$
\langle I\rangle_t=\int_0^tX_s^2\,ds,
$$
i.e. $(I_t^2-\int_0^tX_s^2ds)_{0\le t\le T}$ is a martingale.

**Proposition 5.17 (maximal estimates) (S).** For $X\in M^2([0,T])$ and $\lambda>0$,
$$
P\Big(\sup_{0\le t\le T}\Big|\int_0^tX_s\,dB_s\Big|>\lambda\Big)\le\frac1{\lambda^2}E\Big[\int_0^TX_s^2ds\Big],\qquad E\Big[\sup_{0\le t\le T}\Big|\int_0^tX_s\,dB_s\Big|^2\Big]\le4E\Big[\int_0^TX_s^2ds\Big].
$$
(Doob's maximal inequality and Doob's $L^2$ inequality applied to the continuous martingale $I$, plus the isometry.)

**Theorem 5.18 (uniform convergence in mean square) (S).** If $X_n,X\in M^2([0,T])$ and $E\int_0^T|X_n-X|^2ds\to0$, then
$$
E\Big[\sup_{0\le t\le T}\Big|\int_0^tX_n(s)\,dB_s-\int_0^tX_s\,dB_s\Big|^2\Big]\to0 .
$$

**Proposition 5.19 (deterministic integrands) (S).** If $f\in L^2([0,T])$, then $I_t=\int_0^tf(s)\,dB_s$ is a centered Gaussian process with
$$
E[I_sI_t]=\int_0^{s\wedge t}f(u)^2\,du .
$$
Moreover $I$ has independent increments, and $\int_s^tf\,dB$ is independent of $\mathcal F_s$ (Baldi Ex. 7.7).

**Remark 5.20.** For $f\in L^2([0,T])$, $E[\exp(\int_0^tf(s)\,dB_s)]=\exp(\frac12\int_0^tf(s)^2ds)$, since $\int_0^tf\,dB\sim N(0,\int_0^tf^2)$ and $E[e^Z]=e^{\sigma^2/2}$ for $Z\sim N(0,\sigma^2)$.

**Theorem 5.21 (integration up to a stopping time) (S).** Let $\tau\le T$ be a stopping time and $X\in M^2([0,T])$. Then $(X_t\mathbf 1_{\{t<\tau\}})_t\in M^2([0,T])$ and
$$
\int_0^\tau X_s\,dB_s=\int_0^TX_s\mathbf 1_{\{s<\tau\}}\,dB_s\quad\text{a.s.},
$$
where the left side is the continuous process $I$ evaluated at $\tau$, i.e. $I_{\tau(\omega)}(\omega)$.

**Proposition 5.22 (identities at bounded stopping times) (S).** Let $X\in M^2([0,T])$ and $\tau_1\le\tau_2\le T$ be stopping times. Then
$$
\begin{aligned}
&E\Big[\int_0^{\tau_1}X_t\,dB_t\Big]=0,\qquad E\Big[\Big(\int_0^{\tau_1}X_t\,dB_t\Big)^2\Big]=E\Big[\int_0^{\tau_1}X_t^2\,dt\Big],\\
&E\Big[\int_0^{\tau_2}X_t\,dB_t\,\Big|\,\mathcal F_{\tau_1}\Big]=\int_0^{\tau_1}X_t\,dB_t,\qquad E\Big[\Big(\int_{\tau_1}^{\tau_2}X_t\,dB_t\Big)^2\,\Big|\,\mathcal F_{\tau_1}\Big]=E\Big[\int_{\tau_1}^{\tau_2}X_t^2\,dt\,\Big|\,\mathcal F_{\tau_1}\Big],
\end{aligned}
$$
with $\int_{\tau_1}^{\tau_2}X\,dB:=I_{\tau_2}-I_{\tau_1}$.

**Proposition 5.23 (S).** There is a null set $N$ such that for $\omega\notin N$ and all $0\le a<b\le T$: if $X_t(\omega)=0$ for a.e. $t\in(a,b)$, then $t\mapsto I_t(\omega)$ is constant on $[a,b]$.

**Remark 5.25 (S).** Locality holds for $X,Y\in M^2_{loc}([a,b])$.

**Lemma 5.26 (probability estimate for local integrands) (S&P).** If $X\in M^2_{loc}([a,b])$, then for all $\varepsilon>0$, $\delta>0$,
$$
P\Big(\Big|\int_a^bX_t\,dB_t\Big|>\varepsilon\Big)\le P\Big(\int_a^bX_t^2\,dt>\delta\Big)+\frac{\delta}{\varepsilon^2}.
$$

**Proposition 5.27 (convergence in probability) (S&P).** Let $X,X_n\in M^2_{loc}([a,b])$. If $\int_a^b|X(t)-X_n(t)|^2dt\to0$ in probability, then $\int_a^bX_n\,dB\to\int_a^bX\,dB$ in probability.

**Theorem (slide 5.28, uniform convergence in probability) (S).** Under the same hypothesis,
$$
\sup_{a\le t\le b}\Big|\int_a^tX_n(s)\,dB_s-\int_a^tX_s\,dB_s\Big|\to0\quad\text{in probability.}
$$

**Proposition 5.28 (slide 5.29, left-endpoint Riemann sums) (S&P).** Let $X\in M^2_{loc}([a,b])$ be **continuous** (and adapted). For every sequence of deterministic partitions $\pi_n=\{a=t_{n,0}<\dots<t_{n,m_n}=b\}$ with $|\pi_n|=\max_k(t_{n,k+1}-t_{n,k})\to0$,
$$
\sum_{k=0}^{m_n-1}X_{t_{n,k}}\big(B_{t_{n,k+1}}-B_{t_{n,k}}\big)\xrightarrow[n\to\infty]{P}\int_a^bX_t\,dB_t .
$$

**Theorem 5.30 (slide 5.31, random factor) (S).** If $Z$ is real and $\mathcal F_a$-measurable and $X\in M^2_{loc}([a,b])$, then $ZX\in M^2_{loc}([a,b])$ and
$$
\int_a^bZX_t\,dB_t=Z\int_a^bX_t\,dB_t\quad\text{a.s.}
$$
Without $\mathcal F_a$-measurability $ZX$ need not be adapted, and the left side is undefined.

**Proposition 5.33 (slide 5.34, nonnegative local martingales) (S&P).** Every nonnegative local martingale $M$ is a supermartingale. In particular $M_t\in L^1$, $E[M_t\mid\mathcal F_s]\le M_s$ for $s\le t$, and $E[M_t]\le E[M_0]$.

**Proposition 5.35 (slide 5.36, associated increasing process) (S).** Let $M$ be a continuous local martingale with $M_0\in L^2$. There is a unique continuous adapted increasing process $A$ with $A_0=0$ such that $M^2-A$ is a continuous local martingale. It is denoted $\langle M\rangle$. (For $M_0\in L^1$ only: $M_t^2-M_0^2-\langle M\rangle_t$ is a continuous local martingale.)

**Proposition 5.36 (slide 5.37, increasing process of a stochastic integral) (S&P).** If $X\in M^2_{loc}([0,T])$ and $I_t=\int_0^tX_s\,dB_s$, then $I$ is a continuous local martingale with
$$
\langle I\rangle_t=\int_0^tX_s^2\,ds,
$$
i.e. $\big((\int_0^tX_s\,dB_s)^2-\int_0^tX_s^2ds\big)_{0\le t\le T}$ is a continuous local martingale.

**Corollary 5.37 (slide 5.38, covariation) (S).** Let $M,N$ be continuous local martingales with $M_0N_0\in L^1$. There is a unique adapted continuous finite-variation process $A$ with $A_0=0$ such that $MN-A$ is a continuous local martingale. It is $A=\langle M,N\rangle=\frac14(\langle M+N\rangle-\langle M-N\rangle)$.

## 4. Proofs

The proofs follow the handwritten notes (pages 5.1–5.14). Some steps the notes leave implicit are filled in.

### 4.1 Lemma 5.6 (S&P): conditional moments for elementary integrals

**Proof roadmap.**

1. Each term $\xi_i\Delta B_i$ is integrable. Conditioning on $\mathcal F_{t_i}$ and then on $\mathcal F_a$ (tower) gives mean $0$.
2. Expand the square into a double sum $\sum_{i,j}$ and check that every term is integrable (Cauchy–Schwarz).
3. Off-diagonal terms ($i<j$) vanish: condition on $\mathcal F_{t_j}$.
4. Diagonal terms: condition on $\mathcal F_{t_i}$ and use independence to get $\xi_i^2(t_{i+1}-t_i)$. Sum to get $\int_a^bX_t^2dt$.

**Proof.** Let $X_t=\sum_{i=0}^{n-1}\xi_i\mathbf 1_{[t_i,t_{i+1})}(t)$ with $a=t_0<\dots<t_n=b$, $\xi_i$ $\mathcal F_{t_i}$-measurable and $\xi_i\in L^2$. Write $\Delta B_i=B_{t_{i+1}}-B_{t_i}$. Recall that $\Delta B_i$ is independent of $\mathcal F_{t_i}$, with $E[\Delta B_i]=0$ and $E[\Delta B_i^2]=t_{i+1}-t_i$. Also $\mathcal F_a\subset\mathcal F_{t_i}$ for all $i$.

*Mean.* $\xi_i$ and $\Delta B_i$ are both in $L^2$ and independent, so $\xi_i\Delta B_i\in L^1$. Since $\xi_i$ is $\mathcal F_{t_i}$-measurable ("taking out what is known") and $\Delta B_i$ is independent of $\mathcal F_{t_i}$,
$$
E[\xi_i\Delta B_i\mid\mathcal F_{t_i}]=\xi_i\,E[\Delta B_i\mid\mathcal F_{t_i}]=\xi_i\,E[\Delta B_i]=0 .
$$
By the tower property, $E[\xi_i\Delta B_i\mid\mathcal F_a]=E\big[E[\xi_i\Delta B_i\mid\mathcal F_{t_i}]\,\big|\,\mathcal F_a\big]=0$. By linearity,
$$
E\Big[\int_a^bX_t\,dB_t\,\Big|\,\mathcal F_a\Big]=\sum_{i=0}^{n-1}E[\xi_i\Delta B_i\mid\mathcal F_a]=0 .
$$

*Second moment.* Expanding,
$$
E\Big[\Big(\int_a^bX_t\,dB_t\Big)^2\,\Big|\,\mathcal F_a\Big]=\sum_{i,j=0}^{n-1}E[\xi_i\xi_j\Delta B_i\Delta B_j\mid\mathcal F_a].
$$
Each term is integrable. By independence of $\xi_i^2$ and $\Delta B_i^2$, $E[\xi_i^2\Delta B_i^2]=E[\xi_i^2](t_{i+1}-t_i)<\infty$. By Cauchy–Schwarz,
$$
E|\xi_i\xi_j\Delta B_i\Delta B_j|\le\big(E[\xi_i^2\Delta B_i^2]\big)^{1/2}\big(E[\xi_j^2\Delta B_j^2]\big)^{1/2}<\infty,
$$
so the conditional expectations exist.

*Off-diagonal terms, $i<j$.* Then $t_{i+1}\le t_j$, so $\xi_i,\xi_j,\Delta B_i$ are all $\mathcal F_{t_j}$-measurable, while $\Delta B_j$ is independent of $\mathcal F_{t_j}$. Hence
$$
E[\xi_i\xi_j\Delta B_i\Delta B_j\mid\mathcal F_a]=E\big[\xi_i\xi_j\Delta B_i\,E[\Delta B_j\mid\mathcal F_{t_j}]\,\big|\,\mathcal F_a\big]=0 .
$$
By symmetry the terms with $i>j$ also vanish.

*Diagonal terms.*
$$
E[\xi_i^2\Delta B_i^2\mid\mathcal F_a]=E\big[\xi_i^2E[\Delta B_i^2\mid\mathcal F_{t_i}]\,\big|\,\mathcal F_a\big]=E[\xi_i^2(t_{i+1}-t_i)\mid\mathcal F_a].
$$
Summing over $i$, and since $X_t^2=\xi_i^2$ on $[t_i,t_{i+1})$,
$$
E\Big[\Big(\int_a^bX_t\,dB_t\Big)^2\,\Big|\,\mathcal F_a\Big]=E\Big[\sum_{i=0}^{n-1}\xi_i^2(t_{i+1}-t_i)\,\Big|\,\mathcal F_a\Big]=E\Big[\int_a^bX_t^2\,dt\,\Big|\,\mathcal F_a\Big].
$$
Taking expectations gives the unconditional isometry. $\blacksquare$

**What graders look for / pitfalls.**

- State explicitly that $\Delta B_i$ is **independent of $\mathcal F_{t_i}$** (not just of $\xi_i$). This needs $B$ to be an $(\mathcal F_t)$-Brownian motion.
- Check integrability of the cross terms (Cauchy–Schwarz) before taking conditional expectations.
- Condition on the **larger** time $\mathcal F_{t_j}$ for the cross term, not on $\mathcal F_{t_i}$.
- Use $\mathcal F_a\subset\mathcal F_{t_i}$ to apply the tower property.
- Note that $\xi_i$ being $\mathcal F_{t_i}$-measurable for all $i$ is exactly progressive measurability (adaptedness) of the elementary $X$.

**Memorize-this skeleton.**
$E[\xi_i\Delta B_i\mid\mathcal F_{t_i}]=\xi_iE\Delta B_i=0$, then tower. Square: $\sum_{i,j}$. For $i<j$ condition on $\mathcal F_{t_j}$, giving $0$. For $i=j$, $E[\xi_i^2\Delta B_i^2\mid\mathcal F_{t_i}]=\xi_i^2(t_{i+1}-t_i)$. Sum to get $\int X^2$.

### 4.2 Definition 5.8: well-definedness of the $L^2$ extension (needed for Thm 5.9)

This is not separately tagged, but every construction question needs it.

**Proof.**

*Existence of the limit.* Let $X\in M^2([a,b])$. By Lemma 5.7 there are elementary $X_n\in M^2$ with $\|X_n-X\|_{M^2}\to0$, where $\|Y\|^2_{M^2}=E\int_a^bY_t^2dt$. The elementary integral is linear, so by Lemma 5.6
$$
E\Big[\Big(\int_a^bX_n\,dB-\int_a^bX_m\,dB\Big)^2\Big]=E\int_a^b|X_n-X_m|^2dt=\|X_n-X_m\|_{M^2}^2\le\big(\|X_n-X\|_{M^2}+\|X-X_m\|_{M^2}\big)^2\to0 .
$$
So $(\int X_n\,dB)_n$ is Cauchy in $L^2(\Omega)$, which is complete, and the limit exists.

*Independence of the sequence.* If $(X_n')$ is another approximating sequence, the interleaved sequence $X_1,X_1',X_2,X_2',\dots$ also converges to $X$ in $M^2$. Its integrals form a Cauchy sequence in $L^2$, which has a single limit, so both subsequences have the same limit. (Equivalently, $\|\int X_n\,dB-\int X_n'\,dB\|_{L^2}=\|X_n-X_n'\|_{M^2}\to0$.)

*Isometry and linearity.* The norm is continuous: $\|\int X\,dB\|_{L^2}=\lim\|\int X_n\,dB\|_{L^2}=\lim\|X_n\|_{M^2}=\|X\|_{M^2}$. Linearity passes to the limit. Uniqueness of the continuous linear extension follows from the density of the elementary processes. $\blacksquare$

### 4.3 Theorem 5.9 (S&P): conditional mean and Itô isometry

**Proof roadmap.**

1. Take elementary $X_n\to X$ in $M^2$ (Lemma 5.7). Then $\int X_n\,dB\to\int X\,dB$ in $L^2$ (Def 5.8).
2. Lemma 5.6 gives both identities for $X_n$.
3. Conditional expectation is a contraction in $L^1$ (and $L^2$). Pass to the limit in the first identity.
4. For the second identity, show that both sides converge in $L^1$: $(\int X_n\,dB)^2\to(\int X\,dB)^2$ in $L^1$, and $\int X_n^2dt\to\int X^2dt$ in $L^1$. Limits in $L^1$ are a.s. unique.

**Proof.** Let $X\in M^2([a,b])$ and let $X_n\in M^2([a,b])$ be elementary with $E\int_a^b|X_n(t)-X_t|^2dt\to0$ (Lemma 5.7). Write $J_n=\int_a^bX_n\,dB$ and $J=\int_a^bX\,dB$, so that $J_n\to J$ in $L^2$ by Def 5.8.

We use one fact repeatedly: conditional expectation is a contraction on $L^p$, $p\ge1$. That is, $E|E[Y\mid\mathcal G]-E[Y'\mid\mathcal G]|^p\le E|Y-Y'|^p$, by conditional Jensen. Hence $Y_n\to Y$ in $L^p$ implies $E[Y_n\mid\mathcal G]\to E[Y\mid\mathcal G]$ in $L^p$.

*Conditional mean.* By Lemma 5.6, $E[J_n\mid\mathcal F_a]=0$ for every $n$. Since $J_n\to J$ in $L^2$,
$$
E[J\mid\mathcal F_a]=L^2\text{-}\lim_nE[J_n\mid\mathcal F_a]=0 .
$$

*Conditional second moment.* By Lemma 5.6, for each $n$,
$$
E[J_n^2\mid\mathcal F_a]=E\Big[\int_a^bX_n(t)^2\,dt\,\Big|\,\mathcal F_a\Big].
$$
- Left side: $J_n^2\to J^2$ in $L^1$, because by Cauchy–Schwarz
$$
E|J_n^2-J^2|=E\big[|J_n-J|\,|J_n+J|\big]\le\|J_n-J\|_{L^2}\,\|J_n+J\|_{L^2}\to0,
$$
using that $\|J_n+J\|_{L^2}$ is bounded. So $E[J_n^2\mid\mathcal F_a]\to E[J^2\mid\mathcal F_a]$ in $L^1$.
- Right side: similarly,
$$
E\Big|\int_a^bX_n^2dt-\int_a^bX^2dt\Big|\le E\int_a^b|X_n-X|\,|X_n+X|\,dt\le\|X_n-X\|_{M^2}\|X_n+X\|_{M^2}\to0 .
$$
So $E[\int X_n^2\mid\mathcal F_a]\to E[\int X^2\mid\mathcal F_a]$ in $L^1$.

The two sides agree for every $n$, so their $L^1$-limits agree a.s.:
$$
E\Big[\Big(\int_a^bX_t\,dB_t\Big)^2\,\Big|\,\mathcal F_a\Big]=E\Big[\int_a^bX_t^2\,dt\,\Big|\,\mathcal F_a\Big]\quad\text{a.s.}
$$
Taking expectations gives the Itô isometry. $\blacksquare$

*Variant used in the notes.* For the right-hand side, the notes instead choose $X_n=G_{2^n}X$, so that $\int X_n^2dt$ is increasing in $n$ (Lemma 5.7) and converges to $\int X^2dt$. Then conditional monotone convergence gives the limit. Either argument is acceptable. The $L^1$ argument above does not need monotonicity.

**What graders look for / pitfalls.**

- Say **why** you may pass to the limit inside the conditional expectation ($L^p$-continuity of $E[\cdot\mid\mathcal F_a]$). Do not just write "by continuity".
- $L^2$ convergence of $J_n$ gives only $L^1$ convergence of $J_n^2$. Show it with Cauchy–Schwarz.
- Do not forget the right-hand side: $\int X_n^2\to\int X^2$ must also be justified.
- The approximating $X_n$ must be **adapted** elementary processes (Lemma 5.7). Otherwise Lemma 5.6 does not apply.
- Conclude with "a.s.": conditional expectations are defined only up to null sets.

**Memorize-this skeleton.**
Elementary $X_n\to X$ in $M^2$, so $J_n\to J$ in $L^2$. Lemma 5.6 for $X_n$. $E[\cdot\mid\mathcal F_a]$ is $L^p$-continuous, so the mean is $0$. $J_n^2\to J^2$ in $L^1$ by Cauchy–Schwarz, and $\int X_n^2\to\int X^2$ in $L^1$ by Cauchy–Schwarz. Pass to the limit, take $E$, done.

### 4.4 Theorem 5.14 (S, proof in notes, optional): locality

**Proof sketch** (notes p. 5.6). Let $X_n=G_nX$ and $Y_n=G_nY$. Since $G_n$ acts pathwise, $X_n(\omega)=Y_n(\omega)$ for all $t$ when $\omega\in A$. So the elementary integrals $\int X_n\,dB$ and $\int Y_n\,dB$ (Riemann sums) coincide on $A$. They converge in $L^2$ to $\int X\,dB$ and $\int Y\,dB$. Pick a common subsequence $n_k$ along which both converge a.s. Then on $A$ (outside a null set),
$$
\int_a^bX\,dB=\lim_k\int_a^bX_{n_k}\,dB=\lim_k\int_a^bY_{n_k}\,dB=\int_a^bY\,dB .
$$
Note that $A$ need not be in $\mathcal F_a$, because no conditioning is involved. $\blacksquare$

### 4.5 Theorem 5.16 (S&P): martingale property and continuity

**Proof roadmap.**

1. Martingale: $E[I_t-I_s\mid\mathcal F_s]=E[\int_s^tX\,dB\mid\mathcal F_s]=0$ by Thm 5.9 on $[s,t]$. $I_t\in L^2$ by the isometry and is $\mathcal F_t$-measurable.
2. Increasing process: expand $I_t^2=(I_t-I_s+I_s)^2$. The cross term vanishes by step 1, and the square term cancels with $\int_s^tX^2$ by the conditional isometry.
3. Continuity: elementary integrals $I_n$ are continuous. Doob's maximal inequality applied to the martingale $I_n-I_m$ plus the isometry gives $P(\sup|I_n-I_m|>\varepsilon)\le\varepsilon^{-2}\|X_n-X_m\|^2_{M^2}$.
4. Choose $n_k$ with $P(\sup_t|I_{n_{k+1}}-I_{n_k}|>2^{-k})\le k^{-2}$. By Borel–Cantelli, $I_{n_k}$ converges uniformly a.s. to a continuous $J$.
5. $J_t=I_t$ a.s. for each $t$ ($L^2$ limit = a.s. limit), so $J$ is a continuous version.

**Proof.** Let $X\in M^2([0,T])$ and $I_t=\int_0^tX_s\,dB_s=\int_0^TX_s\mathbf 1_{\{s\le t\}}dB_s$.

*Step 1: square integrable martingale.* By Def 5.15, $I_t$ is $\mathcal F_t$-measurable and $I_t-I_s=\int_s^tX_u\,dB_u$ for $s<t$. By the isometry, $E[I_t^2]=E\int_0^tX_s^2ds\le E\int_0^TX_s^2ds<\infty$, so $I_t\in L^2\subset L^1$. The restriction of $X$ to $[s,t]$ is in $M^2([s,t])$, so Thm 5.9 on $[s,t]$ gives
$$
E[I_t-I_s\mid\mathcal F_s]=E\Big[\int_s^tX_u\,dB_u\,\Big|\,\mathcal F_s\Big]=0 .
$$
Hence $E[I_t\mid\mathcal F_s]=I_s+E[I_t-I_s\mid\mathcal F_s]=I_s$ a.s.

*Step 2: $I_t^2-\langle I\rangle_t$ is a martingale, where $\langle I\rangle_t=\int_0^tX_u^2du$.* It is adapted and integrable (both terms are in $L^1$). For $s<t$,
$$
\begin{aligned}
E\big[I_t^2-\langle I\rangle_t\mid\mathcal F_s\big]
&=E\big[(I_t-I_s+I_s)^2-(\langle I\rangle_t-\langle I\rangle_s)-\langle I\rangle_s\mid\mathcal F_s\big]\\
&=I_s^2-\langle I\rangle_s+\underbrace{E[(I_t-I_s)^2\mid\mathcal F_s]}_{(A)}+\underbrace{2I_s\,E[I_t-I_s\mid\mathcal F_s]}_{(B)}-\underbrace{E\Big[\int_s^tX_u^2du\,\Big|\,\mathcal F_s\Big]}_{(C)} .
\end{aligned}
$$
Here $(B)=0$ by Step 1. ($I_s$ can be taken out because $I_s\in\mathcal F_s$, and $I_s(I_t-I_s)\in L^1$ by Cauchy–Schwarz.) And $(A)=(C)$ by the conditional isometry of Thm 5.9 on $[s,t]$. Hence $E[I_t^2-\langle I\rangle_t\mid\mathcal F_s]=I_s^2-\langle I\rangle_s$. Since $\langle I\rangle$ is continuous, adapted, increasing and starts at $0$, it is the associated increasing process.

*Step 3: continuous version.* Let $X_n$ be elementary in $M^2([0,T])$ with $E\int_0^T|X_n-X|^2ds\to0$, and let $I_n(t)=\int_0^tX_n(s)\,dB_s$. By Def 5.15(c), each $I_n$ has continuous paths. By Step 1, $I_n-I_m$ is a continuous square integrable martingale.

Doob's maximal inequality (applied to the nonnegative continuous submartingale $|I_n-I_m|^2$; in the notes: Thm 4.28 applied to the supermartingale $-|I_n-I_m|^2$ with $\lambda=\varepsilon^2$), followed by the isometry, gives
$$
P\Big(\sup_{0\le t\le T}|I_n(t)-I_m(t)|>\varepsilon\Big)\le\frac1{\varepsilon^2}E\big[|I_n(T)-I_m(T)|^2\big]=\frac1{\varepsilon^2}E\int_0^T|X_n(s)-X_m(s)|^2ds .
$$
$(X_n)$ converges in $M^2$, so it is Cauchy. Choose an increasing sequence $n_k$ such that
$$
E\int_0^T|X_n-X_m|^2ds\le\frac{2^{-2k}}{k^2}\qquad\text{for all }n,m\ge n_k .
$$
With $\varepsilon=2^{-k}$, $n=n_{k+1}$, $m=n_k$:
$$
P\Big(\sup_{0\le t\le T}|I_{n_{k+1}}(t)-I_{n_k}(t)|>2^{-k}\Big)\le2^{2k}\cdot\frac{2^{-2k}}{k^2}=\frac1{k^2}.
$$
Since $\sum_k k^{-2}<\infty$, Borel–Cantelli gives a null set $N$ such that for $\omega\notin N$ there is $k_0(\omega)$ with
$$
\sup_{0\le t\le T}|I_{n_{k+1}}(t)-I_{n_k}(t)|\le2^{-k}\qquad(k\ge k_0(\omega)).
$$
So the telescoping series $I_{n_k}=I_{n_1}+\sum_{i=2}^{k}(I_{n_i}-I_{n_{i-1}})$ converges **uniformly** on $[0,T]$ for $\omega\notin N$. Let $J_t(\omega)=\lim_kI_{n_k}(t)(\omega)$ for $\omega\notin N$ and $J\equiv0$ on $N$. As a uniform limit of continuous functions, $J$ is continuous. $J_t$ is $\mathcal F_t$-measurable, since it is an a.s. limit of $\mathcal F_t$-measurable variables and $\mathcal F_t$ contains the null sets (usual conditions).

Fix $t$. Since $E\int_0^t|X_{n_k}-X|^2ds\to0$, Cor 5.13 gives $I_{n_k}(t)\to I_t$ in $L^2$. But $I_{n_k}(t)\to J_t$ a.s., and $L^2$ and a.s. limits coincide a.s. (pass to a further subsequence). So $J_t=I_t$ a.s. for each $t$: $J$ is a continuous version of $I$. Being a version of a martingale, it is a martingale, and Step 2 holds for it too. $\blacksquare$

**What graders look for / pitfalls.**

- Step 1 must mention $I_t\in L^1$ (in fact $L^2$) and adaptedness, not only the conditional mean.
- In Step 2, justify taking $I_s$ out of the conditional expectation, and cite the **conditional** isometry. The unconditional one is not enough.
- In Step 3, Doob's inequality needs a (right-)continuous martingale. That is why we apply it to the elementary integrals $I_n$, whose continuity is known, not to $I$.
- The choice of $n_k$ must make the probabilities **summable**. $2^{-2k}/k^2$ with threshold $2^{-k}$ works. Any summable choice is fine.
- "Version": $J_t=I_t$ a.s. for each fixed $t$. Do not claim more.
- Usual conditions are used for adaptedness of $J$.

**Memorize-this skeleton.**
(1) $E[\int_s^tX\,dB\mid\mathcal F_s]=0$. (2) $I_t^2=(I_t-I_s)^2+2I_s(I_t-I_s)+I_s^2$; conditional isometry plus (1). (3) $I_n$ continuous; Doob gives $P(\sup|I_n-I_m|>\varepsilon)\le\varepsilon^{-2}\|X_n-X_m\|^2$; pick $n_k$ with $\le k^{-2}$ at $\varepsilon=2^{-k}$; Borel–Cantelli gives uniform convergence to a continuous $J$; $J_t=I_t$ a.s.

### 4.6 Theorem 5.21 (S, proof in notes, optional): integration up to a stopping time

**Proof sketch** (notes p. 5.9–5.10).

*Membership.* $t\mapsto\mathbf 1_{\{t<\tau\}}$ is bounded, adapted and right-continuous, hence progressive. So $X\mathbf 1_{\{\cdot<\tau\}}\in M^2$ by Remark 5.3.

*$\tau$ with finitely many values $t_1<\dots<t_m\le T$.* On $A_k=\{\tau=t_k\}$, the processes $X_s$ and $X_s\mathbf 1_{\{s<\tau\}}$ coincide for $s\in[0,t_k)$. The point $s=t_k$ is irrelevant, since integrands are identified $dt\otimes P$-a.e. Also $X_s\mathbf 1_{\{s<\tau\}}=0$ for $s\in[t_k,T]$. By locality (Thm 5.14), on $A_k$:
$$
I_{t_k}=\int_0^{t_k}X_s\,dB_s=\int_0^{t_k}X_s\mathbf 1_{\{s<\tau\}}dB_s=\int_0^TX_s\mathbf 1_{\{s<\tau\}}dB_s .
$$
Hence $I_\tau=\sum_k\mathbf 1_{A_k}I_{t_k}=\int_0^TX_s\mathbf 1_{\{s<\tau\}}dB_s$ a.s.

*General $\tau$.* Let $\tau_n$ be the stopping times with finitely many values $\tau_n=\min(T,\,kT2^{-n})$ on $\{(k-1)T2^{-n}\le\tau<kT2^{-n}\}$, with $\tau_n=T$ on $\{\tau=T\}$. Then $\tau_n\downarrow\tau$ and $\tau_n\le T$. By continuity of $I$, $I_{\tau_n}\to I_\tau$ a.s. Moreover $|X_s\mathbf 1_{\{s<\tau_n\}}-X_s\mathbf 1_{\{s<\tau\}}|^2=X_s^2\mathbf 1_{\{\tau\le s<\tau_n\}}\to X_s^2\mathbf 1_{\{s=\tau\}}$, which is $0$ for a.e. $s$. By dominated convergence (dominated by $X_s^2$), $E\int_0^T|X\mathbf 1_{\{\cdot<\tau_n\}}-X\mathbf 1_{\{\cdot<\tau\}}|^2ds\to0$. Cor 5.13 then gives $L^2$ convergence of the integrals, and a.s. convergence along a subsequence. The two limits agree. $\blacksquare$

### 4.7 Lemma 5.26 (S&P): probability estimate for local integrands

**Proof roadmap.**

1. Stop when the "energy" exceeds $\delta$: $\tau=\inf\{t\ge a:\int_a^tX_s^2ds>\delta\}\wedge b$.
2. Split according to $\{\tau=b\}$ and $\{\tau<b\}$. Note $\{\tau<b\}\subset\{\int_a^bX^2>\delta\}$.
3. On $\{\tau=b\}$, $X=X\mathbf 1_{\{\cdot<\tau\}}$, so the integrals agree by locality (Remark 5.25).
4. $X\mathbf 1_{\{\cdot<\tau\}}\in M^2$ with energy $\le\delta$. Chebyshev plus the isometry give $\le\delta/\varepsilon^2$.

**Proof.** Let $X\in M^2_{loc}([a,b])$ and $\varepsilon,\delta>0$. Define
$$
\tau=\inf\Big\{t\in[a,b]:\int_a^tX_s^2\,ds>\delta\Big\}\wedge b .
$$
This is a stopping time: $t\mapsto\int_a^tX_s^2ds$ is continuous and adapted (since $X$ is progressive), and this is the hitting time of the open set $(\delta,\infty)$ under the usual conditions. Let $\widetilde X_t=X_t\mathbf 1_{\{t<\tau\}}$. By continuity of the energy, $\int_a^\tau X_s^2ds\le\delta$. So
$$
\int_a^b\widetilde X_t^2\,dt=\int_a^{\tau}X_t^2\,dt\le\delta,
$$
and $\widetilde X\in M^2([a,b])$ (progressive by Remark 5.3(b)).

Split:
$$
P\Big(\Big|\int_a^bX\,dB\Big|>\varepsilon\Big)\le P\Big(\Big|\int_a^bX\,dB\Big|>\varepsilon,\ \tau=b\Big)+P(\tau<b).
$$

*Second term.* If $\tau<b$, there is $t<b$ with $\int_a^tX^2>\delta$, hence $\int_a^bX^2>\delta$. So
$$
P(\tau<b)\le P\Big(\int_a^bX_t^2\,dt>\delta\Big).
$$

*First term.* On $\{\tau=b\}$, $X_t=\widetilde X_t$ for all $t\in[a,b)$ (the point $t=b$ is negligible). By locality for $M^2_{loc}$ (Remark 5.25), $\int_a^bX\,dB=\int_a^b\widetilde X\,dB$ a.s. on $\{\tau=b\}$. Hence, by Chebyshev and the isometry,
$$
P\Big(\Big|\int_a^bX\,dB\Big|>\varepsilon,\ \tau=b\Big)\le P\Big(\Big|\int_a^b\widetilde X\,dB\Big|>\varepsilon\Big)\le\frac{E\big[(\int_a^b\widetilde X\,dB)^2\big]}{\varepsilon^2}=\frac{E\int_a^b\widetilde X_t^2dt}{\varepsilon^2}\le\frac{\delta}{\varepsilon^2}.
$$
Adding the two bounds gives the claim. $\blacksquare$

**What graders look for / pitfalls.**

- The inclusion $\{\tau<b\}\subset\{\int_a^bX^2>\delta\}$ (the direction matters).
- That $\widetilde X\in M^2$ with $E\int\widetilde X^2\le\delta$, using **continuity** of $t\mapsto\int_a^tX^2$.
- Locality is needed on an event $\{\tau=b\}$ that is **not** in $\mathcal F_a$. That is why Thm 5.14 allows any $A\in\mathcal F$.
- Chebyshev with the **second** moment, then the isometry.

**Memorize-this skeleton.**
$\tau=\inf\{t:\int_a^tX^2>\delta\}\wedge b$, $\widetilde X=X\mathbf 1_{\{t<\tau\}}\in M^2$, $\|\widetilde X\|^2\le\delta$. $P(|\int X|>\varepsilon)\le P(|\int\widetilde X|>\varepsilon)+P(\tau<b)\le\delta/\varepsilon^2+P(\int X^2>\delta)$.

### 4.8 Proposition 5.27 (S&P): convergence in probability

**Proof roadmap.** Apply Lemma 5.26 to $X_n-X$. Choose $\delta$ to make $\delta/\varepsilon^2$ small, then $n$ large to make $P(\int|X_n-X|^2>\delta)$ small.

**Proof.** $M^2_{loc}$ is a vector space and the integral is linear on it, so $\int X_n\,dB-\int X\,dB=\int(X_n-X)\,dB$ with $X_n-X\in M^2_{loc}([a,b])$. Fix $\varepsilon>0$ and $\eta>0$. By Lemma 5.26, for every $\delta>0$,
$$
P\Big(\Big|\int_a^bX_n\,dB-\int_a^bX\,dB\Big|>\varepsilon\Big)\le P\Big(\int_a^b|X_n(t)-X(t)|^2dt>\delta\Big)+\frac{\delta}{\varepsilon^2}.
$$
Choose $\delta>0$ with $\delta/\varepsilon^2\le\eta/2$. By hypothesis $\int_a^b|X_n-X|^2dt\to0$ in probability, so there is $n_0$ with $P(\int_a^b|X_n-X|^2dt>\delta)<\eta/2$ for $n\ge n_0$. Then for $n\ge n_0$,
$$
P\Big(\Big|\int_a^bX_n\,dB-\int_a^bX\,dB\Big|>\varepsilon\Big)<\eta .
$$
Since $\varepsilon,\eta$ were arbitrary, $\int X_n\,dB\to\int X\,dB$ in probability. $\blacksquare$

**What graders look for / pitfalls.** Mention linearity on $M^2_{loc}$. Choose $\delta$ **before** $n_0$ (the order of quantifiers matters).

**Memorize-this skeleton.** Lemma 5.26 for $X_n-X$: $\le P(\int|X_n-X|^2>\delta)+\delta/\varepsilon^2$. Pick $\delta=\eta\varepsilon^2/2$, then $n_0$.

### 4.9 Proposition 5.28 (S&P): left-endpoint Riemann sums

**Proof roadmap.**

1. Write the Riemann sum as the integral of the elementary process $X_n=\sum_kX_{t_{n,k}}\mathbf 1_{[t_{n,k},t_{n,k+1})}$.
2. Pathwise uniform continuity gives $\int_a^b|X_n-X|^2dt\to0$ a.s., hence in probability.
3. Apply Prop 5.27.

**Proof.** Define
$$
X_n(t)=\sum_{k=0}^{m_n-1}X_{t_{n,k}}\mathbf 1_{[t_{n,k},t_{n,k+1})}(t).
$$
$X_{t_{n,k}}$ is $\mathcal F_{t_{n,k}}$-measurable ($X$ is adapted), so $X_n$ is an elementary process in $M^2_{loc}([a,b])$. Its integral is, by definition (Def 5.5, which is consistent with Def 5.24),
$$
\int_a^bX_n(t)\,dB_t=\sum_{k=0}^{m_n-1}X_{t_{n,k}}\big(B_{t_{n,k+1}}-B_{t_{n,k}}\big).
$$
Fix $\omega$. The path $t\mapsto X_t(\omega)$ is continuous on the compact $[a,b]$, hence uniformly continuous, with modulus of continuity $w(\omega,h)=\sup_{|s-t|\le h}|X_s(\omega)-X_t(\omega)|\to0$ as $h\to0$. For $t\in[t_{n,k},t_{n,k+1})$, $|X_n(t)-X_t|=|X_{t_{n,k}}-X_t|\le w(\omega,|\pi_n|)$. Hence
$$
\int_a^b|X_n(t)-X_t|^2dt\le(b-a)\,w(\omega,|\pi_n|)^2\xrightarrow[n\to\infty]{}0\quad\text{a.s.}
$$
A.s. convergence implies convergence in probability, so Prop 5.27 gives
$$
\sum_{k=0}^{m_n-1}X_{t_{n,k}}\big(B_{t_{n,k+1}}-B_{t_{n,k}}\big)=\int_a^bX_n\,dB\xrightarrow{P}\int_a^bX\,dB .\qquad\blacksquare
$$

**What graders look for / pitfalls.**

- $X_n$ must be **adapted**. This is where the **left** endpoint is essential.
- The partitions must be **deterministic** (elementary processes use deterministic times).
- The conclusion is convergence in **probability**, not a.s. and not $L^2$ (without more assumptions).
- Uniform continuity on a compact interval, pathwise.
- $X_n$ is not in $M^2$ in general (only in $M^2_{loc}$). That is why we use Prop 5.27, not Cor 5.13. If $X\in M^2$ with $E\sup_t|X_t|^2<\infty$, dominated convergence gives $L^2$ convergence via Cor 5.13.

**Memorize-this skeleton.** Riemann sum $=\int X_n\,dB$ with $X_n$ elementary and adapted. Uniform continuity gives $\int|X_n-X|^2\le(b-a)w(|\pi_n|)^2\to0$ a.s. Prop 5.27.

### 4.10 Proposition 5.33 (S&P): nonnegative local martingales are supermartingales

**Proof roadmap.**

1. Localize: $M_{t\wedge\tau_n}\to M_t$ a.s. because $\tau_n\uparrow\infty$.
2. Integrability: Fatou plus constant expectation of the stopped martingale gives $E[M_t]\le E[M_0]<\infty$.
3. Supermartingale inequality: conditional Fatou (nonnegativity) plus the martingale property of $M^{\tau_n}$.

**Proof.** Let $M\ge0$ be a local martingale with reducing sequence $(\tau_n)$. Since $\tau_n\uparrow\infty$ a.s., for a.e. $\omega$ we have $\tau_n(\omega)\ge t$ for all large $n$, hence
$$
M_{t\wedge\tau_n}\xrightarrow[n\to\infty]{}M_t\quad\text{a.s., for every }t\ge0 .
$$

*Integrability.* $(M_{t\wedge\tau_n})_t$ is a martingale, so $E[M_{t\wedge\tau_n}]=E[M_{0\wedge\tau_n}]=E[M_0]$, and $M_0\in L^1$ (Rem 5.32(a)). By Fatou's lemma ($M\ge0$),
$$
E[M_t]=E\big[\lim_nM_{t\wedge\tau_n}\big]\le\liminf_nE[M_{t\wedge\tau_n}]=E[M_0]<\infty .
$$
So $M_t\in L^1$ for every $t$, and $E[M_t]\le E[M_0]$.

*Supermartingale property.* $M$ is adapted by definition. For $s\le t$, the martingale property of $M^{\tau_n}$ gives $E[M_{t\wedge\tau_n}\mid\mathcal F_s]=M_{s\wedge\tau_n}$ a.s. Since $M_{t\wedge\tau_n}\ge0$, the conditional Fatou lemma applies:
$$
E[M_t\mid\mathcal F_s]=E\big[\liminf_nM_{t\wedge\tau_n}\mid\mathcal F_s\big]\le\liminf_nE[M_{t\wedge\tau_n}\mid\mathcal F_s]=\liminf_nM_{s\wedge\tau_n}=M_s\quad\text{a.s.}
$$
Hence $M$ is a supermartingale. $\blacksquare$

**What graders look for / pitfalls.**

- Integrability of $M_t$ must be **proved**. It is not automatic for local martingales.
- Fatou needs a lower bound: here $M\ge0$. (More generally, a local martingale bounded below by an integrable variable is a supermartingale, by the same proof.)
- The inequality goes the **supermartingale** way: $\le$. Fatou gives "$\le\liminf$", never "$\ge$".
- $M_{s\wedge\tau_n}\to M_s$ a.s. is used on the right-hand side.
- Corollary: a nonnegative local martingale with constant expectation $E[M_t]=E[M_0]$ is a true martingale. (If $E[M_s-E[M_t\mid\mathcal F_s]]=0$ and the integrand is $\ge0$, it is $0$ a.s.) This is used for exponential martingales (Novikov, Girsanov).

**Memorize-this skeleton.** $M_{t\wedge\tau_n}\to M_t$. Fatou: $EM_t\le\liminf EM_{t\wedge\tau_n}=EM_0$. Conditional Fatou: $E[M_t\mid\mathcal F_s]\le\liminf M_{s\wedge\tau_n}=M_s$.

### 4.11 Proposition 5.36 (S&P): increasing process of a stochastic integral

**Proof roadmap.**

1. $\tau_n=\inf\{t:\int_0^tX_s^2ds>n\}\wedge T$ satisfies $\tau_n=T$ eventually, so $P(\tau_n=T)\to1$.
2. Identify the stopped integral: $I_{t\wedge\tau_n}=\int_0^tX_s\mathbf 1_{\{s<\tau_n\}}dB_s$, an integral of an $M^2$ process (Thm 5.21 plus Def 5.24).
3. Thm 5.16 for $Y^{(n)}=X\mathbf 1_{\{\cdot<\tau_n\}}\in M^2$: both $I^{\tau_n}$ and $(I^{\tau_n})^2-\int_0^{\cdot\wedge\tau_n}X^2$ are martingales.
4. So $(\tau_n)$ reduces both $I$ and $I^2-\int_0^\cdot X^2$. Uniqueness comes from Prop 5.35.

**Proof.** Let $X\in M^2_{loc}([0,T])$, $I_t=\int_0^tX_s\,dB_s$ (Def 5.24), and
$$
\tau_n=\inf\Big\{t\in[0,T]:\int_0^tX_s^2ds>n\Big\}\wedge T .
$$
Since $\int_0^TX_s^2ds<\infty$ a.s., $\tau_n=T$ for all $n\ge\int_0^TX_s^2ds$. So $\tau_n\uparrow T$ with $P(\tau_n=T)\to1$, which is condition (i') of the local martingale definition on $[0,T]$. Let $Y^{(n)}_s=X_s\mathbf 1_{\{s<\tau_n\}}$. Then $\int_0^TY^{(n)2}_sds=\int_0^{\tau_n}X_s^2ds\le n$, so $Y^{(n)}\in M^2([0,T])$.

*Step 1: $I_{t\wedge\tau_n}=\int_0^tY^{(n)}_s\,dB_s$ a.s.* By Def 5.24, for each $m\ge n$, $I=I^{(m)}:=\int_0^\cdot X\mathbf 1_{\{s<\tau_m\}}dB$ on $\{\tau_m=T\}$. By Thm 5.21 applied to $X\mathbf 1_{\{\cdot<\tau_m\}}\in M^2$ and the stopping time $t\wedge\tau_n\le T$, and since $\tau_n\le\tau_m$,
$$
I^{(m)}_{t\wedge\tau_n}=\int_0^TX_s\mathbf 1_{\{s<\tau_m\}}\mathbf 1_{\{s<t\wedge\tau_n\}}dB_s=\int_0^TX_s\mathbf 1_{\{s<\tau_n\}}\mathbf 1_{\{s<t\}}dB_s=\int_0^tY^{(n)}_s\,dB_s .
$$
Hence $I_{t\wedge\tau_n}=\int_0^tY^{(n)}\,dB$ a.s. on $\{\tau_m=T\}$ for every $m\ge n$, and $\bigcup_m\{\tau_m=T\}$ has probability one. (The slides state this identity directly.)

*Step 2: martingales.* By Thm 5.16 applied to $Y^{(n)}\in M^2([0,T])$, $(I_{t\wedge\tau_n})_t$ is a continuous square integrable martingale. This shows again that $I$ is a continuous local martingale. Moreover
$$
\Big(\int_0^tY^{(n)}_s\,dB_s\Big)^2-\int_0^t\big(Y^{(n)}_s\big)^2ds=I_{t\wedge\tau_n}^2-\int_0^{t\wedge\tau_n}X_s^2\,ds
$$
is a martingale. Writing $A_t=\int_0^tX_s^2ds$, the right side is exactly the process $I^2-A$ stopped at $\tau_n$. So $(\tau_n)$ reduces $I^2-A$, which is therefore a continuous local martingale.

*Step 3: identification.* $A$ is continuous, adapted (since $X$ is progressive), increasing, and $A_0=0$. By the uniqueness in Prop 5.35, $\langle I\rangle_t=A_t=\int_0^tX_s^2ds$. $\blacksquare$

**What graders look for / pitfalls.**

- Justify $I^{\tau_n}=\int X\mathbf 1_{\{\cdot<\tau_n\}}dB$. This needs Thm 5.21, and since $X\notin M^2$, it also needs the localization of Def 5.24.
- On $[0,T]$, use the correct localization condition $P(\tau_n=T)\to1$ (not just $\tau_n\uparrow T$).
- Check the stopped energy: $\int_0^tY^{(n)2}=\int_0^{t\wedge\tau_n}X^2$.
- Mention uniqueness: "associated increasing process" means the **unique** continuous adapted increasing $A$ with $A_0=0$.
- For the stopped process to be bounded, one may additionally stop at $\inf\{t:|I_t|\ge n\}$ (the notes say "indeed it can be chosen bounded").

**Memorize-this skeleton.** $\tau_n$ is the energy-$n$ time. $I^{\tau_n}=\int X\mathbf 1_{\{s<\tau_n\}}dB$ with integrand in $M^2$. Thm 5.16 gives that $(I^{\tau_n})^2-\int_0^{\cdot\wedge\tau_n}X^2$ is a martingale. So $(\tau_n)$ reduces $I^2-\int X^2$. Uniqueness.

### 4.12 Corollary 5.37 (proof in notes, short)

$M_tN_t=\frac14\big((M_t+N_t)^2-(M_t-N_t)^2\big)$. With $A=\frac14(\langle M+N\rangle-\langle M-N\rangle)$,
$$
M_tN_t-A_t=\tfrac14\big[(M+N)_t^2-\langle M+N\rangle_t\big]-\tfrac14\big[(M-N)_t^2-\langle M-N\rangle_t\big],
$$
a difference of continuous local martingales (Prop 5.35), hence a continuous local martingale. $A$ is a difference of two increasing processes, hence of finite variation. Uniqueness: if $A,A'$ both work, $A-A'$ is a continuous local martingale of finite variation starting at $0$, hence $\equiv0$ (Thm 4.37, localized). $\blacksquare$

### 4.13 Proposition 5.19 (S, but a typical exercise): Gaussianity of $\int f\,dB$

See Exercise 2 for the full proof.

### 4.14 Lemma 5.7 (S): idea of proof (optional)

From the notes (p. 5.2–5.5):

- Jensen gives $|f_i|^p\le\frac n{b-a}\int_{t_{i-1}}^{t_i}|f|^p$, hence $\int_a^b|G_nf|^p\le\int_a^b|f|^p$.
- $G_{2^n}f=G_{2^n}(G_{2^{n+1}}f)$ gives monotonicity: $\int|G_{2^n}f|^p\le\int|G_{2^{n+1}}f|^p$.
- $\int|G_nf-f|^p\to0$: first for continuous $f$ (uniform continuity), then by density of continuous functions in $L^p$.
- For progressive $X$, $X_n=G_nX$ is adapted, since $\int_{t_{i-1}}^{t_i}X_s\,ds\in\mathcal F_{t_i}$.
- $M^p_{loc}$: pathwise convergence a.s. $M^p$: $\int|X-X_n|^p\le2^{p-1}(\int|X|^p+\int|X_n|^p)\le2^p\int|X|^p$, which is integrable, so dominated convergence gives $E\int|X-X_n|^p\to0$.

### 4.15 The integral with respect to a general continuous $L^2$ martingale (assignment-style construction)

This is the content of the mandatory assignment, Problem 3, and a likely exam question in the form "adapt the Brownian construction to an integrator $M$". The proofs below copy the structure of Lemma 5.6 and Def 5.8/Thm 5.9, with $dt$ replaced by $d\langle M\rangle_t$.

**Setting.** $M=(M_t)_{t\in[0,T]}$ is a continuous $(\mathcal F_t)$-martingale with $M_t\in L^2$ for every $t$. $\langle M\rangle$ is its compensator: the continuous adapted increasing process with $\langle M\rangle_0=0$ such that $M^2-\langle M\rangle$ is a martingale. The space of integrands is
$$
M^2_M([0,T])=\Big\{\varphi\ \text{progressively measurable}:\ \|\varphi\|^2_{M}:=E\Big[\int_0^T\varphi_u^2\,d\langle M\rangle_u\Big]<\infty\Big\},
$$
a closed subspace of $L^2([0,T]\times\Omega,d\langle M\rangle\otimes P)$, hence a Hilbert space. Here $\int_0^T\varphi_u^2\,d\langle M\rangle_u(\omega)$ is a pathwise Lebesgue–Stieltjes integral. (For $M=B$: $\langle B\rangle_t=t$, and we recover $M^2([0,T])$.)

**Key lemma (conditional variance of increments).** For $s<t$,
$$
E\big[(M_t-M_s)^2\mid\mathcal F_s\big]=E\big[M_t^2-M_s^2\mid\mathcal F_s\big]=E\big[\langle M\rangle_t-\langle M\rangle_s\mid\mathcal F_s\big].
$$
*Proof.* $E[(M_t-M_s)^2\mid\mathcal F_s]=E[M_t^2\mid\mathcal F_s]-2M_sE[M_t\mid\mathcal F_s]+M_s^2=E[M_t^2\mid\mathcal F_s]-M_s^2$ by the martingale property. Since $M^2-\langle M\rangle$ is a martingale, $E[M_t^2-\langle M\rangle_t\mid\mathcal F_s]=M_s^2-\langle M\rangle_s$, i.e. $E[M_t^2\mid\mathcal F_s]-M_s^2=E[\langle M\rangle_t-\langle M\rangle_s\mid\mathcal F_s]$. $\blacksquare$

#### Step 1: simple integrands and simple integrals

A **simple integrand** is
$$
\varphi(t,\omega)=\sum_{k=1}^{K}\phi_k(\omega)\mathbf 1_{[t_{k-1},t_k)}(t),\qquad0=t_0<t_1<\dots<t_K=T,
$$
with $\phi_k$ $\mathcal F_{t_{k-1}}$-measurable and $\varphi\in M^2_M$, i.e. $\sum_kE[\phi_k^2(\langle M\rangle_{t_k}-\langle M\rangle_{t_{k-1}})]<\infty$. Its integral is the Riemann sum
$$
\int_0^T\varphi_u\,dM_u:=\sum_{k=1}^K\phi_k\,(M_{t_k}-M_{t_{k-1}}),\qquad \int_s^t\varphi_u\,dM_u:=\sum_{k=1}^K\phi_k\,(M_{t_k\wedge t}-M_{t_{k-1}\wedge t})-\sum_{k=1}^K\phi_k\,(M_{t_k\wedge s}-M_{t_{k-1}\wedge s}).
$$
It is linear and independent of the representation.

> **Pitfall:** If you only assume $\phi_k\in L^2$, then $E[\phi_k^2\Delta\langle M\rangle_k]$ may be infinite, because $\Delta\langle M\rangle_k$ is random and possibly unbounded. The natural hypothesis is $\varphi\in M^2_M$. Each term $E[\phi_k^2\Delta\langle M\rangle_k]$ is then finite, as a nonnegative summand of a finite sum. Bounded $\phi_k$ always works, because $E[\langle M\rangle_T]=E[M_T^2-M_0^2]<\infty$. If $\langle M\rangle$ is deterministic (e.g. $M=B$, or $M=\int\sigma\,dB$ with $\sigma$ deterministic), $\phi_k\in L^2$ suffices.

#### Step 2: Itô isometry for simple integrands

**Claim.** $E[(\int_0^T\varphi\,dM)^2]=E[\int_0^T\varphi_u^2\,d\langle M\rangle_u]$.

**Proof.** Write $\Delta M_k=M_{t_k}-M_{t_{k-1}}$ and $\Delta\langle M\rangle_k=\langle M\rangle_{t_k}-\langle M\rangle_{t_{k-1}}$.

*Diagonal terms.* By the key lemma and the tower property, using that $\phi_k^2\ge0$ is $\mathcal F_{t_{k-1}}$-measurable,
$$
E[\phi_k^2\Delta M_k^2]=E\big[\phi_k^2\,E[\Delta M_k^2\mid\mathcal F_{t_{k-1}}]\big]=E\big[\phi_k^2\,E[\Delta\langle M\rangle_k\mid\mathcal F_{t_{k-1}}]\big]=E[\phi_k^2\Delta\langle M\rangle_k]<\infty .
$$
(For nonnegative variables, "taking out what is known" is always allowed. Alternatively, apply it to $\phi_k^2\wedge N$ and let $N\uparrow\infty$ by monotone convergence.) In particular $\phi_k\Delta M_k\in L^2$.

*Cross terms, $j<k$.* $\phi_j\phi_k\Delta M_j\Delta M_k\in L^1$ by Cauchy–Schwarz, and $\phi_j,\phi_k,\Delta M_j$ are $\mathcal F_{t_{k-1}}$-measurable (as $t_j\le t_{k-1}$). So
$$
E[\phi_j\phi_k\Delta M_j\Delta M_k]=E\big[\phi_j\phi_k\Delta M_j\,E[\Delta M_k\mid\mathcal F_{t_{k-1}}]\big]=0,
$$
by the martingale property of $M$. Hence
$$
E\Big[\Big(\int_0^T\varphi\,dM\Big)^2\Big]=\sum_kE[\phi_k^2\Delta M_k^2]=\sum_kE[\phi_k^2\Delta\langle M\rangle_k]=E\Big[\int_0^T\varphi_u^2\,d\langle M\rangle_u\Big],
$$
since $\varphi^2=\phi_k^2$ on $[t_{k-1},t_k)$, so $\int_0^T\varphi^2\,d\langle M\rangle=\sum_k\phi_k^2\Delta\langle M\rangle_k$ pathwise. $\blacksquare$

> Note the difference from the Brownian case. There, $\Delta B_k$ is **independent** of $\mathcal F_{t_{k-1}}$, and $E[\phi_k^2\Delta B_k^2]=E[\phi_k^2]\Delta t_k$. For general $M$ there is no independence, only the conditional identity of the key lemma. The proof works with conditional expectations only.

#### Step 3: conditional mean and conditional isometry for simple integrands

**Claim.** For $0\le s<t\le T$,
$$
E\Big[\int_s^t\varphi_u\,dM_u\,\Big|\,\mathcal F_s\Big]=0,\qquad E\Big[\Big(\int_s^t\varphi_u\,dM_u\Big)^2\,\Big|\,\mathcal F_s\Big]=E\Big[\int_s^t\varphi_u^2\,d\langle M\rangle_u\,\Big|\,\mathcal F_s\Big].
$$
**Proof.** Refine the partition so that $s$ and $t$ are partition points. Splitting $\phi_k\mathbf 1_{[t_{k-1},t_k)}=\phi_k\mathbf 1_{[t_{k-1},s)}+\phi_k\mathbf 1_{[s,t_k)}$ keeps the coefficient $\phi_k$, which is $\mathcal F_{t_{k-1}}$-measurable and hence measurable at the new left endpoint $s\ge t_{k-1}$. So we may assume $s=t_p$ and $t=t_q$, and then $\int_s^t\varphi\,dM=\sum_{k=p+1}^q\phi_k\Delta M_k$. For $k>p$ we have $\mathcal F_s\subset\mathcal F_{t_{k-1}}$.

*Mean.* $E[\phi_k\Delta M_k\mid\mathcal F_s]=E[\phi_kE[\Delta M_k\mid\mathcal F_{t_{k-1}}]\mid\mathcal F_s]=0$. Sum over $k$.

*Second moment.* Expand the square. For $p<j<k\le q$,
$$
E[\phi_j\phi_k\Delta M_j\Delta M_k\mid\mathcal F_s]=E\big[\phi_j\phi_k\Delta M_j\,E[\Delta M_k\mid\mathcal F_{t_{k-1}}]\,\big|\,\mathcal F_s\big]=0,
$$
and
$$
E[\phi_k^2\Delta M_k^2\mid\mathcal F_s]=E\big[\phi_k^2\,E[\Delta M_k^2\mid\mathcal F_{t_{k-1}}]\,\big|\,\mathcal F_s\big]=E\big[\phi_k^2\,E[\Delta\langle M\rangle_k\mid\mathcal F_{t_{k-1}}]\,\big|\,\mathcal F_s\big]=E[\phi_k^2\Delta\langle M\rangle_k\mid\mathcal F_s].
$$
Summing over $k=p+1,\dots,q$ gives $E[\int_s^t\varphi^2\,d\langle M\rangle\mid\mathcal F_s]$. $\blacksquare$

Consequently $t\mapsto\int_0^t\varphi\,dM$ is a continuous square integrable martingale, and $(\int_0^t\varphi\,dM)^2-\int_0^t\varphi^2\,d\langle M\rangle$ is a martingale (same computation as in Thm 5.16, Step 2).

#### Step 4: extension by density

Assume (given) that simple integrands are dense in $M^2_M([0,T])$.

**Definition.** For $\varphi\in M^2_M([0,T])$, choose simple $\varphi_n$ with $\|\varphi_n-\varphi\|_M\to0$ and set
$$
\int_0^T\varphi_u\,dM_u:=L^2\text{-}\lim_{n\to\infty}\int_0^T\varphi_n(u)\,dM_u .
$$
**Well-defined.**

- *Existence.* By linearity and the isometry of Step 2,
$$
\Big\|\int_0^T\varphi_n\,dM-\int_0^T\varphi_m\,dM\Big\|_{L^2}=\|\varphi_n-\varphi_m\|_M\le\|\varphi_n-\varphi\|_M+\|\varphi-\varphi_m\|_M\to0 .
$$
So the integrals form a Cauchy sequence in the complete space $L^2(P)$, and the limit exists.
- *Independence of the approximating sequence.* If $\psi_n$ is another simple sequence with $\|\psi_n-\varphi\|_M\to0$, then
$$
\Big\|\int\varphi_n\,dM-\int\psi_n\,dM\Big\|_{L^2}=\|\varphi_n-\psi_n\|_M\le\|\varphi_n-\varphi\|_M+\|\varphi-\psi_n\|_M\to0,
$$
so both limits coincide (a.s.).
- *Consistency.* If $\varphi$ is simple, take $\varphi_n\equiv\varphi$. The new definition agrees with Step 1.

**Isometry for the extension.** The norm is continuous on $L^2$ and on $M^2_M$, so
$$
E\Big[\Big(\int_0^T\varphi\,dM\Big)^2\Big]=\lim_nE\Big[\Big(\int_0^T\varphi_n\,dM\Big)^2\Big]=\lim_n\|\varphi_n\|_M^2=\|\varphi\|_M^2=E\Big[\int_0^T\varphi_u^2\,d\langle M\rangle_u\Big].
$$
(Using $|\,\|x_n\|-\|x\|\,|\le\|x_n-x\|$ in each space.) Linearity passes to the limit, and the map is the unique continuous linear extension.

**Conditional version for the extension.** Exactly as in Thm 5.9:

- $E[\int_s^t\varphi_n\,dM\mid\mathcal F_s]=0$ passes to the limit by $L^2$-continuity of conditional expectation.
- $(\int_s^t\varphi_n\,dM)^2\to(\int_s^t\varphi\,dM)^2$ in $L^1$ by Cauchy–Schwarz.
- $\int_s^t\varphi_n^2\,d\langle M\rangle\to\int_s^t\varphi^2\,d\langle M\rangle$ in $L^1$, since $E\int|\varphi_n^2-\varphi^2|\,d\langle M\rangle\le\|\varphi_n-\varphi\|_M\|\varphi_n+\varphi\|_M$.

Conditional expectation is an $L^1$ contraction, so the conditional isometry holds in the limit.

**What graders look for / pitfalls.**

- Define the simple integral with **left** endpoints and $\mathcal F_{t_{k-1}}$-measurable coefficients.
- Use the key lemma $E[\Delta M_k^2\mid\mathcal F_{t_{k-1}}]=E[\Delta\langle M\rangle_k\mid\mathcal F_{t_{k-1}}]$. Do **not** use independence of increments (false for general $M$), and do not write $E[\Delta M_k^2]=\Delta t_k$.
- Integrability of every term before conditioning.
- In the extension, show (i) the Cauchy property, (ii) independence of the sequence, (iii) the isometry passes to the limit. Missing (ii) is the most common deduction.
- Remember that the $L^2$ limit is defined only up to a.s. equality.

**Memorize-this skeleton.**
Key lemma: $E[(M_t-M_s)^2\mid\mathcal F_s]=E[\langle M\rangle_t-\langle M\rangle_s\mid\mathcal F_s]$. Cross terms: condition on the later left endpoint, use the martingale property. Diagonal: key lemma. Extension: isometry gives Cauchy, gives a limit; interleaving or the triangle inequality gives independence; continuity of norms gives the isometry.

## 5. Exercises

Conventions: $B$ is a standard $(\mathcal F_t)$-Brownian motion. "Isometry" means Thm 5.9 and "product formula" means Remark 5.10 / Example 5.11(c). Useful Gaussian moments: for $Z\sim N(0,\sigma^2)$, $E[Z^4]=3\sigma^4$, $E[e^{\lambda Z}]=e^{\lambda^2\sigma^2/2}$, $E[e^{\lambda Z^2}]=(1-2\lambda\sigma^2)^{-1/2}$ for $2\lambda\sigma^2<1$ (and $=+\infty$ otherwise), $E|Z|^3=2\sqrt{2/\pi}\,\sigma^3$.

### Exercise 1 (★, 15 min): iterated integrals and the isometry

Let $Y_t=\int_0^ts\,dB_s$ and $V_t=\int_0^tB_s\,dB_s$.

(a) Compute $E\big[\big(\int_0^T\int_0^ts\,dB_s\,dB_t\big)^2\big]$.

(b) Compute $E\big[\big(\int_0^T\int_0^tB_s\,dB_s\,dB_t\big)^2\big]$ and $E[(\int_0^TB_t^2\,dB_t)^2]$.

(c) Compute $E\big[\int_0^TB_t\,dB_t\cdot\int_0^TY_t\,dB_t\big]$ and $E\big[\int_0^TB_t\,dB_t\int_0^TB_t^2\,dB_t\big]$.

(d) For $0\le u\le T$, compute $E\big[\big(\int_u^TY_t\,dB_t\big)^2\,\big|\,\mathcal F_u\big]$.

**Strategy.** Check that the inner integral, as a process, is in $M^2([0,T])$. Then apply the isometry to the outer integral, and the isometry again (or Gaussianity) to the inner one. For (c) use the product formula. For (d) use the conditional isometry, and the independence of $\int_u^ts\,dB_s$ from $\mathcal F_u$.

**Full solution.**

(a) $s\mapsto s$ is deterministic and in $L^2([0,T])$, so $Y_t$ is defined. $Y$ is continuous and adapted (Thm 5.16), hence progressive. By the isometry, $E[Y_t^2]=\int_0^ts^2ds=t^3/3$, which is continuous in $t$, so $E\int_0^TY_t^2dt=\int_0^Tt^3/3\,dt=T^4/12<\infty$ and $Y\in M^2([0,T])$. By the isometry again (Fubini for the exchange of $E$ and $dt$),
$$
E\Big[\Big(\int_0^TY_t\,dB_t\Big)^2\Big]=E\int_0^TY_t^2\,dt=\int_0^T\frac{t^3}{3}\,dt=\frac{T^4}{12}.
$$

(b) $B\in M^2$, so $V_t$ is defined, continuous and adapted, with $E[V_t^2]=\int_0^tE[B_s^2]ds=t^2/2$. Hence $V\in M^2([0,T])$ and
$$
E\Big[\Big(\int_0^TV_t\,dB_t\Big)^2\Big]=\int_0^T\frac{t^2}{2}\,dt=\frac{T^3}{6}.
$$
$B^2$ is continuous and adapted with $E[B_t^4]=3t^2$, so $B^2\in M^2([0,T])$ and $E[(\int_0^TB_t^2dB_t)^2]=\int_0^T3t^2dt=T^3$.

(c) By the product formula, $E[\int_0^TB\,dB\int_0^TY\,dB]=\int_0^TE[B_tY_t]\,dt$. Since $B_t=\int_0^t1\,dB_s$, the product formula again gives $E[B_tY_t]=\int_0^ts\,ds=t^2/2$. Hence the answer is $\int_0^Tt^2/2\,dt=T^3/6$. Similarly $E[\int_0^TB\,dB\int_0^TB^2\,dB]=\int_0^TE[B_t^3]\,dt=0$ (odd moment of a centered Gaussian).

(d) By the conditional isometry (Thm 5.9 on $[u,T]$) and conditional Fubini (the integrand is nonnegative and jointly measurable),
$$
E\Big[\Big(\int_u^TY_t\,dB_t\Big)^2\Big|\mathcal F_u\Big]=E\Big[\int_u^TY_t^2dt\Big|\mathcal F_u\Big]=\int_u^TE[Y_t^2\mid\mathcal F_u]\,dt .
$$
For $t\ge u$, $Y_t=Y_u+\int_u^ts\,dB_s$. The second term is independent of $\mathcal F_u$ (Prop 5.19 / Exercise 2(c)) and is $N(0,(t^3-u^3)/3)$. Hence
$$
E[Y_t^2\mid\mathcal F_u]=Y_u^2+2Y_u\,E\Big[\int_u^ts\,dB_s\Big]+E\Big[\Big(\int_u^ts\,dB_s\Big)^2\Big]=Y_u^2+\frac{t^3-u^3}{3}.
$$
Therefore
$$
E\Big[\Big(\int_u^TY_t\,dB_t\Big)^2\Big|\mathcal F_u\Big]=Y_u^2(T-u)+\frac{T^4-u^4}{12}-\frac{u^3(T-u)}{3}.
$$
Check: at $u=0$ this gives $T^4/12$, as in (a).

**Common pitfalls.** Forgetting to verify $Y\in M^2$ before applying the isometry to the outer integral. Writing $E[(\int Y\,dB)^2]=E[(\int Y\,dt)^2]$ or $\int(EY_t)^2dt$. The correct formula is $\int_0^TE[Y_t^2]\,dt$. In (d), the answer must be $\mathcal F_u$-measurable (it contains $Y_u$). A constant answer is wrong.

### Exercise 2 (★★, 25 min): integrals of deterministic functions are Gaussian

Let $f\in L^2([0,T])$ and $I_t=\int_0^tf(s)\,dB_s$.

(a) Prove that $(I_t)_{t\in[0,T]}$ is a centered Gaussian process and find its covariance.

(b) Compute $E[I_t^4]$, $E[e^{I_t}]$, and $\operatorname{Cov}(I_t,B_t)$.

(c) Show that $I_t-I_s=\int_s^tf\,dB$ is independent of $\mathcal F_s$ for $s<t$.

(d) Show that $Z_t=\exp\big(I_t-\frac12\int_0^tf(s)^2ds\big)$ is a martingale.

**Strategy.** Approximate $f$ by step functions. Elementary integrals of deterministic step functions are linear combinations of independent Gaussian increments. $L^2$ limits of Gaussian vectors are Gaussian (characteristic functions). Get the covariance from the product formula. For (c), approximate and pass to the limit in $E[We^{iuY}]=E[W]E[e^{iuY}]$.

**Full solution.**

(a) Choose step functions $f_n=\sum_i c^n_i\mathbf 1_{[s^n_i,s^n_{i+1})}$ with $\|f_n-f\|_{L^2([0,T])}\to0$ (step functions are dense in $L^2$). Each $f_n$ is an elementary process with deterministic coefficients. So $I^n_t:=\int_0^tf_n\,dB=\sum_ic^n_i(B_{s^n_{i+1}\wedge t}-B_{s^n_i\wedge t})$. By the isometry, for each $t$,
$$
E|I^n_t-I_t|^2=\int_0^t|f_n-f|^2ds\le\|f_n-f\|^2_{L^2}\to0 .
$$
Fix $0\le t_1<\dots<t_k\le T$. The vector $V_n=(I^n_{t_1},\dots,I^n_{t_k})$ is a linear transformation of a finite vector of Brownian increments, which is Gaussian (independent Gaussian increments). So $V_n$ is a Gaussian vector with mean $0$ and covariance matrix $\Gamma_n$. $V_n\to V=(I_{t_1},\dots,I_{t_k})$ in $L^2$, hence $\Gamma_n\to\Gamma=(E[I_{t_i}I_{t_j}])_{ij}$ and $V_n\to V$ in law. For each $u\in\mathbb R^k$,
$$
E[e^{i\langle u,V\rangle}]=\lim_nE[e^{i\langle u,V_n\rangle}]=\lim_ne^{-\frac12u^\top\Gamma_nu}=e^{-\frac12u^\top\Gamma u},
$$
so $V$ is a centered Gaussian vector. Thus $I$ is a centered Gaussian process. By the product formula, for $s\le t$, extending $f\mathbf 1_{[0,s]}$ by zero,
$$
E[I_sI_t]=E\Big[\int_0^Tf\mathbf 1_{[0,s]}\,dB\int_0^Tf\mathbf 1_{[0,t]}\,dB\Big]=\int_0^Tf(u)^2\mathbf 1_{[0,s]}(u)\mathbf 1_{[0,t]}(u)\,du=\int_0^{s\wedge t}f(u)^2du .
$$

(b) Let $\sigma_t^2=\int_0^tf^2$. Since $I_t\sim N(0,\sigma_t^2)$, we get $E[I_t^4]=3\sigma_t^4=3(\int_0^tf^2)^2$ and $E[e^{I_t}]=e^{\sigma_t^2/2}=\exp(\frac12\int_0^tf^2)$ (Remark 5.20). $\operatorname{Cov}(I_t,B_t)=E[\int_0^tf\,dB\int_0^t1\,dB]=\int_0^tf(s)\,ds$. For example, with $f(s)=s$: $E[Y_t^4]=t^6/3$ and $\operatorname{Cov}(Y_t,B_t)=t^2/2$.

(c) For step functions $f_n$ on $[s,t]$, $\int_s^tf_n\,dB$ is a linear combination of increments of $B$ after time $s$, which are independent of $\mathcal F_s$. Let $W$ be bounded and $\mathcal F_s$-measurable, and $u\in\mathbb R$. Then $E[We^{iu\int_s^tf_n\,dB}]=E[W]E[e^{iu\int_s^tf_n\,dB}]$. As $n\to\infty$, $\int_s^tf_n\,dB\to\int_s^tf\,dB$ in $L^2$, hence in probability. Since $|e^{ix}-e^{iy}|\le|x-y|\wedge2$, dominated convergence (or bounded convergence along an a.s. subsequence) lets us pass to the limit on both sides:
$$
E\big[We^{iu\int_s^tf\,dB}\big]=E[W]\,E\big[e^{iu\int_s^tf\,dB}\big].
$$
Taking $W=e^{ivX}$ for an $\mathcal F_s$-measurable $X$ shows that the joint characteristic function factorizes, so $\int_s^tf\,dB$ is independent of $\mathcal F_s$ (equivalently: the criterion "$E[We^{iuY}]=E[W]E[e^{iuY}]$ for all bounded $W\in\mathcal F_s$" characterizes independence).

(d) $Z_t>0$ is adapted, and $E[Z_t]=e^{-\sigma_t^2/2}E[e^{I_t}]=1$, so $Z_t\in L^1$. For $s<t$, $Z_t=Z_s\exp\big(\int_s^tf\,dB-\frac12\int_s^tf^2\big)$. By (c) and since $Z_s\in\mathcal F_s$,
$$
E[Z_t\mid\mathcal F_s]=Z_s\,e^{-\frac12\int_s^tf^2}\,E\big[e^{\int_s^tf\,dB}\big]=Z_s\,e^{-\frac12\int_s^tf^2}\,e^{\frac12\int_s^tf^2}=Z_s .
$$

**Common pitfalls.** Claiming "a limit of Gaussians is Gaussian" without saying in which sense: it needs convergence in law, and here $L^2$ gives it. Showing only that each $I_t$ is Gaussian. A Gaussian **process** requires joint Gaussianity of all finite-dimensional vectors. In (d), "pulling out" $Z_s$ needs $Z_s\in\mathcal F_s$, and computing the remaining expectation unconditionally needs independence (c). For random integrands, (c) fails (Exercise 9).

### Exercise 3 (★★, 20 min): $\int_0^tB_s\,dB_s$ from Riemann sums

Show that $\int_0^tB_s\,dB_s=\frac12(B_t^2-t)$.

**Strategy.** Prop 5.28 says the left-endpoint Riemann sums converge in probability to the integral. Compute their limit by hand with the algebraic identity $a(b-a)=\frac12(b^2-a^2)-\frac12(b-a)^2$ and the quadratic variation of $B$ (Prop 2.15).

**Full solution.** Let $\pi_n=\{0=t_0<\dots<t_{m}=t\}$ (with $m=m_n$) be deterministic partitions with $|\pi_n|\to0$, and $\Delta_i=t_{i+1}-t_i$. Since $a(b-a)=\frac12(b^2-a^2)-\frac12(b-a)^2$,
$$
S_n:=\sum_{i=0}^{m-1}B_{t_i}(B_{t_{i+1}}-B_{t_i})=\frac12\sum_{i=0}^{m-1}\big(B_{t_{i+1}}^2-B_{t_i}^2\big)-\frac12\sum_{i=0}^{m-1}(B_{t_{i+1}}-B_{t_i})^2=\frac12B_t^2-\frac12Q_n,
$$
where $Q_n=\sum_i(\Delta B_i)^2$. The $\Delta B_i$ are independent $N(0,\Delta_i)$, and $\operatorname{Var}((\Delta B_i)^2)=3\Delta_i^2-\Delta_i^2=2\Delta_i^2$. So
$$
E[(Q_n-t)^2]=\operatorname{Var}(Q_n)=\sum_i2\Delta_i^2\le2|\pi_n|\,t\to0 .
$$
So $Q_n\to t$ in $L^2$, and $S_n\to\frac12(B_t^2-t)$ in $L^2$, hence in probability. On the other hand, $B$ is continuous and adapted, so $B\in M^2_{loc}$, and Prop 5.28 gives $S_n\to\int_0^tB\,dB$ in probability. Limits in probability are a.s. unique, so
$$
\int_0^tB_s\,dB_s=\frac12B_t^2-\frac t2\quad\text{a.s.}
$$
Check: the mean is $0$, as it should be, and $E[(\frac12(B_t^2-t))^2]=\frac14\operatorname{Var}(B_t^2)=\frac14\cdot2t^2=\frac{t^2}2=\int_0^tE[B_s^2]ds$, consistent with the isometry.

**Common pitfalls.** Using random partitions. Forgetting to identify the limit with the integral via Prop 5.28 (computing the limit of the sums alone is not enough). Writing $\int B\,dB=\frac12B_t^2$ (the classical chain rule fails).

### Exercise 4 (★★, 25 min): other evaluation points (Baldi Ex. 7.9, Stratonovich)

Let $\pi_n$ be as above, with $m_i=\frac12(t_i+t_{i+1})$.

(a) Find the limit in probability of $\sum_iB_{t_{i+1}}(B_{t_{i+1}}-B_{t_i})$ (right endpoint).

(b) Find the limit of $\sum_iB_{m_i}(B_{t_{i+1}}-B_{t_i})$ (midpoint) and of $\sum_i\frac12(B_{t_i}+B_{t_{i+1}})(B_{t_{i+1}}-B_{t_i})$ (trapezoid).

(c) Show that if $X$ is continuous and adapted with finite-variation paths, the right-endpoint sums $\sum X_{t_{i+1}}\Delta B_i$ have the same limit as the left-endpoint sums.

**Strategy.** Write each sum as the left-endpoint sum plus a correction, and compute the correction's limit in $L^2$ using independence of increments.

**Full solution.**

(a) $\sum B_{t_{i+1}}\Delta B_i=\sum B_{t_i}\Delta B_i+\sum(\Delta B_i)^2\to\int_0^tB\,dB+t=\frac12B_t^2+\frac t2$ in probability (Exercise 3 and $Q_n\to t$).

(b) Write $B_{m_i}=B_{t_i}+(B_{m_i}-B_{t_i})$ and $\Delta B_i=(B_{t_{i+1}}-B_{m_i})+(B_{m_i}-B_{t_i})$. Then
$$
\sum_iB_{m_i}\Delta B_i=\sum_iB_{t_i}\Delta B_i+\underbrace{\sum_i(B_{m_i}-B_{t_i})(B_{t_{i+1}}-B_{m_i})}_{R_n}+\underbrace{\sum_i(B_{m_i}-B_{t_i})^2}_{U_n}.
$$
- $U_n$: the summands are independent with mean $\Delta_i/2$ and variance $2(\Delta_i/2)^2$. So $E[U_n]=t/2$ and $\operatorname{Var}(U_n)=\sum\Delta_i^2/2\le|\pi_n|t/2\to0$, hence $U_n\to t/2$ in $L^2$.
- $R_n$: each summand is a product of two independent $N(0,\Delta_i/2)$ variables, so it has mean $0$ and second moment $\Delta_i^2/4$. Summands for different $i$ are independent and centered, hence orthogonal. So $E[R_n^2]=\sum\Delta_i^2/4\le|\pi_n|t/4\to0$.

Hence the midpoint sums converge to $\int_0^tB\,dB+\frac t2=\frac12B_t^2$. The trapezoid sum telescopes exactly: $\frac12(B_{t_i}+B_{t_{i+1}})(B_{t_{i+1}}-B_{t_i})=\frac12(B_{t_{i+1}}^2-B_{t_i}^2)$, so it equals $\frac12B_t^2$ for every $n$. The limit $\frac12B_t^2$ is the **Stratonovich integral** $\int_0^tB\circ dB$, which obeys the classical chain rule but is not a martingale ($E=\frac t2\ne0$).

(c) $\sum X_{t_{i+1}}\Delta B_i-\sum X_{t_i}\Delta B_i=\sum(X_{t_{i+1}}-X_{t_i})\Delta B_i$, and
$$
\Big|\sum_i(X_{t_{i+1}}-X_{t_i})\Delta B_i\Big|\le\max_i|\Delta B_i|\sum_i|X_{t_{i+1}}-X_{t_i}|\le\max_i|\Delta B_i|\cdot V_0^t(X)(\omega)\to0\quad\text{a.s.},
$$
by uniform continuity of $B$ on $[0,t]$ ($V_0^t(X)$ is the total variation, finite by assumption). So both sums converge in probability to $\int_0^tX\,dB$.

**Common pitfalls.** Thinking that "the integral does not depend on the evaluation point" as in Riemann–Stieltjes. That holds only when the integrator or the integrand has finite variation. The point is Remark 5.29: only left-endpoint (adapted) sampling gives the Itô integral and the martingale property.

### Exercise 5 (★, 10 min): indicator integrands (Baldi Ex. 7.1)

(a) Compute $Z=\int_0^1\mathbf 1_{\{B_t=0\}}dB_t$. (b) For $Z'=\int_0^1\mathbf 1_{\{B_t\le0\}}dB_t$, compute $E[Z']$ and $\operatorname{Var}(Z')$.

**Strategy.** Bounded progressive integrands are in $M^2$. Use mean zero and the isometry plus Fubini.

**Full solution.** $(t,\omega)\mapsto B_t(\omega)$ is jointly measurable and adapted (progressive), so $\mathbf 1_{\{B_t=0\}}=\mathbf 1_{\{0\}}(B_t)$ and $\mathbf 1_{\{B_t\le0\}}$ are progressive (Borel functions of a progressive process). They are bounded, hence in $M^2([0,1])$.

(a) $E[Z]=0$ and $E[Z^2]=E\int_0^1\mathbf 1_{\{B_t=0\}}dt=\int_0^1P(B_t=0)\,dt=0$. So $Z=0$ a.s.

(b) $E[Z']=0$ and $\operatorname{Var}(Z')=E\int_0^1\mathbf 1_{\{B_t\le0\}}dt=\int_0^1P(B_t\le0)\,dt=\frac12$.

**Common pitfalls.** In (a), arguing "the integrand is nonzero at $t=0$" ($B_0=0$). A single time, or a $dt\otimes P$-null set, does not matter (Def 5.2).

### Exercise 6 (★, 15 min): moment computations (Baldi Ex. 7.2, 7.3)

(a) Compute $E[B_s\int_0^tB_u\,dB_u]$.
(b) Let $Y_t=\int_0^te^s\,dB_s$ and $Z_t=\int_0^tY_s\,dB_s$. Compute $E[Z_t]$, $E[Z_t^2]$ and $E[Z_tZ_s]$.

**Full solution.**

(a) Let $r=s\vee t$. Write $B_s=\int_0^r\mathbf 1_{[0,s)}(v)\,dB_v$ and extend $B_u\mathbf 1_{[0,t)}(u)$ by zero to $[0,r]$. By the product formula, $E[B_s\int_0^tB\,dB]=\int_0^{s\wedge t}E[B_u]\,du=0$.

(b) $E[Y_s^2]=\int_0^se^{2u}du=\frac12(e^{2s}-1)$, which is continuous, so $Y\in M^2([0,t])$ (and $Y$ is continuous adapted). Hence $E[Z_t]=0$ and
$$
E[Z_t^2]=\int_0^t\frac12(e^{2s}-1)\,ds=\frac14(e^{2t}-1)-\frac t2 .
$$
For $s\le t$, the product formula over $[0,s]\cap[0,t]$ gives $E[Z_tZ_s]=E[Z_s^2]=\frac14(e^{2s}-1)-\frac s2$. (Alternatively: $Z$ is a martingale, so $E[Z_tZ_s]=E[Z_sE[Z_t\mid\mathcal F_s]]=E[Z_s^2]$.)

**Common pitfalls.** Writing $E[Z_t^2]=\int_0^t(E Y_s)^2ds=0$.

### Exercise 7 (★★, 20 min): $M^2$ versus $M^2_{loc}$, the case $e^{B_t^2}$ (adapted from Baldi Ex. 7.5)

(a) For which $T>0$ is $X_t=e^{B_t^2}$ in $M^2([0,T])$? Is it in $M^2_{loc}([0,T])$? What can be said about $I_t=\int_0^te^{B_s^2}dB_s$?

(b) (Baldi 7.5) Show that $X_t=\int_0^te^{-B_s^2}dB_s$ is a square integrable martingale. Is it bounded in $L^2$?

**Strategy.** Membership in $M^2$ is a computation of $\int_0^TE[X_s^2]\,ds$ (Tonelli). Membership in $M^2_{loc}$ follows from path continuity. Use $E[e^{\lambda Z^2}]=(1-2\lambda\sigma^2)^{-1/2}$.

**Full solution.**

(a) $X$ is continuous and adapted, hence progressive, and $\int_0^TX_s^2ds<\infty$ for every path (a continuous function on a compact set). So $X\in M^2_{loc}([0,T])$ for **every** $T$. For $M^2$: $B_s=\sqrt sZ$ with $Z\sim N(0,1)$, so
$$
E[e^{2B_s^2}]=E[e^{2sZ^2}]=\begin{cases}(1-4s)^{-1/2},&s<\tfrac14,\\+\infty,&s\ge\tfrac14.\end{cases}
$$
By Tonelli, $E\int_0^Te^{2B_s^2}ds=\int_0^TE[e^{2B_s^2}]ds$.
- If $T\le\frac14$: $\int_0^T(1-4s)^{-1/2}ds=\frac12\big(1-\sqrt{1-4T}\big)\le\frac12<\infty$. (The integrand blows up at $s=1/4$, but integrably.)
- If $T>\frac14$: the integrand is $+\infty$ on $[\frac14,T]$, a set of positive length, so the integral is $+\infty$.

Hence $X\in M^2([0,T])$ iff $T\le\frac14$. Consequently, $I$ is a continuous square integrable martingale on $[0,\frac14]$ with $E[I_t^2]=\frac12(1-\sqrt{1-4t})$. On $[0,T]$ with $T>\frac14$, $I$ is a continuous local martingale (Prop 5.36), with $\langle I\rangle_t=\int_0^te^{2B_s^2}ds$. By Exercise 15, $E[\sup_{t\le T}I_t^2]=+\infty$, so $I$ is **not** a square integrable martingale on $[0,T]$.

(b) $0<e^{-B_s^2}\le1$ is continuous and adapted, so it lies in $M^2([0,t])$ for every $t$. Hence $X$ is a square integrable martingale (Thm 5.16). Also $E[e^{-2B_s^2}]=E[e^{-2sZ^2}]=(1+4s)^{-1/2}$, so
$$
E[X_t^2]=\int_0^t\frac{ds}{\sqrt{1+4s}}=\frac12\big(\sqrt{1+4t}-1\big)\xrightarrow[t\to\infty]{}\infty .
$$
So $X$ is **not** bounded in $L^2$.

**Common pitfalls.** Claiming $e^{B_t^2}\notin M^2_{loc}$ ("too big"): $M^2_{loc}$ only asks for pathwise finiteness. Forgetting that $E[e^{\lambda Z^2}]=\infty$ for $2\lambda\sigma^2\ge1$. Confusing "square integrable martingale on every $[0,t]$" with "bounded in $L^2$".

### Exercise 8 (★, 15 min): quick membership checks

Decide whether each process is in $M^2([0,1])$, only in $M^2_{loc}([0,1])$, or in neither.
(a) $f(s)=(1-s)^{-1/2}$; (b) $g(s)=(1-s)^{-1/4}$; (c) $X_t=B_t/\sqrt t$ (with $X_0=0$); (d) $X_t=B_t^n$; (e) $X_t=e^{B_t}$; (f) $X_t=B_1$; (g) $X_t=\mathbf 1_{\{t<\tau\}}B_t$ with $\tau$ a stopping time.

**Full solution.**
(a) Deterministic, hence progressive. $\int_0^1(1-s)^{-1}ds=+\infty$ for every $\omega$, so it is **not in $M^2_{loc}([0,1])$** (but it is in $M^2([0,T])$ for each $T<1$).
(b) $\int_0^1(1-s)^{-1/2}ds=2<\infty$: in $M^2([0,1])$.
(c) Progressive (a product of $B$ and a Borel function of $t$). $E\int_0^1B_t^2/t\,dt=\int_0^11\,dt=1$: in $M^2([0,1])$.
(d) Continuous adapted, with $E[B_t^{2n}]=(2n-1)!!\,t^n$ bounded on $[0,1]$: in $M^2$.
(e) $E[e^{2B_t}]=e^{2t}$: in $M^2$.
(f) **Not adapted** ($B_1$ is not $\mathcal F_t$-measurable for $t<1$), so neither: the Itô integral $\int_0^1B_1\,dB_t$ is not defined.
(g) In $M^2$ by Remark 5.3(b), since $B\in M^2$.

**Common pitfalls.** Forgetting adaptedness. Treating a deterministic function with $\int f^2=\infty$ as $M^2_{loc}$ (there is no randomness to help).

### Exercise 9 (★★, 20 min): conditional moments (Baldi Ex. 7.4)

Let $0\le s<t$.
(a) Compute $E[\int_0^tB_u\,dB_u\mid\mathcal F_s]$ and $E[(\int_s^tB_u\,dB_u)^2\mid\mathcal F_s]$.
(b) Compute $E[(\int_0^tB_u\,dB_u)^2\mid\mathcal F_s]$.
(c) Compute $E[B_s^2(\int_s^tB_u\,dB_u)^2]$, and deduce that $Z=\int_s^tB_u\,dB_u$ is uncorrelated with every $B_v$, $v\le s$, but not independent of $\mathcal F_s$.

**Strategy.** Martingale property and conditional isometry (Thm 5.9 on $[s,t]$). Then decompose $B_u=B_s+(B_u-B_s)$ with an increment independent of $\mathcal F_s$.

**Full solution.**

(a) $I_t=\int_0^tB\,dB$ is a martingale (Thm 5.16), so $E[I_t\mid\mathcal F_s]=I_s=\frac12(B_s^2-s)$. By the conditional isometry and conditional Fubini,
$$
E\Big[\Big(\int_s^tB_u\,dB_u\Big)^2\Big|\mathcal F_s\Big]=\int_s^tE[B_u^2\mid\mathcal F_s]\,du=\int_s^t\big(B_s^2+(u-s)\big)du=B_s^2(t-s)+\frac{(t-s)^2}{2},
$$
since $E[B_u^2\mid\mathcal F_s]=B_s^2+2B_sE[B_u-B_s]+E[(B_u-B_s)^2]=B_s^2+(u-s)$.

(b) $I_t=I_s+Z$ with $Z=\int_s^tB\,dB$, and $E[I_sZ\mid\mathcal F_s]=I_sE[Z\mid\mathcal F_s]=0$. So
$$
E[I_t^2\mid\mathcal F_s]=I_s^2+B_s^2(t-s)+\frac{(t-s)^2}2=\frac14(B_s^2-s)^2+B_s^2(t-s)+\frac{(t-s)^2}2 .
$$
Check: taking expectations gives $\frac14\cdot2s^2+s(t-s)+\frac{(t-s)^2}2=\frac{t^2}2=E[I_t^2]$. (Consistent.)

(c) $B_s^2$ is $\mathcal F_s$-measurable and nonnegative, so by (a),
$$
E[B_s^2Z^2]=E\big[B_s^2E[Z^2\mid\mathcal F_s]\big]=E\Big[B_s^4(t-s)+B_s^2\frac{(t-s)^2}{2}\Big]=3s^2(t-s)+\frac{s(t-s)^2}{2}.
$$
For $v\le s$: $E[ZB_v]=E[B_vE[Z\mid\mathcal F_s]]=0=E[Z]E[B_v]$, so they are uncorrelated. But $E[Z^2]=\int_s^tu\,du=\frac{t^2-s^2}2$, so
$$
E[Z^2]E[B_s^2]=\frac{s(t^2-s^2)}{2}=\frac{s(t-s)(t+s)}2\ne3s^2(t-s)+\frac{s(t-s)^2}2=\frac{s(t-s)(5s+t)}{2}
$$
for $0<s<t$ (since $t+s\ne5s+t$). Hence $Z^2$ and $B_s^2$ are correlated, and $Z$ is **not** independent of $\mathcal F_s$. (Compare Exercise 2(c): for deterministic integrands it would be.)

**Common pitfalls.** Treating $E[(\int_s^tB\,dB)^2\mid\mathcal F_s]$ as the constant $\frac{t^2-s^2}{2}$. Thinking "mean zero given $\mathcal F_s$" means "independent of $\mathcal F_s$".

### Exercise 10 (★★, 20 min): the Brownian bridge (Baldi Ex. 7.11 a)

For $0\le t<1$ let $Y_t=(1-t)\int_0^t\frac{dB_s}{1-s}$. Show that $Y$ is a centered Gaussian process with $E[Y_sY_t]=s(1-t)$ for $s\le t$, and that $Y_t\to0$ in $L^2$ as $t\to1$.

**Full solution.** For each $t<1$, $s\mapsto(1-s)^{-1}$ is bounded on $[0,t]$, hence in $L^2([0,t])$, and $J_t=\int_0^t\frac{dB_s}{1-s}$ is a centered Gaussian process (Prop 5.19). $Y_t=(1-t)J_t$ is a deterministic rescaling, so $Y$ is also a centered Gaussian process. For $s\le t<1$,
$$
E[Y_sY_t]=(1-s)(1-t)E[J_sJ_t]=(1-s)(1-t)\int_0^s\frac{du}{(1-u)^2}=(1-s)(1-t)\Big(\frac1{1-s}-1\Big)=s(1-t).
$$
This is the covariance of the Brownian bridge. In particular $E[Y_t^2]=t(1-t)\to0$ as $t\to1$, so $Y_t\to0$ in $L^2$.

**Common pitfalls.** Trying to integrate up to $t=1$: $(1-s)^{-1}\notin L^2([0,1])$ (Exercise 8(a)). $Y$ is not a martingale (it has the deterministic factor $(1-t)$).

### Exercise 11 (★★, 25 min): Ornstein–Uhlenbeck versus a martingale (Baldi Ex. 7.12)

Let $\lambda>0$, $Y_t=\int_0^te^{-\lambda(t-s)}dB_s$, $Z_t=\int_0^te^{-\lambda s}dB_s$.
(a) Show that $Y_t$ and $Z_t$ have the same law. (b) Is $Z$ a martingale? Is $Y$? (c) Show that $Z_t$ converges a.s. and in $L^2$ as $t\to\infty$. (d) Show that $E[(Y_{t+h}-Y_t)^2]\to\frac1\lambda(1-e^{-\lambda h})$ as $t\to\infty$, so $Y$ does not converge in $L^2$.

**Full solution.**
(a) For fixed $t$, $Y_t=e^{-\lambda t}\int_0^te^{\lambda s}dB_s$ is centered Gaussian with variance $\int_0^te^{-2\lambda(t-s)}ds=\frac1{2\lambda}(1-e^{-2\lambda t})$. $Z_t$ is centered Gaussian with variance $\int_0^te^{-2\lambda s}ds=\frac1{2\lambda}(1-e^{-2\lambda t})$. Same law.
(b) $Z$ is the integral of a deterministic $M^2$ integrand, hence a martingale (Thm 5.16). For $Y$, with $s<t$:
$$
E[Y_t\mid\mathcal F_s]=e^{-\lambda t}E\Big[\int_0^te^{\lambda u}dB_u\,\Big|\,\mathcal F_s\Big]=e^{-\lambda t}\int_0^se^{\lambda u}dB_u=e^{-\lambda(t-s)}Y_s\ne Y_s .
$$
So $Y$ is not a martingale. (Note: the integrand $e^{-\lambda(t-s)}$ depends on the upper limit $t$, so $Y$ is not of the form $\int_0^tX_s\,dB_s$.)
(c) $\sup_tE[Z_t^2]=\frac1{2\lambda}<\infty$. So $Z$ is an $L^2$-bounded martingale and converges a.s. and in $L^2$ (Thm 4.19 and a.s. convergence).
(d) $E[Y_tY_{t+h}]=e^{-\lambda(2t+h)}\int_0^te^{2\lambda s}ds=\frac1{2\lambda}(e^{-\lambda h}-e^{-\lambda(2t+h)})$. Hence
$$
E[(Y_{t+h}-Y_t)^2]=\frac1{2\lambda}\big(1-e^{-2\lambda(t+h)}+1-e^{-2\lambda t}-2e^{-\lambda h}+2e^{-\lambda(2t+h)}\big)\xrightarrow[t\to\infty]{}\frac1\lambda(1-e^{-\lambda h})>0 .
$$
So $Y$ is not Cauchy in $L^2$. It converges only in law, to $N(0,\frac1{2\lambda})$.

**Common pitfalls.** Concluding "same one-dimensional laws, so same process properties". $Y$ and $Z$ have different covariance structures.

### Exercise 12 (★★★, 30 min): $\int_0^tB_s^2\,dB_s$ from Riemann sums

Show that $\int_0^tB_s^2\,dB_s=\frac13B_t^3-\int_0^tB_s\,ds$.

**Strategy.** Prop 5.28 again. Use $b^3-a^3=3a^2(b-a)+3a(b-a)^2+(b-a)^3$. Show that $\sum B_{t_i}(\Delta B_i)^2\to\int_0^tB_s\,ds$ (orthogonal martingale-difference terms) and $\sum(\Delta B_i)^3\to0$ in $L^1$.

**Full solution.** With $a=B_{t_i}$, $b=B_{t_{i+1}}$ we get $a^2(b-a)=\frac13(b^3-a^3)-a(b-a)^2-\frac13(b-a)^3$. Summing,
$$
\sum_iB_{t_i}^2\Delta B_i=\frac13B_t^3-\sum_iB_{t_i}(\Delta B_i)^2-\frac13\sum_i(\Delta B_i)^3 .
$$
*Middle term.* $\sum_iB_{t_i}(\Delta B_i)^2=\sum_iB_{t_i}\Delta_i+\sum_iD_i$ with $D_i=B_{t_i}((\Delta B_i)^2-\Delta_i)$.
- $\sum_iB_{t_i}\Delta_i\to\int_0^tB_s\,ds$ for every path (Riemann sums of a continuous function).
- $E[D_i\mid\mathcal F_{t_i}]=B_{t_i}E[(\Delta B_i)^2-\Delta_i]=0$. So for $i<j$, $E[D_iD_j]=E[D_iE[D_j\mid\mathcal F_{t_j}]]=0$. And $E[D_i^2]=E[B_{t_i}^2]\operatorname{Var}((\Delta B_i)^2)=t_i\cdot2\Delta_i^2$. Hence $E[(\sum_iD_i)^2]=\sum_i2t_i\Delta_i^2\le2t^2|\pi_n|\to0$.

*Last term.* $E|\sum_i(\Delta B_i)^3|\le\sum_iE|\Delta B_i|^3=2\sqrt{2/\pi}\sum_i\Delta_i^{3/2}\le2\sqrt{2/\pi}\,|\pi_n|^{1/2}t\to0$.

Hence the left-endpoint sums converge in probability to $\frac13B_t^3-\int_0^tB_s\,ds$. Since $B^2$ is continuous and adapted, Prop 5.28 identifies this limit with $\int_0^tB^2\,dB$. (This agrees with Itô's formula from Ch. 6: $d(B^3)=3B^2dB+3B\,dt$.)

**Common pitfalls.** Treating $\sum B_{t_i}(\Delta B_i)^2$ as negligible: it converges to $\int B\,ds$, just as $\sum(\Delta B)^2\to t$. Forgetting the integrability or orthogonality check for the $D_i$.

### Exercise 13 (★★, 20 min): Wald identities via stopped integrals

Let $a,b>0$ and $\tau=\inf\{t:B_t\notin(-a,b)\}$. Using Prop 5.22, show that $E[\tau]<\infty$, $P(B_\tau=b)=\frac a{a+b}$, and $E[\tau]=ab$.

**Strategy.** Apply Prop 5.22 with $X\equiv1$ (so $\int_0^\sigma1\,dB=B_\sigma$) to the bounded stopping time $\tau\wedge n$, then let $n\to\infty$.

**Full solution.** $X\equiv1\in M^2([0,n])$, and $\tau\wedge n\le n$ is a stopping time. Prop 5.22 gives
$$
E[B_{\tau\wedge n}]=0,\qquad E[B_{\tau\wedge n}^2]=E\Big[\int_0^{\tau\wedge n}1\,dt\Big]=E[\tau\wedge n].
$$
Since $|B_{\tau\wedge n}|\le a\vee b$, we get $E[\tau\wedge n]\le(a\vee b)^2$. By monotone convergence $E[\tau]\le(a\vee b)^2<\infty$, so $\tau<\infty$ a.s. Then $B_{\tau\wedge n}\to B_\tau\in\{-a,b\}$ a.s., boundedly, so by dominated convergence $E[B_\tau]=0$ and $E[B_\tau^2]=E[\tau]$. With $p=P(B_\tau=b)$: $pb-(1-p)a=0$, so $p=\frac a{a+b}$, and
$$
E[\tau]=E[B_\tau^2]=b^2\frac a{a+b}+a^2\frac b{a+b}=ab .
$$

**Common pitfalls.** Applying Prop 5.22 directly to the unbounded $\tau$. Not justifying the limits (monotone convergence on one side, dominated convergence on the other).

### Exercise 14 (★★, 20 min): local martingales, short questions

(a) Show that a bounded local martingale is a martingale.
(b) Show that a nonnegative continuous local martingale $M$ with $M_0=0$ is identically $0$. Deduce: if $X\in M^2_{loc}$ and $\int_0^tX\,dB\ge0$ for all $t$, then $X=0$ $dt\otimes P$-a.e.
(c) Show that a nonnegative local martingale with $E[M_t]=E[M_0]$ for all $t$ is a martingale.
(d) Show that $M=\mathbf 1_{[0,T)}$ satisfies the naive "$[0,T]$-definition" ($\tau_n\uparrow T$, $M^{\tau_n}$ a martingale) but is not a local martingale.

**Full solution.**
(a) Let $|M_t|\le C$ and let $(\tau_n)$ reduce $M$. For $s\le t$: $E[M_{t\wedge\tau_n}\mid\mathcal F_s]=M_{s\wedge\tau_n}$. As $n\to\infty$, $M_{t\wedge\tau_n}\to M_t$ and $M_{s\wedge\tau_n}\to M_s$ a.s., with $|M_{t\wedge\tau_n}|\le C$. Conditional dominated convergence gives $E[M_t\mid\mathcal F_s]=M_s$. Integrability is clear.
(b) By Prop 5.33, $M$ is a supermartingale, so $0\le E[M_t]\le E[M_0]=0$. Hence $M_t=0$ a.s. for each $t$, and by continuity (taking rational $t$) $M\equiv0$ up to indistinguishability. For the deduction: $I=\int_0^\cdot X\,dB$ is a nonnegative continuous local martingale with $I_0=0$, so $I\equiv0$. By Prop 5.36, $I^2-\int_0^\cdot X^2=-\int_0^\cdot X^2$ is a continuous local martingale. With $\tau_n$ reducing it, $E[\int_0^{t\wedge\tau_n}X_s^2ds]=0$, so $\int_0^{t\wedge\tau_n}X^2=0$ a.s. Letting $n\to\infty$ gives $\int_0^tX^2=0$ a.s.
(c) By Prop 5.33, $D:=M_s-E[M_t\mid\mathcal F_s]\ge0$ and $E[D]=E[M_s]-E[M_t]=0$, so $D=0$ a.s.
(d) With $\tau_n=T-\frac1n$ (deterministic, hence stopping times), $M_{t\wedge\tau_n}=1$ for all $t$, which is a martingale, and $\tau_n\uparrow T$. But $P(\tau_n=T)=0\not\to1$. Under the extension $M_t=M_T=0$ for $t\ge T$, suppose $(\sigma_n)$ reduces $M$ with $\sigma_n\uparrow\infty$. Then $1=E[M_0]=E[M_{T\wedge\sigma_n}]=P(\sigma_n<T)$ for every $n$, contradicting $\sigma_n\uparrow\infty$ a.s. So $M$ is not a local martingale.

**Common pitfalls.** In (a), using unconditional dominated convergence only. In (d), forgetting condition (i') $P(\tau_n=T)\to1$.

### Exercise 15 (★★★, 25 min): when is the integral square integrable? (Baldi Ex. 7.14)

Let $X\in M^2_{loc}([0,T])$, $M_t=\int_0^tX_s\,dB_s$ and $\tau_n=\inf\{t:\int_0^tX_s^2ds>n\}\wedge T$.
(a) Show that $E[\int_0^{\tau_n}X_s^2ds]\le E[\sup_{0\le t\le T}M_t^2]$.
(b) Deduce that $X\in M^2([0,T])$ iff $E[\sup_{0\le t\le T}M_t^2]<\infty$.

**Full solution.**
(a) $X\mathbf 1_{\{s<\tau_n\}}\in M^2([0,T])$ (its energy is at most $n$). By Thm 5.21 and the localization (as in the proof of Prop 5.36), $M_{\tau_n}=\int_0^TX_s\mathbf 1_{\{s<\tau_n\}}dB_s$. So by the isometry,
$$
E\Big[\int_0^{\tau_n}X_s^2ds\Big]=E\Big[\int_0^TX_s^2\mathbf 1_{\{s<\tau_n\}}ds\Big]=E[M_{\tau_n}^2]\le E\Big[\sup_{0\le t\le T}M_t^2\Big].
$$
(b) "$\Leftarrow$": $\tau_n\uparrow T$ and $\int_0^{\tau_n}X^2\uparrow\int_0^TX^2$. By monotone convergence and (a), $E\int_0^TX^2\le E[\sup_tM_t^2]<\infty$. "$\Rightarrow$": by Doob's $L^2$ inequality (Prop 5.17), $E[\sup_tM_t^2]\le4E\int_0^TX^2<\infty$.

Application: for $X_t=e^{B_t^2}$ and $T>\frac14$, $X\notin M^2([0,T])$ (Exercise 7), so $E[\sup_{t\le T}I_t^2]=\infty$.

**Common pitfalls.** Believing "$M_T\in L^2$ implies $X\in M^2$". This is false (Baldi Ex. 8.21). The condition involves the supremum.

### Exercise 16 (★★★, 15 min): a sufficient condition for a true martingale (Baldi Ex. 7.15)

Let $M$ be a local martingale such that for every $t$ the family $\{M_{t\wedge\tau}:\tau\text{ stopping time}\}$ is uniformly integrable. Show that $M$ is a martingale.

**Full solution.** Let $(\tau_n)$ reduce $M$. For $s\le t$, $E[M_{t\wedge\tau_n}\mid\mathcal F_s]=M_{s\wedge\tau_n}$. As $\tau_n\uparrow\infty$, $M_{t\wedge\tau_n}\to M_t$ and $M_{s\wedge\tau_n}\to M_s$ a.s. The family $(M_{t\wedge\tau_n})_n$ is UI by hypothesis, so the a.s. convergence upgrades to $L^1$ convergence (Vitali). In particular $M_t\in L^1$. Since conditional expectation is an $L^1$ contraction, $E[M_{t\wedge\tau_n}\mid\mathcal F_s]\to E[M_t\mid\mathcal F_s]$ in $L^1$. The left side equals $M_{s\wedge\tau_n}\to M_s$, so $E[M_t\mid\mathcal F_s]=M_s$.

**Common pitfalls.** Using only UI of $(M_t)_{t\ge0}$, which is not sufficient (Remark 5.34).

### Exercise 17 (★★, 25 min): integration against a Gaussian martingale (general integrator)

Let $\sigma\in L^2([0,T])$ be deterministic, $M_t=\int_0^t\sigma(s)\,dB_s$, and $S(t)=\int_0^t\sigma(s)^2ds$.
(a) Show that $M$ is a continuous $L^2$ martingale with $\langle M\rangle_t=S(t)$.
(b) For the simple integrand $\varphi=M_1\mathbf 1_{[1,2)}$ ($T\ge2$), compute $\int_0^T\varphi\,dM$ and check the isometry directly.
(c) Show that $M\in M^2_M([0,T])$ and compute $E[(\int_0^TM_t\,dM_t)^2]$ and $E[(\int_s^tM_u\,dM_u)^2\mid\mathcal F_s]$.

**Full solution.**
(a) Thm 5.16: $M$ is a continuous square integrable martingale, and $M_t^2-\int_0^t\sigma^2$ is a martingale. $S$ is continuous, increasing, deterministic (hence adapted) and $S(0)=0$, so $\langle M\rangle=S$.
(b) $\varphi$ is simple: $\phi=M_1$ is $\mathcal F_1$-measurable and in $L^2$, and $\langle M\rangle$ is deterministic. So $\int_0^T\varphi\,dM=M_1(M_2-M_1)$. $M_2-M_1=\int_1^2\sigma\,dB$ is independent of $\mathcal F_1$ (Exercise 2(c)), so
$$
E[(M_1(M_2-M_1))^2]=E[M_1^2]E[(M_2-M_1)^2]=S(1)(S(2)-S(1)),
$$
and $E\int_0^T\varphi^2\,d\langle M\rangle=E[M_1^2](S(2)-S(1))=S(1)(S(2)-S(1))$. (Consistent.)
(c) $M$ is continuous and adapted, hence progressive, and
$$
E\int_0^TM_t^2\,d\langle M\rangle_t=\int_0^TS(t)\sigma(t)^2dt=\int_0^TS(t)\,S'(t)\,dt=\frac{S(T)^2}{2}<\infty .
$$
So $M\in M^2_M([0,T])$, and by the isometry of Section 4.15, $E[(\int_0^TM\,dM)^2]=\frac12S(T)^2$. For the conditional version, $E[M_u^2\mid\mathcal F_s]=M_s^2+S(u)-S(s)$ for $u\ge s$, so
$$
E\Big[\Big(\int_s^tM_u\,dM_u\Big)^2\Big|\mathcal F_s\Big]=\int_s^t\big(M_s^2+S(u)-S(s)\big)\sigma(u)^2du=M_s^2\big(S(t)-S(s)\big)+\frac{(S(t)-S(s))^2}{2}.
$$
With $\sigma\equiv1$ ($M=B$) this reduces to Exercise 9(a). (Consistent.)

**Common pitfalls.** Using $dt$ instead of $d\langle M\rangle_t=\sigma(t)^2dt$.

### Exercise 18 (★★, 20 min): long-time behaviour (Baldi Ex. 7.10)

(a) Let $f\in L^2(\mathbb R_+)$. Show that $\lim_{t\to\infty}\int_0^tf\,dB$ exists a.s. and in $L^2$.
(b) Let $g$ be deterministic with $\int_0^Tg^2<\infty$ for all $T$, and $Y_t=\exp(\int_0^tg\,dB-\frac12\int_0^tg^2)$. Compute $E[Y_t^2]$. Show that $Y$ is UI if $g\in L^2(\mathbb R_+)$. If $\int_0^\infty g^2=\infty$, compute $E[Y_t^\alpha]$ for $0<\alpha<1$ and show that $Y_t\to0$ a.s., so $Y$ is not UI.

**Full solution.**
(a) $X_t=\int_0^tf\,dB$ is a martingale with $E[X_t^2]=\int_0^tf^2\le\|f\|_2^2$. It is bounded in $L^2$, hence converges a.s. and in $L^2$ (Thm 4.19).
(b) $Y$ is a martingale (Exercise 2(d)). With $\sigma_t^2=\int_0^tg^2$, $E[Y_t^2]=E[e^{2\int_0^tg\,dB}]e^{-\sigma_t^2}=e^{2\sigma_t^2-\sigma_t^2}=e^{\sigma_t^2}$. If $g\in L^2(\mathbb R_+)$, then $\sup_tE[Y_t^2]\le e^{\|g\|_2^2}$, so $Y$ is bounded in $L^2$, hence UI. If $\sigma_t^2\to\infty$:
$$
E[Y_t^\alpha]=E\big[e^{\alpha\int_0^tg\,dB}\big]e^{-\frac\alpha2\sigma_t^2}=e^{\frac12\alpha^2\sigma_t^2-\frac12\alpha\sigma_t^2}=e^{\frac12\alpha(\alpha-1)\sigma_t^2}\to0 .
$$
$Y$ is a nonnegative martingale, so $Y_\infty=\lim Y_t$ exists a.s. (Thm 4.12). By Fatou, $E[Y_\infty^\alpha]\le\liminf E[Y_t^\alpha]=0$, hence $Y_\infty=0$ a.s. If $Y$ were UI, then $Y_t\to Y_\infty$ in $L^1$ and $E[Y_\infty]=1$. Contradiction.

### Exercise 19 (★, 10 min): random factors and adaptedness

(a) Compute $\int_1^2B_1\,dB_s$, its mean and its variance. (b) Explain why $\int_0^2B_1\,dB_s$ is not an Itô integral, and why the formal answer $B_1B_2$ would violate the mean-zero property.

**Full solution.** (a) By Thm 5.30 with $Z=B_1\in\mathcal F_1$ and $X\equiv1$ (or directly: an elementary process with one step), $\int_1^2B_1\,dB_s=B_1(B_2-B_1)$. Its mean is $E[B_1]E[B_2-B_1]=0$, and its second moment is $E[B_1^2]E[(B_2-B_1)^2]=1=E\int_1^2B_1^2ds$. (Consistent.) (b) For $s<1$, $B_1$ is not $\mathcal F_s$-measurable, so the integrand is not adapted (Thm 5.30 requires $Z\in\mathcal F_a$ with $a=0$). The formal value $B_1(B_2-B_0)=B_1B_2$ has mean $E[B_1B_2]=1\ne0$.

### Exercise 20 (★★, 15 min): orthogonality (Baldi Ex. 7.8, Example 5.11)

(a) Compute $E[\int_0^2B\,dB\int_1^3B\,dB]$. (b) Show that $\int_0^tB_u^2\,du$ is orthogonal in $L^2$ to $\int_0^sf\,dB$ for every $s>0$ and $f\in L^2([0,s])$.

**Full solution.** (a) Extend by zero to $[0,3]$: $\int_1^2E[B_s^2]ds=\int_1^2s\,ds=\frac32$.
(b) For $f=\mathbf 1_{[0,r]}$, $\int_0^sf\,dB=B_r$, and $E[B_rB_u^2]=0$ because $(B_r,B_u)\stackrel{d}{=}(-B_r,-B_u)$ (symmetry of BM). By Fubini, $E[B_r\int_0^tB_u^2du]=0$. By linearity this holds for step functions $f$ (whose integrals are linear combinations of $B_r$'s). For general $f$, take step functions $f_n\to f$ in $L^2$. Then $\int f_n\,dB\to\int f\,dB$ in $L^2$, and the inner product with the fixed $L^2$ variable $\int_0^tB_u^2du$ is continuous.

## 6. Predicted exam questions (ranked)

1. **State and prove the Itô isometry (Thm 5.9), including the conditional version.** Outline: Lemma 5.6 for elementary processes (cross terms by conditioning on $\mathcal F_{t_j}$, diagonal by independence), density (Lemma 5.7), $L^2$-continuity of $E[\cdot\mid\mathcal F_a]$, $L^1$ convergence of the squares by Cauchy–Schwarz.
2. **Construct the stochastic integral on $M^2$** (Def 5.4–5.8 plus Lemma 5.6/5.7), possibly **for a general continuous $L^2$ martingale $M$** (Section 4.15). Outline: simple integrals as Riemann sums; isometry with $d\langle M\rangle$ via $E[\Delta M^2\mid\mathcal F]=E[\Delta\langle M\rangle\mid\mathcal F]$; Cauchy, so a limit exists; independent of the sequence; isometry passes to the limit.
3. **Prove that $I_t=\int_0^tX\,dB$ is a square integrable martingale with a continuous version and $\langle I\rangle_t=\int_0^tX^2$ (Thm 5.16).** Outline: conditional mean $0$ on $[s,t]$; expand $I_t^2$; Doob plus Borel–Cantelli for continuity.
4. **Computational: an isometry exercise** such as $E[(\int_0^T\int_0^ts\,dB_s\,dB_t)^2]=T^4/12$, conditional moments, products over overlapping intervals. Outline: check $M^2$, then isometry, Fubini, Gaussian moments.
5. **Prove that a nonnegative local martingale is a supermartingale (Prop 5.33).** Outline: Fatou for integrability, conditional Fatou for the inequality.
6. **Prove Prop 5.28 (Riemann sums) and compute $\int_0^tB\,dB$.** Outline: elementary $X_n$, uniform continuity, Prop 5.27; then the identity $a(b-a)=\frac12(b^2-a^2)-\frac12(b-a)^2$ and $\sum(\Delta B)^2\to t$.
7. **Prove Lemma 5.26 and Prop 5.27.** Outline: stop at the energy level $\delta$, locality, Chebyshev; then choose $\delta$, then $n_0$.
8. **Show that $\int_0^tf\,dB$ (deterministic $f$) is Gaussian, find its covariance, and show that $\exp(\int f\,dB-\frac12\int f^2)$ is a martingale.** Outline: step functions, $L^2$ limits of Gaussian vectors, product formula, independence of increments.
9. **Prove Prop 5.36: $\langle\int X\,dB\rangle=\int X^2$ for $X\in M^2_{loc}$.** Outline: $\tau_n$ energy times, $I^{\tau_n}=\int X\mathbf 1_{\{s<\tau_n\}}dB$, Thm 5.16, uniqueness.
10. **Define $M^2_{loc}$ and the extended integral (Def 5.24); define a local martingale; explain the $[0,T]$ subtlety.** Outline: $\tau_n$, eventual constancy via locality; condition (i') $P(\tau_n=T)\to1$; counterexample $\mathbf 1_{[0,T)}$.
11. **Is $X\in M^2$ or only $M^2_{loc}$?** For example $e^{B_t^2}$: in $M^2([0,T])$ iff $T\le1/4$, always in $M^2_{loc}$. Outline: $E[e^{\lambda Z^2}]$.
12. **Midpoint or right-endpoint sums.** Outline: the limits are $\frac12B_t^2$ and $\frac12B_t^2+\frac t2$; the decomposition of Exercise 4.
13. **State locality (Thm 5.14), integration up to a stopping time (Thm 5.21), the random factor result (Thm 5.30), and the maximal estimates (Prop 5.17).** Statement-only questions. Know all hypotheses.
14. **Short conceptual questions:** Why must integrands be progressive? Why is $\int B\,dB\ne\frac12B^2$? Is every local martingale a martingale? (No: a counterexample needs Ch. 6–8, e.g. Baldi Ex. 8.10. A bounded or nonnegative-with-constant-mean one is a martingale.) Why does a nonzero stochastic integral have infinite variation?

## 7. Flashcards

1. $M^2([a,b])$? → Progressive $X$ with $E\int_a^bX_s^2ds<\infty$.
2. $M^2_{loc}([a,b])$? → Progressive $X$ with $\int_a^bX_s^2ds<\infty$ a.s.
3. When are two integrands equal? → $dt\otimes P$-a.e., i.e. $\int_a^b|X-Y|\,ds=0$ a.s.
4. Elementary integral? → $\sum_i\xi_i(B_{t_{i+1}}-B_{t_i})$ with $\xi_i\in\mathcal F_{t_i}$ (left endpoint).
5. Lemma 5.6 conditional isometry? → $E[(\int_a^bX\,dB)^2\mid\mathcal F_a]=E[\int_a^bX^2dt\mid\mathcal F_a]$, and conditional mean $0$.
6. Why do the cross terms vanish? → For $i<j$, condition on $\mathcal F_{t_j}$: $E[\Delta B_j\mid\mathcal F_{t_j}]=0$.
7. Product formula? → $E[\int_a^bX\,dB\int_c^dY\,dB]=\int_{[a,b]\cap[c,d]}E[X_sY_s]\,ds$.
8. $E[\int_0^2B\,dB\int_1^3B\,dB]$? → $\int_1^2s\,ds=3/2$.
9. $\int_0^tB\,dB$? → $\frac12(B_t^2-t)$.
10. Midpoint (Stratonovich) limit for $B$? → $\frac12B_t^2$. Right endpoint → $\frac12B_t^2+\frac t2$.
11. $\langle\int_0^\cdot X\,dB\rangle_t$? → $\int_0^tX_s^2ds$ (both for $M^2$ and $M^2_{loc}$).
12. Law of $\int_0^tf\,dB$, deterministic $f$? → $N(0,\int_0^tf^2)$. Covariance $E[I_sI_t]=\int_0^{s\wedge t}f^2$.
13. $E[e^{\int_0^tf\,dB}]$? → $e^{\frac12\int_0^tf^2}$.
14. Doob for stochastic integrals? → $E[\sup_{t\le T}|\int_0^tX\,dB|^2]\le4E\int_0^TX^2$.
15. Lemma 5.26? → $P(|\int X\,dB|>\varepsilon)\le P(\int X^2>\delta)+\delta/\varepsilon^2$.
16. Prop 5.28 mode of convergence? → In probability, for continuous adapted $X$ and deterministic partitions.
17. Locality hypothesis on $A$? → Any $A\in\mathcal F$ (not necessarily $\mathcal F_a$), with $X=Y$ on $A$ for all $t$.
18. Thm 5.21? → $\int_0^\tau X\,dB=\int_0^TX\mathbf 1_{\{s<\tau\}}dB$ for a stopping time $\tau\le T$.
19. Localizing times for $X\in M^2_{loc}$? → $\tau_n=\inf\{t:\int_0^tX^2>n\}$ ($\wedge T$).
20. Local martingale on $[0,T]$, correct condition? → $P(\tau_n=T)\to1$, not just $\tau_n\uparrow T$.
21. Nonnegative local martingale? → Supermartingale (Fatou). If its mean is constant, it is a true martingale.
22. Bounded local martingale? → A martingale (dominated convergence).
23. Is UI of $(M_t)_t$ enough for a local martingale to be a martingale? → No. UI of $\{M_{t\wedge\tau}\}_\tau$ for each $t$ is enough.
24. $e^{B_t^2}\in M^2([0,T])$? → Iff $T\le1/4$. It is always in $M^2_{loc}$.
25. $X\in M^2([0,T])$ iff? → $E[\sup_{t\le T}(\int_0^tX\,dB)^2]<\infty$ (Baldi 7.14).
26. Key identity for a general martingale integrator? → $E[(M_t-M_s)^2\mid\mathcal F_s]=E[\langle M\rangle_t-\langle M\rangle_s\mid\mathcal F_s]$.
27. Isometry for a general $M$? → $E[(\int_0^T\varphi\,dM)^2]=E\int_0^T\varphi^2\,d\langle M\rangle$.
28. A stochastic integral with finite variation paths? → It is $\equiv0$, i.e. $X=0$ $dt\otimes P$-a.e.
29. $\int_s^tX\,dB$ independent of $\mathcal F_s$? → Yes if $X$ is deterministic. In general it is only conditionally centered (e.g. $X=B$ fails).
30. $\int_a^bZX\,dB=Z\int_a^bX\,dB$ when? → $Z$ is $\mathcal F_a$-measurable.
