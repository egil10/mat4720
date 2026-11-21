# Stochastic Calculus (Itô's formula and its applications)

This chapter covers syllabus section **6. Stochastic Calculus**: everything in slides 6 except the section on the multidimensional stochastic integral (Definition 6.22 to Proposition 6.38 are **not** examinable). Sources: slides 6, the lecturer's handwritten notes for chapter 6 (pages 6.1 to 6.14), Baldi Chapter 8 (Sections 8.1 to 8.3 and 8.6) with its exercises, and Øksendal Chapter 4.

> **Numbering note.** The handwritten notes and the syllabus refer to some chapter 5 results by numbers that are one lower than in the printed slides 5. In this chapter: "uniform convergence in probability" is Theorem 5.28 in the notes; "left endpoint Riemann sums" is Proposition 5.28 in the syllabus (5.29 in the slides); "nonnegative local martingales are supermartingales" is Proposition 5.33 in the syllabus and notes (5.34 in the slides); "increasing process of a stochastic integral" is Proposition 5.36 in the syllabus (5.37 in the slides). When in doubt on the exam, cite the result by **name** as well as by number.

## 1. Exam relevance

| Item | Tag | Likelihood | Why |
|---|---|---|---|
| Definition 6.1 Itô process, Remark 6.2 uniqueness, Definition 6.3 brackets | definitions (included) | Very high | Needed in every computational question. "Show that X is an Itô process" was in the mandatory assignment. |
| Examples 6.4, 6.5 ($d(B_t^2)$, $d(tB_t)$) | included | High | The building blocks of the product rule proof. The proof of 6.4 is in the notes. |
| **Proposition 6.6 Product rule** | **S&P** (proof for elementary processes) | Very high | Short, clean proof; a natural "state and prove" question. |
| **Theorem 6.7 Itô's formula** | **S&P** (proof for $f(x,t)=\sum_i P_i(x)g_i(t)$) | Very high | The central theorem of the course. Expect "state Itô's formula and prove it for polynomials". |
| Examples 6.8 to 6.11, Remark 6.12 | included | Very high (as exercises) | Deterministic integrands, Brownian bridge, $tB_t-\int B$, heuristic rules. |
| **Proposition 6.13 Stochastic exponential** | **S&P** | Very high | Short proof (Itô + positive local martingale). Underlies Girsanov in chapter 7. |
| Remark 6.14 martingale criteria | included (S) | High | "Is the stochastic exponential a true martingale?" is a classic exam question. |
| **Proposition 6.15 Exponential bound** | **S&P** | High | Elegant half-page proof (exponential supermartingale + maximal inequality + optimise over $\theta$). |
| Proposition 6.16 exponential of several integrals | S | Medium | Used in the proof of Theorem 6.17. |
| Theorem 6.17 time change, Corollary 6.20 QV clock | **S** | Medium-high | Statement plus use in computations (deterministic integrands, LIL, hitting times). |
| Definition 6.18, Proposition 6.19 generalised inverse | S | Low-medium | Technical, but you should know the definition of $\tau(t)$. |
| **Proposition 6.21 Maximal $L^p$ estimate** | **S&P** (bounded case, no localisation) | High | Itô on $\lvert x\rvert^p$ + Doob + Hölder: a standard proof that graders like. |
| Multidimensional integral (6.22 to 6.38) | excluded | None | Explicitly excluded by the syllabus. (The multidimensional Itô formula may still be useful as a tool, but it will not be asked as theory.) |

**Bottom line.** The five proofs you must be able to write from memory are: product rule (6.6), Itô for polynomials (6.7), stochastic exponential (6.13), exponential bound (6.15), maximal $L^p$ estimate (6.21). And you must be fluent with Itô's formula in computations.

## 2. Core definitions and facts

### 2.1 Integrand spaces (recall from chapter 5)

Fix a filtered probability space $(\Omega,\mathcal F,(\mathcal F_t),P)$ with an $(\mathcal F_t)$-Brownian motion $B$.

- $M^p([a,b])$: progressively measurable processes $X$ with $E\left[\int_a^b |X_s|^p\,ds\right]<\infty$.
- $M^p_{loc}([a,b])$: progressively measurable processes $X$ with $\int_a^b |X_s|^p\,ds<\infty$ a.s.
- For $X\in M^2([0,T])$, $I_t=\int_0^t X_s\,dB_s$ is a continuous square integrable martingale with $E[I_t^2]=E\int_0^t X_s^2\,ds$ (Itô isometry).
- For $X\in M^2_{loc}([0,T])$, $I$ is a continuous **local** martingale with $\langle I\rangle_t=\int_0^t X_s^2\,ds$.
- A nonnegative local martingale is a supermartingale (Fatou). A bounded local martingale is a martingale.

### 2.2 Itô processes

**Definition 6.1 (Itô process, stochastic differential).** An adapted continuous process $X$ is an *Itô process* if for every $0\le t_1<t_2\le T$
$$
X_{t_2}-X_{t_1}=\int_{t_1}^{t_2}F_t\,dt+\int_{t_1}^{t_2}G_t\,dB_t,
$$
with $F\in M^1_{loc}([0,T])$ and $G\in M^2_{loc}([0,T])$. We write $dX_t=F_t\,dt+G_t\,dB_t$. $F$ is the *drift*, $G$ the *diffusion coefficient*.

- So $X=X_0+(\text{continuous finite-variation process})+(\text{continuous local martingale})$.
- The differential notation is **only shorthand** for the integral identity.

**Remark 6.2 (Uniqueness of the stochastic differential).** If $F_1\,dt+G_1\,dB=F_2\,dt+G_2\,dB$ then $F_1=F_2$ and $G_1=G_2$ $dt\otimes P$-a.e., i.e. a.s. $\int_0^T|F_1-F_2|\,dt=0$ and $\int_0^T|G_1-G_2|^2\,dt=0$.

*Why:* $\int_0^t (F_1-F_2)\,ds=-\int_0^t(G_1-G_2)\,dB_s$ is a continuous local martingale of finite variation, hence constant $=0$ (Theorem 4.37 after localisation); so its bracket $\int_0^t (G_1-G_2)^2ds=0$, and then $\int_0^t(F_1-F_2)ds=0$ for all $t$, so $F_1=F_2$ a.e.

> **Consequence used constantly:** an Itô process is a local martingale **iff** its drift is zero $dt\otimes P$-a.e. So "is $X$ a martingale?" is answered by computing $dX$ and looking at the $dt$-term.

**Definition 6.3 (Brackets of Itô processes).** For $dX=F\,dt+G\,dB$ and $dY=H\,dt+K\,dB$,
$$
\langle X\rangle_t=\int_0^t G_s^2\,ds,\qquad \langle X,Y\rangle_t=\int_0^t G_sK_s\,ds .
$$
These are the bracket/covariation of the local martingale parts; finite-variation parts contribute nothing. Polarisation: $\langle X,Y\rangle=\tfrac14(\langle X+Y\rangle-\langle X-Y\rangle)$.

### 2.3 Basic examples

**Example 6.4.** $d(B_t^2)=dt+2B_t\,dB_t$, i.e. $\int_{t_1}^{t_2}B_t\,dB_t=\tfrac12(B_{t_2}^2-B_{t_1}^2)-\tfrac12(t_2-t_1)$. The ordinary chain rule misses the $dt$.

**Example 6.5.** $d(tB_t)=B_t\,dt+t\,dB_t$, i.e. $t_2B_{t_2}-t_1B_{t_1}=\int_{t_1}^{t_2}B_t\,dt+\int_{t_1}^{t_2}t\,dB_t$.

**Example 6.8 (no explicit time).** If $f\in C^2(\mathbb R)$, $df(X_t)=f'(X_t)\,dX_t+\tfrac12 f''(X_t)\,d\langle X\rangle_t$. In particular $df(B_t)=f'(B_t)\,dB_t+\tfrac12 f''(B_t)\,dt$.

**Example 6.9 (deterministic integrand, integration by parts).** For $f\in C^1([0,T])$:
$$
\int_0^T f(s)\,dB_s=f(T)B_T-\int_0^T B_s f'(s)\,ds,\qquad d(f(t)B_t)=f'(t)B_t\,dt+f(t)\,dB_t .
$$

**Example 6.10 (Brownian bridge).** For $0\le t<1$, $Z_t=(1-t)\int_0^t\frac{dB_s}{1-s}$ satisfies
$$
dZ_t=-\frac{Z_t}{1-t}\,dt+dB_t,\qquad Z_0=0 .
$$

**Example 6.11.** $Y_t=tB_t-\int_0^tB_u\,du$ has $dY_t=t\,dB_t$, so $Y_t=\int_0^t s\,dB_s$, a centred square integrable martingale with $E[Y_t^2]=t^3/3$.

**Recognising martingales from the differential (slide 14).**

- Compute $dY$. If $dY_t=H_t\,dB_t$ (no drift) with $H\in M^2_{loc}$ and $Y_0\in L^1$, then $Y$ is a **local** martingale.
- If moreover $H\in M^2([0,T])$, $Y$ is a **martingale** on $[0,T]$ (square integrable if $Y_0\in L^2$).
- Then $\langle Y\rangle_t=\int_0^t H_s^2\,ds$.

**Remark 6.12 (heuristic multiplication table).**

| $\cdot$ | $dt$ | $dB_t$ |
|---|---|---|
| $dt$ | $0$ | $0$ |
| $dB_t$ | $0$ | $dt$ |

So $(dX_t)^2=G_t^2\,dt=d\langle X\rangle_t$ and $dX\,dY=G_tK_t\,dt=d\langle X,Y\rangle_t$. Itô's formula is "Taylor to second order with this table". Brownian increments are of size $\sqrt{dt}$, so the squared term survives at order $dt$. These are mnemonics, not proofs.

### 2.4 Exponential martingales

**Proposition 6.13** (see Section 3). For $X\in M^2_{loc}$, $\lambda\in\mathbb C$, $Y_t=\exp\left(\lambda\int_0^tX\,dB-\frac{\lambda^2}{2}\int_0^tX^2ds\right)$ solves $dY=\lambda XY\,dB$, $Y_0=1$, and is a local martingale; for real $\lambda$ it is a positive supermartingale with $E[Y_t]\le1$.

Notation: for $\lambda=1$ we write $\mathcal E(X)_t:=\exp\left(\int_0^tX_s\,dB_s-\frac12\int_0^tX_s^2\,ds\right)$ (the *stochastic exponential* or *Doléans-Dade exponential*).

**Remark 6.14 (criteria for a true martingale).** For real $\lambda$:

1. $Y$ is a martingale **iff** $E[Y_t]=1$ for every $t\in[0,T]$.
2. If $YX\in M^2([0,T])$, then $Y$ is a square integrable martingale.

*Proof of (1), worth knowing.* "Only if" is trivial. Conversely, $Y$ is a supermartingale, so for $s\le t$, $D:=Y_s-E[Y_t\mid\mathcal F_s]\ge0$ and $E[D]=E[Y_s]-E[Y_t]=1-1=0$. A nonnegative random variable with zero mean is $0$ a.s., so $E[Y_t\mid\mathcal F_s]=Y_s$.

*Proof of (2).* $Y_t=1+\lambda\int_0^tY_sX_s\,dB_s$ and the integrand is in $M^2$, so the integral is a square integrable martingale (Theorem 5.16).

Other sufficient conditions (useful in exercises, proved or stated in chapter 7): $X$ deterministic in $L^2([0,T])$ (then $\int X\,dB$ is Gaussian and $E[Y_t]=1$ directly by Remark 5.20); $X$ bounded (Exercise 15 below); Novikov's criterion $E[\exp(\frac12\int_0^TX_s^2ds)]<\infty$ (Theorem 7.6).

**Proposition 6.16 (exponentials of several integrals, S).** For $X_1,\dots,X_m\in M^2_{loc}([0,T])$, $\lambda_i\in\mathbb C$, $M_i(t)=\int_0^tX_i\,dB$, $C_{ij}(t)=\int_0^tX_iX_j\,ds$:
$$
Y_t=\exp\Big(\sum_{i=1}^m\lambda_iM_i(t)-\frac12\sum_{i,j=1}^m\lambda_i\lambda_jC_{ij}(t)\Big)
$$
is a local martingale with $Y_t=1+\sum_i\lambda_i\int_0^tY_sX_i(s)\,dB_s$. (This is Proposition 6.13 with $X=\sum_i\lambda_iX_i$ and $\lambda=1$.)

### 2.5 Time change

**Definition 6.18 (generalised inverse).** For $a:\mathbb R_+\to\mathbb R_+$ nondecreasing and right-continuous, $c(t)=\inf\{s\ge0:a(s)>t\}$ ($\inf\emptyset=\infty$).

**Proposition 6.19.** (a) $c$ is right-continuous. (b) If $t_0>0$ and $\lim_{t\uparrow t_0}c(t)=L<c(t_0)$, then $a(s)=t_0$ for all $s\in[L,c(t_0))$ (a jump of $c$ corresponds to a flat stretch of $a$).

**Interpretation.** $\int_0^tX\,dB$ runs along a Brownian path at the random clock $A_t=\int_0^tX_s^2\,ds$. Where the clock stops ($X=0$ a.e.), the integral is constant (Proposition 5.23), which is why $W$ stays continuous even though $\tau$ may jump. Path properties of Brownian motion (LIL, modulus of continuity, hitting times, reflection principle) transfer through the clock.

> **Special case to remember.** If $X=f$ is **deterministic** with $f\in L^2_{loc}$ and $A_t=\int_0^tf^2\to\infty$, then $\int_0^tf\,dB=W_{A(t)}$ for a Brownian motion $W$. If $f$ never vanishes, $A$ is a continuous strictly increasing bijection of $[0,\infty)$ and $\tau=A^{-1}$.

### 2.6 $L^p$ estimates

The isometry controls second moments. Itô's formula gives control of higher moments and running maxima, in terms of
$$
E\Big[\Big(\int_0^T|X_s|^2ds\Big)^{p/2}\Big]\quad\text{and}\quad E\Big[\int_0^T|X_s|^pds\Big].
$$
These are used for regularity of SDE solutions (chapter 8: a priori bounds, Theorem 8.10, and stability, Theorem 8.22).

Useful facts used in the proofs:

- **Doob's $L^p$ inequality** (Theorem 4.17/4.32): for a continuous martingale $M$ and $p>1$, $E[\sup_{t\le T}|M_t|^p]\le\left(\frac{p}{p-1}\right)^pE[|M_T|^p]$.
- **Maximal inequality for supermartingales** (Theorem 4.28): for a right-continuous supermartingale $Z$ and $\lambda>0$, $\lambda P(\sup_{0\le t\le T}Z_t\ge\lambda)\le E[Z_0]+E[Z_T^-]$.
- **Hölder**: $E[UV]\le (E|U|^r)^{1/r}(E|V|^{r'})^{1/r'}$ with $\frac1r+\frac1{r'}=1$.

## 3. Theorems: statements

**Proposition 6.6 (Product rule).** Let $X_1,X_2$ be Itô processes with $dX_i(t)=F_i(t)\,dt+G_i(t)\,dB_t$, $i=1,2$. Then
$$
d(X_1(t)X_2(t))=X_1(t)\,dX_2(t)+X_2(t)\,dX_1(t)+d\langle X_1,X_2\rangle_t ,\qquad d\langle X_1,X_2\rangle_t=G_1(t)G_2(t)\,dt .
$$
In integral form, for $0\le t_1<t_2\le T$:
$$
X_1(t_2)X_2(t_2)-X_1(t_1)X_2(t_1)=\int_{t_1}^{t_2}\big(X_1F_2+X_2F_1+G_1G_2\big)dt+\int_{t_1}^{t_2}\big(X_1G_2+X_2G_1\big)dB_t .
$$
If one of $G_1,G_2$ vanishes, the ordinary product rule holds.

**Theorem 6.7 (Itô's formula).** Let $X$ be an Itô process, $dX_t=F_t\,dt+G_t\,dB_t$, and let $f:\mathbb R\times\mathbb R_+\to\mathbb R$, $(x,t)\mapsto f(x,t)$, have continuous partial derivatives $f_t,f_x,f_{xx}$. Then $f(X_t,t)$ is an Itô process and
$$
\begin{aligned}
df(X_t,t)&=f_t(X_t,t)\,dt+f_x(X_t,t)\,dX_t+\tfrac12f_{xx}(X_t,t)\,G_t^2\,dt\\
&=\Big(f_t(X_t,t)+f_x(X_t,t)F_t+\tfrac12f_{xx}(X_t,t)G_t^2\Big)dt+f_x(X_t,t)G_t\,dB_t\\
&=f_t(X_t,t)\,dt+f_x(X_t,t)\,dX_t+\tfrac12f_{xx}(X_t,t)\,d\langle X\rangle_t .
\end{aligned}
$$

> **Pitfall (argument order).** The course writes $f(x,t)$ (space first, time second), following Baldi. Øksendal writes $g(t,x)$. Either is fine on the exam if you say which you use.

**Proposition 6.13 (Stochastic exponentials).** Let $X\in M^2_{loc}([0,T])$ and $\lambda\in\mathbb C$. Set
$$
Y_t=\exp\Big(\lambda\int_0^tX_s\,dB_s-\frac{\lambda^2}{2}\int_0^tX_s^2\,ds\Big).
$$
Then
$$
dY_t=\lambda X_tY_t\,dB_t,\qquad Y_t=1+\lambda\int_0^tY_sX_s\,dB_s ,
$$
so $Y$ is a local martingale (for complex $\lambda$: real and imaginary parts are local martingales). For real $\lambda$, $Y$ is positive, hence a supermartingale, and $E[Y_t]\le E[Y_0]=1$ for $0\le t\le T$.

**Proposition 6.15 (Exponential bound).** Let $X\in M^2([0,T])$ and suppose there is a **deterministic** constant $k>0$ with $\int_0^TX_s^2\,ds\le k$ a.s. Then for every $x>0$
$$
P\Big(\sup_{0\le t\le T}\Big|\int_0^tX_s\,dB_s\Big|\ge x\Big)\le 2\exp\Big(-\frac{x^2}{2k}\Big).
$$

**Theorem 6.17 (Brownian motion by a time change, S).** Let $X\in M^2_{loc}([0,\infty))$ with $\int_0^\infty X_s^2\,ds=\infty$ a.s. Set $A_u=\int_0^uX_s^2\,ds$ and $\tau(t)=\inf\{u\ge0:A_u>t\}$. Then
$$
W_t=\int_0^{\tau(t)}X_s\,dB_s
$$
is a (continuous) Brownian motion with respect to the time-changed filtration $(\mathcal F_{\tau(t)})_{t\ge0}$.

**Corollary 6.20 (Quadratic-variation clock, S).** Under the assumptions of Theorem 6.17, with $A_t=\int_0^tX_s^2ds$ and $W$ as there,
$$
\int_0^tX_s\,dB_s=W_{A_t},\qquad t\ge0,
$$
as continuous processes, up to indistinguishability.

**Proposition 6.21 (Maximal $L^p$ estimate).** Let $p\ge2$ and $X\in M^2_{loc}([0,T])$. There is a constant $c_p>0$ depending only on $p$ such that
$$
E\Big[\sup_{0\le t\le T}\Big|\int_0^tX_s\,dB_s\Big|^p\Big]\le c_p\,E\Big[\Big(\int_0^T|X_s|^2ds\Big)^{p/2}\Big]\le c_p\,T^{\frac{p-2}{2}}\,E\Big[\int_0^T|X_s|^pds\Big],
$$
in the extended sense if a right-hand side is infinite. One may take $c_p=\left(\frac{p(p-1)}{2}\left(\frac{p}{p-1}\right)^p\right)^{p/2}$ (and $c_2=4$).

## 4. Proofs

### 4.0 Two lemmas: Examples 6.4 and 6.5

These are the inputs for the product rule. Both use left-endpoint Riemann sums (Proposition 5.28 in the syllabus): for continuous $X\in M^2_{loc}$ and partitions $\pi_n$ of $[t_1,t_2]$ with $|\pi_n|\to0$, $\sum_kX_{t_{n,k}}(B_{t_{n,k+1}}-B_{t_{n,k}})\to\int_{t_1}^{t_2}X\,dB$ in probability.

**Proof of Example 6.4 (notes p. 6.1).** Let $\pi_n=\{t_1=t_{n,0}<\dots<t_{n,m_n}=t_2\}$ with $|\pi_n|\to0$. Using $a(b-a)=\tfrac12\big(b^2-a^2-(b-a)^2\big)$:
$$
\begin{aligned}
\int_{t_1}^{t_2}B_t\,dB_t&=P\text{-}\lim_n\sum_{k}B_{t_{n,k}}(B_{t_{n,k+1}}-B_{t_{n,k}})\\
&=\tfrac12P\text{-}\lim_n\sum_k\Big\{B_{t_{n,k+1}}^2-B_{t_{n,k}}^2-(B_{t_{n,k+1}}-B_{t_{n,k}})^2\Big\}\\
&=\tfrac12(B_{t_2}^2-B_{t_1}^2)-\tfrac12P\text{-}\lim_n\sum_k(B_{t_{n,k+1}}-B_{t_{n,k}})^2 .
\end{aligned}
$$
By Proposition 2.15 the last sum converges in $L^2$ (hence in probability) to $t_2-t_1$. So $\int_{t_1}^{t_2}B\,dB=\tfrac12(B_{t_2}^2-B_{t_1}^2)-\tfrac12(t_2-t_1)$, i.e. $d(B_t^2)=dt+2B_t\,dB_t$. $\square$

**Proof of Example 6.5.** With the same partitions,
$$
t_2B_{t_2}-t_1B_{t_1}=\sum_k\big(t_{k+1}B_{t_{k+1}}-t_kB_{t_k}\big)=\sum_kt_k(B_{t_{k+1}}-B_{t_k})+\sum_kB_{t_{k+1}}(t_{k+1}-t_k)
$$
(writing $t_k=t_{n,k}$; check: $t_k(B_{k+1}-B_k)+B_{k+1}(t_{k+1}-t_k)=t_{k+1}B_{k+1}-t_kB_k$). The first sum is a left-endpoint Riemann sum for the continuous integrand $t$, so it converges in probability to $\int_{t_1}^{t_2}t\,dB_t$. The second is a Riemann sum for the continuous function $t\mapsto B_t(\omega)$, so it converges pathwise to $\int_{t_1}^{t_2}B_t\,dt$. Hence $d(tB_t)=B_t\,dt+t\,dB_t$. $\square$

Trivially also $d(t^2)=2t\,dt$ and $d(t)=dt$.

### 4.1 Proposition 6.6 (Product rule), proof for elementary processes

**Proof roadmap.**

1. Step 1: Constant coefficients on an interval $[t_1,t_2]$ (random, $\mathcal F_{t_1}$-measurable): reduce to $Y_i=F_it+G_iB_t$.
2. Step 2: Expand $Y_1Y_2$ and use $d(t^2)=2t\,dt$, $d(tB_t)=B_t\,dt+t\,dB_t$, $d(B_t^2)=dt+2B_t\,dB_t$.
3. Step 3: Regroup terms into $Y_1\,dY_2+Y_2\,dY_1+G_1G_2\,dt$.
4. Step 4: Elementary processes are piecewise constant, so sum over the intervals.
5. (General case, not required: approximate by elementary processes, use uniform convergence in probability, pass to a.s. limits along subsequences.)

**Proof.** *Step 1 (constant coefficients).* Suppose that on $[t_1,t_2]$ we have $F_i(t)=F_i$, $G_i(t)=G_i$, where $F_i,G_i$ are $\mathcal F_{t_1}$-measurable random variables. Then for $t\in[t_1,t_2]$
$$
X_i(t)=X_i(t_1)+F_i(t-t_1)+G_i(B_t-B_{t_1})=c_i+Y_i(t),\qquad Y_i(t):=F_it+G_iB_t,
$$
where $c_i:=X_i(t_1)-F_it_1-G_iB_{t_1}$ is $\mathcal F_{t_1}$-measurable. Since $dY_i=F_i\,dt+G_i\,dB_t$ on $[t_1,t_2]$ (random $\mathcal F_{t_1}$-measurable factors can be taken outside the stochastic integral on $[t_1,t_2]$, Theorem 5.31),
$$
X_1X_2=c_1c_2+c_1Y_2+c_2Y_1+Y_1Y_2,
$$
and $d(c_1Y_2)=c_1\,dY_2$, $d(c_2Y_1)=c_2\,dY_1$. On the other side, $X_1\,dX_2+X_2\,dX_1=Y_1\,dY_2+Y_2\,dY_1+c_1\,dY_2+c_2\,dY_1$. So it suffices to prove
$$
d(Y_1Y_2)=Y_1\,dY_2+Y_2\,dY_1+G_1G_2\,dt\quad\text{on }[t_1,t_2].
$$

*Step 2 (expand).* Using linearity, Theorem 5.31 again, and the three differentials of Section 4.0:
$$
\begin{aligned}
d(Y_1Y_2)&=d\big((F_1t+G_1B_t)(F_2t+G_2B_t)\big)\\
&=F_1F_2\,d(t^2)+(F_1G_2+G_1F_2)\,d(tB_t)+G_1G_2\,d(B_t^2)\\
&=2F_1F_2t\,dt+(F_1G_2+G_1F_2)(B_t\,dt+t\,dB_t)+G_1G_2(dt+2B_t\,dB_t).
\end{aligned}
$$

*Step 3 (regroup).* Collect the terms:
$$
\begin{aligned}
d(Y_1Y_2)&=(F_1t+G_1B_t)F_2\,dt+(F_1t+G_1B_t)G_2\,dB_t\\
&\quad+(F_2t+G_2B_t)F_1\,dt+(F_2t+G_2B_t)G_1\,dB_t+G_1G_2\,dt\\
&=Y_1\,dY_2+Y_2\,dY_1+G_1G_2\,dt .
\end{aligned}
$$
(Check the $dt$ terms: $F_1F_2t+G_1F_2B+F_1F_2t+G_2F_1B+G_1G_2=2F_1F_2t+(F_1G_2+G_1F_2)B+G_1G_2$. The $dB$ terms: $F_1G_2t+G_1G_2B+F_2G_1t+G_1G_2B=(F_1G_2+F_2G_1)t+2G_1G_2B$. Both match Step 2.)

*Step 4 (elementary processes).* If $F_i,G_i$ are elementary, there is a partition $0=s_0<s_1<\dots<s_N=T$ such that on each $[s_j,s_{j+1})$ all four processes are constant with $\mathcal F_{s_j}$-measurable values. By Steps 1 to 3 the integral form of (6.1) holds on each $[s_j,s_{j+1}]$ (by continuity of all terms, including the right endpoint). For $t_1<t_2$, split $[t_1,t_2]$ at the partition points and add the identities: the left-hand sides telescope to $X_1(t_2)X_2(t_2)-X_1(t_1)X_2(t_1)$ and the right-hand sides add by additivity of the integrals. $\square$

*Remark (general case, from the notes, not required).* Choose elementary $F_{i,n}\to F_i$ in the sense $\int_0^T|F_{i,n}-F_i|\,dt\to0$ a.s. and $G_{i,n}\to G_i$ with $\int_0^T|G_{i,n}-G_i|^2dt\to0$ a.s.; set $X_{i,n}=X_i(0)+\int F_{i,n}+\int G_{i,n}\,dB$. By Theorem 5.28, $\sup_t|X_{i,n}-X_i|\to0$ in probability, hence a.s. along a subsequence. Then $\int X_{1,n}F_{2,n}\,dt\to\int X_1F_2\,dt$ (split as $(X_{1,n}-X_1)F_{2,n}+X_1(F_{2,n}-F_2)$), $\int G_{1,n}G_{2,n}dt\to\int G_1G_2dt$ (Cauchy-Schwarz), and $\int X_{1,n}G_{2,n}\,dB\to\int X_1G_2\,dB$ in probability by Proposition 5.27 since $\int|X_{1,n}G_{2,n}-X_1G_2|^2dt\to0$. Pass to the limit along a subsequence.

**What graders look for / pitfalls.**

- The coefficients on each interval are **random** but $\mathcal F_{t_k}$-measurable: say so, and cite "a $\mathcal F_a$-measurable factor can be taken out of $\int_a^b$" (Theorem 5.31). Treating them as deterministic constants without comment loses points.
- Do not forget the initial values $c_i$ (the notes silently set them to zero; a sentence handles them).
- Name where $d(B^2)$ and $d(tB)$ come from (Examples 6.4 and 6.5, Riemann sums + quadratic variation of BM).
- The covariation term is $G_1G_2\,dt$, not $F_1F_2\,dt$ or $(G_1+G_2)^2dt$.
- Differentials are shorthand for integral identities; at least once, write the integral form.

**Memorize-this skeleton.**

- On $[t_1,t_2]$ with $\mathcal F_{t_1}$-measurable constants: $X_i=c_i+F_it+G_iB_t$; constants are harmless.
- $(F_1t+G_1B)(F_2t+G_2B)=F_1F_2t^2+(F_1G_2+F_2G_1)tB+G_1G_2B^2$.
- Plug $d(t^2)=2t\,dt$, $d(tB)=B\,dt+t\,dB$, $d(B^2)=dt+2B\,dB$; regroup into $Y_1dY_2+Y_2dY_1+G_1G_2dt$.
- Elementary: sum over the partition intervals.

### 4.2 Theorem 6.7 (Itô's formula), proof for $f(x,t)=\sum_iP_i(x)g_i(t)$

The syllabus asks for the proof for functions that are polynomials in space and regular ($C^1$) in time. This is Steps 1 to 3 of the notes (p. 6.4 to 6.5).

**Proof roadmap.**

1. Step 1: $f(x)=x^n$ by induction on $n$, using the product rule with $X^n=X\cdot X^{n-1}$.
2. Step 2: by linearity, any polynomial $P(x)$; then $P(x)g(t)$ with $g\in C^1$ via the product rule (no bracket since $dg=g'\,dt$).
3. Step 3: by linearity, finite sums $\sum_iP_i(x)g_i(t)$.
4. (Step 4, not required: approximate a $C^{2,1}$ function by such sums uniformly on compacts with derivatives; pass to the limit using Proposition 5.27.)

**Proof.** Write the claim as
$$
df(X_t,t)=\Big(f_t+f_xF+\tfrac12f_{xx}G^2\Big)(X_t,t)\,dt+f_x(X_t,t)G_t\,dB_t. \qquad (\ast)
$$
Note that $(\ast)$ is **linear in $f$**: if it holds for $f$ and $h$, it holds for $\alpha f+\beta h$.

*Step 1: $f(x,t)=x^n$.* We show by induction that
$$
d(X_t^n)=nX_t^{n-1}\,dX_t+\tfrac12n(n-1)X_t^{n-2}G_t^2\,dt. \qquad (\ast\ast)
$$
For $n=1$ this is $dX=dX$. (For $n=0$ it is trivial.) Assume $(\ast\ast)$ for $n-1$, i.e. $X^{n-1}$ is an Itô process with
$$
d(X^{n-1})=\Big((n-1)X^{n-2}F+\tfrac12(n-1)(n-2)X^{n-3}G^2\Big)dt+(n-1)X^{n-2}G\,dB .
$$
Its diffusion coefficient is $(n-1)X^{n-2}G$, so $d\langle X,X^{n-1}\rangle=G\cdot(n-1)X^{n-2}G\,dt=(n-1)X^{n-2}G^2\,dt$. By the product rule (Proposition 6.6):
$$
\begin{aligned}
d(X^n)=d(X\cdot X^{n-1})&=X\,d(X^{n-1})+X^{n-1}\,dX+d\langle X,X^{n-1}\rangle\\
&=(n-1)X^{n-1}\,dX+\tfrac12(n-1)(n-2)X^{n-2}G^2\,dt+X^{n-1}\,dX+(n-1)X^{n-2}G^2\,dt\\
&=nX^{n-1}\,dX+(n-1)\Big(\tfrac{n-2}{2}+1\Big)X^{n-2}G^2\,dt\\
&=nX^{n-1}\,dX+\tfrac12n(n-1)X^{n-2}G^2\,dt .
\end{aligned}
$$
This is $(\ast)$ for $f(x,t)=x^n$ ($f_t=0$, $f_x=nx^{n-1}$, $f_{xx}=n(n-1)x^{n-2}$).

All integrands are admissible: $X$ is continuous, so $X^{n-1}F\in M^1_{loc}$, $X^{n-2}G^2\in M^1_{loc}$ and $X^{n-1}G\in M^2_{loc}$ (a continuous process is pathwise bounded on $[0,T]$).

*Step 2: $f(x,t)=P(x)g(t)$.* By Step 1 and linearity, $(\ast)$ holds for every polynomial $P$:
$$
dP(X_t)=\Big(P'(X_t)F_t+\tfrac12P''(X_t)G_t^2\Big)dt+P'(X_t)G_t\,dB_t .
$$
Let $g\in C^1(\mathbb R_+)$. Then $g(t)$ is an Itô process with $dg(t)=g'(t)\,dt$ and diffusion coefficient $0$, so $d\langle P(X),g\rangle=0$. By the product rule:
$$
\begin{aligned}
d\big(P(X_t)g(t)\big)&=g(t)\,dP(X_t)+P(X_t)g'(t)\,dt\\
&=\Big(P(X_t)g'(t)+P'(X_t)g(t)F_t+\tfrac12P''(X_t)g(t)G_t^2\Big)dt+P'(X_t)g(t)G_t\,dB_t ,
\end{aligned}
$$
which is $(\ast)$ for $f=Pg$, since $f_t=Pg'$, $f_x=P'g$, $f_{xx}=P''g$.

*Step 3: $f(x,t)=\sum_{i=1}^{\ell}P_i(x)g_i(t)$.* Follows from Step 2 by linearity of $(\ast)$. $\square$

*Step 4 (general $f\in C^{2,1}$, not required, from the notes).* There are $f_n$ of the form of Step 3 with $f_n\to f$, $\partial_tf_n\to f_t$, $\partial_xf_n\to f_x$, $\partial_{xx}f_n\to f_{xx}$ uniformly on compact subsets of $\mathbb R\times\mathbb R_+$ (Stone-Weierstrass type approximation). Write $(\ast)$ in integral form for $f_n$ on $[t_1,t_2]$. Since $t\mapsto X_t(\omega)$ is continuous, hence bounded on $[t_1,t_2]$, the $dt$-integrals converge a.s.; $\int|\partial_xf_n(X_t,t)-f_x(X_t,t)|^2G_t^2dt\to0$ a.s., so the stochastic integrals converge in probability (Proposition 5.27). Take a.s. limits along a subsequence.

**What graders look for / pitfalls.**

- State precisely the hypotheses: $f_t,f_x,f_{xx}$ **continuous**; $X$ an Itô process with $F\in M^1_{loc}$, $G\in M^2_{loc}$.
- In the induction you must compute the **bracket** $\langle X,X^{n-1}\rangle$ correctly from the diffusion coefficient of $X^{n-1}$, which requires the induction hypothesis (that is why we prove $(\ast\ast)$, not just "it is an Itô process").
- Explicitly note that $g(t)$ has zero diffusion coefficient, so no bracket term appears in Step 2.
- Say that the formula is linear in $f$ (Step 3).
- Mention that the new integrands are in $M^1_{loc}$, $M^2_{loc}$ (continuity of $X$).
- If asked for the full theorem, state it for general $C^{2,1}$ $f$ even if you only prove the polynomial case; then sketch Step 4 in two lines.

**Memorize-this skeleton.**

- $(\ast)$ is linear in $f$.
- $d(X^n)=d(X\cdot X^{n-1})$, induction: $X\,d(X^{n-1})+X^{n-1}dX+(n-1)X^{n-2}G^2dt=nX^{n-1}dX+\frac{n(n-1)}2X^{n-2}G^2dt$.
- $d(P(X)g)=g\,dP(X)+P(X)g'\,dt$ (no bracket).
- Sums by linearity. (General $f$: approximate, Proposition 5.27.)

### 4.3 Proposition 6.13 (Stochastic exponential)

**Proof roadmap.**

1. Step 1: Set $Z_t=\lambda\int_0^tX\,dB-\frac{\lambda^2}2\int_0^tX^2ds$, an Itô process with $dZ=-\frac{\lambda^2}{2}X^2dt+\lambda X\,dB$ and $d\langle Z\rangle=\lambda^2X^2dt$.
2. Step 2: Itô with $f(x)=e^x$: $dY=Y\,dZ+\frac12Y\,d\langle Z\rangle=\lambda XY\,dB$.
3. Step 3: Integral form with $Y_0=1$; $XY\in M^2_{loc}$, so $Y$ is a local martingale.
4. Step 4: Real $\lambda$: $Y>0$, positive local martingale is a supermartingale, so $E[Y_t]\le1$.

**Proof.** Let $X\in M^2_{loc}([0,T])$, $\lambda\in\mathbb C$, and
$$
Z_t=\lambda\int_0^tX_s\,dB_s-\frac{\lambda^2}{2}\int_0^tX_s^2\,ds,\qquad Y_t=e^{Z_t}.
$$
*Step 1.* $Z$ is an Itô process (complex-valued if $\lambda\notin\mathbb R$: real and imaginary parts are real Itô processes) with $dZ_t=-\frac{\lambda^2}2X_t^2\,dt+\lambda X_t\,dB_t$. Its "bracket" is $d\langle Z\rangle_t=\lambda^2X_t^2\,dt$ (for complex $\lambda$, apply the real Itô formula to real and imaginary parts, $e^{Z}=e^{\Re Z}(\cos\Im Z+i\sin\Im Z)$, or equivalently the two-dimensional Itô formula; the result is the same formal computation).

*Step 2.* Apply Itô's formula (Example 6.8) with $f(x)=e^x$, $f'=f''=e^x$:
$$
dY_t=e^{Z_t}\,dZ_t+\tfrac12e^{Z_t}\,d\langle Z\rangle_t=Y_t\Big(\lambda X_t\,dB_t-\frac{\lambda^2}{2}X_t^2\,dt\Big)+\tfrac12Y_t\lambda^2X_t^2\,dt=\lambda X_tY_t\,dB_t .
$$

*Step 3.* Since $Z_0=0$, $Y_0=1$, and in integral form
$$
Y_t=1+\lambda\int_0^tY_sX_s\,dB_s .
$$
$Y$ is continuous, hence pathwise bounded on $[0,T]$, so $\int_0^T|Y_sX_s|^2ds\le\sup_{s\le T}|Y_s|^2\int_0^TX_s^2ds<\infty$ a.s., i.e. $YX\in M^2_{loc}$. A stochastic integral of an $M^2_{loc}$ integrand is a local martingale, so $Y$ is a local martingale (real and imaginary parts separately, if $\lambda\in\mathbb C$).

*Step 4.* If $\lambda\in\mathbb R$, $Y=e^{Z}>0$. A nonnegative local martingale is a supermartingale (Proposition 5.33: if $\tau_n\uparrow\infty$ localises $Y$, then by conditional Fatou $E[Y_t\mid\mathcal F_s]=E[\liminf_nY_{t\wedge\tau_n}\mid\mathcal F_s]\le\liminf_nE[Y_{t\wedge\tau_n}\mid\mathcal F_s]=\liminf_nY_{s\wedge\tau_n}=Y_s$). Hence $E[Y_t]\le E[Y_0]=1$ for all $t\le T$. $\square$

**What graders look for / pitfalls.**

- Correct Itô correction: $\frac12e^Z\,d\langle Z\rangle$ with $d\langle Z\rangle=\lambda^2X^2dt$; the drift $-\frac{\lambda^2}2X^2$ of $Z$ does **not** contribute to $\langle Z\rangle$.
- Justify $XY\in M^2_{loc}$ (continuity of $Y$).
- **Only a local martingale** in general. Do not claim it is a martingale without an extra argument (Remark 6.14, Novikov, bounded or deterministic $X$).
- Supermartingale needs positivity, so needs $\lambda$ real. Cite "nonnegative local martingale is a supermartingale" (or prove it with Fatou in two lines).

**Memorize-this skeleton.**

- $Z=\lambda\int X\,dB-\frac{\lambda^2}{2}\int X^2$, $d\langle Z\rangle=\lambda^2X^2dt$.
- $dY=Y\,dZ+\frac12Y\,d\langle Z\rangle=\lambda XY\,dB$, $Y_0=1$.
- $YX\in M^2_{loc}$, so local martingale; positive, so supermartingale (Fatou), $E[Y_t]\le1$.

### 4.4 Proposition 6.15 (Exponential bound)

**Proof roadmap.**

1. Step 1: Let $M_t=\int_0^tX\,dB$, $A_t=\langle M\rangle_t=\int_0^tX^2ds\le k$. For $\theta>0$, $Z^\theta_t=\exp(\theta M_t-\frac{\theta^2}2A_t)$ is a positive supermartingale (Proposition 6.13).
2. Step 2: $\{\sup_tM_t\ge x\}\subseteq\{\sup_tZ^\theta_t\ge e^{\theta x-\theta^2k/2}\}$ since $A_t\le k$.
3. Step 3: Maximal inequality for supermartingales: $P(\sup M\ge x)\le e^{-\theta x+\theta^2k/2}$; minimise over $\theta$: $\theta=x/k$ gives $e^{-x^2/(2k)}$.
4. Step 4: Same for $-M$; add the two bounds.

**Proof.** Let $M_t=\int_0^tX_s\,dB_s$ and $A_t=\langle M\rangle_t=\int_0^tX_s^2\,ds$. By hypothesis $A_t\le A_T\le k$ for all $t\le T$ a.s.

*Step 1.* For $\theta>0$, by Proposition 6.13 (with $\lambda=\theta$ real),
$$
Z^\theta_t=\exp\Big(\theta M_t-\frac{\theta^2}{2}A_t\Big)
$$
is a positive continuous supermartingale with $Z^\theta_0=1$.

*Step 2.* Since $A_t\le k$, on the event $\{M_t\ge x\}$ we have $\theta M_t-\frac{\theta^2}2A_t\ge\theta x-\frac{\theta^2}{2}k$. Hence
$$
\{M_t\ge x\}=\{e^{\theta M_t}\ge e^{\theta x}\}\subseteq\Big\{Z^\theta_t\ge e^{\theta x-\frac12\theta^2k}\Big\},
\qquad\text{so}\qquad
\Big\{\sup_{0\le t\le T}M_t\ge x\Big\}\subseteq\Big\{\sup_{0\le t\le T}Z^\theta_t\ge e^{\theta x-\frac12\theta^2k}\Big\}.
$$
(For the supremum: $\sup M\ge x$ and continuity give $M_t\ge x-\varepsilon$ for some $t$; or note that $\sup_t$ of a continuous process on a compact interval is attained, so $M_{t^*}\ge x$ at some $t^*$.)

*Step 3.* The maximal inequality for the continuous supermartingale $Z^\theta$ (Theorem 4.28), with $\lambda=e^{\theta x-\theta^2k/2}$, gives
$$
P\Big(\sup_{0\le t\le T}M_t\ge x\Big)\le P\Big(\sup_{0\le t\le T}Z^\theta_t\ge e^{\theta x-\frac12\theta^2k}\Big)\le e^{-\theta x+\frac12\theta^2k}\Big(E[Z^\theta_0]+E[(Z^\theta_T)^-]\Big)=e^{-\theta x+\frac12\theta^2k},
$$
because $Z^\theta_0=1$ and $(Z^\theta_T)^-=0$ ($Z^\theta>0$). This holds for every $\theta>0$. The function $\theta\mapsto-\theta x+\frac12\theta^2k$ is minimised on $(0,\infty)$ at $\theta=x/k$, with minimum value $-\frac{x^2}{k}+\frac{x^2}{2k}=-\frac{x^2}{2k}$. Therefore
$$
P\Big(\sup_{0\le t\le T}M_t\ge x\Big)\le e^{-\frac{x^2}{2k}} .
$$

*Step 4.* $-M=\int_0^t(-X_s)\,dB_s$ has the same increasing process $A$, so by Step 3
$$
P\Big(\inf_{0\le t\le T}M_t\le-x\Big)=P\Big(\sup_{0\le t\le T}(-M_t)\ge x\Big)\le e^{-\frac{x^2}{2k}} .
$$
Since $\{\sup_t|M_t|\ge x\}\subseteq\{\sup_tM_t\ge x\}\cup\{\inf_tM_t\le-x\}$, adding gives the claim. $\square$

**What graders look for / pitfalls.**

- $k$ must be **deterministic**. With a random bound the inequality $\theta x-\frac{\theta^2}{2}A_t\ge\theta x-\frac{\theta^2}2k$ still holds pathwise, but optimising $\theta=x/k$ requires a fixed number.
- The inequality direction: $A_t\le k$ means $-\frac{\theta^2}2A_t\ge-\frac{\theta^2}2k$. Get this right.
- Use the **supermartingale** maximal inequality ($\lambda P(\sup Z\ge\lambda)\le E Z_0+E Z_T^-$), not Doob's $L^p$ inequality. Note $Z^\theta$ need not be a martingale (though here it is, by Novikov, it is not needed).
- Do not forget the factor 2 (two one-sided bounds).
- Optimisation: $\theta^*=x/k>0$; plug back carefully.

**Memorize-this skeleton.**

- $Z^\theta=e^{\theta M-\frac{\theta^2}2A}$ positive supermartingale, $Z_0=1$.
- $\{\sup M\ge x\}\subseteq\{\sup Z^\theta\ge e^{\theta x-\theta^2k/2}\}$.
- Maximal inequality: $P\le e^{-\theta x+\theta^2k/2}$, $\theta=x/k$: $e^{-x^2/2k}$.
- Apply to $-M$, factor 2.

### 4.5 Theorem 6.17 and Corollary 6.20 (statement only; proof idea for understanding)

Not required as proofs, but the idea (notes p. 6.8 to 6.11) helps you remember the statements.

- *Finite-dimensional distributions.* For $0\le t_1<\dots<t_m$ and $\theta_j\in\mathbb R$, apply Proposition 6.16 with $X_j(s)=X_s\mathbf 1_{\{s<\tau(t_j)\}}$, $\lambda_j=i\theta_j$. Since $\int_0^tX_hX_k\,ds\le t_h\wedge t_k$, the resulting complex exponential local martingale is **bounded**, hence a martingale with expectation 1. Letting $t\to\infty$ (dominated convergence) gives $E[\exp(i\sum_j\theta_jW_{t_j})]=\exp(-\frac12\sum_{h,k}\theta_h\theta_k(t_h\wedge t_k))$, so $(W_{t_1},\dots,W_{t_m})\sim N(0,(t_h\wedge t_k))$: the finite-dimensional distributions of BM.
- *Continuity.* $\tau$ is right-continuous (Proposition 6.19(a)), so $W$ is right-continuous. At a jump of $\tau$, $A$ is flat on $[L,\tau(t_0))$, so $X=0$ a.e. there and the integral is constant there (Proposition 5.23): $W$ is also left-continuous.
- *Corollary 6.20.* $\tau(A_t)\ge t$. If $\tau(A_t)=L>t$, $A$ is constant on $[t,L)$, so $X=0$ a.e. on $[t,L)$ and $W_{A_t}=\int_0^LX\,dB=\int_0^tX\,dB$.

### 4.6 Proposition 6.21 (Maximal $L^p$ estimate), bounded case

As allowed by the syllabus, assume $M_t=\int_0^tX_s\,dB_s$ and $\langle M\rangle_t=\int_0^tX_s^2ds$ are **bounded**: $|M_t|\le C$ and $\langle M\rangle_T\le C$ for a constant $C$. (In the notes this is achieved by stopping at $\tau_n=\inf\{t:|M_t|\ge n\text{ or }\langle M\rangle_t\ge n\}\wedge T$ and letting $n\to\infty$ by monotone convergence at the end.)

> **Lecturer's remark (notes p. 6.12).** Baldi's proof is incomplete: it does not cover $X\notin M^p$. Example: $p>2$, $T=1$, $X_t=t^{-1/p}$; then $\int_0^1X_t^2dt=\frac{p}{p-2}<\infty$ but $\int_0^1|X_t|^pdt=\infty$. Hence the localisation proof via $\langle M\rangle$.

**Proof roadmap.**

1. Step 1: Itô's formula for $f(x)=|x|^p$ ($C^2$ for $p\ge2$): $|M_T|^p=\text{martingale}+\frac{p(p-1)}2\int_0^T|M_s|^{p-2}X_s^2ds$.
2. Step 2: Take expectations (the $dB$ integral has mean 0 by boundedness), bound $|M_s|^{p-2}\le S^{p-2}$ with $S=\sup|M|$: $E|M_T|^p\le\frac{p(p-1)}2E[S^{p-2}\langle M\rangle_T]$.
3. Step 3: Doob's $L^p$ inequality: $E[S^p]\le(\frac p{p-1})^pE|M_T|^p\le K_pE[S^{p-2}\langle M\rangle_T]$.
4. Step 4: Hölder with $\frac p{p-2}$ and $\frac p2$, then divide by $(E S^p)^{(p-2)/p}$: $E S^p\le K_p^{p/2}E[\langle M\rangle_T^{p/2}]$.
5. Step 5: Second inequality: pathwise Hölder $\int_0^T|X|^2\le(\int_0^T|X|^p)^{2/p}T^{(p-2)/p}$, raise to $p/2$.

**Proof.** Let $S=\sup_{0\le t\le T}|M_t|\le C$.

*Case $p=2$.* By Doob's inequality and the isometry, $E[S^2]\le4E[M_T^2]=4E[\langle M\rangle_T]$. So $c_2=4$. (The second inequality is an equality for $p=2$.)

*Case $p>2$. Step 1.* The function $f(x)=|x|^p$ is $C^2$ for $p\ge2$ with
$$
f'(x)=p\,\operatorname{sgn}(x)|x|^{p-1},\qquad f''(x)=p(p-1)|x|^{p-2},
$$
both continuous. By Itô's formula (Example 6.8) with $dM_t=X_t\,dB_t$, $d\langle M\rangle_t=X_t^2dt$, $M_0=0$:
$$
|M_T|^p=p\int_0^T|M_s|^{p-1}\operatorname{sgn}(M_s)X_s\,dB_s+\frac{p(p-1)}{2}\int_0^T|M_s|^{p-2}X_s^2\,ds .
$$

*Step 2.* The stochastic integral has zero expectation because its integrand is in $M^2([0,T])$:
$$
E\Big[\int_0^T|M_s|^{2p-2}X_s^2\,ds\Big]\le C^{2p-2}E[\langle M\rangle_T]\le C^{2p-1}<\infty .
$$
Hence, using $|M_s|^{p-2}\le S^{p-2}$,
$$
E[|M_T|^p]=\frac{p(p-1)}{2}E\Big[\int_0^T|M_s|^{p-2}X_s^2\,ds\Big]\le\frac{p(p-1)}{2}E\big[S^{p-2}\langle M\rangle_T\big].
$$

*Step 3.* $M$ is a continuous (bounded) martingale; by Doob's $L^p$ inequality,
$$
E[S^p]\le\Big(\frac{p}{p-1}\Big)^pE[|M_T|^p]\le K_p\,E\big[S^{p-2}\langle M\rangle_T\big],\qquad K_p:=\frac{p(p-1)}{2}\Big(\frac{p}{p-1}\Big)^p .
$$

*Step 4.* Hölder with conjugate exponents $r=\frac{p}{p-2}$ and $r'=\frac p2$ (indeed $\frac{p-2}{p}+\frac2p=1$):
$$
E\big[S^{p-2}\langle M\rangle_T\big]\le\big(E[S^{p}]\big)^{\frac{p-2}{p}}\big(E[\langle M\rangle_T^{p/2}]\big)^{\frac2p}.
$$
So $E[S^p]\le K_p\,(E[S^p])^{\frac{p-2}p}(E[\langle M\rangle_T^{p/2}])^{\frac2p}$. All quantities are finite (boundedness). If $E[S^p]=0$ there is nothing to prove; otherwise divide by $(E[S^p])^{(p-2)/p}$:
$$
\big(E[S^p]\big)^{\frac2p}\le K_p\big(E[\langle M\rangle_T^{p/2}]\big)^{\frac2p}
\quad\Longrightarrow\quad
E[S^p]\le K_p^{p/2}\,E\Big[\Big(\int_0^TX_s^2ds\Big)^{p/2}\Big].
$$
This is the first inequality with $c_p=K_p^{p/2}$.

*Step 5.* For $p>2$, Hölder in $ds$ with exponents $\frac p2$ and $\frac p{p-2}$, pathwise:
$$
\int_0^T|X_s|^2\cdot1\,ds\le\Big(\int_0^T|X_s|^pds\Big)^{2/p}\Big(\int_0^T1\,ds\Big)^{\frac{p-2}{p}}=\Big(\int_0^T|X_s|^pds\Big)^{2/p}T^{\frac{p-2}{p}} .
$$
Raising to the power $p/2$ and taking expectations:
$$
E\Big[\Big(\int_0^T|X_s|^2ds\Big)^{p/2}\Big]\le T^{\frac{p-2}{2}}E\Big[\int_0^T|X_s|^pds\Big].\qquad\square
$$

*(Localisation, for completeness.)* For general $X\in M^2_{loc}$ apply the bounded case to $M^{\tau_n}$ (integrand $X\mathbf 1_{\{s<\tau_n\}}$): $E[\sup_t|M_{t\wedge\tau_n}|^p]\le c_pE[\langle M\rangle_{\tau_n}^{p/2}]\le c_pE[\langle M\rangle_T^{p/2}]$. Since $\tau_n\uparrow T$ and eventually equals $T$ a.s., $\sup_t|M_{t\wedge\tau_n}|\uparrow\sup_t|M_t|$; monotone convergence finishes.

**What graders look for / pitfalls.**

- $|x|^p$ is $C^2$ only because $p\ge2$ (for $1<p<2$, $f''$ blows up at $0$). Say it.
- Justify $E[\text{stochastic integral}]=0$: the integrand must be in $M^2$, which is where boundedness (or localisation) is used.
- Hölder exponents $\frac{p}{p-2}$ and $\frac p2$, and the **division step** requires $E[S^p]<\infty$ (boundedness) and $E[S^p]>0$.
- Doob's inequality applies to the martingale $M$ (not to $|M|^p$, which is a submartingale; Doob is also fine stated for nonnegative submartingales $|M|$).
- The second inequality is pathwise Hölder; do not confuse it with Jensen in $\omega$.
- Constants: $c_p$ depends only on $p$, not on $T$ or $X$.

**Memorize-this skeleton.**

- Itô: $|M_T|^p=\int(\dots)dB+\frac{p(p-1)}2\int|M|^{p-2}X^2ds$; expectation kills $dB$ (bounded).
- $E|M_T|^p\le\frac{p(p-1)}2E[S^{p-2}\langle M\rangle_T]$; Doob: $E S^p\le(\frac p{p-1})^pE|M_T|^p$.
- Hölder $(\frac p{p-2},\frac p2)$; divide: $E S^p\le K_p^{p/2}E\langle M\rangle_T^{p/2}$.
- Pathwise Hölder: $(\int X^2)^{p/2}\le T^{(p-2)/2}\int|X|^p$.

## 5. Exercises

**General recipe for "is $Y$ a (local) martingale?"**

1. Write $Y_t=f(X_t,t)$ (or a product) and compute $dY$ by Itô / the product rule.
2. Drift $\ne0$ on a set of positive $dt\otimes P$ measure: not a local martingale (uniqueness, Remark 6.2).
3. Drift $=0$: $Y$ is a local martingale; check $H\in M^2([0,T])$ for the $dB$-coefficient $H$, i.e. $E\int_0^TH_s^2ds<\infty$, to get a true martingale.

Two facts used repeatedly: for $B_s\sim N(0,s)$, $E[e^{cB_s}]=e^{c^2s/2}$ and $E[B_s^{2k}]=(2k-1)!!\,s^k$; and for $c<\frac1{2s}$, $E[e^{-cB_s^2}]=(1+2cs)^{-1/2}$.

**Itô cookbook (memorise; $B$ a Brownian motion, $B_0=0$).**

| Process | Differential | Martingale? |
|---|---|---|
| $B_t^2$ | $dt+2B_t\,dB_t$ | no; $B_t^2-t$ yes |
| $B_t^3$ | $3B_t\,dt+3B_t^2\,dB_t$ | no; $B_t^3-3tB_t$ yes |
| $B_t^4$ | $6B_t^2\,dt+4B_t^3\,dB_t$ | no; $B_t^4-6tB_t^2+3t^2$ yes |
| $tB_t$ | $B_t\,dt+t\,dB_t$ | no; $tB_t-\int_0^tB_s\,ds$ yes |
| $e^{B_t}$ | $\frac12e^{B_t}dt+e^{B_t}dB_t$ | submartingale |
| $e^{aB_t-\frac{a^2}2t}$ | $a\,e^{aB_t-\frac{a^2}2t}\,dB_t$ | yes |
| $e^{t/2}\cos B_t$ | $-e^{t/2}\sin B_t\,dB_t$ | yes |
| $e^{t/2}\sin B_t$ | $e^{t/2}\cos B_t\,dB_t$ | yes |
| $\cos B_t$ | $-\frac12\cos B_t\,dt-\sin B_t\,dB_t$ | no |
| $\log(1+B_t^2)$ | $\frac{1-B_t^2}{(1+B_t^2)^2}dt+\frac{2B_t}{1+B_t^2}dB_t$ | no |
| $X_t^2$ ($dX=F\,dt+G\,dB$) | $2X_t\,dX_t+G_t^2\,dt$ | depends |
| $f(t)B_t$ ($f\in C^1$) | $f'(t)B_t\,dt+f(t)\,dB_t$ | iff $f$ constant |
| $\mathcal E(X)_t$ | $\mathcal E(X)_tX_t\,dB_t$ | local martingale |

**Common Itô mistakes (all cost points).**

- Forgetting $\frac12f_{xx}G^2dt$, or using $G$ = drift instead of diffusion coefficient.
- Forgetting $f_t$ when $f$ depends on $t$.
- Concluding "martingale" from "zero drift" without checking that the $dB$-integrand is in $M^2$ (otherwise it is only a **local** martingale).
- Taking expectations of $\int H\,dB$ without $H\in M^2$.
- Applying the stopping theorem at an unbounded stopping time without a limit argument.
- Writing $d\big(g(t)\int_0^th(s)\,dB_s\big)=g(t)h(t)\,dB_t$ (forgetting $g'(t)\int_0^th\,dB\,dt$).

### Exercise 1 (★, 10 min). Itô process drill

Write each process as an Itô process, i.e. find $F,G$ with $dX_t=F_t\,dt+G_t\,dB_t$.

(a) $X_t=2+t+e^{B_t}$. (b) $X_t=t^2B_t$. (c) $X_t=e^{tB_t}$. (d) $X_t=\log(1+B_t^2)$. (e) $X_t=B_t^3$.

**Strategy.** Identify $f(x,t)$, compute $f_t,f_x,f_{xx}$, plug into $df=(f_t+\frac12f_{xx})dt+f_x\,dB$ (here $X=B$, $F=0$, $G=1$).

**Full solution.**

(a) $f(x,t)=2+t+e^x$: $f_t=1$, $f_x=f_{xx}=e^x$. So $dX_t=\big(1+\frac12e^{B_t}\big)dt+e^{B_t}\,dB_t$.

(b) $f(x,t)=t^2x$: $f_t=2tx$, $f_x=t^2$, $f_{xx}=0$. So $dX_t=2tB_t\,dt+t^2\,dB_t$ (product rule with zero bracket).

(c) $f(x,t)=e^{tx}$: $f_t=xe^{tx}$, $f_x=te^{tx}$, $f_{xx}=t^2e^{tx}$. So
$$
dX_t=X_t\Big(B_t+\frac{t^2}{2}\Big)dt+tX_t\,dB_t .
$$

(d) $f(x)=\log(1+x^2)$: $f'(x)=\frac{2x}{1+x^2}$, $f''(x)=\frac{2(1+x^2)-4x^2}{(1+x^2)^2}=\frac{2(1-x^2)}{(1+x^2)^2}$. So
$$
dX_t=\frac{1-B_t^2}{(1+B_t^2)^2}\,dt+\frac{2B_t}{1+B_t^2}\,dB_t .
$$

(e) $d(B_t^3)=3B_t\,dt+3B_t^2\,dB_t$.

All coefficients are continuous functions of $(B_t,t)$, so $F\in M^1_{loc}$, $G\in M^2_{loc}$.

**Common pitfalls.** Forgetting the $f_t$ term in (c); differentiating $\log(1+x^2)$ twice incorrectly; writing $dX=f'(B)\,dB$ only (no Itô correction).

### Exercise 2 (★, 10 min). $d(B^n)$ and the moments $E[B_t^4]$, $E[B_t^6]$

(a) Compute $d(B_t^n)$ for $n\ge2$. (b) Show that $m_n(t)=E[B_t^n]$ satisfies $m_n(t)=\frac{n(n-1)}{2}\int_0^tm_{n-2}(s)\,ds$. (c) Deduce $E[B_t^4]=3t^2$, $E[B_t^6]=15t^3$, and that odd moments vanish. (Øksendal Exercise 4.5.)

**Strategy.** Itô with $f(x)=x^n$, then take expectations: the $dB$ integral has mean zero if its integrand is in $M^2$.

**Full solution.** (a) $f(x)=x^n$, $f'=nx^{n-1}$, $f''=n(n-1)x^{n-2}$:
$$
d(B_t^n)=nB_t^{n-1}\,dB_t+\tfrac12n(n-1)B_t^{n-2}\,dt .
$$
(b) In integral form, $B_t^n=n\int_0^tB_s^{n-1}dB_s+\frac{n(n-1)}2\int_0^tB_s^{n-2}ds$. The integrand $nB^{n-1}$ is in $M^2([0,t])$ because
$$
E\int_0^tB_s^{2n-2}\,ds=\int_0^t(2n-3)!!\,s^{n-1}\,ds<\infty ,
$$
so the stochastic integral is a martingale starting at 0 and has mean $0$. By Fubini (the integrand $|B_s|^{n-2}$ has finite expectation, continuous in $s$),
$$
m_n(t)=\frac{n(n-1)}{2}\int_0^tm_{n-2}(s)\,ds .
$$
(c) $m_0=1$, $m_1=0$. Then $m_2(t)=\int_0^t1\,ds=t$, $m_4(t)=6\int_0^ts\,ds=3t^2$, $m_6(t)=15\int_0^t3s^2\,ds=15t^3$. Odd: $m_3=3\int_0^tm_1=0$, and inductively $m_{2k+1}=0$. In general $m_{2k}(t)=(2k-1)!!\,t^k$.

Equivalently (Dynkin-type ODE): $m_4'(t)=6m_2(t)=6t$, $m_4(0)=0$; $m_6'(t)=15m_4(t)=45t^2$, $m_6(0)=0$.

**Common pitfalls.** Taking expectations of the $dB$ integral without checking $M^2$; forgetting the factor $\frac12$.

### Exercise 3 (★, 10 min). Dynkin-type ODEs

Using Itô's formula only (no Gaussian integrals), compute (a) $E[e^{aB_t}]$, (b) $E[\cos B_t]$, (c) $E[\sin^2B_t]$.

**Strategy.** For $f\in C^2$ with $f'(B)\in M^2$: $E[f(B_t)]=f(0)+\frac12\int_0^tE[f''(B_s)]\,ds$. If $f''$ is a multiple of $f$, this is a linear ODE.

**Full solution.** (a) $f(x)=e^{ax}$: $de^{aB_t}=ae^{aB_t}dB_t+\frac{a^2}2e^{aB_t}dt$. The integrand is in $M^2$: $E\int_0^te^{2aB_s}ds=\int_0^te^{2a^2s}ds<\infty$ (a priori one can also localise; here the explicit bound is available). So $m(t)=E[e^{aB_t}]$ satisfies $m(t)=1+\frac{a^2}{2}\int_0^tm(s)ds$, i.e. $m'=\frac{a^2}2m$, $m(0)=1$, so $m(t)=e^{a^2t/2}$.

(b) $d\cos B_t=-\sin B_t\,dB_t-\frac12\cos B_t\,dt$; the integrand is bounded, so in $M^2$. Hence $m(t)=E[\cos B_t]$ solves $m'=-\frac12m$, $m(0)=1$: $E[\cos B_t]=e^{-t/2}$.

(c) $f(x)=\sin^2x$, $f'(x)=2\sin x\cos x=\sin2x$, $f''(x)=2\cos2x$. So $E[\sin^2B_t]=\int_0^tE[\cos2B_s]\,ds$. As in (b), $d\cos2B=-2\sin2B\,dB-2\cos2B\,dt$, so $E[\cos2B_s]=e^{-2s}$. Hence
$$
E[\sin^2B_t]=\int_0^te^{-2s}ds=\frac{1-e^{-2t}}{2}.
$$
Check: $\sin^2x=\frac{1-\cos2x}2$ gives the same.

**Common pitfalls.** Not justifying that the $dB$ part has zero mean; sign errors in $f''$ for trigonometric functions.

### Exercise 4 (★, 15 min). Exponential processes (mandatory assignment 2026, Problem 1)

(a) Is $Y_t=e^{B_t}$ a martingale, submartingale or supermartingale? (b) For deterministic $f\in L^2([0,T])$, show that $Z_t=\exp\left(\int_0^tf\,dB-\frac12\int_0^tf^2ds\right)$ is a martingale. (c) Compute $E[Y_t]$, $E[Y_t^2]$, $E[Z_t]$, $E[Z_t^2]$.

**Strategy.** Itô shows the drift sign; for a rigorous sub-/supermartingale statement, write $Y$ as (deterministic increasing function) times a martingale. For (b) use Gaussianity of $\int f\,dB$ and Remark 6.14(1).

**Full solution.** (a) $dY_t=e^{B_t}dB_t+\frac12e^{B_t}dt$: positive drift, so $Y$ is not a martingale (uniqueness of the differential). Precisely: $Y_t=e^{t/2}\mathcal E_t$ with $\mathcal E_t=e^{B_t-t/2}$. Itô with $f(x,t)=e^{x-t/2}$ ($f_t=-\frac12f$, $f_x=f_{xx}=f$) gives $d\mathcal E=\mathcal E\,dB$, and $E\int_0^T\mathcal E_s^2ds=\int_0^Te^{s}ds<\infty$, so $\mathcal E$ is a martingale. Hence for $s\le t$
$$
E[Y_t\mid\mathcal F_s]=e^{t/2}\mathcal E_s=e^{(t-s)/2}Y_s\ge Y_s ,
$$
and $Y$ is integrable: $Y$ is a **submartingale** (strict, not a martingale).

(b) $I_t=\int_0^tf\,dB\sim N(0,\int_0^tf^2)$ (Proposition 5.19). By Proposition 6.13, $Z$ is a positive local martingale, hence a supermartingale, and $E[Z_t]=e^{-\frac12\int_0^tf^2}E[e^{I_t}]=e^{-\frac12\int_0^tf^2}e^{\frac12\int_0^tf^2}=1$. By Remark 6.14(1), $Z$ is a martingale.

(c) $E[Y_t]=e^{t/2}$, $E[Y_t^2]=E[e^{2B_t}]=e^{2t}$ (so $\operatorname{Var}Y_t=e^{2t}-e^t$). $E[Z_t]=1$, and
$$
E[Z_t^2]=e^{-\int_0^tf^2}E[e^{2I_t}]=e^{-\int_0^tf^2}e^{2\int_0^tf^2}=e^{\int_0^tf^2ds}.
$$

**Common pitfalls.** Concluding "submartingale" only from "positive drift" without checking integrability and the conditional inequality; claiming a stochastic exponential is a martingale without justification.

### Exercise 5 (★, 10 min). $e^{t/2}\sin B_t$ and $e^{t/2}\cos B_t$ (Baldi 8.3)

(a) Show that $X_t=e^{t/2}\sin B_t$ and $Y_t=e^{t/2}\cos B_t$ are martingales and compute $E[X_1]$, $E[Y_1]$. (b) Compute $\langle X,Y\rangle_t$.

**Strategy.** Itô for $f(x,t)=e^{t/2}\sin x$; the $\frac12$ in the exponent cancels $\frac12f_{xx}=-\frac12f$.

**Full solution.** (a) $f(x,t)=e^{t/2}\sin x$: $f_t=\frac12f$, $f_x=e^{t/2}\cos x$, $f_{xx}=-f$. Drift $f_t+\frac12f_{xx}=0$, so
$$
dX_t=e^{t/2}\cos B_t\,dB_t,\qquad\text{and similarly}\qquad dY_t=-e^{t/2}\sin B_t\,dB_t .
$$
On $[0,T]$ the integrands are bounded by $e^{T/2}$, hence in $M^2([0,T])$, so $X,Y$ are martingales. Therefore $E[X_1]=X_0=0$ and $E[Y_1]=Y_0=1$ (consistent with $E[\cos B_1]=e^{-1/2}$).

(b) $\langle X,Y\rangle_t=\int_0^te^{s/2}\cos B_s\cdot(-e^{s/2}\sin B_s)\,ds=-\frac12\int_0^te^s\sin(2B_s)\,ds$.

**Common pitfalls.** Sign of $\frac{d^2}{dx^2}\sin x$; forgetting that both are martingales (students often think only one of them is).

### Exercise 6 (★ for (a),(b); ★★ for (c), 20 min). Space-time harmonic polynomials (Baldi 8.5)

(a) Show that $X_t=B_t^3-3tB_t$ is a martingale. (b) Show that there are coefficients $c_{n,m}$ such that $P_n(x,t)=\sum_{m=0}^{[n/2]}c_{n,m}x^{n-2m}t^m$ (with $c_{n,0}=1$) makes $P_n(B_t,t)$ a martingale; compute $P_1,\dots,P_4$. (c) Let $a,b>0$ and $\tau$ the exit time of $B$ from $]-a,b[$. Are $\tau$ and $B_\tau$ independent?

**Strategy.** $P(B_t,t)$ is a martingale iff $P_t+\frac12P_{xx}=0$ (backward heat equation), since $P_x$ is a polynomial and hence the $dB$ integrand is in $M^2$. For (c), use optional stopping on $X$.

**Full solution.** (a) $f(x,t)=x^3-3tx$: $f_t=-3x$, $f_x=3x^2-3t$, $f_{xx}=6x$. Drift: $-3x+3x=0$. So $dX_t=3(B_t^2-t)\,dB_t$, and $E\int_0^T(B_s^2-s)^2ds<\infty$, so $X$ is a martingale.

(b) For $P=\sum_mc_mx^{n-2m}t^m$: $P_t=\sum_mmc_mx^{n-2m}t^{m-1}$ and $\frac12P_{xx}=\frac12\sum_mc_m(n-2m)(n-2m-1)x^{n-2m-2}t^m$. The coefficient of $x^{n-2m-2}t^m$ in $P_t+\frac12P_{xx}$ is $(m+1)c_{m+1}+\frac12(n-2m)(n-2m-1)c_m$. Setting it to zero:
$$
c_{m+1}=-\frac{(n-2m)(n-2m-1)}{2(m+1)}\,c_m,\qquad c_0=1 .
$$
The recursion stops by itself once $n-2m\le1$. Then $P_n$ is a martingale because $\partial_xP_n$ is a polynomial in $(x,t)$, so $\partial_xP_n(B,t)\in M^2([0,T])$. We get
$$
P_1=x,\qquad P_2=x^2-t,\qquad P_3=x^3-3tx,\qquad P_4=x^4-6tx^2+3t^2 .
$$
(Check $P_4$: $\partial_tP_4=-6x^2+6t$, $\frac12\partial_{xx}P_4=6x^2-6t$.)

(c) Recall $\tau<\infty$ a.s., $E[\tau]=ab$ (Exercise 7 below) and $P(B_\tau=b)=\frac a{a+b}$, $P(B_\tau=-a)=\frac b{a+b}$. The stopped martingale $X_{t\wedge\tau}$ is a martingale, so $E[B_{t\wedge\tau}^3]=3E[(t\wedge\tau)B_{t\wedge\tau}]$. Since $|B_{t\wedge\tau}|\le\max(a,b)=:c$ and $|(t\wedge\tau)B_{t\wedge\tau}|\le c\tau\in L^1$, dominated convergence as $t\to\infty$ gives
$$
E[B_\tau^3]=3E[\tau B_\tau].
$$
Now $E[B_\tau^3]=b^3\frac{a}{a+b}-a^3\frac{b}{a+b}=\frac{ab(b^2-a^2)}{a+b}=ab(b-a)$. If $\tau$ and $B_\tau$ were independent, $E[\tau B_\tau]=E[\tau]E[B_\tau]=ab\cdot\big(b\frac a{a+b}-a\frac b{a+b}\big)=0$, forcing $ab(b-a)=0$. Hence **for $a\ne b$, $\tau$ and $B_\tau$ are not independent.** (For $a=b$ they are independent, by the symmetry $B\mapsto-B$, which leaves $\tau$ unchanged and flips $B_\tau$.)

**Common pitfalls.** Applying optional stopping at the unbounded $\tau$ without a dominated-convergence argument; mixing up which endpoint has probability $\frac a{a+b}$.

### Exercise 7 (★, 10 min). $(b-B_t)(a+B_t)+t$ and $E[\tau]=ab$ (Baldi 8.2)

Compute the differential of $X_t=(b-B_t)(a+B_t)+t$, show it is a martingale, and deduce $E[\tau]=ab$ for the exit time $\tau$ of $]-a,b[$.

**Strategy.** Expand; Itô gives $-dt+dt=0$ drift. Stop at $t\wedge\tau$ and let $t\to\infty$.

**Full solution.** $X_t=ab+(b-a)B_t-B_t^2+t$, so $dX_t=(b-a)\,dB_t-(2B_t\,dB_t+dt)+dt=(b-a-2B_t)\,dB_t$. The integrand is in $M^2([0,T])$, so $X$ is a martingale. By the stopping theorem, $E[X_{t\wedge\tau}]=X_0=ab$:
$$
E\big[(b-B_{t\wedge\tau})(a+B_{t\wedge\tau})\big]+E[t\wedge\tau]=ab .
$$
As $t\to\infty$: $\tau<\infty$ a.s. and the first term is bounded by $(a+b)^2$ and converges to $(b-B_\tau)(a+B_\tau)=0$ (since $B_\tau\in\{-a,b\}$), so by dominated convergence it tends to $0$; $E[t\wedge\tau]\uparrow E[\tau]$ by monotone convergence. Hence $E[\tau]=ab$.

**Common pitfalls.** Forgetting to justify the limit (bounded + monotone convergence); claiming $E[X_\tau]=ab$ directly at an unbounded stopping time.

### Exercise 8 (★★, 15 min). Baldi 8.1

Let $M_t=(B_t+t)\,e^{-(B_t+\frac12t)}$. (a) Compute $dM_t$. (b) Show that $M$ is a martingale.

**Strategy.** $f(x,t)=(x+t)e^{-x-t/2}$; compute carefully, factor out the exponential.

**Full solution.** (a) Write $E=e^{-x-t/2}$ and $u=x+t$. Then
$$
f_t=E-\tfrac12uE=E\big(1-\tfrac u2\big),\qquad f_x=E-uE=E(1-u),\qquad f_{xx}=-E-E(1-u)=E(u-2).
$$
Drift: $f_t+\frac12f_{xx}=E\big(1-\frac u2+\frac u2-1\big)=0$. Hence
$$
dM_t=e^{-B_t-t/2}\,(1-B_t-t)\,dB_t .
$$
(b) Let $H_s=e^{-B_s-s/2}(1-B_s-s)$. By Cauchy-Schwarz,
$$
E[H_s^2]\le\big(E[e^{-4B_s-2s}]\big)^{1/2}\big(E[(1-B_s-s)^4]\big)^{1/2}=e^{3s}\big(E[(1-B_s-s)^4]\big)^{1/2},
$$
which is continuous in $s$, so $E\int_0^TH_s^2ds<\infty$. Thus $H\in M^2([0,T])$ and $M$ is a martingale (with $M_0=0$).

**Common pitfalls.** Algebra in $f_{xx}$; checking only "drift zero" and concluding martingale without the $M^2$ check.

### Exercise 9 (★, 10 min). Product rule drill

(a) Verify the product rule on $e^{B_t}\cdot e^{-B_t}=1$. (b) Let $X_t=\int_0^tB_s\,dB_s$. Using the product rule, compute $E[B_t^2X_t]$ and check against $X_t=\frac12(B_t^2-t)$.

**Strategy.** $d(UV)=U\,dV+V\,dU+d\langle U,V\rangle$, bracket = product of the $dB$-coefficients.

**Full solution.** (a) $de^{B}=e^B\,dB+\frac12e^B\,dt$, $de^{-B}=-e^{-B}\,dB+\frac12e^{-B}\,dt$, $d\langle e^B,e^{-B}\rangle=e^B(-e^{-B})\,dt=-dt$. So
$$
d(e^Be^{-B})=e^B\big(-e^{-B}dB+\tfrac12e^{-B}dt\big)+e^{-B}\big(e^BdB+\tfrac12e^Bdt\big)-dt=\tfrac12dt+\tfrac12dt-dt=0 .
$$
Consistent. Without the bracket we would get the wrong answer $d(1)=dt$.

(b) $d(B^2)=dt+2B\,dB$, $dX=B\,dB$, $d\langle B^2,X\rangle=2B\cdot B\,dt=2B^2dt$. Then
$$
d(B_t^2X_t)=B_t^2\cdot B_t\,dB_t+X_t(dt+2B_t\,dB_t)+2B_t^2\,dt=(X_t+2B_t^2)\,dt+(B_t^3+2B_tX_t)\,dB_t .
$$
The $dB$ integrand is a polynomial in $B$ (since $X=\frac12(B^2-t)$), hence in $M^2$. Taking expectations with $E[X_s]=0$, $E[B_s^2]=s$:
$$
E[B_t^2X_t]=\int_0^t(0+2s)\,ds=t^2 .
$$
Check: $E[B_t^2\cdot\frac12(B_t^2-t)]=\frac12(3t^2-t^2)=t^2$. This matches.

**Common pitfalls.** Missing the bracket; wrong bracket ($2B$ times $B$, not $2B$ times $1$).

### Exercise 10 (★★, 15 min). $tB_t-\int_0^tB_u\,du$ (Example 6.11, Baldi 8.7)

(a) Show $Y_t=tB_t-\int_0^tB_u\,du=\int_0^ts\,dB_s$ and $E[Y_t^2]=t^3/3$. (b) Show $Z_t=e^{Y_t-t^3/6}$ is a martingale. (c) Compute $E\big[(\int_0^tB_s\,ds)^2\big]$ and $\operatorname{Cov}(B_t,\int_0^tB_sds)$.

**Strategy.** Product rule $d(tB_t)=B_t\,dt+t\,dB_t$. Deterministic integrands give Gaussian integrals.

**Full solution.** (a) $dY_t=d(tB_t)-B_t\,dt=t\,dB_t$ and $Y_0=0$, so $Y_t=\int_0^ts\,dB_s$. Itô isometry: $E[Y_t^2]=\int_0^ts^2ds=t^3/3$. $Y$ is a centred square integrable martingale (deterministic integrand in $L^2$).

(b) $Z_t=\exp\big(\int_0^ts\,dB_s-\frac12\int_0^ts^2ds\big)$ is the stochastic exponential of the deterministic $f(s)=s$, since $\frac12\cdot\frac{t^3}3=\frac{t^3}6$. As in Exercise 4(b): $Y_t\sim N(0,t^3/3)$ so $E[Z_t]=e^{-t^3/6}e^{t^3/6}=1$; $Z$ is a positive local martingale with constant expectation 1, hence a martingale (Remark 6.14(1)).

(c) From (a), $\int_0^tB_sds=tB_t-Y_t=\int_0^tt\,dB_s-\int_0^ts\,dB_s=\int_0^t(t-s)\,dB_s$. By the isometry,
$$
E\Big[\Big(\int_0^tB_sds\Big)^2\Big]=\int_0^t(t-s)^2ds=\frac{t^3}{3},\qquad
\operatorname{Cov}\Big(B_t,\int_0^tB_sds\Big)=E\Big[\int_0^t1\,dB_s\int_0^t(t-s)\,dB_s\Big]=\int_0^t(t-s)\,ds=\frac{t^2}{2}.
$$

**Common pitfalls.** Writing $Z$ with $t^3/3$ instead of $t^3/6$ (half the variance); forgetting that $t$ inside $\int_0^t(t-s)dB_s$ is a fixed parameter (fine: the integrand is deterministic for fixed $t$).

### Exercise 11 (★★, 15 min). Deterministic integrands and integration by parts (Example 6.9, Øksendal 4.2, Baldi 8.9)

(a) Show that $\int_0^ts^2\,dB_s=t^2B_t-2\int_0^tsB_s\,ds$. (b) Let $\lambda>0$ and $X_t=\int_0^te^{-\lambda s}B_s\,ds$. Show that $X_t$ converges a.s. and in $L^2$ as $t\to\infty$ and find the law of the limit.

**Strategy.** Product rule $d(f(t)B_t)=f'(t)B_t\,dt+f(t)\,dB_t$; then martingale convergence for an $L^2$-bounded integral.

**Full solution.** (a) $d(t^2B_t)=2tB_t\,dt+t^2\,dB_t$; integrate from 0 to $t$ ($B_0=0$).

(b) $d(e^{-\lambda s}B_s)=-\lambda e^{-\lambda s}B_s\,ds+e^{-\lambda s}\,dB_s$, so
$$
X_t=\int_0^te^{-\lambda s}B_s\,ds=\frac1\lambda\Big(\int_0^te^{-\lambda s}\,dB_s-e^{-\lambda t}B_t\Big).
$$
- $e^{-\lambda t}B_t\to0$ a.s. (since $B_t/t\to0$ a.s., or by the LIL) and in $L^2$ ($E[e^{-2\lambda t}B_t^2]=te^{-2\lambda t}\to0$).
- $N_t=\int_0^te^{-\lambda s}dB_s$ is a continuous martingale with $E[N_t^2]=\int_0^te^{-2\lambda s}ds\le\frac1{2\lambda}$: bounded in $L^2$, so it converges a.s. and in $L^2$ to $N_\infty=\int_0^\infty e^{-\lambda s}dB_s$ (martingale convergence in $L^p$, $p=2$).

So $X_t\to X_\infty=\frac1\lambda N_\infty$ a.s. and in $L^2$. $N_t$ is centred Gaussian with variance $\frac{1-e^{-2\lambda t}}{2\lambda}$; $L^2$-limits of centred Gaussians are centred Gaussian with the limiting variance, so $N_\infty\sim N(0,\frac1{2\lambda})$ and
$$
X_\infty\sim N\Big(0,\frac{1}{2\lambda^3}\Big).
$$

**Common pitfalls.** Forgetting the boundary term $e^{-\lambda t}B_t$; wrong variance ($\frac1{\lambda^2}\cdot\frac1{2\lambda}$).

### Exercise 12 (★★, 20 min). Brownian bridge (Example 6.10, assignment 2026 Problem 2.3a)

Let $a,b\in\mathbb R$ and, for $t\in[0,1)$, $X_t=a(1-t)+bt+(1-t)\int_0^t\frac{dB_s}{1-s}$. (a) Show $X$ is an Itô process and find its differential in terms of $X_t$. (b) Compute $E[X_t]$, $\operatorname{Var}(X_t)$, and show $X_t\to b$ in $L^2$ as $t\to1$.

**Strategy.** Product rule on $(1-t)\cdot I_t$, $I_t=\int_0^t\frac{dB_s}{1-s}$; express the drift in terms of $X$.

**Full solution.** (a) For fixed $T<1$, $s\mapsto\frac1{1-s}$ is bounded on $[0,T]$, so $I_t$ is a well-defined continuous martingale on $[0,T]$ with $dI_t=\frac{dB_t}{1-t}$. Let $Z_t=(1-t)I_t$. Since $1-t$ is deterministic with $d(1-t)=-dt$ (zero bracket), the product rule gives
$$
dZ_t=-I_t\,dt+(1-t)\frac{dB_t}{1-t}=-I_t\,dt+dB_t=-\frac{Z_t}{1-t}\,dt+dB_t .
$$
Then $X_t=a(1-t)+bt+Z_t$, so $dX_t=(b-a)\,dt+dZ_t$. Using $Z_t=X_t-a(1-t)-bt$:
$$
(b-a)-\frac{X_t-a(1-t)-bt}{1-t}=b-a-\frac{X_t}{1-t}+a+\frac{bt}{1-t}=\frac{b(1-t)+bt-X_t}{1-t}=\frac{b-X_t}{1-t}.
$$
Hence
$$
dX_t=\frac{b-X_t}{1-t}\,dt+dB_t,\qquad X_0=a .
$$
The drift is continuous on $[0,T]$, so in $M^1_{loc}([0,T])$, and $G\equiv1$: $X$ is an Itô process on $[0,T]$ for every $T<1$.

(b) $E[X_t]=a(1-t)+bt$, and by the isometry
$$
\operatorname{Var}(X_t)=(1-t)^2\int_0^t\frac{ds}{(1-s)^2}=(1-t)^2\Big(\frac1{1-t}-1\Big)=t(1-t).
$$
Hence $E[(X_t-b)^2]=(a-b)^2(1-t)^2+t(1-t)\to0$ as $t\to1$. (The drift pulls $X$ towards $b$, with strength $\frac1{1-t}\to\infty$.)

**Common pitfalls.** Forgetting that the integral only exists on $[0,T]$, $T<1$; algebra errors when rewriting the drift; writing $d\big((1-t)I_t\big)=(1-t)\,dI_t$ only (forgetting $-I_t\,dt$).

### Exercise 13 (★★, 20 min). Ornstein-Uhlenbeck by variation of constants (assignment 2026 Problem 2.3b)

Let $Y_t=xe^{\lambda t}+\sigma e^{\lambda t}\int_0^te^{-\lambda s}\,dB_s$, $t\ge0$ ($\lambda,\sigma>0$, $x\in\mathbb R$). (a) Show that $dY_t=\lambda Y_t\,dt+\sigma\,dB_t$. (b) Compute $E[Y_t]$ and $E[Y_t^2]$, first directly, then via an ODE obtained from Itô's formula.

**Strategy.** Product rule with the deterministic factor $e^{\lambda t}$. For the ODE use $d(Y^2)=2Y\,dY+\sigma^2dt$.

**Full solution.** (a) Let $I_t=\int_0^te^{-\lambda s}dB_s$, $dI_t=e^{-\lambda t}dB_t$. Since $e^{\lambda t}$ has no $dB$-part,
$$
d(e^{\lambda t}I_t)=\lambda e^{\lambda t}I_t\,dt+e^{\lambda t}e^{-\lambda t}\,dB_t=\lambda e^{\lambda t}I_t\,dt+dB_t .
$$
So $dY_t=\lambda xe^{\lambda t}dt+\sigma\lambda e^{\lambda t}I_t\,dt+\sigma\,dB_t=\lambda Y_t\,dt+\sigma\,dB_t$, $Y_0=x$.

(b) *Directly.* $I_t$ is centred Gaussian with $E[I_t^2]=\int_0^te^{-2\lambda s}ds=\frac{1-e^{-2\lambda t}}{2\lambda}$. So $E[Y_t]=xe^{\lambda t}$ and
$$
E[Y_t^2]=x^2e^{2\lambda t}+\sigma^2e^{2\lambda t}\frac{1-e^{-2\lambda t}}{2\lambda}=x^2e^{2\lambda t}+\frac{\sigma^2}{2\lambda}\big(e^{2\lambda t}-1\big).
$$
*Via ODEs.* $m_1(t)=E[Y_t]$: $Y_t=x+\lambda\int_0^tY_sds+\sigma B_t$ gives $m_1'=\lambda m_1$, $m_1(0)=x$, so $m_1=xe^{\lambda t}$. For $m_2(t)=E[Y_t^2]$: by Itô,
$$
d(Y_t^2)=2Y_t\,dY_t+\sigma^2dt=(2\lambda Y_t^2+\sigma^2)\,dt+2\sigma Y_t\,dB_t .
$$
$Y$ is Gaussian with mean and variance continuous in $t$, so $E\int_0^TY_s^2ds<\infty$ and the $dB$ part has mean $0$. Hence $m_2'=2\lambda m_2+\sigma^2$, $m_2(0)=x^2$, whose solution is $m_2(t)=x^2e^{2\lambda t}+\frac{\sigma^2}{2\lambda}(e^{2\lambda t}-1)$, matching.

*Remark.* With $-\lambda$ in place of $\lambda$ (mean-reverting OU, $dY=-\lambda Y\,dt+\sigma\,dB$) the variance tends to $\frac{\sigma^2}{2\lambda}$.

**Common pitfalls.** Treating $e^{\lambda t}\int_0^te^{-\lambda s}dB_s$ as $\int_0^te^{\lambda(t-s)}dB_s$ and then "differentiating under the integral" (the integrand depends on $t$, so this needs the product rule); forgetting $\sigma^2dt$ in $d(Y^2)$.

### Exercise 14 (★★, 15 min). Brackets and covariations

Let $X_t=B_t^2$, $Y_t=\sin B_t$, $U_t=\int_0^tB_s\,dB_s+t$. (a) Compute $\langle X\rangle_t$, $\langle Y\rangle_t$, $\langle X,Y\rangle_t$, $\langle U\rangle_t$, $\langle U,X\rangle_t$. (b) Compute $E[\langle X\rangle_t]$ and $\operatorname{Var}\big(\int_0^tB_s\,dB_s\big)$. (c) Show that $\big(\int_0^tB_sdB_s\big)^2-\int_0^tB_s^2ds$ is a martingale.

**Strategy.** Bracket = integral of the product of the $dB$-coefficients. Drifts are irrelevant.

**Full solution.** (a) $dX=dt+2B\,dB$, $dY=\cos B\,dB-\frac12\sin B\,dt$, $dU=dt+B\,dB$. Hence
$$
\langle X\rangle_t=4\int_0^tB_s^2ds,\quad\langle Y\rangle_t=\int_0^t\cos^2B_s\,ds,\quad\langle X,Y\rangle_t=2\int_0^tB_s\cos B_s\,ds,
$$
$$
\langle U\rangle_t=\int_0^tB_s^2ds,\qquad\langle U,X\rangle_t=2\int_0^tB_s^2ds .
$$
(b) $E\langle X\rangle_t=4\int_0^ts\,ds=2t^2$. Since $B\in M^2$, $\int_0^tB\,dB$ is a centred martingale with $\operatorname{Var}=E\int_0^tB_s^2ds=\frac{t^2}2$. (Check: $\int_0^tBdB=\frac12(B_t^2-t)$, $\operatorname{Var}=\frac14\operatorname{Var}(B_t^2)=\frac14\cdot2t^2$.)

(c) $M_t=\int_0^tB\,dB$, $dM=B\,dB$; by Itô, $d(M^2)=2M\,dM+B^2dt$, so $d\big(M^2-\int_0^\cdot B^2\big)=2M_tB_t\,dB_t$. The integrand $2MB=(B^2-t)B$ is a polynomial in $B$ and $t$, so it is in $M^2([0,T])$, hence a martingale. (This is also Proposition 5.36 in the syllabus: $M^2-\langle M\rangle$.)

**Common pitfalls.** Including drift contributions in brackets; forgetting the factor 4 in $\langle B^2\rangle$.

### Exercise 15 (★★, 20 min). Itô's formula for $X_t^2$, $X$ an Itô process

(a) For $dX=F\,dt+G\,dB$, show $d(X_t^2)=2X_t\,dX_t+G_t^2\,dt$. (b) Let $X_t=\int_0^te^{B_s}dB_s$. Compute $E[X_t^2]$ in two ways. (c) Let $X_t=\int_0^ts\,dB_s$. Compute $E[X_t^4]$ via an ODE and check with Gaussianity. (d) Let $dS_t=\mu S_t\,dt+\sigma S_t\,dB_t$, $S_0=s_0$, $S_t=s_0\exp((\mu-\frac{\sigma^2}{2})t+\sigma B_t)$. Compute $E[S_t^2]$ via an ODE.

**Strategy.** $f(x)=x^2$: $f'=2x$, $f''=2$. Take expectations after checking the $dB$ part is a martingale.

**Full solution.** (a) Itô (Example 6.8): $d(X^2)=2X\,dX+\frac12\cdot2\,G^2dt=(2XF+G^2)dt+2XG\,dB$.

(b) *Isometry:* $e^{B}\in M^2$ since $E\int_0^te^{2B_s}ds=\int_0^te^{2s}ds<\infty$, so $E[X_t^2]=\int_0^te^{2s}ds=\frac{e^{2t}-1}{2}$. *Via (a):* $d(X^2)=2Xe^B\,dB+e^{2B}dt$. Taking expectations (the integrand $2Xe^B$ is in $M^2$: $E[X_s^2e^{2B_s}]\le(E X_s^4)^{1/2}(Ee^{4B_s})^{1/2}$ and $E X_s^4\le c_4\,s\int_0^sE e^{4B_u}du$ by Proposition 6.21, finite and bounded on $[0,t]$), $m'(t)=E[e^{2B_t}]=e^{2t}$, $m(0)=0$. Same answer.

(c) $dX=t\,dB$, $d(X^4)=4X^3t\,dB+\frac12\cdot12X^2t^2dt$. $X$ is Gaussian, so all moments are finite and continuous in $t$, and the $dB$ part is a martingale. Hence $m_4'(t)=6t^2m_2(t)=6t^2\cdot\frac{t^3}{3}=2t^5$, $m_4(t)=\frac{t^6}3$. Check: $X_t\sim N(0,\frac{t^3}3)$, $E X^4=3\cdot\frac{t^6}9=\frac{t^6}3$. This matches.

(d) $d(S^2)=2S\,dS+\sigma^2S^2dt=(2\mu+\sigma^2)S^2dt+2\sigma S^2dB$. $E\int_0^TS_s^4ds<\infty$ (lognormal), so the $dB$ part has mean 0 and $m'=(2\mu+\sigma^2)m$, $m(0)=s_0^2$: $E[S_t^2]=s_0^2e^{(2\mu+\sigma^2)t}$. Check: $E[S_t^2]=s_0^2e^{(2\mu-\sigma^2)t}E[e^{2\sigma B_t}]=s_0^2e^{(2\mu-\sigma^2)t+2\sigma^2t}$. This matches.

**Common pitfalls.** Writing $d(X^2)=2X\,dX$ (classical chain rule); using $G^2dt$ with the wrong $G$ (the $dB$-coefficient, not the drift).

### Exercise 16 (★★, 20 min). Martingale representation via Itô (Baldi 8.18b, 8.19)

Find $\mathcal F_t$-adapted $X\in M^2([0,T])$ with (a) $B_T^3=\int_0^TX_s\,dB_s$; (b) $\int_0^TB_s\,ds=\int_0^TX_s\,dB_s$; (c) $\int_0^TB_s^2\,ds=\frac{T^2}{2}+\int_0^TX_s\,dB_s$.

**Strategy.** Compute the martingale $M_t=E[\xi\mid\mathcal F_t]$ explicitly, then its differential $dM_t=X_t\,dB_t$; finally $\xi=M_T=M_0+\int_0^TX\,dB$.

**Full solution.** (a) $E[B_T^3\mid\mathcal F_t]=E[(B_t+(B_T-B_t))^3\mid\mathcal F_t]=B_t^3+3B_t(T-t)$ (independent increments, odd moments 0, $E(B_T-B_t)^2=T-t$). So $M_t=B_t^3+3(T-t)B_t$ and
$$
dM_t=3B_t^2dB_t+3B_tdt-3B_tdt+3(T-t)dB_t=3\big(B_t^2+T-t\big)\,dB_t .
$$
$M_0=0$, so $X_t=3(B_t^2+T-t)$.

(b) $M_t=E[\int_0^TB_sds\mid\mathcal F_t]=\int_0^tB_sds+\int_t^TE[B_s\mid\mathcal F_t]ds=\int_0^tB_sds+(T-t)B_t$. Then $dM_t=B_tdt-B_tdt+(T-t)dB_t=(T-t)\,dB_t$, $M_0=0$: $X_t=T-t$. (Compare Exercise 10(c).)

(c) $E[B_s^2\mid\mathcal F_t]=B_t^2+(s-t)$ for $s\ge t$. So
$$
M_t=\int_0^tB_s^2ds+(T-t)B_t^2+\frac{(T-t)^2}{2}.
$$
$d\big((T-t)B_t^2\big)=-B_t^2dt+(T-t)(dt+2B_tdB_t)$ and $d\frac{(T-t)^2}{2}=-(T-t)dt$. Summing with $B_t^2dt$: $dM_t=2(T-t)B_t\,dB_t$. $M_0=\frac{T^2}2$, so $X_t=2(T-t)B_t$.

**Common pitfalls.** Forgetting the time-dependence in $M_t$ (the $(T-t)$ factors) when differentiating; forgetting $M_0$.

### Exercise 17 (★, 10 min). Integrals of stochastic exponentials (Baldi 8.4)

(a) For $\sigma\ne0$, show $\int_0^te^{\sigma B_s-\frac12\sigma^2s}dB_s=\frac1\sigma\big(e^{\sigma B_t-\frac12\sigma^2t}-1\big)$. (b) Compute $\int_0^t\exp\big(\int_0^sB_udB_u-\frac12\int_0^sB_u^2du\big)B_s\,dB_s$.

**Strategy.** Proposition 6.13: $Y_t=1+\lambda\int_0^tY_sX_s\,dB_s$.

**Full solution.** (a) Take $X\equiv1$, $\lambda=\sigma$: $Y_t=e^{\sigma B_t-\frac{\sigma^2}{2}t}=1+\sigma\int_0^tY_s\,dB_s$; divide by $\sigma$.

(b) Take $X_s=B_s\in M^2_{loc}$, $\lambda=1$: $Y_t=\mathcal E(B)_t=1+\int_0^tY_sB_s\,dB_s$. So the integral equals $\exp\big(\int_0^tB_udB_u-\frac12\int_0^tB_u^2du\big)-1$. Using $\int_0^tBdB=\frac12(B_t^2-t)$, this is $\exp\big(\frac12B_t^2-\frac t2-\frac12\int_0^tB_u^2du\big)-1$.

**Common pitfalls.** Forgetting the $-1$ (from $Y_0=1$).

### Exercise 18 (★★, 15 min). Bounded integrands give true martingales

Let $X\in M^2([0,T])$ with $|X_s|\le K$. Show that $\mathcal E(X)_t=\exp\left(\int_0^tX\,dB-\frac12\int_0^tX^2ds\right)$ is a square integrable martingale and $E[\mathcal E(X)_t^2]\le e^{K^2t}$.

**Strategy.** Remark 6.14(2): show $\mathcal E(X)X\in M^2$. Write $\mathcal E(X)^2$ as $\mathcal E(2X)$ times a bounded factor.

**Full solution.** Let $Y=\mathcal E(X)$. Then
$$
Y_t^2=\exp\Big(2\int_0^tX\,dB-\int_0^tX^2ds\Big)=\exp\Big(\int_0^t2X\,dB-\frac12\int_0^t(2X)^2ds\Big)\exp\Big(\int_0^tX^2ds\Big)=\mathcal E(2X)_t\,e^{\int_0^tX^2ds}.
$$
$\mathcal E(2X)$ is a positive supermartingale with $E[\mathcal E(2X)_t]\le1$ (Proposition 6.13), and $e^{\int_0^tX^2}\le e^{K^2t}$. Hence $E[Y_t^2]\le e^{K^2t}$ and
$$
E\int_0^TY_s^2X_s^2ds\le K^2\int_0^Te^{K^2s}ds<\infty .
$$
So $YX\in M^2([0,T])$, and by Remark 6.14(2) (i.e. $Y_t=1+\int_0^tY_sX_s\,dB_s$ with an $M^2$ integrand) $Y$ is a square integrable martingale.

**Common pitfalls.** Trying to bound $E[e^{2\int X\,dB}]$ directly without the supermartingale trick; forgetting that the supermartingale property gives only $\le1$, which is enough.

### Exercise 19 (★★★, 25 min). Baldi 8.6

Let $\lambda\in\mathbb R\setminus\{0\}$ and $M_t=e^{\lambda t}B_t-\lambda\int_0^te^{\lambda u}B_u\,du$. (a) Show $M$ is a square integrable martingale; find $\langle M\rangle$. (b) For $\lambda<0$, show $M$ is uniformly integrable and find the law of $M_\infty$. (c) Show $Z_t=e^{M_t-\frac1{4\lambda}(e^{2\lambda t}-1)}$ is a martingale. For $\lambda<0$ find the law of $Z_\infty$; for $\lambda>0$ compute $E[Z_t^p]$, $0<p<1$, and identify $Z_\infty$.

**Strategy.** Product rule gives $M_t=\int_0^te^{\lambda u}dB_u$, a Gaussian martingale; then exponential martingale and martingale convergence.

**Full solution.** (a) $d(e^{\lambda t}B_t)=\lambda e^{\lambda t}B_tdt+e^{\lambda t}dB_t$, so $dM_t=e^{\lambda t}dB_t$, $M_t=\int_0^te^{\lambda u}dB_u$, a square integrable martingale with $\langle M\rangle_t=\int_0^te^{2\lambda u}du=\frac{e^{2\lambda t}-1}{2\lambda}$.

(b) If $\lambda<0$, $E[M_t^2]=\langle M\rangle_t\le\frac1{2|\lambda|}$, so $M$ is bounded in $L^2$, hence uniformly integrable, and $M_t\to M_\infty$ a.s. and in $L^2$. As an $L^2$-limit of centred Gaussians with variances $\to\frac1{2|\lambda|}$: $M_\infty\sim N(0,\frac{1}{2|\lambda|})$.

(c) $\frac1{4\lambda}(e^{2\lambda t}-1)=\frac12\langle M\rangle_t$, so $Z=\mathcal E(e^{\lambda\cdot})$, the stochastic exponential of a deterministic integrand: a martingale (Exercise 4(b)).

- $\lambda<0$: $Z_t=e^{M_t-\frac12\langle M\rangle_t}\to e^{M_\infty-\frac1{4|\lambda|}}$ a.s., so $\log Z_\infty\sim N\big(-\frac1{4|\lambda|},\frac1{2|\lambda|}\big)$: lognormal. (Here $E[Z_\infty]=1$.)
- $\lambda>0$: $E[Z_t^p]=e^{-\frac p2\langle M\rangle_t}E[e^{pM_t}]=e^{\frac{p^2-p}{2}\langle M\rangle_t}\to0$ for $0<p<1$, since $\langle M\rangle_t\to\infty$. $Z$ is a positive martingale, hence converges a.s. to some $Z_\infty\ge0$ (Theorem 4.29). By Fatou, $E[Z_\infty^p]\le\liminf_tE[Z_t^p]=0$, so $Z_\infty=0$ a.s. (A martingale with $E[Z_t]=1$ for all $t$ but $Z_\infty=0$: not uniformly integrable.)

**Common pitfalls.** Confusing $\langle M\rangle$ with $E[M]$; for $\lambda>0$ concluding $E[Z_\infty]=1$ (there is no $L^1$ convergence).

### Exercise 20 (★★★, 30 min). A martingale with $E=1$ that tends to 0 (Baldi 8.14)

For $0\le t<1$ let $Z_t=\frac{1}{\sqrt{1-t}}\exp\Big(-\frac{B_t^2}{2(1-t)}\Big)$.

(a) Show $Z$ is a continuous martingale on $[0,1)$. (b) Compute $E[Z_t^p]$, $p>0$. Is $Z_t$ square integrable? Is $Z$ bounded in $L^2$? (c) Find $\lim_{t\to1}Z_t$. (d) Find $X\in M^2_{loc}([0,1))$ with $Z_t=\mathcal E(X)_t$.

**Strategy.** $f(x,t)=(1-t)^{-1/2}e^{-x^2/(2(1-t))}$ solves the backward heat equation $f_t+\frac12f_{xx}=0$. For (d) apply Itô to $\log Z$.

**Full solution.** (a) Let $s=1-t$. Compute $f_x=-\frac{x}{s}f$, $f_{xx}=\big(\frac{x^2}{s^2}-\frac1s\big)f$, and $f_t=\big(\frac1{2s}-\frac{x^2}{2s^2}\big)f$ (since $\partial_ts=-1$: $\partial_t s^{-1/2}=\frac12s^{-3/2}$ and $\partial_t\big(-\frac{x^2}{2s}\big)=-\frac{x^2}{2s^2}$). Hence $f_t+\frac12f_{xx}=0$ and
$$
dZ_t=-\frac{B_t}{1-t}Z_t\,dB_t .
$$
For $T<1$ the integrand is bounded on $[0,T]$: $\big|\frac{x}{s}f\big|=s^{-3/2}|x|e^{-x^2/(2s)}\le s^{-3/2}\sqrt{s/e}\le(1-T)^{-1}$. So it is in $M^2([0,T])$, and $Z$ is a martingale on $[0,T]$ for every $T<1$.

(b) With $E[e^{-cB_t^2}]=(1+2ct)^{-1/2}$ and $c=\frac{p}{2(1-t)}$: $1+2ct=\frac{1-t+pt}{1-t}$, so
$$
E[Z_t^p]=(1-t)^{-p/2}\Big(\frac{1-t}{1+(p-1)t}\Big)^{1/2}=(1-t)^{\frac{1-p}{2}}\big(1+(p-1)t\big)^{-1/2}.
$$
For $p=1$ this is 1 (consistent with (a)). For $p=2$: $E[Z_t^2]=(1-t^2)^{-1/2}<\infty$ for each $t<1$, but $\to\infty$ as $t\to1$: square integrable, **not** bounded in $L^2$.

(c) $B_1\ne0$ a.s., so $\frac{B_t^2}{2(1-t)}\to+\infty$ and $Z_t=(1-t)^{-1/2}e^{-B_t^2/(2(1-t))}\to0$ a.s. (exponential beats the power). So $E[Z_t]=1$ for all $t<1$ but $Z_t\to0$: not uniformly integrable.

(d) $\log Z_t=-\frac12\log(1-t)-\frac{B_t^2}{2(1-t)}$. By Itô,
$$
d\log Z_t=\frac{dt}{2(1-t)}-\frac{B_t\,dB_t}{1-t}-\frac{dt}{2(1-t)}-\frac{B_t^2}{2(1-t)^2}dt=-\frac{B_t}{1-t}dB_t-\frac12\Big(\frac{B_t}{1-t}\Big)^2dt .
$$
So $Z=\mathcal E(X)$ with $X_s=-\frac{B_s}{1-s}$ (and $\log Z_0=0$).

**Common pitfalls.** Sign of $\partial_t(1-t)^{-1/2}$; concluding $E[\lim Z_t]=\lim E[Z_t]$.

### Exercise 21 (★★, 15 min). Time change for deterministic integrands (Baldi 8.11, 8.10a)

(a) Let $X_t=\int_0^t\frac{dB_s}{\sqrt{1+s}}$. Compute $P\big(\sup_{0\le t\le3}X_t\ge1\big)$. (b) Let $X^\varepsilon_t=\sqrt2\int_0^t\sin\frac s\varepsilon\,dB_s$. Find the limit in law of $X^\varepsilon_t$ as $\varepsilon\to0$.

**Strategy.** Corollary 6.20: $X_t=W_{A_t}$ with $A_t=\int_0^tX_s^2ds$. If $A$ is deterministic, continuous, strictly increasing, then $\sup_{t\le T}X_t=\sup_{u\le A_T}W_u$. Then the reflection principle $P(\sup_{u\le a}W_u\ge x)=2P(W_a\ge x)$.

**Full solution.** (a) $A_t=\int_0^t\frac{ds}{1+s}=\log(1+t)\to\infty$, continuous and strictly increasing. By Theorem 6.17 and Corollary 6.20 there is a BM $W$ with $X_t=W_{\log(1+t)}$. As $t$ ranges over $[0,3]$, $A_t$ ranges over $[0,\log4]$, so
$$
P\Big(\sup_{0\le t\le3}X_t\ge1\Big)=P\Big(\sup_{0\le u\le\log4}W_u\ge1\Big)=2P(W_{\log4}\ge1)=2\Big(1-\Phi\Big(\frac1{\sqrt{\log4}}\Big)\Big)\approx0.40 .
$$
(b) Deterministic integrand: $X^\varepsilon_t\sim N(0,v_\varepsilon)$ with $v_\varepsilon=2\int_0^t\sin^2\frac s\varepsilon ds=\int_0^t(1-\cos\frac{2s}\varepsilon)ds=t-\frac\varepsilon2\sin\frac{2t}{\varepsilon}\to t$. Characteristic functions $e^{-\theta^2v_\varepsilon/2}\to e^{-\theta^2t/2}$, so $X^\varepsilon_t\to N(0,t)$ in law.

**Common pitfalls.** Using $A_3=3$ (forgetting the clock); for deterministic integrands one could also argue directly with Gaussian processes, but the time change gives the law of the supremum.

### Exercise 22 (★★★, 25 min). Hitting time of a time-changed BM (Baldi 8.12)

Let $\alpha>0$ and $X_t=\sqrt{\alpha+1}\int_0^tu^{\alpha/2}\,dB_u$. (a) Compute $P(\sup_{0\le s\le2}X_s\ge1)$. (b) Let $\tau=\inf\{t>0:X_t\ge1\}$. Find the density of $\tau$. For which $\alpha$ is $E[\tau]<\infty$?

**Strategy.** $A_t=(\alpha+1)\int_0^tu^\alpha du=t^{\alpha+1}$; $\tau$ is the hitting time of $W$ composed with $A^{-1}$.

**Full solution.** (a) $A_t=t^{\alpha+1}$ is a continuous increasing bijection of $[0,\infty)$, so $X_t=W_{t^{\alpha+1}}$ for a BM $W$. Hence
$$
P\Big(\sup_{s\le2}X_s\ge1\Big)=P\Big(\sup_{u\le2^{\alpha+1}}W_u\ge1\Big)=2\Big(1-\Phi\big(2^{-(\alpha+1)/2}\big)\Big).
$$
(b) By continuity, $\{\tau\le t\}=\{\sup_{s\le t}X_s\ge1\}$, so
$$
P(\tau\le t)=2\Big(1-\Phi\big(t^{-(\alpha+1)/2}\big)\Big).
$$
Differentiating, with $\Phi'=\varphi$ and $\frac d{dt}t^{-(\alpha+1)/2}=-\frac{\alpha+1}2t^{-(\alpha+3)/2}$:
$$
f_\tau(t)=(\alpha+1)\,t^{-\frac{\alpha+3}{2}}\varphi\big(t^{-\frac{\alpha+1}2}\big)=\frac{\alpha+1}{\sqrt{2\pi}}\,t^{-\frac{\alpha+3}2}\exp\Big(-\frac{1}{2t^{\alpha+1}}\Big),\qquad t>0 .
$$
$E[\tau]=\int_0^\infty tf_\tau(t)dt$. Near $0$ the exponential makes the integrand vanish; near $\infty$, $tf_\tau(t)\sim c\,t^{-\frac{\alpha+1}{2}}$, integrable iff $\frac{\alpha+1}2>1$. So $E[\tau]<\infty$ iff $\alpha>1$. (For $\alpha=0$, $\tau$ is the hitting time of BM, with infinite mean, as it should.)

**Common pitfalls.** Differentiating the composite function; forgetting that the time-change argument needs $A_t\to\infty$ (here true).

### Exercise 23 (★★★, 20 min). LIL through the clock (Baldi 8.8)

Let $X_t=\int_0^t\frac{dB_s}{\sqrt{2+\sin s}}$. Compute $\limsup_{t\to\infty}\frac{X_t}{\sqrt{2t\log\log t}}$. (Given: $\int_0^{2\pi}\frac{ds}{2+\sin s}=\frac{2\pi}{\sqrt3}$.)

**Strategy.** $X_t=W_{A_t}$, apply the LIL (Theorem 2.16) to $W$ along $A_t\to\infty$, and $A_t\sim t/\sqrt3$.

**Full solution.** $A_t=\int_0^t\frac{ds}{2+\sin s}$ is continuous, strictly increasing and $\ge t/3$, so $A_t\to\infty$; by Corollary 6.20, $X_t=W_{A_t}$ for a BM $W$. Since $A$ is a bijection of $[0,\infty)$,
$$
\limsup_{t\to\infty}\frac{W_{A_t}}{\sqrt{2A_t\log\log A_t}}=\limsup_{u\to\infty}\frac{W_u}{\sqrt{2u\log\log u}}=1\quad\text{a.s.}
$$
By periodicity, $A_t=\frac{t}{\sqrt3}+O(1)$ (each full period contributes $\frac{2\pi}{\sqrt3}$, i.e. average $\frac1{\sqrt3}$ per unit time), so $A_t/t\to\frac1{\sqrt3}$ and $\frac{\log\log A_t}{\log\log t}\to1$. Therefore
$$
\limsup_{t\to\infty}\frac{X_t}{\sqrt{2t\log\log t}}=\lim_{t\to\infty}\sqrt{\frac{A_t\log\log A_t}{t\log\log t}}\cdot1=3^{-1/4}\quad\text{a.s.}
$$

**Common pitfalls.** Answering 1 (forgetting the clock) or $3^{-1/2}$ (forgetting the square root).

### Exercise 24 (★★, 15 min). Applications of the exponential bound

Let $M_t=\int_0^tX_sdB_s$ with $X\in M^2([0,T])$, $\int_0^TX_s^2ds\le k$.

(a) Bound $P\big(\sup_{t\le1}|\int_0^t\sin B_s\,dB_s|\ge3\big)$. (b) Show $E[e^{\alpha\sup_{t\le T}|M_t|}]<\infty$ for every $\alpha>0$; in particular $\sup_t|M_t|$ has moments of all orders. (c) Compare (a) with the Chebyshev-Doob bound of Proposition 5.17.

**Strategy.** Plug in $k$. For (b) use $E[e^{\alpha S}]=1+\int_0^\infty\alpha e^{\alpha x}P(S>x)dx$.

**Full solution.** (a) $\int_0^1\sin^2B_s\,ds\le1=k$. So the probability is $\le2e^{-9/2}\approx0.022$.

(b) Let $S=\sup_{t\le T}|M_t|$. For a nonnegative random variable, $E[e^{\alpha S}]=1+\int_0^\infty\alpha e^{\alpha x}P(S>x)\,dx$ (Fubini). By Proposition 6.15,
$$
E[e^{\alpha S}]\le1+2\alpha\int_0^\infty e^{\alpha x-\frac{x^2}{2k}}dx<\infty ,
$$
since the Gaussian factor dominates. Since $x^p\le C_{p,\alpha}e^{\alpha x}$, all moments of $S$ are finite.

(c) Proposition 5.17 gives $P(S>3)\le\frac19E\int_0^1\sin^2B_sds\le\frac19\approx0.11$: the exponential bound is five times better here, and much better for large $x$ (Gaussian versus polynomial decay).

**Common pitfalls.** Using a random $k$ (e.g. $\int_0^TB_s^2ds$ is not bounded, so the bound does not apply to $\int B\,dB$).

### Exercise 25 (★★★, 20 min). A strong law for stochastic integrals

Let $X$ be progressively measurable with $|X_s|\le c$ for all $s\ge0$. Show that $\frac1t\int_0^tX_s\,dB_s\to0$ a.s. as $t\to\infty$.

**Strategy.** Exponential bound on $[0,n]$ with $k=c^2n$, Borel-Cantelli, then interpolate between integers.

**Full solution.** Fix $\varepsilon>0$. Let $M_t=\int_0^tX\,dB$, $S_n=\sup_{t\le n}|M_t|$. Since $\int_0^nX^2\le c^2n$, Proposition 6.15 gives
$$
P(S_n\ge\varepsilon n)\le2\exp\Big(-\frac{\varepsilon^2n^2}{2c^2n}\Big)=2e^{-\varepsilon^2n/(2c^2)},
$$
which is summable in $n$. By Borel-Cantelli, a.s. $S_n<\varepsilon n$ for all $n\ge n_0(\omega)$. For $t\in[n-1,n]$ with $n\ge\max(n_0,2)$:
$$
\frac{|M_t|}{t}\le\frac{S_n}{n-1}<\varepsilon\frac{n}{n-1}\le2\varepsilon .
$$
So $\limsup_t|M_t|/t\le2\varepsilon$ a.s.; take $\varepsilon=1/m$, $m\in\mathbb N$ (countable intersection). $\square$

**Common pitfalls.** Applying Borel-Cantelli at fixed times only and forgetting the interpolation between integers (that is why we bound the supremum).

### Exercise 26 (★★, 15 min). Using the maximal $L^p$ estimate

(a) Show $E\big[\sup_{t\le T}\big|\int_0^tB_s\,dB_s\big|^4\big]\le c_4T^4$, compute $c_4$ from the proof, and compare with the exact $E\big[(\int_0^TB\,dB)^4\big]$. (b) Let $X_t=x+\int_0^tb_sds+\int_0^t\sigma_sdB_s$ with $|b|,|\sigma|\le K$. Show $E[\sup_{t\le T}|X_t|^p]\le3^{p-1}\big(|x|^p+K^pT^p+c_pK^pT^{p/2}\big)$ for $p\ge2$.

**Strategy.** Proposition 6.21 with $p=4$; for (b) use $|a+b+c|^p\le3^{p-1}(|a|^p+|b|^p+|c|^p)$.

**Full solution.** (a) By Proposition 6.21 with $p=4$: $E[\sup|M|^4]\le c_4E[(\int_0^TB_s^2ds)^2]\le c_4T\,E\int_0^TB_s^4ds=c_4T\int_0^T3s^2ds=c_4T^4$. From the proof, $K_4=\frac{4\cdot3}{2}\big(\frac43\big)^4=6\cdot\frac{256}{81}=\frac{512}{27}$ and $c_4=K_4^2=\frac{262144}{729}\approx360$. Exact: $\int_0^TB\,dB=\frac12(B_T^2-T)=\frac T2(Z^2-1)$ with $Z\sim N(0,1)$, and $E(Z^2-1)^4=EZ^8-4EZ^6+6EZ^4-4EZ^2+1=105-60+18-4+1=60$. So $E[(\int_0^TB\,dB)^4]=\frac{60}{16}T^4=\frac{15}4T^4$; by Doob, the supremum has fourth moment at most $(\frac43)^4\cdot\frac{15}{4}T^4\approx11.9\,T^4$. The constant $c_4$ is far from sharp, but the **order $T^4$** is right.

(b) $\sup_t|X_t|\le|x|+\int_0^T|b_s|ds+\sup_t|\int_0^t\sigma\,dB|\le|x|+KT+\sup_t|\int_0^t\sigma\,dB|$. By convexity and Proposition 6.21,
$$
E\Big[\sup_t|X_t|^p\Big]\le3^{p-1}\Big(|x|^p+K^pT^p+c_pE\Big[\Big(\int_0^T\sigma^2\Big)^{p/2}\Big]\Big)\le3^{p-1}\big(|x|^p+K^pT^p+c_pK^pT^{p/2}\big).
$$
This is the type of estimate used for a priori moment bounds of SDEs (Theorem 8.10).

**Common pitfalls.** Forgetting the factor $T^{(p-2)/2}$ or the $3^{p-1}$.

### Exercise 27 (★★★, 15 min). Hölder continuity of stochastic integrals

Let $|X_s|\le K$ and $I_t=\int_0^tX\,dB$. Show $E|I_t-I_s|^p\le c_pK^p|t-s|^{p/2}$ for $p\ge2$, and deduce that $I$ has paths that are Hölder continuous of every order $\gamma<\frac12$.

**Strategy.** Maximal $L^p$ estimate on $[s,t]$; Kolmogorov's continuity theorem (Theorem 1.15).

**Full solution.** $I_t-I_s=\int_0^tX_u\mathbf 1_{[s,t]}(u)\,dB_u$. Apply Proposition 6.21 to the integrand $X\mathbf 1_{[s,t]}$:
$$
E|I_t-I_s|^p\le c_pE\Big[\Big(\int_s^tX_u^2du\Big)^{p/2}\Big]\le c_pK^p(t-s)^{p/2}.
$$
Kolmogorov: if $E|I_t-I_s|^\alpha\le C|t-s|^{1+\beta}$ then $I$ has a version that is locally $\gamma$-Hölder for every $\gamma<\beta/\alpha$. Here $\alpha=p$, $\beta=\frac p2-1$, so $\gamma<\frac12-\frac1p$. Since $p$ is arbitrary, every $\gamma<\frac12$ works ($I$ is already continuous, so it is indistinguishable from that version).

**Common pitfalls.** Using only $p=2$ (that gives $\beta=0$, no conclusion).

### Exercise 28 (★, 10 min). Which are martingales? (Øksendal 4.11 style)

Decide which processes are martingales: (a) $B_t^3-3\int_0^tB_s\,ds$; (b) $e^{B_t^2/2}$; (c) $t^2B_t-2\int_0^tsB_s\,ds$; (d) $B_t^4-6\int_0^tB_s^2\,ds$; (e) $B_t^2-2\int_0^tB_s\,dB_s$.

**Strategy.** Compute the differential, look at the drift, check $M^2$.

**Full solution.**

(a) $d(B^3)=3B^2dB+3B\,dt$, so $d\big(B^3-3\int B\big)=3B_t^2dB_t$, integrand in $M^2$: **martingale**.

(b) $f(x)=e^{x^2/2}$, $f'=xf$, $f''=(1+x^2)f$. Drift $\frac12(1+B_t^2)e^{B_t^2/2}>0$: **not** a (local) martingale. (Also $E[e^{B_t^2/2}]=(1-t)^{-1/2}$ for $t<1$ and $=\infty$ for $t\ge1$: not even integrable for $t\ge1$.)

(c) $d(t^2B_t)=2tB_tdt+t^2dB_t$, so the process equals $\int_0^ts^2dB_s$: **martingale**.

(d) $d(B^4)=4B^3dB+6B^2dt$, so the process equals $4\int_0^tB^3dB$: **martingale**.

(e) $B_t^2-2\int_0^tBdB=t$: deterministic and increasing, **not** a martingale.

**Common pitfalls.** In (b), "drift is positive" already decides; no need to check integrability for the negative answer.

### Exercise 29 (★★, 15 min). Geometric Brownian motion

Let $S_t=s_0\exp\big((\mu-\frac{\sigma^2}2)t+\sigma B_t\big)$, $s_0>0$. (a) Show $dS_t=\mu S_t\,dt+\sigma S_t\,dB_t$. (b) For which $\mu$ is $S$ a martingale, a submartingale, a supermartingale? (c) Compute $d(\log S_t)$ and $\langle S\rangle_t$.

**Strategy.** $S=f(B_t,t)$ with $f(x,t)=s_0e^{(\mu-\sigma^2/2)t+\sigma x}$.

**Full solution.** (a) $f_t=(\mu-\frac{\sigma^2}2)f$, $f_x=\sigma f$, $f_{xx}=\sigma^2f$, so $dS=\big(\mu-\frac{\sigma^2}{2}+\frac{\sigma^2}2\big)S\,dt+\sigma S\,dB=\mu S\,dt+\sigma S\,dB$.

(b) $S_t=s_0e^{\mu t}\mathcal E_t$ with $\mathcal E_t=e^{\sigma B_t-\sigma^2t/2}$ a martingale (Exercise 4). So $E[S_t\mid\mathcal F_s]=e^{\mu(t-s)}S_s$: martingale iff $\mu=0$, submartingale iff $\mu\ge0$, supermartingale iff $\mu\le0$.

(c) $\log S_t=\log s_0+(\mu-\frac{\sigma^2}2)t+\sigma B_t$, so $d\log S_t=(\mu-\frac{\sigma^2}2)dt+\sigma dB_t$. Equivalently, by Itô on $\log$: $d\log S=\frac{dS}{S}-\frac12\frac{\sigma^2S^2}{S^2}dt$. $\langle S\rangle_t=\sigma^2\int_0^tS_u^2du$.

**Common pitfalls.** Writing $d\log S=\frac{dS}{S}$ (no correction).

### Exercise 30 (★★★, 20 min). Laplace transform of a hitting time via the exponential martingale

Let $a>0$ and $\tau_a=\inf\{t:B_t=a\}$. Show $E[e^{-\lambda\tau_a}]=e^{-a\sqrt{2\lambda}}$ for $\lambda>0$.

**Strategy.** $M_t=e^{\theta B_t-\theta^2t/2}$ is a martingale (Proposition 6.13 with $X\equiv1$, plus Remark 6.14); stop it at $\tau_a$; bounded convergence.

**Full solution.** Fix $\theta>0$. $M$ is a martingale (Exercise 4), so the stopped process $M_{t\wedge\tau_a}$ is a martingale and $E[M_{t\wedge\tau_a}]=1$. For $t\le\tau_a$, $B_t\le a$, so $0<M_{t\wedge\tau_a}\le e^{\theta a}$. As $t\to\infty$: on $\{\tau_a<\infty\}$ (which has probability 1 by recurrence of BM), $M_{t\wedge\tau_a}\to e^{\theta a-\theta^2\tau_a/2}$. By bounded convergence,
$$
E\big[e^{\theta a-\frac{\theta^2}{2}\tau_a}\big]=1\quad\Longrightarrow\quad E\big[e^{-\frac{\theta^2}2\tau_a}\big]=e^{-\theta a}.
$$
Put $\lambda=\frac{\theta^2}2$, i.e. $\theta=\sqrt{2\lambda}$. $\square$

(Letting $\lambda\downarrow0$ recovers $P(\tau_a<\infty)=1$, consistent. Differentiating at $\lambda=0$ shows $E[\tau_a]=\infty$.)

**Common pitfalls.** Using $\theta<0$ (then $M_{t\wedge\tau_a}$ is not bounded); forgetting to justify the limit $t\to\infty$.

## 6. Predicted exam questions

Ranked by likelihood.

1. **State Itô's formula and prove it for $f(x,t)=P(x)g(t)$.** Outline: induction $d(X^n)=d(X\cdot X^{n-1})$ via product rule; linearity; $d(P(X)g)=g\,dP(X)+P(X)g'dt$; sums.
2. **Computational Itô question** (very likely several): compute $df(B_t,t)$, decide martingale/sub/super, compute moments. Outline: Itô, look at drift, check $M^2$, take expectations.
3. **State and prove the product rule (elementary processes).** Outline: constant random $\mathcal F_{t_1}$-measurable coefficients, expand $(F_1t+G_1B)(F_2t+G_2B)$, use $d(t^2),d(tB),d(B^2)$, regroup; sum over intervals.
4. **State and prove Proposition 6.13 (stochastic exponential).** Outline: Itô on $e^Z$, $dY=\lambda XY\,dB$, local martingale; positive local martingale is a supermartingale (Fatou), $E Y_t\le1$. Plus: when is it a martingale (Remark 6.14).
5. **Show that a given process is an Itô process and find its SDE** (Brownian bridge, OU in variation-of-constants form, GBM). Outline: product rule with the deterministic factor; rewrite drift in terms of $X$.
6. **State and prove the exponential bound.** Outline: $Z^\theta=e^{\theta M-\theta^2A/2}$ supermartingale, inclusion of events using $A\le k$, maximal inequality, $\theta=x/k$, symmetric for $-M$.
7. **State and prove the maximal $L^p$ estimate (bounded case).** Outline: Itô on $|x|^p$, expectation, $S^{p-2}$ bound, Doob, Hölder $(\frac p{p-2},\frac p2)$, divide; pathwise Hölder for the second inequality.
8. **State the time change theorem and the QV clock; use them** (law of $\sup_{t\le T}\int f\,dB$, LIL, hitting times). Outline: $\int_0^tX\,dB=W_{A_t}$, $A_t=\int_0^tX^2$; for deterministic $f$ use reflection principle.
9. **Compute brackets/covariations of Itô processes** and show $M^2-\langle M\rangle$ is a martingale.
10. **Martingale representation by Itô** (find $X$ with $\xi=E\xi+\int X\,dB$ for $\xi=B_T^3$, $\int_0^TB_sds$, $e^{\sigma B_T}$). Outline: compute $E[\xi\mid\mathcal F_t]$ explicitly, differentiate.
11. **Short conceptual questions:** Why is the stochastic exponential only a local martingale in general? Give an example of a positive martingale with $E Z_t=1$ converging to 0 (Exercise 19/20). Why must $k$ be deterministic in Proposition 6.15? Why does Itô's formula have the extra term (Remark 6.12)?

## 7. Flashcards

1. Definition of an Itô process? → Adapted continuous $X$ with $X_{t_2}-X_{t_1}=\int_{t_1}^{t_2}F\,dt+\int_{t_1}^{t_2}G\,dB$, $F\in M^1_{loc}$, $G\in M^2_{loc}$.
2. Uniqueness of the differential? → $F_1dt+G_1dB=F_2dt+G_2dB$ implies $F_1=F_2$, $G_1=G_2$ $dt\otimes P$-a.e.
3. $\langle X,Y\rangle$ for $dX=F\,dt+G\,dB$, $dY=H\,dt+K\,dB$? → $\int_0^tG_sK_s\,ds$.
4. $d(B_t^2)$? → $dt+2B_t\,dB_t$.
5. $d(tB_t)$? → $B_t\,dt+t\,dB_t$.
6. Product rule? → $d(X_1X_2)=X_1dX_2+X_2dX_1+G_1G_2\,dt$.
7. Itô's formula? → $df(X_t,t)=f_tdt+f_xdX+\frac12f_{xx}G^2dt$, with $f_t,f_x,f_{xx}$ continuous.
8. Heuristic table? → $(dB)^2=dt$, $dt\,dB=0$, $(dt)^2=0$.
9. $\int_0^tB\,dB$? → $\frac12(B_t^2-t)$.
10. $\int_0^Tf(s)dB_s$ for $f\in C^1$? → $f(T)B_T-\int_0^TB_sf'(s)ds$.
11. $E[B_t^4]$, $E[B_t^6]$? → $3t^2$, $15t^3$ (via $m_n=\frac{n(n-1)}2\int m_{n-2}$).
12. Brownian bridge SDE? → $dX_t=\frac{b-X_t}{1-t}dt+dB_t$; $\operatorname{Var}X_t=t(1-t)$.
13. $d(e^{\lambda t}\int_0^te^{-\lambda s}dB_s)$? → $\lambda(\cdot)\,dt+dB_t$ (OU).
14. Martingale polynomials $P_3$, $P_4$? → $x^3-3tx$, $x^4-6tx^2+3t^2$.
15. Stochastic exponential SDE? → $dY=\lambda XY\,dB$, $Y_0=1$.
16. Is $\mathcal E(X)$ always a martingale? → No: positive local martingale, hence supermartingale with $E\le1$.
17. Martingale criterion for $\mathcal E(X)$? → $E[Y_t]=1$ for all $t$; or $YX\in M^2$; or $X$ deterministic/bounded; or Novikov.
18. Exponential bound? → $\int_0^TX^2\le k$ (deterministic) implies $P(\sup_{t\le T}|\int_0^tX\,dB|\ge x)\le2e^{-x^2/(2k)}$.
19. Key steps of the exponential bound proof? → $e^{\theta M-\theta^2A/2}$ supermartingale, maximal inequality, $\theta=x/k$, factor 2.
20. Time change theorem? → $\int_0^\infty X^2=\infty$ a.s., $\tau(t)=\inf\{u:A_u>t\}$; $W_t=\int_0^{\tau(t)}X\,dB$ is a BM for $(\mathcal F_{\tau(t)})$.
21. QV clock? → $\int_0^tX\,dB=W_{A_t}$, $A_t=\int_0^tX_s^2ds$.
22. Generalised inverse? → $c(t)=\inf\{s:a(s)>t\}$; right-continuous; jumps of $c$ correspond to flat stretches of $a$.
23. Maximal $L^p$ estimate? → $E\sup|\int X\,dB|^p\le c_pE(\int_0^TX^2)^{p/2}\le c_pT^{\frac{p-2}2}E\int_0^T|X|^p$, $p\ge2$.
24. Key steps of the $L^p$ proof? → Itô on $|x|^p$; Doob; Hölder $(\frac p{p-2},\frac p2)$; divide.
25. Why $p\ge2$ in Proposition 6.21? → $|x|^p$ must be $C^2$ for Itô's formula.
26. $c_2$? → $4$ (Doob + isometry).
27. $\int_0^tB_sds$ as a stochastic integral? → $\int_0^t(t-s)dB_s$, variance $t^3/3$.
28. $\limsup X_t/\sqrt{2t\log\log t}$ for $X=\int dB/\sqrt{2+\sin s}$? → $3^{-1/4}$.
