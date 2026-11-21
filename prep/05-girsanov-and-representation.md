# Girsanov's Theorem and Martingale Representation (Chapter 7: More Stochastic Calculus)

This chapter covers syllabus section 7 (slides 7, handwritten notes pp. 7.1–7.14, Baldi Ch. 12). Numbering follows the course (slides and notes). Baldi's numbers appear in brackets for reference: Prop 7.3 = Baldi Prop 12.1, Lemma 7.4 = Baldi Lemma 12.1 (Baldi proves only one direction), Thm 7.5 = Baldi Thm 12.1, Thm 7.6 = Baldi Thm 12.2, Cor 7.7 = Baldi Cor 12.1, Thm 7.10 = Baldi Thm 12.4.

Results from earlier chapters that we use:

- **Theorem 4.42 (characterization of BM).** Let $X$ be a continuous $m$-dimensional $(\mathcal F_t)$-adapted process with $X_0=0$ a.s. If for every $\lambda\in\mathbb R^m$ the process $Y_t=\exp\big(i\langle\lambda,X_t\rangle+\tfrac12|\lambda|^2t\big)$ is an $(\mathcal F_t)$-martingale, then $X$ is an $(\mathcal F_t)$-Brownian motion.
- **Proposition 4.23 (UI via events).** A family $\mathcal H$ is uniformly integrable if and only if (a) $\sup_{Y\in\mathcal H}E|Y|<\infty$ and (b) for every $\varepsilon>0$ there is $\delta>0$ with $E[|Y|\mathbf 1_A]\le\varepsilon$ for all $Y\in\mathcal H$ and all $A$ with $P(A)\le\delta$.
- **Propositions 6.15 / 6.33 (exponential bound).** If $X\in M^2([0,T])$ and $\int_0^TX_s^2\,ds\le k$ a.s., then $P\big(\sup_{t\le T}\big|\int_0^tX_s\,dB_s\big|\ge x\big)\le 2e^{-x^2/(2k)}$.
- **Itô isometry**, the martingale property of $\int H\,dB$ for $H\in M^2$, and **optional stopping**.

---

## 1. Exam relevance

| Item | Tag | Likelihood | Why |
|---|---|---|---|
| Lemma 7.4 Transferring the martingale property | S&P | Very high | Short proof, two directions. Needed in the proof of Girsanov. An ideal "state and prove" question. |
| Thm 7.5 Girsanov | S&P | Very high | The core theorem of the chapter. Proof = Thm 4.42 + Lemma 7.4 + Prop 7.3 + localization. Also used in Thm 8.25 (weak solutions). |
| Thm 7.10 Representation of $L^2$ random variables | S&P | High | The second big proof. Uniqueness, closedness, density of exponentials. The $Q^+=Q^-$ part may be skipped. |
| Thm 7.6 Novikov and Kazamaki | S | Very high (in exercises) | Every Girsanov exercise needs "check Novikov". The statement must be exact. |
| Prop 7.3 Bounded energy criterion | S | Medium-high | Used inside the Girsanov proof. State it precisely. |
| Thm 7.11 Representation of $L^2$ martingales | S | Medium | A quick consequence of 7.10. Also a possible "deduce 7.11 from 7.10" exercise. |
| Thm 7.12 Representation of local martingales | S | Low-medium | Statement only. Used in the proof of 7.13. |
| Thm 7.13 All equivalent measures | S | Medium | Statement only. A nice "find $\Phi$ for given $dQ/dP$" exercise. |
| Example 7.1 Exponential change of probability | incl. | Very high | Basic Girsanov computation via characteristic function. |
| Def 7.2 Stochastic exponential and its properties | incl. | Very high | Local martingale, supermartingale, "$E Z_T=1$ iff martingale". |
| Cor 7.7 Uniform exponential-moment criterion | incl. | Medium | Used in Example 7.8 (OU under $Q$). |
| Example 7.8 OU law under new measure | incl. | High | Classic exercise. Novikov fails for large $T$, but Cor 7.7 works. |
| Example 7.9 Passage times with drift | incl. | Medium-high | Uses Girsanov + optional stopping. A good longer exercise. |
| Drift of an Itô process after a change of measure | incl. | Very high | "Drift removal" exercises. |
| Augmented Brownian filtration, consequences of representation | incl. | Medium | Conceptual questions: why the natural filtration matters. |

**Strategy.** Learn the proofs of Lemma 7.4 and Theorem 7.5 so you can write them perfectly. Then learn Theorem 7.10 (uniqueness and existence Steps 1–2, plus the idea of Step 3). Drill the computational exercises: Girsanov with Novikov, drift removal, and finding the integrand $\varphi$.

---

## 2. Core definitions and facts

Throughout, $(\Omega,\mathcal F,(\mathcal F_t)_t,(B_t)_t,P)$ is an $m$-dimensional Brownian motion and $T>0$ is a fixed finite horizon.

### 2.1 Example 7.1: an exponential change of probability

Let $B$ be real and $\lambda\in\mathbb R$. Then
$$
M_t=\exp\Big(\lambda B_t-\frac{\lambda^2}{2}t\Big)
$$
is a positive martingale with $E_P[M_t]=1$. Define $Q(A)=E_P[M_T\mathbf 1_A]$ for $A\in\mathcal F$. Then $Q$ is a probability measure. Under $Q$, for $0\le t\le T$,
$$
E_Q\big[e^{i\theta B_t}\big]=E\big[e^{i\theta B_t}M_T\big]=E\big[e^{i\theta B_t}E[M_T\mid\mathcal F_t]\big]=E\big[e^{i\theta B_t}M_t\big]=E\Big[e^{(\lambda+i\theta)B_t-\frac{\lambda^2}{2}t}\Big].
$$
Write $-\frac{\lambda^2}{2}t=-\frac{(\lambda+i\theta)^2}{2}t+i\theta\lambda t-\frac{\theta^2}{2}t$. Then
$$
E_Q\big[e^{i\theta B_t}\big]=E\Big[e^{(\lambda+i\theta)B_t-\frac12(\lambda+i\theta)^2t}\Big]e^{i\theta\lambda t-\frac{\theta^2t}{2}}=e^{i\theta\lambda t-\frac{\theta^2t}{2}}.
$$
The last step uses that the complex exponential $e^{zB_t-z^2t/2}$ has expectation $1$ for every $z\in\mathbb C$. So $B_t\sim N(\lambda t,t)$ under $Q$.

**Notes, p. 7.1.** The stronger claim is that $W_t=B_t-\lambda t$ is an $(\mathcal F_t)$-BM under $Q$ on $[0,T]$. By Theorem 4.42 we must check that $Y_t=e^{i\theta W_t+\frac12\theta^2t}$ is a $Q$-martingale for every $\theta$. For $s\le t\le T$ and $A\in\mathcal F_s$:
$$
\begin{aligned}
E_Q[Y_t\mathbf 1_A]&=E[Y_t\mathbf 1_AM_T]=E[Y_t\mathbf 1_AM_t]=E\Big[\exp\big((\lambda+i\theta)B_t-\tfrac12(\lambda+i\theta)^2t\big)\mathbf 1_A\Big]\\
&=E\Big[\exp\big((\lambda+i\theta)B_s-\tfrac12(\lambda+i\theta)^2s\big)\mathbf 1_A\Big]=E[Y_sM_s\mathbf 1_A]=E[Y_sM_T\mathbf 1_A]=E_Q[Y_s\mathbf 1_A].
\end{aligned}
$$
The middle step uses that $Z^{(z)}_t=\exp(zB_t-\frac12z^2t)$ is a complex martingale for $z=\lambda+i\theta$. Also check that $Y_tM_t=Z^{(\lambda+i\theta)}_t$: the exponent is $i\theta B_t-i\theta\lambda t+\frac12\theta^2t+\lambda B_t-\frac12\lambda^2t$, and $\frac12(\lambda+i\theta)^2=\frac12\lambda^2+i\lambda\theta-\frac12\theta^2$. These agree. **Conclusion:** under $Q$, $B_t=W_t+\lambda t$ is a BM with drift $\lambda$.

### 2.2 Definition 7.2: the stochastic exponential

Let $\Phi$ be a progressively measurable $\mathbb C^m$-valued process in $M^2_{\rm loc}([0,T])$. Then
$$
Z_t=\exp\Big(\int_0^t\Phi_s\cdot dB_s-\frac12\int_0^t\Phi_s^2\,ds\Big),\qquad 0\le t\le T.
$$
Notation: for $z\in\mathbb C^m$, $z^2=\sum_{k=1}^mz_k^2$ (bilinear, **no** conjugation) and $|z|^2=\sum_k|z_k|^2$. The product $\Phi\cdot dB=\sum_k\Phi^k\,dB^k$ is bilinear. For real $\Phi$, $\Phi^2=|\Phi|^2$.

**Facts (slide 6/26).**

1. By Itô's formula, $dZ_t=Z_t\Phi_t\cdot dB_t$ and $Z_0=1$. So $Z$ is a (complex) **local martingale**.
2. If $E_P\big[\int_0^T|Z_t\Phi_t|^2dt\big]<\infty$, then $Z\Phi\in M^2$ and $Z$ is a true (complex) martingale.
3. If $\Phi$ is **real**, $Z>0$ and $Z$ is a **supermartingale**, with $E_P[Z_t]\le1$. (A positive local martingale is a supermartingale, by Fatou along a localizing sequence.)
4. If $\Phi$ is real, $E_P[Z_T]=1$ is **sufficient** (and obviously necessary) for $Z$ to be a martingale on $[0,T]$. See Exercise 3 for the proof.

### 2.3 Measure defined by a density (slide 8/26)

From now on $\Phi$ is $\mathbb R^m$-valued. If $Z$ is a martingale, define $dQ=Z_T\,dP$. Since $Z_T>0$ and $E_P[Z_T]=1$, $Q$ is a probability measure **equivalent** to $P$ on $\mathcal F_T$: both have the same null sets, $dP=Z_T^{-1}dQ$. For $t\le T$ and $Y$ $\mathcal F_t$-measurable and $Q$-integrable,
$$
E_Q[Y]=E_P[Z_TY]=E_P\big[E_P[Z_T\mid\mathcal F_t]Y\big]=E_P[Z_tY].
$$
**Bayes formula** (Baldi Ex. 4.4): for $s\le t$ and $Y$ $\mathcal F_t$-measurable and $Q$-integrable,
$$
E_Q[Y\mid\mathcal F_s]=\frac{E_P[Z_TY\mid\mathcal F_s]}{E_P[Z_T\mid\mathcal F_s]}=\frac{E_P[Z_tY\mid\mathcal F_s]}{Z_s}.
$$

### 2.4 Drift of an Itô process after a change of measure (slide 11/26)

Assume the hypotheses of Girsanov (Thm 7.5): $Z$ is a martingale, $dQ=Z_TdP$, and $\widetilde B_t=B_t-\int_0^t\Phi_s\,ds$. If
$$
dX_t=A_t\,dt+G_t\,dB_t
$$
under $P$, then substituting $dB_t=d\widetilde B_t+\Phi_t\,dt$ gives
$$
dX_t=(A_t+G_t\Phi_t)\,dt+G_t\,d\widetilde B_t
$$
under $Q$. The process $G\Phi\in M^1_{\rm loc}$ because both factors are in $M^2_{\rm loc}$ (Cauchy–Schwarz). **The diffusion coefficient does not change. Only the drift does.**

**Recipe for drift removal.** To make the drift of $X$ under $Q$ equal to a target $\widetilde A$, solve $A_t+G_t\Phi_t=\widetilde A_t$ for $\Phi$. In one dimension with $G_t\ne0$: $\Phi_t=(\widetilde A_t-A_t)/G_t$. To make $X$ driftless: $\Phi_t=-A_t/G_t$.

> **Pitfall:** Sign conventions. In the course, $Z=\exp(\int\Phi\,dB-\frac12\int|\Phi|^2)$ and $\widetilde B=B-\int\Phi\,ds$ is a $Q$-BM. To make $B_t+\mu t$ a $Q$-BM, write $B_t+\mu t=B_t-\int_0^t(-\mu)\,ds$, so $\Phi=-\mu$.

### 2.5 Corollary 7.7: uniform exponential-moment criterion

With the notation of Thm 7.6, suppose there are constants $\delta>0$ and $C<\infty$ such that
$$
E_P\big[e^{\delta|\Phi_t|^2}\big]\le C\qquad\text{for every }0\le t\le T.
$$
Then $(Z_t)_{0\le t\le T}$ is a martingale.

**Proof idea (Baldi).** Split $[0,T]$ into pieces $t_0<t_1<\dots<t_n$ of length $h\le2\delta$. By Jensen's inequality for the uniform probability on $[t_{k-1},t_k]$,
$$
\exp\Big(\frac12\int_{t_{k-1}}^{t_k}|\Phi_s|^2ds\Big)=\exp\Big(\frac1h\int_{t_{k-1}}^{t_k}\frac h2|\Phi_s|^2ds\Big)\le\frac1h\int_{t_{k-1}}^{t_k}e^{\frac h2|\Phi_s|^2}ds,
$$
which has expectation $\le C$ since $h/2\le\delta$. So Novikov holds for $\Phi\mathbf 1_{[t_{k-1},t_k]}$. Its exponential $Z_{t\vee t_{k-1}\wedge t_k}/Z_{t_{k-1}}$ is a martingale, so $E[Z_{t_k}/Z_{t_{k-1}}\mid\mathcal F_{t_{k-1}}]=1$. Chaining (all quantities are positive): $E[Z_{t_k}]=E[Z_{t_{k-1}}E[Z_{t_k}/Z_{t_{k-1}}\mid\mathcal F_{t_{k-1}}]]=E[Z_{t_{k-1}}]$, so $E[Z_T]=1$ and $Z$ is a martingale.

### 2.6 Example 7.8: an exponential involving BM, OU under $Q$

Let $B$ be real, $\theta\in\mathbb R$, $\Phi_s=\theta B_s$. Then
$$
Z_t=\exp\Big(\theta\int_0^tB_s\,dB_s-\frac{\theta^2}{2}\int_0^tB_s^2\,ds\Big),\qquad t\le T,
$$
is a martingale for **every finite** $T$. By Cor 7.7: for $\delta>0$ with $2\delta\theta^2T<1$,
$$
E_P\big[e^{\delta\theta^2B_t^2}\big]=(1-2\delta\theta^2t)^{-1/2}\le(1-2\delta\theta^2T)^{-1/2}.
$$
This uses $E[e^{aN^2}]=(1-2a\sigma^2)^{-1/2}$ for $N\sim N(0,\sigma^2)$ and $2a\sigma^2<1$. With $dQ=Z_TdP$, the process $W_t=B_t-\theta\int_0^tB_s\,ds$ is a $Q$-BM. So under $Q$
$$
dB_t=\theta B_t\,dt+dW_t,
$$
and $B$ is an **Ornstein–Uhlenbeck process** with linear drift $\theta x$.

> **Remark:** Novikov would require $E\exp(\frac{\theta^2}{2}\int_0^TB_s^2ds)<\infty$. This holds only for $|\theta|T<\pi/2$ (see Exercise 8). So Cor 7.7 is genuinely stronger here.

### 2.7 Example 7.9: passage times for BM with drift

Let $X_t=W_t+\mu t$ with $W$ a real BM, $a>0$, and $\tau_a=\inf\{t\ge0:X_t\ge a\}$. Then
$$
P(\tau_a\le t)=\int_0^tg_\mu(s)\,ds,\qquad g_\mu(s)=\frac{a}{\sqrt{2\pi}\,s^{3/2}}\exp\Big(-\frac{(\mu s-a)^2}{2s}\Big)=e^{\mu a-\mu^2s/2}g_0(s).
$$
- If $\mu\ge0$: $\tau_a<\infty$ a.s. and $\int_0^\infty g_\mu=1$.
- If $\mu>0$: $g_\mu$ decays exponentially and $E[\tau_a]=a/\mu$.
- If $\mu<0$: $P(\tau_a=\infty)=1-e^{2\mu a}$.

The full derivation is Exercise 12.

### 2.8 The augmented Brownian filtration (slide 19/26)

$\mathcal G_t=\mathcal F^B_t:=\sigma(B_s:0\le s\le t)\vee\mathcal N$, where $\mathcal N$ is the family of $P$-null sets of $\mathcal F$. This filtration satisfies the **usual conditions** (right-continuous and complete). The representation theorems concern **this** filtration. For a real r.v. or martingale the integrand $H$ is $\mathbb R^m$-valued and $\int_0^tH_s\cdot dB_s=\sum_{k=1}^m\int_0^tH^k_s\,dB^k_s$. Recall that $M^2([0,T])$ means progressively measurable with $E_P\int_0^T|H_s|^2ds<\infty$.

### 2.9 Consequences of martingale representation (slide 23/26)

- Every martingale of the augmented Brownian filtration has a **continuous modification**. Square integrability is not needed for this.
- The stochastic integral describes **all** local-martingale fluctuations of this filtration, starting from a deterministic initial value.
- **The natural-filtration hypothesis matters.** Nothing is claimed for a larger filtration in which $B$ is still a BM. Counterexample in Exercise 21.
- Application: hedging derivatives in finance (Baldi Ch. 13).

### 2.10 Equivalent probability measures (slide 25/26)

$Q\sim P$ (equivalent) means they have the same null sets. Girsanov starts from a martingale exponential and produces $Q\sim P$ via $dQ=Z_TdP$. On the augmented Brownian filtration, **every** $Q\sim P$ arises in this way (Theorem 7.13).

---

## 3. Theorems: statements

### Proposition 7.3 (Bounded energy criterion) (S)

Let $Z$ be the stochastic exponential of Definition 7.2, with $\Phi$ complex, $\mathbb C^m$-valued, in $M^2_{\rm loc}([0,T])$. If there is a **deterministic** constant $K<\infty$ with
$$
\int_0^T|\Phi_s|^2ds\le K\quad\text{a.s.},
$$
then $(Z_t)_{0\le t\le T}$ is a complex martingale bounded in $L^p$ for every finite $p\ge1$:
$$
\sup_{0\le t\le T}E_P\big[|Z_t|^p\big]<\infty,\qquad1\le p<\infty.
$$

### Lemma 7.4 (Transferring the martingale property) (S&P)

Let $(Z_t)_{0\le t\le T}$ be a **strictly positive** $(\mathcal F_t)$-martingale under $P$ with $Z_0=1$. Let $(Y_t)_{0\le t\le T}$ be $(\mathcal F_t)$-adapted, and let $Q$ be the probability $dQ=Z_TdP$. Then
$$
(Y_t)_{0\le t\le T}\text{ is an }(\mathcal F_t)\text{-martingale under }Q\iff(Z_tY_t)_{0\le t\le T}\text{ is an }(\mathcal F_t)\text{-martingale under }P.
$$

### Theorem 7.5 (Girsanov) (S&P)

Let $B$ be an $m$-dimensional $(\mathcal F_t)$-BM under $P$ and $\Phi\in M^2_{\rm loc}([0,T];\mathbb R^m)$. Suppose
$$
Z_t=\exp\Big(\int_0^t\Phi_s\cdot dB_s-\frac12\int_0^t|\Phi_s|^2ds\Big)
$$
is a **martingale** on $[0,T]$, and define $dQ=Z_TdP$. Then
$$
\widetilde B_t=B_t-\int_0^t\Phi_s\,ds,\qquad0\le t\le T,
$$
is an $(\mathcal F_t)$-Brownian motion under $Q$.

### Theorem 7.6 (Novikov and Kazamaki criteria) (S)

Let $\Phi\in M^2_{\rm loc}([0,T];\mathbb R^m)$, $M_t=\int_0^t\Phi_s\cdot dB_s$ and $Z_t=e^{M_t-\frac12\langle M\rangle_t}$, where $\langle M\rangle_t=\int_0^t|\Phi_s|^2ds$. Consider:

- (a) **Novikov:** $E_P\big[e^{\frac12\langle M\rangle_T}\big]=E_P\big[e^{\frac12\int_0^T|\Phi_s|^2ds}\big]<\infty$.
- (b) **Kazamaki:** $M$ is a martingale bounded in $L^2$ and $E_P\big[e^{M_T/2}\big]<\infty$.
- (c) $Z$ is a uniformly integrable martingale on $[0,T]$.

Then (a) $\Rightarrow$ (b) $\Rightarrow$ (c).

### Corollary 7.7 (Uniform exponential moments)

If $E_P[e^{\delta|\Phi_t|^2}]\le C$ for all $t\le T$, for some $\delta>0$ and $C<\infty$, then $Z$ is a martingale on $[0,T]$.

### Theorem 7.10 (Representation of square-integrable random variables) (S&P)

Let $B$ be an $m$-dimensional BM with augmented natural filtration $(\mathcal G_t)$, and $T>0$. Every real r.v. $Z\in L^2(\Omega,\mathcal G_T,P)$ has a **unique** representation
$$
Z=c+\int_0^TH_s\cdot dB_s,
$$
with $c\in\mathbb R$ and $H\in M^2([0,T];\mathbb R^m)$ progressively measurable for $(\mathcal G_t)$. Necessarily $c=E_P[Z]$.

### Theorem 7.11 (Representation of square-integrable martingales) (S)

Let $(M_t)_{0\le t\le T}$ be a square-integrable martingale for $(\mathcal G_t)$. There exist a unique $H\in M^2([0,T];\mathbb R^m)$ and a constant $c\in\mathbb R$ such that, for every $t\in[0,T]$,
$$
M_t=c+\int_0^tH_s\cdot dB_s\quad\text{a.s.}
$$
In particular $M$ has a continuous modification, even if continuity is not assumed.

### Theorem 7.12 (Representation of local martingales) (S)

Let $(M_t)_{0\le t\le T}$ be a local martingale for $(\mathcal G_t)$. There exist a unique progressively measurable $H\in M^2_{\rm loc}([0,T];\mathbb R^m)$ and a constant $c\in\mathbb R$ such that, for every $t\in[0,T]$,
$$
M_t=c+\int_0^tH_s\cdot dB_s\quad\text{a.s.}
$$
In particular every such local martingale has a continuous modification.

### Theorem 7.13 (All equivalent measures on a Brownian filtration) (S)

Let $B$ be an $m$-dimensional BM with augmented natural filtration $(\mathcal G_t)$. If $Q$ on $(\Omega,\mathcal G_T)$ is equivalent to $P$, there exists a progressively measurable $\Phi\in M^2_{\rm loc}([0,T];\mathbb R^m)$ such that
$$
dQ=Z_T\,dP,\qquad Z_t=\exp\Big(\int_0^t\Phi_s\cdot dB_s-\frac12\int_0^t|\Phi_s|^2ds\Big),
$$
where $Z$ is a $P$-martingale. Moreover $\widetilde B_t=B_t-\int_0^t\Phi_s\,ds$ is a $(\mathcal G_t)$-BM under $Q$ on $[0,T]$.

> **Remark:** The proof (notes pp. 7.12–7.14) takes $Z_t=E_P[dQ/dP\mid\mathcal G_t]$, represents $Z_t=1+\int_0^tH_s\cdot dB_s$ by Thm 7.12, shows $Z>0$ on $[0,T]$, sets $\Phi=H/Z$, and applies Itô to $\log Z$ (localized). See Section 4.5.

---

## 4. Proofs

### 4.1 Lemma 7.4 (S&P): transferring the martingale property

**Proof roadmap.**

- Step 0: integrability and adaptedness transfer. $Y_t\in L^1(Q)\iff Z_tY_t\in L^1(P)$, and $Y$ is adapted $\iff ZY$ is adapted, because $Z_t>0$.
- Step 1 ($\Rightarrow$): for $A\in\mathcal F_s$, rewrite $E_P[Z_tY_t\mathbf 1_A]$ as $E_Q[Y_t\mathbf 1_A]$ by inserting $Z_t=E_P[Z_T\mid\mathcal F_t]$. Use the $Q$-martingale property, then go back.
- Step 2 ($\Leftarrow$): the same chain read in the other direction.

**Full proof.** Since $Z$ is a $P$-martingale, $Z_t=E_P[Z_T\mid\mathcal F_t]$ for $t\le T$.

*Step 0.* For $t\le T$, $Y_t$ is $\mathcal F_t$-measurable and $|Y_t|\ge0$, so the tower property for nonnegative variables gives
$$
E_Q|Y_t|=E_P[Z_T|Y_t|]=E_P\big[E_P[Z_T\mid\mathcal F_t]\,|Y_t|\big]=E_P[Z_t|Y_t|]=E_P|Z_tY_t|.
$$
So $Y_t$ is $Q$-integrable iff $Z_tY_t$ is $P$-integrable. Since $Z_t$ is $\mathcal F_t$-measurable and $Z_t>0$ a.s., $Y_t$ is $\mathcal F_t$-measurable iff $Z_tY_t=:X_t$ is (because $Y_t=X_t/Z_t$). Hence the integrability and adaptedness requirements of the two martingale definitions are equivalent. It remains to compare the martingale equalities.

*Step 1 ($\Rightarrow$).* Assume $Y$ is a $Q$-martingale. Let $s\le t\le T$ and $A\in\mathcal F_s$. Then
$$
\begin{aligned}
E_P[Z_tY_t\mathbf 1_A]&=E_P\big[E_P[Z_T\mid\mathcal F_t]Y_t\mathbf 1_A\big]=E_P[Z_TY_t\mathbf 1_A]=E_Q[Y_t\mathbf 1_A]\\
&=E_Q[Y_s\mathbf 1_A]=E_P[Z_TY_s\mathbf 1_A]=E_P\big[E_P[Z_T\mid\mathcal F_s]Y_s\mathbf 1_A\big]=E_P[Z_sY_s\mathbf 1_A].
\end{aligned}
$$
The first and the second-to-last equalities hold because $Y_t\mathbf 1_A$ is $\mathcal F_t$-measurable and $Y_s\mathbf 1_A$ is $\mathcal F_s$-measurable (and the products are integrable by Step 0). The fourth equality is the $Q$-martingale property. Since $Z_sY_s$ is $\mathcal F_s$-measurable and $A\in\mathcal F_s$ is arbitrary, $E_P[Z_tY_t\mid\mathcal F_s]=Z_sY_s$. So $ZY$ is a $P$-martingale.

*Step 2 ($\Leftarrow$).* Assume $ZY$ is a $P$-martingale. Let $s\le t\le T$ and $A\in\mathcal F_s$. Then
$$
\begin{aligned}
E_Q[Y_t\mathbf 1_A]&=E_P[Z_TY_t\mathbf 1_A]=E_P\big[E_P[Z_T\mid\mathcal F_t]Y_t\mathbf 1_A\big]=E_P[Z_tY_t\mathbf 1_A]\\
&=E_P[Z_sY_s\mathbf 1_A]=E_P\big[E_P[Z_T\mid\mathcal F_s]Y_s\mathbf 1_A\big]=E_P[Z_TY_s\mathbf 1_A]=E_Q[Y_s\mathbf 1_A].
\end{aligned}
$$
Hence $E_Q[Y_t\mid\mathcal F_s]=Y_s$, so $Y$ is a $Q$-martingale. $\square$

**What graders look for / pitfalls.**

- State the hypotheses: $Z$ is a **strictly positive** $P$-**martingale** with $Z_0=1$ (so that $E_PZ_T=1$, $Q$ is a probability, and $Z_t=E_P[Z_T\mid\mathcal F_t]$).
- Do not forget Step 0. A martingale must be adapted **and** integrable under the relevant measure. Strict positivity is used exactly here (to recover $Y_t=X_t/Z_t$).
- The key trick is to insert $Z_t=E_P[Z_T\mid\mathcal F_t]$ at the right time. You must use **$\mathcal F_t$-measurability of $Y_t\mathbf 1_A$** to pull it inside the conditional expectation.
- Characterize conditional expectations by testing against $\mathbf 1_A$, $A\in\mathcal F_s$. Say explicitly why this determines $E[\cdot\mid\mathcal F_s]$.
- Baldi only proves "$\Leftarrow$" (via the Bayes formula). The course statement is an **iff**, so prove both directions.

**Memorize-this skeleton.**
$$
E_P[Z_tY_t\mathbf 1_A]=E_P[Z_TY_t\mathbf 1_A]=E_Q[Y_t\mathbf 1_A]\overset{?}{=}E_Q[Y_s\mathbf 1_A]=E_P[Z_TY_s\mathbf 1_A]=E_P[Z_sY_s\mathbf 1_A],\quad A\in\mathcal F_s.
$$
The outer equalities always hold (insert $Z_t=E[Z_T\mid\mathcal F_t]$). So the middle equality ($Q$-martingale) holds iff the outer quantities are equal ($P$-martingale). Add the remark on integrability and adaptedness.

---

### 4.2 Theorem 7.5 (S&P): Girsanov

**Proof roadmap.**

- Step 1: By Thm 4.42 (under $Q$), it suffices to show $Y^\lambda_t=e^{i\langle\lambda,\widetilde B_t\rangle+\frac12|\lambda|^2t}$ is a $Q$-martingale for every $\lambda\in\mathbb R^m$. By Lemma 7.4, this holds iff $X^\lambda_t=Z_tY^\lambda_t$ is a $P$-martingale.
- Step 2: Compute $X^\lambda=$ the complex stochastic exponential of $\Phi+i\lambda$.
- Step 3 (bounded case): if $\int_0^T|\Phi|^2\le K$, then $X^\lambda$ is a martingale by Prop 7.3.
- Step 4 (general case): localize with $\tau_n=\inf\{t:\int_0^t|\Phi_s|^2ds>n\}$. Show $X^\lambda_n(t)\to X^\lambda_t$ in $L^1$. This uses $Z_{t\wedge\tau_n}\to Z_t$ in $L^1$ (Scheffé-type argument, which needs $E Z_t=1$), and $|Y^\lambda_n|\le e^{\frac12|\lambda|^2t}$. Pass the martingale property to the limit.

**Full proof.**

*Step 1 (reduction).* $\widetilde B$ is continuous, $(\mathcal F_t)$-adapted, and $\widetilde B_0=0$. ($\int_0^t\Phi_s\,ds$ is well defined, continuous and adapted, since $\Phi\in M^2_{\rm loc}\subset M^1_{\rm loc}$.) Since $Q\sim P$ on $\mathcal F_T$, "a.s." means the same under both measures. By Theorem 4.42 applied on $(\Omega,\mathcal F,(\mathcal F_t)_{t\le T},Q)$, it suffices to prove that for every $\lambda\in\mathbb R^m$
$$
Y^\lambda_t=\exp\Big(i\langle\lambda,\widetilde B_t\rangle+\frac12|\lambda|^2t\Big),\qquad0\le t\le T,
$$
is an $(\mathcal F_t)$-martingale under $Q$. Here $Z$ is a strictly positive $P$-martingale with $Z_0=1$. $Y^\lambda$ is adapted and bounded ($|Y^\lambda_t|=e^{\frac12|\lambda|^2t}$). By Lemma 7.4 (applied to the real and imaginary parts), it suffices to show that
$$
X^\lambda_t:=Z_tY^\lambda_t
$$
is an $(\mathcal F_t)$-martingale under $P$.

*Step 2 (computation).*
$$
\begin{aligned}
X^\lambda_t&=\exp\Big(\int_0^t\Phi_s\cdot dB_s-\frac12\int_0^t|\Phi_s|^2ds+i\langle\lambda,B_t\rangle-i\int_0^t\langle\lambda,\Phi_s\rangle ds+\frac12|\lambda|^2t\Big)\\
&=\exp\Big(\int_0^t(\Phi_s+i\lambda)\cdot dB_s-\frac12\int_0^t\big(|\Phi_s|^2+2i\langle\lambda,\Phi_s\rangle-|\lambda|^2\big)ds\Big)\\
&=\exp\Big(\int_0^t(\Phi_s+i\lambda)\cdot dB_s-\frac12\int_0^t(\Phi_s+i\lambda)^2ds\Big).
\end{aligned}
$$
This uses $\langle\lambda,B_t\rangle=\int_0^t\lambda\cdot dB_s$ and the bilinear square $(\Phi+i\lambda)^2=|\Phi|^2+2i\langle\lambda,\Phi\rangle-|\lambda|^2$ for real $\Phi,\lambda$. So $X^\lambda$ is the complex stochastic exponential (Def. 7.2) of $\Phi+i\lambda$.

*Step 3 (bounded case).* If $\int_0^T|\Phi_s|^2ds\le K$ a.s., then
$$
\int_0^T|\Phi_s+i\lambda|^2ds=\int_0^T\big(|\Phi_s|^2+|\lambda|^2\big)ds\le K+|\lambda|^2T.
$$
So by Prop 7.3, $X^\lambda$ is a (complex) $P$-martingale, and we are done.

*Step 4 (general case: localization).* Let
$$
\tau_n=\inf\Big\{t\le T:\int_0^t|\Phi_s|^2ds>n\Big\}\quad(\inf\emptyset=+\infty),\qquad\Phi_n(s)=\Phi_s\mathbf 1_{\{s<\tau_n\}}.
$$
Then $\int_0^T|\Phi_n(s)|^2ds\le n$. Since $\Phi\in M^2_{\rm loc}$, $\int_0^T|\Phi_s|^2ds<\infty$ a.s., so $\tau_n=+\infty$ for $n$ large (a.s.). The stochastic exponential of $\Phi_n$ is
$$
\exp\Big(\int_0^t\Phi_n\cdot dB-\frac12\int_0^t|\Phi_n|^2ds\Big)=\exp\Big(\int_0^{t\wedge\tau_n}\Phi\cdot dB-\frac12\int_0^{t\wedge\tau_n}|\Phi|^2ds\Big)=Z_{t\wedge\tau_n}.
$$
Put $Y^\lambda_n(t)=\exp\big(i\langle\lambda,B_t-\int_0^t\Phi_n(s)ds\rangle+\frac12|\lambda|^2t\big)$. By Steps 2–3 applied to $\Phi_n$ (energy $\le n$),
$$
X^\lambda_n(t):=Z_{t\wedge\tau_n}Y^\lambda_n(t)
$$
is a $P$-martingale. We show $X^\lambda_n(t)\to X^\lambda_t$ in $L^1(P)$ for each $t$.

1. $Z_{t\wedge\tau_n}\to Z_t$ a.s., since $\tau_n\to+\infty$ a.s.
2. Let $H_n=\min(Z_{t\wedge\tau_n},Z_t)$. Then $H_n\to Z_t$ a.s. by 1., and $0\le H_n\le Z_t\in L^1$. By dominated convergence, $E[H_n]\to E[Z_t]$.
3. $E[Z_t]=1=E[Z_{t\wedge\tau_n}]$, since both $Z$ (by hypothesis) and $Z_{\cdot\wedge\tau_n}$ (by Prop 7.3) are martingales starting from $1$.

Since $|a-b|=(a-a\wedge b)+(b-a\wedge b)$,
$$
E|Z_t-Z_{t\wedge\tau_n}|=E[Z_t-H_n]+E[Z_{t\wedge\tau_n}-H_n]\overset{3.}{=}2E[Z_t-H_n]\xrightarrow[n\to\infty]{2.}0.
$$
4. $Y^\lambda_n(t)\to Y^\lambda_t$ a.s., because $\int_0^t\Phi_n(s)ds\to\int_0^t\Phi_s\,ds$ a.s. (they coincide once $\tau_n=\infty$) and $x\mapsto e^{ix}$ is continuous. Also $|Y^\lambda_n(t)|=|Y^\lambda_t|=e^{\frac12|\lambda|^2t}$.

Then
$$
E|X^\lambda_n(t)-X^\lambda_t|\le E\big[|Z_{t\wedge\tau_n}-Z_t|\,|Y^\lambda_n(t)|\big]+E\big[Z_t|Y^\lambda_n(t)-Y^\lambda_t|\big]\le e^{\frac12|\lambda|^2t}E|Z_{t\wedge\tau_n}-Z_t|+E\big[Z_t|Y^\lambda_n(t)-Y^\lambda_t|\big].
$$
The first term $\to0$ by the above. The second $\to0$ by dominated convergence (dominated by $2e^{\frac12|\lambda|^2t}Z_t\in L^1$). So $X^\lambda_n(t)\to X^\lambda_t$ in $L^1$. Conditional expectation is a contraction in $L^1$, so for $s\le t$,
$$
E[X^\lambda_t\mid\mathcal F_s]=\lim_{n}E[X^\lambda_n(t)\mid\mathcal F_s]=\lim_nX^\lambda_n(s)=X^\lambda_s\quad\text{(limits in }L^1).
$$
$X^\lambda$ is adapted and integrable ($|X^\lambda_t|\le e^{\frac12|\lambda|^2t}Z_t$). Hence $X^\lambda$ is a $P$-martingale, $Y^\lambda$ is a $Q$-martingale by Lemma 7.4, and $\widetilde B$ is a $Q$-BM by Thm 4.42. $\square$

**What graders look for / pitfalls.**

- **Hypothesis:** $Z$ must be a **martingale** (not just a local martingale). Otherwise $Q$ is not a probability measure. This is also used in item 3 ($E Z_t=1$).
- The finite horizon $T$. Girsanov is on $[0,T]$. On $[0,\infty)$ the measures are typically singular (Exercise 15).
- Correct use of Thm 4.42: you need **continuity**, $\widetilde B_0=0$, adaptedness, and the martingale property for **all** $\lambda$, **under $Q$**.
- The algebra in Step 2: the bilinear (unconjugated) square $(\Phi+i\lambda)^2$.
- Prop 7.3 needs a **deterministic** bound on $\int_0^T|\Phi+i\lambda|^2$. That is why we localize.
- In the localization step: $Z_{t\wedge\tau_n}$ is the exponential of $\Phi\mathbf 1_{[0,\tau_n)}$, and $L^1$ convergence needs more than a.s. convergence. The trick $|a-b|=a+b-2(a\wedge b)$ with equal means is the standard (Scheffé) argument.
- Lemma 7.4 is applied to complex $Y$. That is fine: apply it to the real and imaginary parts.

**Memorize-this skeleton.**

1. Thm 4.42 $\Rightarrow$ need $Y^\lambda=e^{i\langle\lambda,\widetilde B\rangle+\frac12|\lambda|^2t}$ to be a $Q$-martingale. Lemma 7.4 $\Rightarrow$ need $ZY^\lambda$ to be a $P$-martingale.
2. $ZY^\lambda=\exp\big(\int(\Phi+i\lambda)\cdot dB-\frac12\int(\Phi+i\lambda)^2ds\big)$.
3. Bounded energy $\Rightarrow$ martingale (Prop 7.3).
4. General: $\tau_n$, $Z_{t\wedge\tau_n}\to Z_t$ in $L^1$ (equal means + a.s. convergence + $E|a-b|=2E[a-a\wedge b]$), $|Y|$ bounded $\Rightarrow$ $L^1$ convergence $\Rightarrow$ martingale property passes to the limit.

---

### 4.3 Theorem 7.10 (S&P): representation of $L^2(\mathcal G_T)$ random variables

Notation: $\mathcal H=\big\{c+\int_0^TH_s\cdot dB_s:\ c\in\mathbb R,\ H\in M^2([0,T];\mathbb R^m)\big\}\subset L^2(\Omega,\mathcal G_T,P)$.

**Proof roadmap.**

- Uniqueness: take expectations to get $c=E[Z]$. Subtract two representations and use the Itô isometry.
- Existence Step 1: $\mathcal H$ is a **closed** subspace of $L^2$ (Cauchy sequences, isometry, completeness of $M^2$).
- Existence Step 2: the exponentials $e_f(T)=\exp(\int_0^Tf\cdot dB-\frac12\int_0^T|f|^2ds)$, $f\in L^2([0,T];\mathbb R^m)$ deterministic, belong to $\mathcal H$, since $e_f(T)=1+\int_0^Te_f(s)f(s)\cdot dB_s$ with $e_ff\in M^2$.
- Existence Step 3 (totality): if $Y\in L^2(\mathcal G_T)$ is orthogonal to all $e_f(T)$, then $Y=0$. Use $Q^\pm=\frac{Y^\pm}{a}P$, Laplace transforms of increments, analytic continuation, and Carathéodory. (This is the part you may skip.)
- Conclusion: $L^2=\overline{\operatorname{span}}\,\mathcal E\subseteq\mathcal H\subseteq L^2$.

**Full proof.**

*Uniqueness.* Let $Z=c+\int_0^TH_s\cdot dB_s$ with $H\in M^2$. The stochastic integral of an $M^2$ process has mean zero, so $E[Z]=c$. If $Z=c+\int_0^TH^1\cdot dB=c+\int_0^TH^2\cdot dB$ with $H^1,H^2\in M^2$, then $\int_0^T(H^1_s-H^2_s)\cdot dB_s=0$. By the Itô isometry,
$$
E\int_0^T|H^1_s-H^2_s|^2ds=E\Big[\Big(\int_0^T(H^1_s-H^2_s)\cdot dB_s\Big)^2\Big]=0,
$$
so $H^1=H^2$ $\ (\lambda\otimes P)$-a.e., i.e. as elements of $M^2$.

*Existence, Step 1: $\mathcal H$ is closed in $L^2$.* Let $Z_n=c_n+\int_0^TH_n(s)\cdot dB_s=c_n+I_n$ be a sequence in $\mathcal H$ converging (hence Cauchy) in $L^2$. Then
$$
|c_n-c_k|=|E[Z_n-Z_k]|\le E|Z_n-Z_k|\le E\big[|Z_n-Z_k|^2\big]^{1/2},
$$
so $(c_n)$ is Cauchy in $\mathbb R$, with limit $c$. Hence $I_n=Z_n-c_n$ is Cauchy in $L^2$. By the Itô isometry $\|I_n-I_k\|_{L^2}=\|H_n-H_k\|_{M^2}$, so $(H_n)$ is Cauchy in $M^2$. $M^2$ is complete (a closed subspace of $L^2([0,T]\times\Omega)$), so $H_n\to H$ in $M^2$. By the isometry again, $I_n\to\int_0^TH\cdot dB$ in $L^2$. Hence
$$
\lim_nZ_n=c+\int_0^TH_s\cdot dB_s\in\mathcal H\quad\text{in }L^2.
$$

*Existence, Step 2: exponentials belong to $\mathcal H$.* Let $f\in L^2([0,T];\mathbb R^m)$ be deterministic and
$$
e_f(t)=\exp\Big(\int_0^tf(s)\cdot dB_s-\frac12\int_0^t|f(s)|^2ds\Big),\qquad0\le t\le T.
$$
By Itô's formula, $de_f(t)=e_f(t)f(t)\cdot dB_t$, so
$$
e_f(T)=1+\int_0^Te_f(s)f(s)\cdot dB_s.
$$
We check that $e_ff\in M^2$. Since $\int_0^sf\cdot dB\sim N(0,\int_0^s|f|^2)$ and $E[e^{\sigma N}]=e^{\sigma^2/2}$ for $N\sim N(0,1)$,
$$
E[e_f(s)^2]=E\Big[e^{2\int_0^sf\cdot dB}\Big]e^{-\int_0^s|f|^2}=e^{2\int_0^s|f|^2}e^{-\int_0^s|f|^2}=e^{\int_0^s|f(u)|^2du}\le e^{\int_0^T|f(u)|^2du}.
$$
Hence, by Fubini,
$$
E\int_0^Te_f(s)^2|f(s)|^2ds=\int_0^TE[e_f(s)^2]|f(s)|^2ds\le e^{\int_0^T|f|^2}\int_0^T|f(s)|^2ds<\infty.
$$
$e_ff$ is continuous in $s$ times deterministic, adapted, hence progressively measurable. So $e_ff\in M^2$ and $e_f(T)\in\mathcal H$. Thus $\mathcal E:=\{e_f(T):f\in L^2([0,T];\mathbb R^m)\}\subseteq\mathcal H$.

*Existence, Step 3: $\mathcal E$ is total in $L^2(\mathcal G_T)$.* We show $\overline{\operatorname{span}\,\mathcal E}^{L^2}=L^2(\mathcal G_T)$. Since $L^2$ is a Hilbert space, it suffices to show that
$$
Y\in L^2(\mathcal G_T),\quad E[Ye_f(T)]=0\ \ \forall f\in L^2([0,T];\mathbb R^m)\quad\Longrightarrow\quad Y=0\text{ a.s.}
$$
Let $Y$ be such. Taking $f\equiv0$ gives $e_f\equiv1$, so $E[Y]=0$. Hence $E[Y^+]=E[Y^-]=:a$. If $a=0$, then $Y=0$ and we are done. If $a>0$, define the probability measures on $(\Omega,\mathcal G_T)$
$$
dQ^+=\frac{Y^+}{a}dP,\qquad dQ^-=\frac{Y^-}{a}dP.
$$
**Claim:** $Q^+=Q^-$ on $\mathcal G_T$. Granting the claim, $Y^+=Y^-$ a.s. (equal densities). Since $Y^+Y^-=0$, this forces $Y^+=Y^-=0$, i.e. $Y=0$ a.s.

*Sketch of the claim (technical part; the syllabus lets you skip it).* Take a step function $f(s)=\sum_{j=1}^n\lambda_j\mathbf 1_{[t_{j-1},t_j)}(s)$ with $0=t_0<\dots<t_n=T$ and $\lambda_j\in\mathbb R^m$. Then $\int_0^Tf\cdot dB=\sum_j\langle\lambda_j,B_{t_j}-B_{t_{j-1}}\rangle=:S_\lambda$ and $\int_0^T|f|^2=\sum_j|\lambda_j|^2(t_j-t_{j-1})=:v_\lambda$. Since $e_f(T)=e^{S_\lambda-v_\lambda/2}$,
$$
E[Ye_f(T)]=0\iff E[Ye^{S_\lambda}]=0\iff E_{Q^+}[e^{S_\lambda}]=E_{Q^-}[e^{S_\lambda}]\quad\forall\lambda\in\mathbb R^{mn}.
$$
These are finite: $E_{Q^\pm}[e^{S_\lambda}]\le\frac1a\|Y^\pm\|_2\,E[e^{2S_\lambda}]^{1/2}=\frac1a\|Y^\pm\|_2e^{v_\lambda}<\infty$. So the laws of $\Delta B=(B_{t_1}-B_{t_0},\dots,B_{t_n}-B_{t_{n-1}})$ under $Q^\pm$ have the same, everywhere finite, Laplace transform on $\mathbb R^{mn}$. For fixed $\lambda$, $F_\pm(z)=E_{Q^\pm}[e^{zS_\lambda}]$ is holomorphic on $\mathbb C$ (differentiate under the integral, dominating $|e^{zS_\lambda}|\le e^{RS_\lambda}+e^{-RS_\lambda}$ for $|z|\le R$), and $F_+=F_-$ on $\mathbb R$. By the identity theorem $F_+=F_-$ on $\mathbb C$, and in particular at $z=i$: $E_{Q^+}[e^{iS_\lambda}]=E_{Q^-}[e^{iS_\lambda}]$ for every $\lambda$. So $\Delta B$ has the same characteristic function, hence the same law, under $Q^+$ and $Q^-$. So $Q^+=Q^-$ on $\sigma(B_{t_1},\dots,B_{t_n})$. Ranging over all finite partitions, $Q^\pm$ agree on the cylinder events, a $\pi$-system generating $\sigma(B_s:s\le T)$, so they agree there by Carathéodory/Dynkin. Since $Q^\pm\ll P$, both vanish on the added $P$-null sets, so $Q^+=Q^-$ on $\mathcal G_T$.

*Conclusion.* By Steps 2 and 1, $\operatorname{span}\mathcal E\subseteq\mathcal H$ ($\mathcal H$ is a linear space) and $\mathcal H$ is closed. By Step 3,
$$
L^2(\mathcal G_T)=\overline{\operatorname{span}\,\mathcal E}^{L^2}\subseteq\mathcal H\subseteq L^2(\mathcal G_T),
$$
so $\mathcal H=L^2(\mathcal G_T)$. $\square$

**What graders look for / pitfalls.**

- The filtration must be the **augmented natural filtration of $B$**. It is used in Step 3 ($\mathcal G_T$ is generated by $B$ and null sets).
- Uniqueness needs $H\in M^2$ (isometry). In $M^2_{\rm loc}$ the representation is **not** unique (Exercise 21).
- In Step 1: show that **both** $c_n$ and $H_n$ converge. Cite completeness of $M^2$ and the isometry.
- In Step 2: you must check $e_ff\in M^2$ with the explicit second-moment computation $E[e_f(s)^2]=e^{\int_0^s|f|^2}$. Without it, $\int e_ff\,dB$ is only a local martingale.
- In Step 3: the Hilbert space fact "a subspace is dense iff its orthogonal complement is $\{0\}$". Use $f=0$ to get $E[Y]=0$, and note the case $a=0$.
- State clearly that $\mathcal H$ is a linear subspace (so it contains the span).

**Memorize-this skeleton.**

1. Uniqueness: $c=EZ$. Isometry $\Rightarrow$ $H^1=H^2$.
2. $\mathcal H$ closed: $c_n$ Cauchy (since $|c_n-c_k|\le\|Z_n-Z_k\|_2$), $H_n$ Cauchy in $M^2$ (isometry), limits exist.
3. $e_f(T)=1+\int_0^Te_ff\cdot dB$, $E e_f(s)^2=e^{\int_0^s|f|^2}$ $\Rightarrow$ $e_ff\in M^2$.
4. $Y\perp\mathcal E$ $\Rightarrow$ $EY=0$, $Q^\pm=Y^\pm/a\cdot P$ have the same Laplace transform of increments $\Rightarrow$ the same law $\Rightarrow$ $Q^+=Q^-$ $\Rightarrow$ $Y=0$.
5. $L^2=\overline{\rm span}\,\mathcal E\subseteq\mathcal H$.

---

### 4.4 Optional: proof sketches of the (S) results (for understanding only)

These are **not** required proofs. Knowing the ideas helps you state the results correctly and answer "why" questions.

**Prop 7.3 (notes p. 7.1–7.2).** Let $Z^*=\sup_{t\le T}|Z_t|$. Then $E[Z^{*p}]=\int_0^\infty pr^{p-1}P(Z^*>r)\,dr$. Since $|e^w|=e^{\operatorname{Re}w}$ and $\operatorname{Re}(\Phi^2)=|\operatorname{Re}\Phi|^2-|\operatorname{Im}\Phi|^2$,
$$
|Z_t|=\exp\Big(\int_0^t\operatorname{Re}\Phi_s\cdot dB_s-\frac12\int_0^t|\operatorname{Re}\Phi_s|^2ds+\frac12\int_0^t|\operatorname{Im}\Phi_s|^2ds\Big)\le\exp\Big(\int_0^t\operatorname{Re}\Phi_s\cdot dB_s+\frac K2\Big).
$$
By the exponential bound (Prop 6.33), for $\log r>K/2$,
$$
P(Z^*\ge r)\le P\Big(\sup_{t\le T}\int_0^t\operatorname{Re}\Phi_s\cdot dB_s\ge\log r-\frac K2\Big)\le2\exp\Big(-\frac{(\log r-K/2)^2}{2K}\Big).
$$
This is $\approx r^{-c\log r}$, so it decays faster than any power. Hence $E[Z^{*p}]<\infty$ for all $p$. Then $E\int_0^T|\Phi_s|^2|Z_s|^2ds\le K\,E[Z^{*2}]<\infty$, so $Z\Phi\in M^2$, and $Z=1+\int Z\Phi\cdot dB$ is a square-integrable martingale, bounded in every $L^p$.

**Thm 7.6 (notes pp. 7.5–7.7).**

- (a)$\Rightarrow$(b): $\langle M\rangle_T\ge0$ has a finite Laplace transform at $1/2$, so $E\langle M\rangle_T<\infty$. Hence $\Phi\in M^2$ and $M$ is an $L^2$-bounded martingale. Also $e^{M_T/2}=Z_T^{1/2}(e^{\frac12\langle M\rangle_T})^{1/2}$, so by Cauchy–Schwarz and $EZ_T\le1$: $Ee^{M_T/2}\le(Ee^{\frac12\langle M\rangle_T})^{1/2}<\infty$.
- (b)$\Rightarrow$(c): For stopping times $\tau\le T$, $M_\tau=E[M_T\mid\mathcal F_\tau]$ and by Jensen $e^{M_\tau/2}\le E[e^{M_T/2}\mid\mathcal F_\tau]$. So $\{e^{M_\tau/2}\}_\tau$ is UI. For $0<a<1$ write $\exp(aM-\frac{a^2}2\langle M\rangle)=Z^{a^2}\big(e^{\frac{a}{1+a}M}\big)^{1-a^2}$. Two Hölder inequalities (exponents $1/a^2,1/(1-a^2)$, then $(1+a)/(2a)$) and $E Z_\tau\le1$ give $E[\mathbf 1_Ae^{aM_\tau-\frac{a^2}{2}\langle M\rangle_\tau}]\le E[\mathbf 1_Ae^{M_\tau/2}]^{2a(1-a)}$. So $W^{(a)}=e^{aM-\frac{a^2}2\langle M\rangle}$ is UI over stopping times (Prop 4.23), hence a true martingale (localize and pass to the limit). Then $1=EW^{(a)}_T\le(EZ_T)^{a^2}(Ee^{M_T/2})^{2a(1-a)}$. Let $a\uparrow1$: $EZ_T\ge1$, so $EZ_T=1$ and $Z$ is a martingale on $[0,T]$ (hence UI, as $Z_t=E[Z_T\mid\mathcal F_t]$).

---

### 4.5 Optional: proof sketch of Theorem 7.13 (notes pp. 7.12–7.14)

Let $L=dQ/dP$ on $\mathcal G_T$. Since $Q\sim P$: $L>0$ a.s. and $E_PL=1$. Let $Z_t=E_P[L\mid\mathcal G_t]$, a martingale with $Z_0=1$ ($\mathcal G_0$ is trivial) and $Z_T=L$. By Thm 7.12, $Z$ has a continuous version $Z_t=1+\int_0^tH_s\cdot dB_s$ with $H\in M^2_{\rm loc}$.

**Positivity.** Let $\sigma=\inf\{t:Z_t=0\}$ and $\tau=\sigma\wedge T$. Optional sampling gives $Z_\tau=E[L\mid\mathcal G_\tau]$. On $A=\{Z_\tau=0\}$, $E[L\mathbf 1_A]=E[Z_\tau\mathbf 1_A]=0$, so $P(A)=0$ since $L>0$. So $Z$ never hits $0$, and $m(\omega)=\min_{t\le T}Z_t>0$.

**Defining $\Phi$.** Set $\Phi=H/Z$. Then $\int_0^T|\Phi|^2\le m^{-2}\int_0^T|H|^2<\infty$, so $\Phi\in M^2_{\rm loc}$. Apply Itô's formula to $\log Z$ (localized at $\tau_n=\inf\{s:Z_s\le1/n\}\wedge T$, using a $C^2$ function $f_n$ equal to $\log$ on $[1/n,\infty)$):
$$
\log Z_{t\wedge\tau_n}=\int_0^{t\wedge\tau_n}\Phi_s\cdot dB_s-\frac12\int_0^{t\wedge\tau_n}|\Phi_s|^2ds.
$$
Since $\tau_n=T$ eventually (a.s.), we get $Z_t=\exp(\int_0^t\Phi\cdot dB-\frac12\int_0^t|\Phi|^2)$. Girsanov then gives the last claim.

---

## 5. Exercises

### Toolbox for this chapter

- **Girsanov recipe.** (1) Identify the target drift. (2) Solve for $\Phi$: you want $\widetilde B=B-\int\Phi\,ds$ to be a $Q$-BM. (3) Write $Z_T=\exp(\int_0^T\Phi\cdot dB-\frac12\int_0^T|\Phi|^2ds)$. (4) Check that $Z$ is a martingale: Novikov ($\Phi$ bounded or deterministic gives this at once), Cor 7.7, or $E Z_T=1$ directly. (5) Conclude, and rewrite SDEs under $Q$ with $dB=d\widetilde B+\Phi\,dt$.
- **Computing $E_Q$.** $E_Q[F]=E_P[Z_TF]$. Usually it is easier to use the $Q$-dynamics, i.e. to compute the law of the process under $Q$ directly.
- **Computing $E_P$ of awkward products.** Recognize $e^{\int\Phi dB-\frac12\int|\Phi|^2}$ inside $E_P[\cdots]$ and turn it into $E_Q[\cdots]$.
- **Representation recipe** for $F=f(B_T)$: $M_t=E[F\mid\mathcal F_t]=u(t,B_t)$ with $u(t,x)=E[f(x+B_T-B_t)]=E[f(x+\sqrt{T-t}\,N)]$. Then $u$ solves $u_t+\frac12u_{xx}=0$, so $dM_t=u_x(t,B_t)\,dB_t$ and $\varphi_t=u_x(t,B_t)$. Shortcut (Clark–Ocone, Baldi Ex. 12.9d): if $f$ is $C^1$ with bounded derivative, $\varphi_t=E[f'(B_T)\mid\mathcal F_t]$.
- **Gaussian facts.** $E[e^{\sigma N}]=e^{\sigma^2/2}$. $E[e^{aN^2}]=(1-2a)^{-1/2}$ for $a<\frac12$, $N\sim N(0,1)$. $E[N^4]=3$. $E[\cos(\sigma N)]=e^{-\sigma^2/2}$, $E[\sin(\sigma N)]=0$.

---

### Exercise 1 (★, 15 min). Brownian motion with drift

Let $B$ be a real BM on $[0,T]$ under $P$, and $\mu\in\mathbb R$.

(a) Find a probability $Q\sim P$ on $\mathcal F_T$ under which $W_t=B_t+\mu t$ is a BM. Give $dQ/dP$ and check Novikov.
(b) Compute $E_Q[B_T]$, $E_Q[B_T^2]$ and $E_Q[e^{B_T}]$.
(c) Verify $E_Q[e^{B_T}]$ by a direct computation under $P$.

**Strategy.** Write $B_t+\mu t=B_t-\int_0^t(-\mu)ds$, so $\Phi\equiv-\mu$. Constant $\Phi$ means Novikov is trivial. Under $Q$, $B_T=W_T-\mu T$.

**Full solution.**

(a) Take $\Phi_s\equiv-\mu$ (deterministic, so in $M^2$). Then
$$
Z_t=\exp\Big(-\mu B_t-\frac{\mu^2}{2}t\Big),\qquad\frac{dQ}{dP}\Big|_{\mathcal F_T}=Z_T=e^{-\mu B_T-\frac{\mu^2}2T}.
$$
Novikov: $E_P[e^{\frac12\int_0^T\mu^2ds}]=e^{\mu^2T/2}<\infty$. So $Z$ is a (UI) martingale, $E_PZ_T=1$, $Q$ is a probability, and $Q\sim P$ on $\mathcal F_T$ because $Z_T>0$. By Girsanov, $\widetilde B_t=B_t-\int_0^t(-\mu)ds=B_t+\mu t=W_t$ is an $(\mathcal F_t)$-BM under $Q$ on $[0,T]$.

(b) Under $Q$, $B_T=W_T-\mu T$ with $W_T\sim N(0,T)$. So
$$
E_Q[B_T]=-\mu T,\qquad E_Q[B_T^2]=\operatorname{Var}_Q(B_T)+(E_QB_T)^2=T+\mu^2T^2,\qquad E_Q[e^{B_T}]=e^{-\mu T}E_Q[e^{W_T}]=e^{T/2-\mu T}.
$$

(c) Directly:
$$
E_Q[e^{B_T}]=E_P\big[e^{B_T}e^{-\mu B_T-\frac{\mu^2}{2}T}\big]=e^{-\frac{\mu^2}2T}E_P\big[e^{(1-\mu)B_T}\big]=e^{-\frac{\mu^2}2T+\frac{(1-\mu)^2}{2}T}=e^{\frac T2-\mu T}.
$$

**Common pitfalls.**

- A wrong sign of $\Phi$. Remember: $\widetilde B=B-\int\Phi$, so a drift **$+\mu$** added to $B$ corresponds to $\Phi=-\mu$.
- Forgetting to say why $Q$ is a probability equivalent to $P$ ($Z$ is a martingale and $Z_T>0$).
- Claiming $Q\sim P$ on $\mathcal F_\infty$. It is only on $\mathcal F_T$ (see Exercise 15).

---

### Exercise 2 (★, 15 min). Removing a time-dependent or bounded random drift

(a) Let $\theta_s=s$. Find $Q$ such that $B_t-\frac{t^2}{2}$ is a $Q$-BM on $[0,T]$. Write $dQ/dP$ without stochastic integrals, and compute $E_Q[B_T]$.
(b) Let $\theta_s=\sin(B_s)$. Show that there is $Q\sim P$ with $B_t-\int_0^t\sin(B_s)\,ds$ a $Q$-BM, and write the SDE satisfied by $B$ under $Q$.

**Strategy.** Here the drift is given as $\int\theta\,ds$, so $\Phi=\theta$ directly. Deterministic or bounded $\Phi$ satisfies Novikov.

**Full solution.**

(a) $B_t-\frac{t^2}{2}=B_t-\int_0^ts\,ds$, so $\Phi_s=s$. Novikov: $E\exp(\frac12\int_0^Ts^2ds)=e^{T^3/6}<\infty$. Hence
$$
\frac{dQ}{dP}=\exp\Big(\int_0^Ts\,dB_s-\frac12\int_0^Ts^2ds\Big)=\exp\Big(TB_T-\int_0^TB_s\,ds-\frac{T^3}{6}\Big).
$$
Here we used the product rule $d(sB_s)=B_s\,ds+s\,dB_s$, which gives $\int_0^Ts\,dB_s=TB_T-\int_0^TB_s\,ds$. Under $Q$, $B_T=\widetilde B_T+\frac{T^2}{2}$, so $E_Q[B_T]=\frac{T^2}{2}$.

Check: $\int_0^Ts\,dB_s\sim N(0,T^3/3)$, so $E_P[Z_T]=e^{T^3/6-T^3/6}=1$. ✓

(b) $\Phi_s=\sin(B_s)$ is continuous and adapted, hence progressively measurable, with $|\Phi_s|\le1$. Novikov: $E\exp(\frac12\int_0^T\sin^2(B_s)ds)\le e^{T/2}<\infty$. So
$$
Z_T=\exp\Big(\int_0^T\sin(B_s)\,dB_s-\frac12\int_0^T\sin^2(B_s)\,ds\Big)
$$
defines $Q\sim P$, and $\widetilde B_t=B_t-\int_0^t\sin(B_s)\,ds$ is a $Q$-BM. Under $Q$,
$$
dB_t=\sin(B_t)\,dt+d\widetilde B_t,\qquad B_0=0,
$$
i.e. $B$ is a (weak) solution of the SDE with drift $\sin x$ and unit diffusion.

**Common pitfalls.**

- Writing $\int_0^ts\,dB_s=tB_t$. You forgot the $-\int B\,ds$ term.
- In (b), saying "$\Phi\in M^2$, hence $Z$ is a martingale". Belonging to $M^2$ is **not enough**. Use Novikov with the bound $|\Phi|\le1$.

---

### Exercise 3 (★, 15 min). Positive local martingales and the criterion $E Z_T=1$

Let $Z$ be a continuous, strictly positive local martingale on $[0,T]$ with $Z_0=1$ (e.g. a real stochastic exponential).

(a) Show that $Z$ is a supermartingale and $E[Z_t]\le1$.
(b) Show that $Z$ is a martingale on $[0,T]$ if and only if $E[Z_T]=1$.

**Strategy.** Fatou's lemma along a localizing sequence. For (b): a supermartingale with constant expectation is a martingale.

**Full solution.**

(a) Let $\tau_n\uparrow\infty$ be a localizing sequence: $Z_{\cdot\wedge\tau_n}$ is a martingale. For $s\le t\le T$, $Z_{t\wedge\tau_n}\to Z_t$ a.s. and $Z\ge0$, so by the conditional Fatou lemma
$$
E[Z_t\mid\mathcal F_s]=E\big[\liminf_nZ_{t\wedge\tau_n}\mid\mathcal F_s\big]\le\liminf_nE[Z_{t\wedge\tau_n}\mid\mathcal F_s]=\liminf_nZ_{s\wedge\tau_n}=Z_s.
$$
Taking $s=0$ and expectations: $E[Z_t]\le Z_0=1$, so $Z_t\in L^1$. Hence $Z$ is a supermartingale.

(b) "$\Rightarrow$" is clear: $E Z_T=E Z_0=1$. "$\Leftarrow$": by the supermartingale property, for $t\le T$, $1\ge E Z_t\ge E Z_T=1$, so $E Z_t=1$ for all $t$. For $s\le t$, $D:=Z_s-E[Z_t\mid\mathcal F_s]\ge0$ and $E[D]=E Z_s-E Z_t=0$. So $D=0$ a.s., i.e. $E[Z_t\mid\mathcal F_s]=Z_s$. $\square$

**Common pitfalls.**

- Applying Fatou to a signed sequence. Positivity of $Z$ is essential.
- Concluding $E Z_t=1$ from "$Z$ is a local martingale". This is false in general (Exercise 10).

---

### Exercise 4 (★, 15 min). Change back from $Q$ to $P$, and computing $E_P$ via $Q$

Let $\Phi$ be real, $Z$ a martingale, and $dQ=Z_TdP$.

(a) Show that $(Z_t^{-1})_{t\le T}$ is a $Q$-martingale and that $dP=Z_T^{-1}dQ$ on $\mathcal F_T$.
(b) Let $B$ be real and $\mu\in\mathbb R$. Use Girsanov to compute $E_P[B_Te^{\mu B_T}]$ and $E_P[B_T^2e^{\mu B_T}]$. Check the results by differentiating $E[e^{\mu B_T}]=e^{\mu^2T/2}$.

**Strategy.** (a) Lemma 7.4 with $Y=Z^{-1}$: $ZY=1$ is trivially a $P$-martingale. (b) $e^{\mu B_T}=e^{\mu^2T/2}\cdot\big(e^{\mu B_T-\mu^2T/2}\big)$, where the second factor is the density of the $Q$ under which $B_t-\mu t$ is a BM.

**Full solution.**

(a) $Y_t=Z_t^{-1}$ is adapted, and $Z_tY_t=1$ is a $P$-martingale. By Lemma 7.4, $Y$ is a $Q$-martingale. For $A\in\mathcal F_T$, $E_Q[Z_T^{-1}\mathbf 1_A]=E_P[Z_TZ_T^{-1}\mathbf 1_A]=P(A)$, so $dP=Z_T^{-1}dQ$ on $\mathcal F_T$.

(b) Let $dQ=e^{\mu B_T-\mu^2T/2}dP$ ($\Phi\equiv\mu$, Novikov is trivial). Under $Q$, $B_t-\mu t$ is a BM, so $B_T\sim N(\mu T,T)$. Then
$$
E_P[B_Te^{\mu B_T}]=e^{\mu^2T/2}E_P\big[B_Te^{\mu B_T-\mu^2T/2}\big]=e^{\mu^2T/2}E_Q[B_T]=\mu Te^{\mu^2T/2},
$$
$$
E_P[B_T^2e^{\mu B_T}]=e^{\mu^2T/2}E_Q[B_T^2]=e^{\mu^2T/2}(T+\mu^2T^2).
$$
Check: $\frac{d}{d\mu}e^{\mu^2T/2}=\mu Te^{\mu^2T/2}$ and $\frac{d^2}{d\mu^2}e^{\mu^2T/2}=(T+\mu^2T^2)e^{\mu^2T/2}$. ✓ (Differentiating under $E$ is allowed by dominated convergence.)

**Common pitfalls.** Forgetting the factor $e^{\mu^2T/2}$ when you insert the density.

---

### Exercise 5 (★★, 20 min). Geometric Brownian motion: the risk-neutral measure

Let $dS_t=\mu S_t\,dt+\sigma S_t\,dB_t$, $S_0=s>0$, with $\sigma>0$, and let $r\in\mathbb R$.

(a) Find $Q\sim P$ on $\mathcal F_T$ under which $\widetilde S_t=e^{-rt}S_t$ is a martingale. Give $dQ/dP$.
(b) Write the $Q$-dynamics of $S$ and compute $E_Q[S_T]$, $E_Q[S_T^2]$ and $Q(S_T>K)$ for $K>0$.

**Strategy.** Drift removal (Section 2.4): $A_t=\mu S_t$, $G_t=\sigma S_t$, target drift $rS_t$. Solve $\mu S+\sigma S\Phi=rS$.

**Full solution.**

(a) We need $\mu S_t+\sigma S_t\Phi_t=rS_t$, i.e. $\Phi\equiv-\theta$ with $\theta=\frac{\mu-r}{\sigma}$ (the "market price of risk"). Constant, so Novikov holds and
$$
\frac{dQ}{dP}=\exp\Big(-\theta B_T-\frac{\theta^2}{2}T\Big).
$$
Under $Q$, $W_t=B_t+\theta t$ is a BM, and $dS_t=\mu S_tdt+\sigma S_t(dW_t-\theta\,dt)=rS_t\,dt+\sigma S_t\,dW_t$. By Itô's product rule, $d\widetilde S_t=-re^{-rt}S_tdt+e^{-rt}dS_t=\sigma\widetilde S_t\,dW_t$. So
$$
\widetilde S_t=s\exp\Big(\sigma W_t-\frac{\sigma^2}{2}t\Big),
$$
an exponential martingale under $Q$ (deterministic exponent coefficient, so it is a true martingale).

(b) $S_T=s\exp\big((r-\frac{\sigma^2}{2})T+\sigma W_T\big)$ with $W_T\sim N(0,T)$ under $Q$. Then
$$
E_Q[S_T]=se^{rT},\qquad E_Q[S_T^2]=s^2e^{2rT-\sigma^2T}E_Q[e^{2\sigma W_T}]=s^2e^{2rT-\sigma^2T+2\sigma^2T}=s^2e^{(2r+\sigma^2)T},
$$
$$
Q(S_T>K)=Q\Big(W_T>\frac{\log(K/s)-(r-\sigma^2/2)T}{\sigma}\Big)=\mathcal N(d_2),\qquad d_2=\frac{\log(s/K)+(r-\frac{\sigma^2}2)T}{\sigma\sqrt T},
$$
where $\mathcal N$ is the standard normal cdf.

**Common pitfalls.**

- Thinking that $\sigma$ changes under $Q$. It does not: only the drift changes.
- A sign error in $\theta$: $\Phi=-(\mu-r)/\sigma$, **not** $+(\mu-r)/\sigma$.

---

### Exercise 6 (★★, 25 min). Drift removal for an SDE with bounded drift

Let $X$ solve $dX_t=b(X_t)\,dt+dB_t$, $X_0=x$, with $b:\mathbb R\to\mathbb R$ bounded and measurable.

(a) Find $Q\sim P$ on $\mathcal F_T$ such that $(X_t-x)_{t\le T}$ is a $Q$-BM.
(b) Express $dQ/dP$ in terms of $X$ only (no $B$).
(c) Deduce: for bounded measurable $f$,
$$
E_P[f(X_T)]=E\Big[f(x+W_T)\exp\Big(\int_0^Tb(x+W_s)\,dW_s-\frac12\int_0^Tb(x+W_s)^2ds\Big)\Big],
$$
where $W$ is a BM.

**Strategy.** Under $Q$ we want $X-x=B+\int b(X)\,ds$ to be the Brownian motion $\widetilde B=B-\int\Phi$. So $\Phi=-b(X)$. Then invert with $dP=Z_T^{-1}dQ$.

**Full solution.**

(a) Let $\Phi_s=-b(X_s)$. It is progressively measurable and bounded by $\|b\|_\infty$, so Novikov holds: $E\exp(\frac12\int_0^T\Phi^2)\le e^{\|b\|_\infty^2T/2}$. With
$$
Z_T=\exp\Big(-\int_0^Tb(X_s)\,dB_s-\frac12\int_0^Tb(X_s)^2ds\Big),\qquad dQ=Z_TdP,
$$
Girsanov gives that $\widetilde B_t=B_t+\int_0^tb(X_s)\,ds=X_t-x$ is a $Q$-BM.

(b) Substitute $dB_s=dX_s-b(X_s)ds$:
$$
Z_T=\exp\Big(-\int_0^Tb(X_s)\,dX_s+\int_0^Tb(X_s)^2ds-\frac12\int_0^Tb(X_s)^2ds\Big)=\exp\Big(-\int_0^Tb(X_s)\,dX_s+\frac12\int_0^Tb(X_s)^2ds\Big).
$$

(c) By Exercise 4(a), $dP=Z_T^{-1}dQ$, and
$$
Z_T^{-1}=\exp\Big(\int_0^Tb(X_s)\,dX_s-\frac12\int_0^Tb(X_s)^2ds\Big).
$$
Hence $E_P[f(X_T)]=E_Q\big[f(X_T)\exp(\int_0^Tb(X_s)dX_s-\frac12\int_0^Tb(X_s)^2ds)\big]$. Under $Q$, $X=x+W$ with $W:=X-x$ a BM. The expression inside $E_Q$ is a functional of the path $(X_s)_{s\le T}$, and the stochastic integral $\int b(X)\,dX$ is the integral against the $Q$-BM $W$. So the expectation depends only on the $Q$-law of $W$, which gives the formula.

**Common pitfalls.**

- Forgetting that $\int b(X)\,dB$ and $\int b(X)\,dX$ differ by $\int b^2\,ds$.
- Mixing up $Z_T$ (density of $Q$ w.r.t. $P$) and $Z_T^{-1}$ (density of $P$ w.r.t. $Q$).
- This is exactly the idea of **Thm 8.25 (weak existence via Girsanov)**: start from a BM $X-x$ and define $Q$ so that $X$ solves the SDE. Know both directions.

---

### Exercise 7 (★★, 20 min). Which stochastic exponentials are martingales?

Decide whether $Z_t=\exp(\int_0^t\Phi_s\,dB_s-\frac12\int_0^t\Phi_s^2ds)$ is a martingale on $[0,T]$ when:

(a) $\Phi_s=f(s)$ with $f\in L^2([0,T])$ deterministic (assignment 2026, Problem 1.3).
(b) $\Phi_s=\operatorname{sign}(B_s)$, or more generally $|\Phi|\le K$.
(c) $\Phi_s=B_s$.
(d) $\Phi_s=\mathbf 1_{\{s\le\tau\}}h(s)$, where $\tau$ is a stopping time and $h$ is deterministic with $\int_0^Th^2<\infty$.

**Strategy.** Novikov whenever $\int_0^T\Phi^2$ is bounded by a deterministic constant. For (c), Cor 7.7. For (a), also a direct Gaussian computation.

**Full solution.**

(a) $\int_0^T\Phi^2=\|f\|_2^2$ is deterministic, so Novikov holds: $E e^{\frac12\|f\|_2^2}<\infty$. Hence $Z$ is a martingale. Directly: for $s\le t$, $\int_s^tf\,dB\sim N(0,\int_s^tf^2)$ and is independent of $\mathcal F_s$, so
$$
E[Z_t\mid\mathcal F_s]=Z_sE\Big[e^{\int_s^tf\,dB-\frac12\int_s^tf^2}\Big]=Z_s.
$$
Also $E Z_t=1$, $E Z_t^2=e^{\int_0^tf^2}$, and $Z>0$. So $Z$ is a martingale, not merely a super- or submartingale.

(b) $\int_0^T\Phi^2\le K^2T$, so Novikov gives a martingale. (Prop 7.3 also gives boundedness in every $L^p$.)

(c) Novikov: $E\exp(\frac12\int_0^TB_s^2ds)<\infty$ only if $T<\pi/2$ (Exercise 8(d)). So Novikov **fails** for $T\ge\pi/2$. But Cor 7.7 applies: $E[e^{\delta B_t^2}]=(1-2\delta t)^{-1/2}\le(1-2\delta T)^{-1/2}$ for $\delta<\frac1{2T}$. So $Z$ is a martingale for **every** $T$ (Example 7.8 with $\theta=1$).

(d) $\int_0^T\Phi^2\le\int_0^Th^2$, deterministic. So Novikov holds and $Z$ is a martingale.

**Common pitfalls.**

- Saying "Novikov fails, so $Z$ is not a martingale". Novikov is only **sufficient**.
- Remark (beyond the syllabus): for $\Phi_s=B_s^2$, $Z$ is **not** a martingale for any $T>0$. This is related to the explosion of $dX=X^2dt+dW$.

---

### Exercise 8 (★★, 30 min). Example 7.8 in detail: OU under $Q$ and the Cameron–Martin formula

Let $B$ be real, $\theta\ne0$, $Z_t=\exp(\theta\int_0^tB_s\,dB_s-\frac{\theta^2}{2}\int_0^tB_s^2ds)$, $dQ=Z_TdP$.

(a) Show that under $Q$, $B$ is an OU process. Compute $E_Q[B_t]$ and $\operatorname{Var}_Q(B_t)$ for $t\le T$.
(b) Show that $Z_t=\exp\big(\frac\theta2(B_t^2-t)-\frac{\theta^2}2\int_0^tB_s^2ds\big)$.
(c) Deduce the Cameron–Martin formula: for $\lambda>0$,
$$
E_P\Big[\exp\Big(-\lambda\int_0^tB_s^2ds\Big)\Big]=\big(\cosh(\sqrt{2\lambda}\,t)\big)^{-1/2}.
$$
(d) (Remark) The analogous formula $E\exp(c\int_0^tB_s^2ds)=(\cos(\sqrt{2c}\,t))^{-1/2}$ holds for $\sqrt{2c}\,t<\pi/2$, and the expectation is $+\infty$ for $\sqrt{2c}\,t\ge\pi/2$. Conclude when Novikov holds for $\Phi=\theta B$.

**Strategy.** Girsanov with $\Phi=\theta B$ (a martingale by Cor 7.7, see Section 2.6). Solve the linear SDE under $Q$. Itô's formula gives $\int B\,dB=\frac12(B^2-t)$. Then turn the $P$-expectation into a $Q$-expectation of a function of the Gaussian $B_t$.

**Full solution.**

(a) $Z$ is a martingale (Example 7.8/Cor 7.7). By Girsanov, $W_t=B_t-\theta\int_0^tB_sds$ is a $Q$-BM on $[0,T]$. So $dB_t=\theta B_tdt+dW_t$, $B_0=0$. This linear SDE has the solution (product rule on $e^{-\theta t}B_t$)
$$
B_t=\int_0^te^{\theta(t-s)}dW_s.
$$
A Wiener integral of a deterministic function, hence Gaussian. So $E_Q[B_t]=0$ and
$$
\operatorname{Var}_Q(B_t)=\int_0^te^{2\theta(t-s)}ds=\frac{e^{2\theta t}-1}{2\theta}=:v_t.
$$

(b) By Itô, $d(B_t^2)=2B_tdB_t+dt$, so $\int_0^tB_sdB_s=\frac12(B_t^2-t)$. Substitute.

(c) Fix $t\le T$. By (b),
$$
\exp\Big(-\frac{\theta^2}2\int_0^tB_s^2ds\Big)=Z_t\exp\Big(-\frac\theta2(B_t^2-t)\Big).
$$
Take $P$-expectations, using $E_P[Z_tY]=E_Q[Y]$ for $\mathcal F_t$-measurable $Y\ge0$:
$$
E_P\Big[e^{-\frac{\theta^2}2\int_0^tB_s^2ds}\Big]=e^{\theta t/2}E_Q\big[e^{-\frac\theta2B_t^2}\big]=e^{\theta t/2}(1+\theta v_t)^{-1/2}.
$$
Here we used $E[e^{-aN^2}]=(1+2av)^{-1/2}$ for $N\sim N(0,v)$ and $1+2av>0$, with $a=\theta/2$. Now $1+\theta v_t=1+\frac{e^{2\theta t}-1}{2}=\frac{1+e^{2\theta t}}{2}>0$, so
$$
E_P\Big[e^{-\frac{\theta^2}2\int_0^tB_s^2ds}\Big]=\Big(\frac{e^{-\theta t}(1+e^{2\theta t})}{2}\Big)^{-1/2}=\Big(\frac{e^{\theta t}+e^{-\theta t}}{2}\Big)^{-1/2}=(\cosh\theta t)^{-1/2}.
$$
With $\lambda=\theta^2/2$, i.e. $|\theta|=\sqrt{2\lambda}$ ($\cosh$ is even): $E\exp(-\lambda\int_0^tB^2)=(\cosh(\sqrt{2\lambda}t))^{-1/2}$.

Sanity check for small $t$: $\cosh(\sqrt{2\lambda}t)^{-1/2}\approx1-\frac{\lambda t^2}{2}$, and $E[1-\lambda\int_0^tB_s^2ds]=1-\lambda\frac{t^2}{2}$. ✓

(d) Novikov for $\Phi=\theta B$ reads $E\exp(\frac{\theta^2}{2}\int_0^TB_s^2ds)<\infty$, i.e. $c=\theta^2/2$, $\sqrt{2c}=|\theta|$. So Novikov holds iff $|\theta|T<\pi/2$. But $Z$ is a martingale for **every** $T$ by Cor 7.7. (One way to see the blow-up: by the Karhunen–Loève expansion, $\int_0^TB^2=\sum_k\lambda_k\xi_k^2$ with $\xi_k$ i.i.d. $N(0,1)$ and largest eigenvalue $\lambda_1=4T^2/\pi^2$. Then $E e^{c\lambda_1\xi_1^2}=\infty$ iff $2c\lambda_1\ge1$, i.e. $\sqrt{2c}\,T\ge\pi/2$.)

**Common pitfalls.**

- Writing $\int_0^tB\,dB=\frac12B_t^2$. The $-\frac t2$ is the Itô correction.
- Using $E_P[Z_TY]$ with $Y$ $\mathcal F_t$-measurable: it equals $E_P[Z_tY]$. Either is fine, but be consistent.
- Computing $\operatorname{Var}_Q(B_t)=t$. Under $Q$, $B$ is **not** a BM.

---

### Exercise 9 (★★, 20 min). Brownian bridge via Girsanov (Baldi Ex. 12.4)

Let $0<T<1$ and $Z_t=(1-t)^{-1/2}\exp\big(-\frac{B_t^2}{2(1-t)}\big)$ for $t\le T$.

(a) Show that $Z_t=\exp\big(-\int_0^t\frac{B_s}{1-s}dB_s-\frac12\int_0^t\frac{B_s^2}{(1-s)^2}ds\big)$.
(b) Show that $Z$ is a martingale on $[0,T]$.
(c) With $dQ=Z_TdP$, identify the law of $B$ under $Q$, and compute $\operatorname{Var}_Q(B_T)$ in two ways.

**Strategy.** Itô's formula on $g(t,x)=-\frac{x^2}{2(1-t)}-\frac12\log(1-t)$. For (b) use the criterion $E Z_T=1$ (Exercise 3). For (c) use Girsanov and the bridge SDE.

**Full solution.**

(a) Let $g(t,x)=-\frac{x^2}{2(1-t)}-\frac12\log(1-t)$, so $Z_t=e^{g(t,B_t)}$. We have $g_x=-\frac{x}{1-t}$, $g_{xx}=-\frac{1}{1-t}$, $g_t=-\frac{x^2}{2(1-t)^2}+\frac{1}{2(1-t)}$. By Itô,
$$
dg(t,B_t)=\Big(g_t+\frac12g_{xx}\Big)dt+g_xdB_t=-\frac{B_t^2}{2(1-t)^2}dt-\frac{B_t}{1-t}dB_t.
$$
Since $g(0,0)=0$, this proves the claim, with $\Phi_s=-\frac{B_s}{1-s}$ ($\Phi\in M^2$ on $[0,T]$, $T<1$).

(b) $Z>0$ is a stochastic exponential, hence a supermartingale. Using $E[e^{-cB_T^2}]=(1+2cT)^{-1/2}$ with $c=\frac1{2(1-T)}$ (so $2cT=\frac{T}{1-T}$),
$$
E Z_T=(1-T)^{-1/2}\Big(1+\frac{T}{1-T}\Big)^{-1/2}=(1-T)^{-1/2}(1-T)^{1/2}=1.
$$
By Exercise 3, $Z$ is a martingale on $[0,T]$.

(c) By Girsanov, $W_t=B_t+\int_0^t\frac{B_s}{1-s}ds$ is a $Q$-BM on $[0,T]$. So under $Q$
$$
dB_t=-\frac{B_t}{1-t}dt+dW_t,\qquad B_0=0,
$$
which is the SDE of the **Brownian bridge** from $0$ to $0$ on $[0,1]$, restricted to $[0,T]$. The solution is $B_t=(1-t)\int_0^t\frac{dW_s}{1-s}$, so
$$
\operatorname{Var}_Q(B_T)=(1-T)^2\int_0^T\frac{ds}{(1-s)^2}=(1-T)^2\Big(\frac1{1-T}-1\Big)=T(1-T).
$$
Second way: the $Q$-density of $B_T$ is proportional to $e^{-\frac{x^2}{2T}}e^{-\frac{x^2}{2(1-T)}}=e^{-\frac{x^2}{2}\left(\frac1T+\frac1{1-T}\right)}=e^{-\frac{x^2}{2T(1-T)}}$. ✓

**Common pitfalls.** The time horizon must satisfy $T<1$: $\Phi$ blows up at $t=1$, and $Q$ would be singular w.r.t. $P$ on $\mathcal F_1$ (under $Q$, $B_1=0$).

---

### Exercise 10 (★★★, 30 min). A stochastic exponential that is NOT a martingale

On $[0,1]$, let $X_t=\int_0^t\frac{dB_s}{1-s}$ for $t<1$, with $\langle X\rangle_t=\int_0^t\frac{ds}{(1-s)^2}=\frac1{1-t}-1\to\infty$ as $t\uparrow1$. Let $Y_t=X_t-\frac12\langle X\rangle_t$ and $\tau=\inf\{t<1:Y_t=-1\}$.

(a) Admit that $\tau<1$ a.s. (by the Dambis–Dubins–Schwarz time change, $Y_t=\beta_{u}-\frac u2$ with $u=\langle X\rangle_t$ and $\beta$ a BM; and $\beta_u-\frac u2\to-\infty$ as $u\to\infty$). Define $\Phi_s=\frac{1}{1-s}\mathbf 1_{\{s<\tau\}}$. Show that $\Phi\in M^2_{\rm loc}([0,1])$ and compute the stochastic exponential $Z$ of $\Phi$.
(b) Show that $E[Z_1]=e^{-1}<1$. Conclude that $Z$ is a positive local martingale and a strict supermartingale, but not a martingale. Which hypothesis of Girsanov fails?
(c) Why must Novikov fail here? Check it directly.

**Strategy.** The stopped exponential is $\exp(Y_{t\wedge\tau})$. At time $1$ it is deterministic.

**Full solution.**

(a) $\Phi$ is progressively measurable ($\{s<\tau\}$ is adapted, left-continuous in $s$). Since $\tau<1$ a.s.,
$$
\int_0^1\Phi_s^2ds=\int_0^\tau\frac{ds}{(1-s)^2}=\frac{1}{1-\tau}-1<\infty\quad\text{a.s.}
$$
So $\Phi\in M^2_{\rm loc}([0,1])$. In fact $\Phi\in M^2$: $\langle X\rangle_\tau$ is the hitting time of $-1$ by the BM with drift $\beta_u-\frac u2$, whose mean is $1/(1/2)=2<\infty$. For $t\le1$,
$$
\int_0^t\Phi_sdB_s=X_{t\wedge\tau},\qquad\int_0^t\Phi_s^2ds=\langle X\rangle_{t\wedge\tau},\qquad Z_t=\exp\big(X_{t\wedge\tau}-\tfrac12\langle X\rangle_{t\wedge\tau}\big)=e^{Y_{t\wedge\tau}}.
$$

(b) By continuity $Y_\tau=-1$, so $Z_1=e^{Y_\tau}=e^{-1}$ a.s. Hence $E Z_1=e^{-1}\ne1=Z_0$. $Z$ is a positive local martingale (Def. 7.2), hence a supermartingale (Exercise 3), but not a martingale. In Girsanov, the hypothesis "**$Z$ is a martingale**" fails. Indeed $Z_1\,dP$ has total mass $e^{-1}$ and does not define a probability.

(c) If Novikov held, Thm 7.6 would give that $Z$ is a martingale, which contradicts (b). Directly: $\frac12\int_0^1\Phi^2=\frac12\langle X\rangle_\tau$, and $\langle X\rangle_\tau$ is the hitting time of $-1$ by $\beta_u-\frac u2$. Its Laplace transform $E[e^{\alpha\langle X\rangle_\tau}]$ is finite only for $\alpha\le\frac18$ (for BM with drift $-\nu$, the hitting time $\sigma$ of $-a$ has $E e^{-\gamma\sigma}=e^{-a(\sqrt{\nu^2+2\gamma}-\nu)}$, which needs $\nu^2+2\gamma\ge0$, i.e. $\gamma\ge-\frac{\nu^2}{2}=-\frac18$). Since $\frac12>\frac18$, Novikov fails.

**Common pitfalls.**

- Believing that every stochastic exponential is a martingale. In general it is only a local martingale and a supermartingale.
- Other classical strict local martingales: $1/|W_t|$ for a 3-dimensional BM $W$ started at $W_0\ne0$ (the inverse Bessel process), and the exponential of $\Phi_s=B_s^2$.

---

### Exercise 11 (★★, 20 min). Multi-dimensional drift removal

Let $B$ be a 2-dimensional BM, $X_t=GB_t+At$ with $A\in\mathbb R^2$ constant and $G$ an invertible $2\times2$ matrix.

(a) Find $Q$ such that $(X_t)_{t\le T}$ has no drift under $Q$, i.e. $X_t=G\widetilde B_t$ with $\widetilde B$ a $Q$-BM.
(b) Make it explicit for $G=\begin{pmatrix}1&0\\1&1\end{pmatrix}$ and $A=(1,2)^\top$.

**Strategy.** $dX=A\,dt+G\,dB$. Under $Q$, $dX=(A+G\Phi)dt+G\,d\widetilde B$. Take $\Phi=-G^{-1}A$.

**Full solution.**

(a) $\Phi\equiv-G^{-1}A\in\mathbb R^2$, constant, so Novikov holds. Then
$$
\frac{dQ}{dP}=\exp\Big(-\langle G^{-1}A,B_T\rangle-\frac12|G^{-1}A|^2T\Big),
$$
$\widetilde B_t=B_t+G^{-1}At$ is a $Q$-BM, and $X_t=G(\widetilde B_t-G^{-1}At)+At=G\widetilde B_t$.

(b) $G^{-1}=\begin{pmatrix}1&0\\-1&1\end{pmatrix}$, so $G^{-1}A=(1,1)^\top$. Then
$$
\frac{dQ}{dP}=\exp\big(-B^1_T-B^2_T-T\big),
$$
and $\widetilde B=(B^1_t+t,\,B^2_t+t)$ is a $Q$-BM. Check: $X^1=B^1+t=\widetilde B^1$ and $X^2=B^1+B^2+2t=\widetilde B^1+\widetilde B^2$. ✓

**Common pitfalls.** $|\Phi|^2$ is the Euclidean norm squared, here $1+1=2$, so $\frac12|\Phi|^2T=T$.

---

### Exercise 12 (★★, 25 min). Example 7.9: passage times of BM with drift

Let $a>0$, $\mu\in\mathbb R$, and let $\tau_a=\inf\{t:X_t\ge a\}$ for $X_t=W_t+\mu t$, $W$ a BM. You may use that, for a standard BM, $\tau_a$ has density $g_0(s)=\frac{a}{\sqrt{2\pi}s^{3/2}}e^{-a^2/(2s)}$ and Laplace transform $E[e^{-\gamma\tau_a}]=e^{-a\sqrt{2\gamma}}$ for $\gamma\ge0$.

(a) Show that $P(\tau_a\le t)=\int_0^tg_\mu(s)ds$ with $g_\mu(s)=e^{\mu a-\mu^2s/2}g_0(s)=\frac{a}{\sqrt{2\pi}s^{3/2}}\exp\big(-\frac{(\mu s-a)^2}{2s}\big)$.
(b) Show that $\int_0^\infty g_\mu=1$ if $\mu\ge0$ and $=e^{2\mu a}$ if $\mu<0$.
(c) Show that $E[\tau_a]=a/\mu$ for $\mu>0$.

**Strategy.** Realize BM with drift as $B$ under $Q$ with $dQ=Z_tdP$, $Z_t=e^{\mu B_t-\mu^2t/2}$. Then $Q(\tau_a\le t)=E_P[\mathbf 1_{\{\tau_a\le t\}}Z_t]$, and optional stopping replaces $Z_t$ by $Z_{\tau_a}$ on $\{\tau_a\le t\}$.

**Full solution.**

(a) Let $B$ be a $P$-BM and $\tau_a=\inf\{s:B_s\ge a\}$. Fix $t$ and let $Z_s=e^{\mu B_s-\mu^2s/2}$ ($\Phi\equiv\mu$, a martingale), $dQ=Z_tdP$. By Girsanov, $W_s=B_s-\mu s$ is a $Q$-BM for $s\le t$, so under $Q$, $(B_s)_{s\le t}=(W_s+\mu s)_{s\le t}$ is a BM with drift $\mu$. Since $\{\tau_a\le t\}$ depends only on the path up to $t$, the desired probability is $Q(\tau_a\le t)$. Now:

- $\{\tau_a\le t\}\in\mathcal F_{\tau_a}\cap\mathcal F_t=\mathcal F_{\tau_a\wedge t}$.
- By optional stopping for the martingale $Z$ and the bounded stopping time $\tau_a\wedge t\le t$: $E[Z_t\mid\mathcal F_{\tau_a\wedge t}]=Z_{\tau_a\wedge t}$.

Hence
$$
Q(\tau_a\le t)=E_P[\mathbf 1_{\{\tau_a\le t\}}Z_t]=E_P[\mathbf 1_{\{\tau_a\le t\}}Z_{\tau_a\wedge t}]=E_P[\mathbf 1_{\{\tau_a\le t\}}Z_{\tau_a}].
$$
On $\{\tau_a<\infty\}$, $B_{\tau_a}=a$ by continuity, so $Z_{\tau_a}=e^{\mu a-\mu^2\tau_a/2}$. Using the $P$-density $g_0$ of $\tau_a$:
$$
Q(\tau_a\le t)=\int_0^te^{\mu a-\mu^2s/2}\frac{a}{\sqrt{2\pi}s^{3/2}}e^{-\frac{a^2}{2s}}ds.
$$
The exponents combine: $-\frac{a^2}{2s}+\mu a-\frac{\mu^2s}{2}=-\frac{a^2-2\mu as+\mu^2s^2}{2s}=-\frac{(\mu s-a)^2}{2s}$. ✓

(b) $\int_0^\infty g_\mu=e^{\mu a}\int_0^\infty e^{-\frac{\mu^2}2s}g_0(s)ds=e^{\mu a}E[e^{-\frac{\mu^2}{2}\tau_a}]=e^{\mu a}e^{-a|\mu|}$. This equals $1$ if $\mu\ge0$ and $e^{2\mu a}$ if $\mu<0$. So for $\mu<0$, $P(\tau_a=\infty)=1-e^{2\mu a}$. (Equivalently $\sup_tX_t\sim\operatorname{Exp}(2|\mu|)$, see Exercise 13.)

(c) For $\mu>0$:
$$
E[\tau_a]=\int_0^\infty sg_\mu(s)ds=e^{\mu a}E\big[\tau_ae^{-\frac{\mu^2}{2}\tau_a}\big]=e^{\mu a}\Big(-\frac{d}{d\gamma}e^{-a\sqrt{2\gamma}}\Big)\Big|_{\gamma=\mu^2/2}=e^{\mu a}\frac{a}{\sqrt{2\gamma}}e^{-a\sqrt{2\gamma}}\Big|_{\gamma=\mu^2/2}=\frac a\mu.
$$
(Differentiation under $E$ is fine for $\gamma>0$.)

**Common pitfalls.**

- Forgetting the optional stopping step (you need $\{\tau_a\le t\}\in\mathcal F_{\tau_a\wedge t}$).
- $Q$ depends on $t$, but this is harmless: the $Q$'s are consistent, $Q_{t'}|_{\mathcal F_t}=Q_t$ for $t'\ge t$, since $Z$ is a martingale.

---

### Exercise 13 (★★★, 30 min). The supremum of BM with negative drift (Baldi Ex. 12.3)

Let $X_t=B_t-\mu t$ with $\mu>0$. Show that $\sup_{t\ge0}X_t\sim\operatorname{Exp}(2\mu)$.

(a) Let $Z_t=e^{2\mu B_t-2\mu^2t}$ and $dQ=Z_TdP$. Show that $\widetilde B_t=B_t-2\mu t$ is a $Q$-BM on $[0,T]$, and that $X_t=\widetilde B_t+\mu t$ under $Q$.
(b) Show that $Z_t^{-1}=e^{-2\mu X_t}$ is a $Q$-martingale.
(c) Let $\tau_R=\inf\{t:X_t=R\}$, $R>0$. Show $P(\tau_R\le T)=e^{-2\mu R}Q(\tau_R\le T)$.
(d) Conclude $P(\sup_tX_t\ge R)=e^{-2\mu R}$.

**Strategy.** Change to a measure where $X$ has **positive** drift, so it surely reaches $R$. Compensate with the density $Z^{-1}$, which is constant ($e^{-2\mu R}$) at $\tau_R$.

**Full solution.**

(a) $\Phi\equiv2\mu$ (constant, Novikov), $Z_t=e^{2\mu B_t-\frac12(2\mu)^2t}=e^{2\mu B_t-2\mu^2t}$. By Girsanov, $\widetilde B_t=B_t-2\mu t$ is a $Q$-BM, and $X_t=B_t-\mu t=\widetilde B_t+\mu t$.

(b) $Z_t^{-1}=e^{-2\mu B_t+2\mu^2t}=e^{-2\mu(B_t-\mu t)}=e^{-2\mu X_t}$. Since $Z_tZ_t^{-1}=1$ is a $P$-martingale, Lemma 7.4 shows that $Z^{-1}$ is a $Q$-martingale.

(c) $dP=Z_T^{-1}dQ$ on $\mathcal F_T$, and $\{\tau_R\le T\}\in\mathcal F_{\tau_R\wedge T}\subset\mathcal F_T$. By optional stopping for the $Q$-martingale $Z^{-1}$ at $\tau_R\wedge T\le T$,
$$
P(\tau_R\le T)=E_Q[\mathbf 1_{\{\tau_R\le T\}}Z_T^{-1}]=E_Q[\mathbf 1_{\{\tau_R\le T\}}Z^{-1}_{\tau_R\wedge T}]=E_Q[\mathbf 1_{\{\tau_R\le T\}}e^{-2\mu X_{\tau_R}}]=e^{-2\mu R}Q(\tau_R\le T).
$$

(d) Under $Q=Q_T$, $(X_t)_{t\le T}$ is a BM with drift $+\mu$. So $Q_T(\tau_R\le T)=P\big(\sup_{t\le T}(W_t+\mu t)\ge R\big)$ for a BM $W$. This increases to $P(\exists t:W_t+\mu t\ge R)=1$ as $T\to\infty$, since $W_t+\mu t\to+\infty$ a.s. (law of large numbers / iterated logarithm). Letting $T\to\infty$ in (c), with $\{\tau_R\le T\}\uparrow\{\tau_R<\infty\}$:
$$
P\Big(\sup_{t\ge0}X_t\ge R\Big)=P(\tau_R<\infty)=e^{-2\mu R},\qquad R>0.
$$
This is the tail of an $\operatorname{Exp}(2\mu)$ law.

**Common pitfalls.**

- Letting $T\to\infty$ inside $Q$ without care. $Q_T$ depends on $T$; we only used that the $Q_T$-law of $X$ on $[0,T]$ is that of BM with drift $\mu$.
- Forgetting that Lemma 7.4 gives the $Q$-martingale property of $Z^{-1}$.

---

### Exercise 14 (★★★, 35 min). A drift with a closed-form law (Baldi Ex. 12.6)

Let $X$ be a real $P$-BM, $x\in\mathbb R$, $k>0$, $c\in\mathbb R$, and $b(z)=k\tanh(kz+c)$.

(a) Find $Q$ under which $Y_t=x+X_t$ solves $dY_t=b(Y_t)dt+d\widetilde B_t$ on $[0,T]$, with $\widetilde B$ a $Q$-BM.
(b) Let $U(z)=\log\cosh(kz+c)$, a primitive of $b$. Show that
$$
\frac{dQ}{dP}=\exp\Big(U(Y_T)-U(x)-\frac12\int_0^T\big(b'(Y_s)+b(Y_s)^2\big)ds\Big)=\frac{\cosh(kY_T+c)}{\cosh(kx+c)}e^{-k^2T/2}.
$$
(c) Show that, under $Q$, $Y_T\sim\alpha\,N(x+kT,T)+(1-\alpha)\,N(x-kT,T)$ with $\alpha=\frac{e^{kx+c}}{2\cosh(kx+c)}$, and $E_Q[Y_T]=x+kT\tanh(kx+c)$.

**Strategy.** Girsanov with $\Phi_s=b(x+X_s)$ (bounded by $k$). Use Itô on $U(Y_t)$ to remove the stochastic integral. Note $b'+b^2\equiv k^2$. Then compute the Laplace transform.

**Full solution.**

(a) $\Phi_s=b(x+X_s)$, $|\Phi|\le k$, so Novikov holds and
$$
Z_T=\exp\Big(\int_0^Tb(Y_s)dX_s-\frac12\int_0^Tb(Y_s)^2ds\Big).
$$
By Girsanov, $\widetilde B_t=X_t-\int_0^tb(Y_s)ds$ is a $Q$-BM. Since $dY=dX$, $dY_t=b(Y_t)dt+d\widetilde B_t$.

(b) By Itô, $dU(Y_t)=b(Y_t)dX_t+\frac12b'(Y_t)dt$. So $\int_0^Tb(Y_s)dX_s=U(Y_T)-U(x)-\frac12\int_0^Tb'(Y_s)ds$. Substituting gives the first formula. Since $b'(z)=k^2(1-\tanh^2(kz+c))$ and $b^2=k^2\tanh^2(kz+c)$, we get $b'+b^2\equiv k^2$, and $e^{U(z)}=\cosh(kz+c)$.

(c) Let $X_T\sim N(0,T)$ under $P$ and $\lambda\in\mathbb R$. Write $\cosh(k(x+X_T)+c)=\frac12\big(e^{kx+c}e^{kX_T}+e^{-kx-c}e^{-kX_T}\big)$. Then
$$
E_Q[e^{\lambda Y_T}]=\frac{e^{\lambda x}e^{-k^2T/2}}{2\cosh(kx+c)}\Big(e^{kx+c}E[e^{(\lambda+k)X_T}]+e^{-kx-c}E[e^{(\lambda-k)X_T}]\Big).
$$
Since $E[e^{(\lambda\pm k)X_T}]=e^{(\lambda\pm k)^2T/2}$ and $\frac{(\lambda\pm k)^2T}{2}-\frac{k^2T}{2}=\frac{\lambda^2T}{2}\pm\lambda kT$,
$$
E_Q[e^{\lambda Y_T}]=\alpha\,e^{\lambda(x+kT)+\frac{\lambda^2T}2}+(1-\alpha)\,e^{\lambda(x-kT)+\frac{\lambda^2T}2},\qquad\alpha=\frac{e^{kx+c}}{e^{kx+c}+e^{-kx-c}}.
$$
These are the Laplace transforms of $N(x\pm kT,T)$, so $Y_T$ has the stated mixture law (Laplace transforms finite on $\mathbb R$ determine the law). Finally
$$
E_Q[Y_T]=\alpha(x+kT)+(1-\alpha)(x-kT)=x+kT(2\alpha-1)=x+kT\tanh(kx+c).
$$

**Common pitfalls.** Missing the Itô correction $\frac12b'$ in $dU(Y)$. Also remember $\alpha\in(0,1)$, which is needed for a genuine mixture.

---

### Exercise 15 (★★, 20 min). Equivalence on $[0,t]$, singularity on $[0,\infty)$ (Baldi Ex. 12.1)

On the canonical space $(C,\mathcal M,(\mathcal M_t),(X_t))$, let $P_B$ be Wiener measure, $P_Y$ the law of $Y_t=B_t+ct$ ($c\ne0$), and $P_Z$ the law of $\sigma B_t$ ($\sigma>0$, $\sigma\ne1$).

(a) Show that $P_Y\sim P_B$ on $\mathcal M_t$ for every $t$, with $\frac{dP_Y}{dP_B}\big|_{\mathcal M_t}=e^{cX_t-\frac{c^2}{2}t}$.
(b) Show that $P_Y\perp P_B$ on $\mathcal M_\infty$.
(c) Show that $P_Z\perp P_B$ on $\mathcal M_t$ for every $t>0$.

**Strategy.** (a) Girsanov. (b) and (c): find an event of probability $1$ under one measure and $0$ under the other. Use the law of large numbers, resp. the quadratic variation.

**Full solution.**

(a) Let $dQ=e^{cB_t-\frac{c^2}2t}dP$ ($\Phi\equiv c$). Under $Q$, $\widetilde B_s=B_s-cs$ is a BM for $s\le t$, so $(B_s)_{s\le t}=(\widetilde B_s+cs)_{s\le t}$ has law $P_Y$ on $\mathcal M_t$. For bounded measurable $F$ of the path up to $t$:
$$
E_{P_Y}[F(X)]=E_Q[F(B)]=E_P\big[F(B)e^{cB_t-\frac{c^2}{2}t}\big]=E_{P_B}\big[F(X)e^{cX_t-\frac{c^2}{2}t}\big].
$$
The density is strictly positive, so the measures are equivalent on $\mathcal M_t$.

(b) $A=\{\lim_{t\to\infty}X_t/t=c\}\in\mathcal M_\infty$. Under $P_Y$, $X_t/t=B_t/t+c\to c$ a.s., so $P_Y(A)=1$. Under $P_B$, $X_t/t\to0\ne c$, so $P_B(A)=0$.

(c) Along dyadic partitions of $[0,t]$, $\sum_k(X_{t_k}-X_{t_{k-1}})^2\to t$ $P_B$-a.s. and $\to\sigma^2t$ $P_Z$-a.s. The event "$\lim=t$" is in $\mathcal M_t$ and separates the two measures.

**Common pitfalls.** Concluding from (a) that $P_Y\sim P_B$ on $\mathcal M_\infty$. Equivalence on each $\mathcal M_t$ does not pass to the limit, because the densities $e^{cX_t-c^2t/2}\to0$ $P_B$-a.s. are not uniformly integrable.

---

### Exercise 16 (★, 15 min). Representation: $B_T^2$, $\int_0^TB_sds$, $e^{B_T}$

Find $c$ and $\varphi\in M^2$ with $F=c+\int_0^T\varphi_tdB_t$ for: (a) $F=B_T^2$; (b) $F=\int_0^TB_sds$; (c) $F=e^{B_T}$; (d) $F=e^{\sigma B_T-\frac{\sigma^2}2T}$.

**Strategy.** Itô's formula directly, or $M_t=E[F\mid\mathcal F_t]=u(t,B_t)$ and $\varphi=u_x$.

**Full solution.**

(a) $d(B_t^2)=2B_tdB_t+dt$, so $B_T^2=T+\int_0^T2B_tdB_t$. Here $c=T=E[B_T^2]$, $\varphi_t=2B_t\in M^2$ (since $E\int_0^T4B_t^2dt=2T^2<\infty$).

(b) Product rule: $d(tB_t)=B_tdt+t\,dB_t$, so $TB_T=\int_0^TB_tdt+\int_0^Tt\,dB_t$. Hence
$$
\int_0^TB_sds=TB_T-\int_0^Tt\,dB_t=\int_0^T(T-t)\,dB_t,
$$
so $c=0$ and $\varphi_t=T-t$.

(c) $u(t,x)=E[e^{x+B_T-B_t}]=e^{x+\frac{T-t}2}$. Check: $u_t+\frac12u_{xx}=-\frac12u+\frac12u=0$. By Itô, $du(t,B_t)=u_x(t,B_t)dB_t$, so
$$
e^{B_T}=e^{T/2}+\int_0^Te^{B_t+\frac{T-t}2}dB_t.
$$
$\varphi\in M^2$: $E\int_0^Te^{2B_t+T-t}dt=\int_0^Te^{2t+T-t}dt<\infty$.

(d) The exponential martingale satisfies $dE_t=\sigma E_tdB_t$, so $F=1+\int_0^T\sigma e^{\sigma B_t-\frac{\sigma^2}2t}dB_t$.

**Common pitfalls.**

- In (b), $\varphi$ is deterministic, so $\int_0^TB_sds\sim N(0,\int_0^T(T-t)^2dt)=N(0,T^3/3)$. That is a good check.
- In (c), $c=e^{T/2}$, not $1$.

---

### Exercise 17 (★★, 20 min). Representation: $B_T^3$, $B_T^4$, $\sin B_T$, $\cos B_T$

Find the representation of: (a) $B_T^3$; (b) $B_T^4$; (c) $\sin B_T$; (d) $\cos B_T$.

**Strategy.** Compute $u(t,x)=E[f(x+\sqrt{T-t}N)]$, then $\varphi_t=u_x(t,B_t)$. Check with the Clark–Ocone shortcut $\varphi_t=E[f'(B_T)\mid\mathcal F_t]$.

**Full solution.**

(a) $u(t,x)=E[(x+\sqrt{T-t}N)^3]=x^3+3x(T-t)$ (odd moments of $N$ vanish, $E N^2=1$). Then $u_x=3x^2+3(T-t)$, and
$$
B_T^3=\int_0^T3\big(B_t^2+T-t\big)dB_t,\qquad c=0.
$$
Check via Itô: $d(B^3)=3B^2dB+3B\,dt$, so $B_T^3=\int_0^T3B_t^2dB_t+3\int_0^TB_tdt$. By Exercise 16(b), $3\int_0^TB_tdt=\int_0^T3(T-t)dB_t$. ✓ Clark–Ocone: $E[3B_T^2\mid\mathcal F_t]=3(B_t^2+T-t)$. ✓

(b) $u(t,x)=E[(x+\sqrt{T-t}N)^4]=x^4+6x^2(T-t)+3(T-t)^2$. Then $u_x=4x^3+12x(T-t)$ and
$$
B_T^4=3T^2+\int_0^T\big(4B_t^3+12(T-t)B_t\big)dB_t.
$$
Check: $c=E[B_T^4]=3T^2$. ✓

(c) $u(t,x)=E[\sin(x+\sqrt{T-t}N)]=\sin x\,E[\cos(\sqrt{T-t}N)]+\cos x\,E[\sin(\sqrt{T-t}N)]=e^{-\frac{T-t}2}\sin x$. Then
$$
\sin B_T=\int_0^Te^{-\frac{T-t}2}\cos(B_t)\,dB_t,\qquad c=0.
$$
Check via Itô: $d\big(e^{\frac{t-T}2}\sin B_t\big)=\frac12e^{\frac{t-T}2}\sin B_tdt+e^{\frac{t-T}2}\big(\cos B_tdB_t-\frac12\sin B_tdt\big)=e^{\frac{t-T}2}\cos B_tdB_t$. ✓

(d) $u(t,x)=e^{-\frac{T-t}2}\cos x$, $u_x=-e^{-\frac{T-t}2}\sin x$. So
$$
\cos B_T=e^{-T/2}-\int_0^Te^{-\frac{T-t}2}\sin(B_t)\,dB_t.
$$
(Check: $E\cos B_T=e^{-T/2}$. ✓)

**Common pitfalls.**

- Forgetting the $3(T-t)$ term in (a). It comes from the $dt$ part of Itô, rewritten as a $dB$ integral.
- In (c), $\varphi_t=\cos B_t$ is wrong (that would be the naive "derivative inside").

---

### Exercise 18 (★★, 25 min). General $f(B_T)$ and an indicator (Baldi Ex. 12.9)

Let $f:\mathbb R\to\mathbb R$ be bounded and measurable.

(a) Show $E[f(B_T)\mid\mathcal F_t]=u(t,B_t)$ with $u(t,x)=\int f(z)p_{T-t}(z-x)dz$, $p_s(y)=(2\pi s)^{-1/2}e^{-y^2/(2s)}$. Show that $u$ is $C^\infty$ on $[0,T)\times\mathbb R$ and solves $u_t+\frac12u_{xx}=0$.
(b) Deduce that $f(B_T)=E[f(B_T)]+\int_0^Tu_x(s,B_s)dB_s$.
(c) Make this explicit for $f=\mathbf 1_{(0,\infty)}$.

**Strategy.** Freezing lemma ($B_T-B_t$ is independent of $\mathcal F_t$). Why does $u$ solve the heat equation? $u(t,B_t)$ is a martingale, so its $dt$-term must vanish. Then let $t\uparrow T$.

**Full solution.**

(a) $B_T=B_t+(B_T-B_t)$ with $B_T-B_t\sim N(0,T-t)$ independent of $\mathcal F_t$. By the freezing lemma, $E[f(B_T)\mid\mathcal F_t]=u(t,B_t)$ with $u(t,x)=E[f(x+B_T-B_t)]=\int f(z)p_{T-t}(z-x)dz$. Since $f$ is bounded and the Gaussian kernel is smooth with integrable derivatives for $T-t>0$, differentiation under the integral gives $u\in C^\infty([0,T)\times\mathbb R)$. Also $\partial_sp_s=\frac12\partial_{yy}p_s$, which gives $u_t+\frac12u_{xx}=0$. Alternative argument: by Itô, $u(t,B_t)=u(0,0)+\int_0^tu_xdB+\int_0^t(u_t+\frac12u_{xx})(s,B_s)ds$, and the left side is a martingale. A continuous martingale of finite variation is constant, so the $ds$-term vanishes, i.e. $u_t+\frac12u_{xx}=0$ along the paths, hence everywhere by continuity and full support.

(b) For $t<T$: $u(t,B_t)=u(0,0)+\int_0^tu_x(s,B_s)dB_s$. By the Itô isometry and $L^2$-boundedness of the martingale, $E\int_0^tu_x(s,B_s)^2ds=E[u(t,B_t)^2]-u(0,0)^2\le\|f\|_\infty^2$. Let $t\uparrow T$: by monotone convergence, $u_x(\cdot,B_\cdot)\in M^2([0,T])$. Also $u(t,B_t)=E[f(B_T)\mid\mathcal F_t]\to f(B_T)$ in $L^2$ (martingale convergence; $f(B_T)$ is $\mathcal F_T$-measurable), and $\int_0^tu_xdB\to\int_0^Tu_xdB$ in $L^2$ by the isometry. Since $u(0,0)=E f(B_T)$, the claim follows.

(c) $u(t,x)=P(x+B_T-B_t>0)=\mathcal N\big(\frac{x}{\sqrt{T-t}}\big)$, so $u_x(t,x)=\frac{1}{\sqrt{2\pi(T-t)}}e^{-\frac{x^2}{2(T-t)}}$ and
$$
\mathbf 1_{\{B_T>0\}}=\frac12+\int_0^T\frac{1}{\sqrt{2\pi(T-s)}}e^{-\frac{B_s^2}{2(T-s)}}dB_s.
$$
Note that $f$ is not differentiable, so the Clark–Ocone shortcut $E[f'(B_T)\mid\mathcal F_t]$ does not apply directly. Interpreted formally, $f'=\delta_0$ and $E[\delta_0(B_T)\mid\mathcal F_t]=p_{T-t}(B_t)$. That is the same answer.

**Common pitfalls.** Applying Itô at $t=T$, where $u$ is not smooth. Do it on $[0,t]$ with $t<T$ and pass to the limit in $L^2$.

---

### Exercise 19 (★★, 20 min). Path functionals: $\int_0^TB_s^2ds$ and $\big(\int_0^TB_sds\big)^2$

Find the representation of (a) $F=\int_0^TB_s^2ds$; (b) $G=\big(\int_0^TB_sds\big)^2$.

**Strategy.** Compute $M_t=E[F\mid\mathcal F_t]$ explicitly with Fubini and the freezing lemma, then take its Itô differential.

**Full solution.**

(a) For $s\ge t$, $E[B_s^2\mid\mathcal F_t]=B_t^2+(s-t)$. So
$$
M_t=E[F\mid\mathcal F_t]=\int_0^tB_s^2ds+\int_t^T\big(B_t^2+s-t\big)ds=\int_0^tB_s^2ds+(T-t)B_t^2+\frac{(T-t)^2}{2}.
$$
Differentiate:
$$
dM_t=B_t^2dt-B_t^2dt+(T-t)\big(2B_tdB_t+dt\big)-(T-t)dt=2(T-t)B_t\,dB_t.
$$
Since $M_0=T^2/2=E[F]$,
$$
\int_0^TB_s^2ds=\frac{T^2}2+\int_0^T2(T-t)B_t\,dB_t.
$$
(Clark–Ocone check: $D_tF=\int_t^T2B_sds$, and $E[D_tF\mid\mathcal F_t]=2(T-t)B_t$. ✓)

(b) By Exercise 16(b), $\int_0^TB_sds=X_T$ with $X_t=\int_0^t(T-s)dB_s$. By Itô, $d(X_t^2)=2X_t(T-t)dB_t+(T-t)^2dt$. So
$$
G=X_T^2=\int_0^T(T-t)^2dt+\int_0^T2(T-t)X_tdB_t=\frac{T^3}{3}+\int_0^T2(T-t)\Big(\int_0^tB_sds+(T-t)B_t\Big)dB_t.
$$
Here we used $X_t=E[X_T\mid\mathcal F_t]=\int_0^tB_sds+(T-t)B_t$. (Check: $d(\int_0^tB+(T-t)B_t)=B\,dt-B\,dt+(T-t)dB$. ✓)

**Common pitfalls.** In (b), $X_t\ne\int_0^tB_sds$. The integrand involves the conditional expectation, not the running integral.

---

### Exercise 20 (★★, 15 min). Deduce Theorem 7.11 from Theorem 7.10

Let $M$ be a square-integrable $(\mathcal G_t)$-martingale on $[0,T]$. Show that $M_t=c+\int_0^tH_s\cdot dB_s$ a.s. for each $t$, with $H\in M^2$ unique, and that $M$ has a continuous modification.

**Strategy.** Represent $M_T$ by Thm 7.10 and condition on $\mathcal G_t$.

**Full solution.** $M_T\in L^2(\mathcal G_T)$, so by Thm 7.10, $M_T=c+\int_0^TH_s\cdot dB_s$ with $c=E M_T$ and $H\in M^2$ unique. For $H\in M^2$, $I_t=\int_0^tH\cdot dB$ is a (continuous) martingale. Hence for each $t$,
$$
M_t=E[M_T\mid\mathcal G_t]=c+E\Big[\int_0^TH\cdot dB\,\Big|\,\mathcal G_t\Big]=c+\int_0^tH_s\cdot dB_s\quad\text{a.s.}
$$
So $\widetilde M_t:=c+I_t$ is a continuous process with $P(M_t=\widetilde M_t)=1$ for each $t$, i.e. a continuous modification. Uniqueness: if $H'$ also works, then $M_T=c+\int_0^TH'\cdot dB$, and uniqueness in Thm 7.10 gives $H=H'$. $\square$

**Common pitfalls.** Forgetting that $c=E[M_T]=E[M_0]=M_0$ ($\mathcal G_0$ is trivial up to null sets).

---

### Exercise 21 (★★, 20 min). When representation fails or is not unique

(a) Let $\xi$ be a fair $\pm1$ r.v. independent of $B$, and $\mathcal G'_t=\sigma(\xi)\vee\mathcal F^B_t$ (augmented). Show that $B$ is a $(\mathcal G'_t)$-BM, but that $\xi\in L^2(\mathcal G'_T)$ has **no** representation $\xi=c+\int_0^TH\,dB$ with $H\in M^2(\mathcal G')$.
(b) Show that uniqueness fails if we only require $H\in M^2_{\rm loc}$. Hint: with $X_t=\int_0^t\frac{dB_s}{1-s}$ on $[0,1)$, let $\tau=\inf\{t<1:X_t=1\}$, and admit that $\tau<1$ a.s.
(c) Show directly that the representation of $B_T$ is unique in $M^2$.

**Strategy.** (a) Condition on $\mathcal G'_0$. (b) Find $H\in M^2_{\rm loc}$ with $\int_0^1H\,dB=1$. (c) Isometry.

**Full solution.**

(a) $B_t-B_s$ is independent of $\mathcal F^B_s\vee\sigma(\xi)$ (since $\xi\perp B$, and BM has independent increments). So $B$ is a $(\mathcal G'_t)$-BM. Suppose $\xi=c+\int_0^TH\,dB$ with $H\in M^2(\mathcal G')$. Then $I_t=\int_0^tH\,dB$ is a $(\mathcal G')$-martingale with $I_0=0$, so $E[I_T\mid\mathcal G'_0]=0$. But $\xi$ is $\mathcal G'_0$-measurable, so $\xi=E[\xi\mid\mathcal G'_0]=c$ a.s. This contradicts $P(\xi=1)=P(\xi=-1)=\frac12$. So the natural-filtration hypothesis cannot be dropped.

(b) $\langle X\rangle_t=\frac1{1-t}-1\uparrow\infty$, and $\tau<1$ a.s. (time change: $X$ is a BM run with a clock tending to $\infty$, so it hits $1$). Let $H_s=\frac{1}{1-s}\mathbf 1_{\{s<\tau\}}$. Then $\int_0^1H_s^2ds=\langle X\rangle_\tau<\infty$ a.s., so $H\in M^2_{\rm loc}$, and $\int_0^1H\,dB=X_\tau=1$. Hence
$$
1=1+\int_0^10\,dB=0+\int_0^1H_s\,dB_s,
$$
two different representations (even $c$ differs). Note that $H\notin M^2$: otherwise $E\int_0^1H\,dB=0\ne1$.

(c) $B_T=0+\int_0^T1\,dB$. If also $B_T=c+\int_0^TH\,dB$ with $H\in M^2$, then $c=E B_T=0$ and $\int_0^T(H-1)dB=0$, so $E\int_0^T(H_s-1)^2ds=0$ by the isometry, i.e. $H=1$ a.e.

**Common pitfalls.** Forgetting that Theorem 7.10 needs **both** the Brownian filtration and $H\in M^2$.

---

### Exercise 22 (★★★, 25 min). Theorem 7.13 in practice: find $\Phi$ for a given density

Let $B$ be real with augmented filtration $(\mathcal G_t)$, and $dQ=L\,dP$ on $\mathcal G_T$ with $L=B_T^2/T$.

(a) Show that $Q$ is a probability equivalent to $P$ on $\mathcal G_T$.
(b) Find $\Phi$ such that $Z_t=E[L\mid\mathcal G_t]=\exp(\int_0^t\Phi\,dB-\frac12\int_0^t\Phi^2ds)$, and write the $Q$-dynamics of $B$.
(c) Compute $E_Q[B_T^2]$.

**Strategy.** Follow the proof of Thm 7.13: compute the martingale $Z_t$, represent $dZ=H\,dB$, set $\Phi=H/Z$.

**Full solution.**

(a) $L\ge0$, $E L=E[B_T^2]/T=1$, and $L>0$ a.s. because $P(B_T=0)=0$. So $Q$ is a probability with the same null sets as $P$.

(b) $Z_t=E[B_T^2\mid\mathcal G_t]/T=\frac{B_t^2+T-t}{T}$. Then $dZ_t=\frac1T(2B_tdB_t+dt-dt)=\frac{2B_t}{T}dB_t$, so $H_t=\frac{2B_t}{T}$ and
$$
\Phi_t=\frac{H_t}{Z_t}=\frac{2B_t}{B_t^2+T-t}.
$$
$Z_t>0$ for $t<T$ (since $T-t>0$), and $Z_T=B_T^2/T>0$ a.s. Also $\int_0^T\Phi^2<\infty$ a.s., since the paths of $Z$ are bounded below by a positive random constant. By Thm 7.13 (or Itô on $\log Z$ directly), $Z=\exp(\int\Phi\,dB-\frac12\int\Phi^2)$, and under $Q$
$$
dB_t=\frac{2B_t}{B_t^2+T-t}dt+d\widetilde B_t,\qquad\widetilde B\text{ a }Q\text{-BM}.
$$

(c) $E_Q[B_T^2]=E_P[B_T^4]/T=3T^2/T=3T$.

**Common pitfalls.** Concluding that $\Phi\in M^2$. Only $M^2_{\rm loc}$ is guaranteed. Also, $Z$ is a true martingale here by construction (it is a conditional expectation).

---

### Exercise 23 (★, 10 min). Conceptual true/false

Answer with a one-line justification.

1. If $\Phi\in M^2([0,T])$, then its stochastic exponential is a martingale.
2. Under $Q$ from Girsanov, the quadratic variation of $B$ on $[0,t]$ is still $t$.
3. Every $\mathcal G_T$-measurable $F\in L^1$ can be written as $E F+\int_0^TH\,dB$ with $H\in M^2$.
4. Every $(\mathcal G_t)$-martingale has a continuous modification.
5. If $Q\sim P$ on $\mathcal G_T$, then $dQ/dP$ is a stochastic exponential at time $T$.

**Solutions.**

1. **False.** Novikov-type conditions are needed. In Exercise 10, $\Phi\in M^2$ but $E Z_1=e^{-1}$.
2. **True.** Quadratic variation is an a.s. pathwise limit, and $Q\sim P$ preserves a.s. statements. Also $B=\widetilde B+\int\Phi$ and the finite-variation part does not contribute.
3. **False.** $H\in M^2$ forces $\int H\,dB\in L^2$, so $F$ must be in $L^2$.
4. **True** (Thm 7.12 and slide 23).
5. **True** (Thm 7.13).

---

### Exercise 24 (★★, 20 min). Removing the drift of an Ornstein–Uhlenbeck process

Let $dX_t=-\alpha X_tdt+\sigma dB_t$, $X_0=x$, with $\alpha,\sigma>0$.

(a) Find $Q$ on $\mathcal F_T$ under which $X_t=x+\sigma\widetilde B_t$, with $\widetilde B$ a $Q$-BM. Justify that $Z$ is a martingale.
(b) Express $dQ/dP$ without stochastic integrals (use Itô on $X^2$).

**Strategy.** $\Phi=-A/G=\alpha X/\sigma$. This is not bounded, so use Cor 7.7 with the Gaussian law of $X_t$.

**Full solution.**

(a) We need $-\alpha X_t+\sigma\Phi_t=0$, so $\Phi_t=\frac{\alpha}{\sigma}X_t$. Under $P$, $X_t=xe^{-\alpha t}+\sigma\int_0^te^{-\alpha(t-s)}dB_s\sim N(m_t,v_t)$ with $|m_t|\le|x|$ and $v_t=\frac{\sigma^2}{2\alpha}(1-e^{-2\alpha t})\le\frac{\sigma^2}{2\alpha}$. For $N\sim N(m,v)$ and $2\delta' v<1$, $E e^{\delta'N^2}=(1-2\delta'v)^{-1/2}e^{\delta'm^2/(1-2\delta'v)}$. So with $\delta'=\delta\alpha^2/\sigma^2$ small enough that $2\delta'\frac{\sigma^2}{2\alpha}\le\frac12$:
$$
\sup_{t\le T}E\big[e^{\delta|\Phi_t|^2}\big]=\sup_{t\le T}E\big[e^{\delta'X_t^2}\big]\le\sqrt2\,e^{2\delta'x^2}<\infty.
$$
By Cor 7.7, $Z$ is a martingale. With $dQ=Z_TdP$, $\widetilde B_t=B_t-\frac\alpha\sigma\int_0^tX_sds$ is a $Q$-BM, and $dX_t=-\alpha X_tdt+\sigma(d\widetilde B_t+\frac{\alpha}{\sigma}X_tdt)=\sigma d\widetilde B_t$.

(b) $\int_0^T\Phi\,dB=\frac\alpha\sigma\int_0^TX_sdB_s$. Since $dB_s=\frac1\sigma(dX_s+\alpha X_sds)$, we get $\int_0^TX_sdB_s=\frac1\sigma\int_0^TX_sdX_s+\frac\alpha\sigma\int_0^TX_s^2ds$. By Itô, $d(X^2)=2X\,dX+\sigma^2dt$, so $\int_0^TX\,dX=\frac12(X_T^2-x^2-\sigma^2T)$. Hence
$$
\frac{dQ}{dP}=\exp\Big(\frac{\alpha}{2\sigma^2}\big(X_T^2-x^2-\sigma^2T\big)+\frac{\alpha^2}{\sigma^2}\int_0^TX_s^2ds-\frac{\alpha^2}{2\sigma^2}\int_0^TX_s^2ds\Big)=\exp\Big(\frac{\alpha}{2\sigma^2}\big(X_T^2-x^2\big)-\frac{\alpha T}{2}+\frac{\alpha^2}{2\sigma^2}\int_0^TX_s^2ds\Big).
$$

**Common pitfalls.** Trying Novikov: $E\exp(\frac{\alpha^2}{2\sigma^2}\int_0^TX_s^2ds)$ may be infinite for large $T$ (compare Exercise 8(d)). Cor 7.7 avoids this.

---

### Exercise 25 (★★, 15 min). Bayes formula and conditional $Q$-expectations

Let $\Phi\equiv\mu$, $dQ=e^{\mu B_T-\mu^2T/2}dP$.

(a) Prove the Bayes formula $E_Q[Y\mid\mathcal F_s]=E_P[Z_tY\mid\mathcal F_s]/Z_s$ for $Y\in L^1(Q)$ $\mathcal F_t$-measurable, $s\le t\le T$.
(b) Compute $E_Q[B_t^2\mid\mathcal F_s]$ in two ways.

**Strategy.** (a) Test against $\mathbf 1_A$, $A\in\mathcal F_s$. (b) Either the Bayes formula, or the $Q$-dynamics $B_t=W_t+\mu t$.

**Full solution.**

(a) Let $V=E_P[Z_tY\mid\mathcal F_s]/Z_s$, which is $\mathcal F_s$-measurable ($Z_s>0$). For $A\in\mathcal F_s$:
$$
E_Q[V\mathbf 1_A]=E_P[Z_sV\mathbf 1_A]=E_P\big[E_P[Z_tY\mid\mathcal F_s]\mathbf 1_A\big]=E_P[Z_tY\mathbf 1_A]=E_Q[Y\mathbf 1_A].
$$
(The first and last equalities use $E_Q[U]=E_P[Z_rU]$ for $\mathcal F_r$-measurable $U$.) Hence $V=E_Q[Y\mid\mathcal F_s]$.

(b) *Via the $Q$-dynamics:* $B_t=B_s+(W_t-W_s)+\mu(t-s)$ with $W_t-W_s\sim N(0,t-s)$ independent of $\mathcal F_s$ under $Q$. So
$$
E_Q[B_t^2\mid\mathcal F_s]=\big(B_s+\mu(t-s)\big)^2+(t-s).
$$
*Via Bayes:* $Z_t/Z_s=e^{\mu(B_t-B_s)-\mu^2(t-s)/2}$. With $X=B_t-B_s\sim N(0,h)$, $h=t-s$, independent of $\mathcal F_s$, the freezing lemma gives
$$
E_Q[B_t^2\mid\mathcal F_s]=E\big[(b+X)^2e^{\mu X-\mu^2h/2}\big]\big|_{b=B_s}.
$$
Under the tilted law $e^{\mu X-\mu^2h/2}dP$, $X\sim N(\mu h,h)$. So the expectation is $(b+\mu h)^2+h$. ✓

**Common pitfalls.** Forgetting to divide by $Z_s$ in the Bayes formula.

---

### Exercise 26 (★, 10 min). Gaussian Girsanov trick

Let $f\in L^2([0,T])$ be deterministic. Compute $E_P\big[B_T\exp(\int_0^Tf\,dB)\big]$.

**Strategy.** Insert $e^{-\frac12\int f^2}$ to get a density. Under $Q$, $B_T=\widetilde B_T+\int_0^Tf$.

**Full solution.** $Z_T=e^{\int_0^Tf\,dB-\frac12\int_0^Tf^2}$ is the density of a probability $Q$ (Novikov: deterministic exponent). Under $Q$, $B_t=\widetilde B_t+\int_0^tf(s)ds$. Hence
$$
E_P\Big[B_Te^{\int_0^Tf\,dB}\Big]=e^{\frac12\int_0^Tf^2}E_Q[B_T]=e^{\frac12\int_0^Tf^2}\int_0^Tf(s)\,ds.
$$
Check with $f\equiv\mu$: $\mu Te^{\mu^2T/2}$, as in Exercise 4. ✓

**Common pitfalls.** None serious. Just remember the normalizing factor.

---

## 6. Predicted exam questions (ranked)

1. **State and prove Girsanov's theorem (Thm 7.5).** Outline: Thm 4.42 under $Q$ $\to$ Lemma 7.4 $\to$ $ZY^\lambda$ is the exponential of $\Phi+i\lambda$ $\to$ Prop 7.3 in the bounded case $\to$ localization with $L^1$ convergence ($E|Z_t-Z_{t\wedge\tau_n}|=2E[Z_t-Z_t\wedge Z_{t\wedge\tau_n}]\to0$).
2. **State and prove Lemma 7.4.** Outline: Step 0 (integrability $E_Q|Y_t|=E_P|Z_tY_t|$, adaptedness via $Z>0$). Then the chain $E_P[Z_tY_t\mathbf 1_A]=E_Q[Y_t\mathbf 1_A]$, both directions.
3. **Girsanov computation: find $Q$ making $B_t+\mu t$ (or $B_t-\int_0^t\theta_sds$) a BM, give $dQ/dP$, check Novikov, compute some $E_Q[\cdot]$.** Outline: $\Phi=-\mu$ (resp. $\theta$), $Z_T=e^{\int\Phi dB-\frac12\int\Phi^2}$, Novikov with deterministic or bounded $\Phi$. Under $Q$, $B=\widetilde B+\int\Phi$.
4. **State and prove the representation theorem (Thm 7.10).** Outline: uniqueness by isometry; $\mathcal H$ closed; $e_f(T)\in\mathcal H$ with $Ee_f(s)^2=e^{\int_0^s|f|^2}$; totality via $Q^\pm$ (sketch); $L^2=\overline{\rm span}\,\mathcal E\subseteq\mathcal H$.
5. **Find $\varphi$ in $F=E F+\int\varphi\,dB$** for $B_T^2$, $B_T^3$, $e^{B_T}$, $\sin B_T$, $\int_0^TB_sds$, $\int_0^TB_s^2ds$. Outline: $u(t,x)=E f(x+\sqrt{T-t}N)$, $\varphi=u_x(t,B_t)$, or Itô plus $\int B\,dt=\int(T-t)dB$.
6. **State Novikov and Kazamaki (Thm 7.6), and use it.** Outline: (a) $Ee^{\frac12\int_0^T|\Phi|^2}<\infty$ $\Rightarrow$ (b) $M$ is $L^2$-bounded and $Ee^{M_T/2}<\infty$ $\Rightarrow$ (c) $Z$ is a UI martingale.
7. **Drift removal for an SDE / GBM under $Q$.** Outline: $dX=A\,dt+G\,dB\Rightarrow dX=(A+G\Phi)dt+G\,d\widetilde B$. Solve for $\Phi$, check Novikov.
8. **Show that the stochastic exponential is a local martingale and a supermartingale, and that it is a martingale iff $E Z_T=1$.** Outline: Itô gives $dZ=Z\Phi\,dB$; Fatou; constant expectation.
9. **State Prop 7.3 and explain where it is used.** Outline: $\int_0^T|\Phi|^2\le K$ deterministic $\Rightarrow$ martingale bounded in all $L^p$. Used in the bounded step of Girsanov.
10. **State Thms 7.11–7.13.** Outline: $L^2$ martingales $=c+\int H\,dB$ with $H\in M^2$; local martingales with $H\in M^2_{\rm loc}$; every $Q\sim P$ on $\mathcal G_T$ is given by a stochastic exponential, and $B-\int\Phi$ is a $Q$-BM.
11. **Example 7.8 (OU under $Q$) or Example 7.9 (passage times).** Outline: Cor 7.7 for the martingale property. Under $Q$, $dB=\theta B\,dt+dW$. Passage time: $Q(\tau_a\le t)=E[\mathbf 1_{\{\tau_a\le t\}}Z_{\tau_a}]$.
12. **Conceptual: why the natural filtration, why $M^2$, why a finite horizon $T$.** Outline: the $\xi$-counterexample (Exercise 21); non-uniqueness in $M^2_{\rm loc}$; singularity on $\mathcal F_\infty$ (Exercise 15).

---

## 7. Flashcards

1. Stochastic exponential of $\Phi$? → $Z_t=\exp(\int_0^t\Phi\cdot dB-\frac12\int_0^t|\Phi|^2ds)$, with $dZ=Z\Phi\cdot dB$, $Z_0=1$.
2. Is $Z$ always a martingale? → No. It is a local martingale, and for real $\Phi$ a positive supermartingale with $E Z_t\le1$.
3. Simplest criterion for $Z$ (real $\Phi$) to be a martingale on $[0,T]$? → $E[Z_T]=1$.
4. Prop 7.3? → $\int_0^T|\Phi|^2\le K$ (deterministic) $\Rightarrow$ $Z$ is a complex martingale bounded in every $L^p$, $p<\infty$.
5. Lemma 7.4? → For $Z>0$ a $P$-martingale with $Z_0=1$ and $dQ=Z_TdP$: $Y$ is a $Q$-martingale $\iff$ $ZY$ is a $P$-martingale.
6. Girsanov? → If $Z$ is a martingale and $dQ=Z_TdP$, then $B_t-\int_0^t\Phi_sds$ is a $Q$-BM on $[0,T]$.
7. Novikov? → $E\exp(\frac12\int_0^T|\Phi_s|^2ds)<\infty$ $\Rightarrow$ $Z$ is a UI martingale on $[0,T]$.
8. Kazamaki? → $M=\int\Phi\,dB$ is an $L^2$-bounded martingale and $E e^{M_T/2}<\infty$ $\Rightarrow$ $Z$ is a UI martingale.
9. Order of implications in Thm 7.6? → Novikov $\Rightarrow$ Kazamaki $\Rightarrow$ UI martingale.
10. Cor 7.7? → $\sup_{t\le T}E e^{\delta|\Phi_t|^2}<\infty$ for some $\delta>0$ $\Rightarrow$ $Z$ is a martingale.
11. Which $\Phi$ makes $B_t+\mu t$ a $Q$-BM? → $\Phi=-\mu$, $dQ/dP=e^{-\mu B_T-\mu^2T/2}$.
12. Drift of $dX=A\,dt+G\,dB$ under $Q$? → $A+G\Phi$. The diffusion coefficient $G$ is unchanged.
13. Density of $P$ w.r.t. $Q$? → $Z_T^{-1}$, and $Z^{-1}$ is a $Q$-martingale.
14. $E_Q[Y]$ for $\mathcal F_t$-measurable $Y$? → $E_P[Z_tY]$.
15. Bayes formula? → $E_Q[Y\mid\mathcal F_s]=E_P[Z_tY\mid\mathcal F_s]/Z_s$ for $Y\in\mathcal F_t$, $s\le t$.
16. Thm 7.10? → Every $F\in L^2(\mathcal G_T)$ is $F=E F+\int_0^TH\cdot dB$ with a unique $H\in M^2$ ($\mathcal G$ = augmented Brownian filtration).
17. Key dense family in the proof of 7.10? → $e_f(T)=\exp(\int_0^Tf\,dB-\frac12\int_0^T|f|^2)$, $f$ deterministic, with $e_f(T)=1+\int_0^Te_ff\,dB$.
18. $E[e_f(s)^2]$? → $\exp(\int_0^s|f|^2)$.
19. Representation of $B_T^2$? → $T+\int_0^T2B_tdB_t$.
20. Representation of $B_T^3$? → $\int_0^T3(B_t^2+T-t)dB_t$.
21. Representation of $e^{B_T}$? → $e^{T/2}+\int_0^Te^{B_t+(T-t)/2}dB_t$.
22. Representation of $\sin B_T$? → $\int_0^Te^{-(T-t)/2}\cos B_t\,dB_t$.
23. Representation of $\int_0^TB_sds$? → $\int_0^T(T-t)dB_t$.
24. Representation of $\int_0^TB_s^2ds$? → $\frac{T^2}2+\int_0^T2(T-t)B_tdB_t$.
25. General recipe for $f(B_T)$? → $\varphi_t=u_x(t,B_t)$ with $u(t,x)=E f(x+B_T-B_t)$. If $f\in C^1_b$: $\varphi_t=E[f'(B_T)\mid\mathcal F_t]$.
26. Thm 7.11? → $L^2$ martingales of $(\mathcal G_t)$ are $c+\int_0^tH\cdot dB$ with a unique $H\in M^2$, hence continuous.
27. Thm 7.12? → Local martingales of $(\mathcal G_t)$ are $c+\int_0^tH\cdot dB$ with $H\in M^2_{\rm loc}$, hence continuous.
28. Thm 7.13? → Every $Q\sim P$ on $\mathcal G_T$ has $dQ/dP=Z_T$ for a martingale stochastic exponential $Z$, and $B-\int\Phi$ is a $Q$-BM.
29. Why the natural filtration? → With an extra independent $\xi\in\mathcal G_0$, $F=\xi$ is not representable.
30. Are the law of BM and the law of BM with drift $c\ne0$ equivalent? → On each $\mathcal M_t$, yes (density $e^{cX_t-c^2t/2}$). On $\mathcal M_\infty$, no: they are singular.
