# Mock Exams

## How the written exam will probably look

### What is new in 2026

- **This is the first written exam under the new lecturer.** Earlier years (Di Nunno) the exam was a 30–40 minute oral exam at the blackboard. The old oral question lists ("state and prove the Doob decomposition", "construction of the stochastic integral in the $L^2$ setting", "Girsanov's theorem (proof) and change of measures", ...) are still a good map of *which* topics matter, but no past written exams exist. Everything below is an informed guess based on the final syllabus (19 November 2026), the 2026 mandatory assignment and the usual style of UiO MAT4xxx written exams.
- **Format:** 4 hours, no aids, 30 November 2026 at 09:00. Expect 4–6 problems, each with lettered sub-parts and (usually) stated point weights or "all problems have equal weight".
- **The final syllabus decides everything.** It says: (S) = statement, (P) = proof, (S&P) = statement and proof, and *anything not explicitly mentioned is (S)*. Definitions, examples and remarks are included for Chapters 1, 2 and 7.

### What the markings imply

| Marking | What you can be asked | What you must be able to do |
|---|---|---|
| (S&P) | "State and prove Theorem X." | Write the statement with *all* hypotheses, then a complete proof. Typical weight: 5–10 points. |
| (P) only | "Prove that ..." (the statement is given to you) | Reproduce the proof; the statement may be printed in the question. Examples: Propositions 1.25, 1.27, 1.28, 1.29, Proposition 2.4, the proofs in the Chapter 3 notes. |
| (S) | "State Theorem Y precisely" or "Use Theorem Y to ..." | Exact hypotheses and conclusion. Used as a tool inside computational problems (Novikov, Theorem 4.33, Lévy's characterization, martingale representation 7.11–7.13, time change 6.17). |
| Restricted proofs | "Prove ... for elementary processes / for polynomials / assuming boundedness" | The syllabus restricts several proofs: product rule 6.6 (elementary processes), Itô 6.7 (polynomials in space, regular in time), 6.21 (bounded integral and bracket), 4.37 (bounded variation case), 7.10 (skip $Q_+=Q_-$), 8.25 (only the Girsanov construction). Expect the question to say so explicitly. |

> **Numbering warning (Chapter 5).** The syllabus follows the handwritten notes. For the last part of Chapter 5 the slides are shifted by one: syllabus Proposition 5.28 (left-endpoint Riemann sums) is Proposition 5.29 on the slides, syllabus Proposition 5.33 (nonnegative local martingales) is Proposition 5.34 on the slides, and syllabus Proposition 5.36 (increasing process of a stochastic integral) is Proposition 5.37 on the slides. These mock exams use the **syllabus** numbers and always give the name of the result too. On the exam, writing the name ("left-endpoint Riemann sums") next to the number protects you if the numbering differs.

### Time management for 4 hours

1. **First 10 minutes: read everything.** Mark each sub-part as (A) "I can write this immediately", (B) "I know the idea", (C) "hard". Note the points.
2. **Budget about 2 minutes per point** for a 100-point exam (200 minutes) and keep about 25 minutes in reserve for checking and for the (C) parts.
3. **Collect the cheap points first:** statements, short (P) proofs (stopped martingale, Proposition 1.25, Proposition 5.27 from 5.26, Proposition 5.33), and routine computations (Itô isometry, conditional expectations with Brownian motion). These are typically 40–50% of the points and take less than half the time.
4. **Never get stuck on one proof for more than 1.5 times its budget.** Write the roadmap (see below), mark the gap clearly ("I use without proof that ..."), and move on. Partial credit for a correct structure is substantial.
5. **Last 15 minutes:** re-check signs and factors in the computations (the $\tfrac12$ in Itô's formula, $(t-s)$ vs $t$, variances of Gaussian integrals), and check that every statement you wrote contains its hypotheses.

### How to write proofs efficiently

- **Roadmap first.** Begin every proof with 2–4 lines: "Step 1: reduce to ...; Step 2: estimate ...; Step 3: pass to the limit using ...". The old oral-exam instructions explicitly rewarded this, and graders of a written exam reward it too: a reader who sees the plan gives credit for the steps you do execute.
- **State what you use.** "By the conditional Itô isometry (Theorem 5.9) ...", "by Doob's inequality (Theorem 4.17 with $p=2$) ...". Cite the course result by number *and* name.
- **Check the hypotheses aloud.** Most lost points come from missing checks: integrability ($X\in M^2$ vs $M^2_{loc}$), boundedness of stopping times in the stopping theorem, adaptedness/measurability of the candidate in a conditional expectation, the martingale property of the density in Girsanov.
- **Do not re-derive (S) results.** If a result is (S), quote it; do not waste time proving it.
- **Write the final answer of a computation in a box or on its own line**, with the conditions under which it holds (e.g. "for $0\le s\le t$").

### The four mock exams

- **Exam 1**: moderate. A good first full-length test.
- **Exams 2 and 3**: realistic level.
- **Exam 4**: hard (long SDE proofs and harder computations).

Every item that the syllabus marks (S&P) or (P) appears in at least one exam, except a few short Chapter 3 proofs from the notes (Prop 3.7(f), Examples 3.16 and 3.17), which the coverage table flags. The coverage table is at the end of this file. Model solutions, with grading notes and time budgets, are in the next chapter ("Mock Exam Solutions"). Attempt each exam under exam conditions first: 4 hours, no notes.

Throughout, $B$ denotes a real standard Brownian motion on a filtered probability space $(\Omega,\mathcal F,(\mathcal F_t)_t,P)$ satisfying the usual conditions, unless stated otherwise.

## Mock Exam 1 (moderate)

*4 hours. No aids. Total: 100 points. Justify every step.*

### Problem 1 (20 points): Brownian motion

**(a)** (7 points) State and prove Proposition 2.3 (Brownian motion as a Gaussian process): a process $B$ is a Brownian motion if and only if $B_0=0$ a.s., $B$ is a centered Gaussian process, and $E[B_sB_t]=s\wedge t$. (For the converse direction it suffices to show that $B$ is a natural Brownian motion.)

**(b)** (4 points) Let $B$ be a Brownian motion and define $Z_0=0$, $Z_t=tB_{1/t}$ for $t>0$. Prove that $Z$ is a natural Brownian motion in the sense of the converse in (a), i.e. verify the three conditions. Explain in two or three sentences why continuity of $Z$ at $t=0$ requires an additional argument and what that argument is.

**(c)** (6 points) State and prove Proposition 2.15 ($L^2$-convergence of the quadratic variation of Brownian motion), including the consequence that Brownian paths a.s. do not have finite variation on $[s,t]$.

**(d)** (3 points) State Kolmogorov's continuity theorem (Theorem 1.15, or its Corollary 1.16 for processes indexed by time) and use it to show that Brownian motion has a modification whose paths are Hölder continuous of every exponent $\gamma<\tfrac12$.

### Problem 2 (22 points): Conditional expectations and discrete-time martingales

**(a)** (5 points) Let $X$ be integrable and $\mathcal D\subset\mathcal D'\subset\mathcal F$ sub-$\sigma$-algebras. Using only the definition of conditional expectation, prove:
(i) if $Z$ is bounded and $\mathcal D$-measurable, then $E[ZX\mid\mathcal D]=Z\,E[X\mid\mathcal D]$;
(ii) $E\big[E[X\mid\mathcal D']\mid\mathcal D\big]=E[X\mid\mathcal D]$.

**(b)** (5 points) Let $0\le s\le t$. Compute
$$
E[B_t^3\mid\mathcal F_s]\qquad\text{and}\qquad E\Big[\int_0^t B_u^2\,du\ \Big|\ \mathcal F_s\Big],
$$
justifying the interchange of conditional expectation and the time integral. Deduce that $B_t^3-3tB_t$ is an $(\mathcal F_t)$-martingale.

**(c)** (6 points) State and prove Theorem 4.5 (Doob's decomposition).

**(d)** (4 points) Let $(\xi_k)_{k\ge1}$ be i.i.d. with $P(\xi_k=1)=P(\xi_k=-1)=\tfrac12$, $S_0=0$, $S_n=\xi_1+\dots+\xi_n$, $\mathcal F_n=\sigma(\xi_1,\dots,\xi_n)$ ($\mathcal F_0$ trivial). Show that $X_n=|S_n|$ is a submartingale and find its Doob decomposition explicitly. Use it to compute $E|S_4|$, and check the answer directly from the law of $S_4$.

**(e)** (2 points) Let $(M_n)_n$ be a martingale and $\tau$ a stopping time. Prove that $(M_{n\wedge\tau})_n$ is a martingale.

### Problem 3 (20 points): The stochastic integral

**(a)** (6 points) State and prove Lemma 5.6 (conditional moments for elementary integrals).

**(b)** (6 points) Recall Definition 5.8 of $\int_a^bX_t\,dB_t$ for $X\in M^2([a,b])$. State Theorem 5.9 (conditional mean and Itô isometry) and prove it from Lemma 5.6. You may use Lemma 5.7 (density of elementary processes) without proof.

**(c)** (5 points) Compute, for $T>0$:
(i) $E\big[\big(\int_0^T B_t^2\,dB_t\big)^2\big]$;
(ii) $E\big[\big(\int_0^2 B_s\,dB_s\big)\big(\int_1^3 B_s\,dB_s\big)\big]$;
(iii) $\operatorname{Var}\big(\int_0^T e^{B_t}\,dB_t\big)$.
In each case check that the integrand is in the relevant $M^2$ space.

**(d)** (3 points) Using Proposition 5.28 (left-endpoint Riemann sums) and Proposition 2.15, prove that $\int_0^tB_s\,dB_s=\tfrac12(B_t^2-t)$.

### Problem 4 (18 points): Itô's formula and the Ornstein–Uhlenbeck process

**(a)** (3 points) State Itô's formula (Theorem 6.7) for an Itô process $dX_t=F_t\,dt+G_t\,dB_t$ and $f(x,t)$.

**(b)** (5 points)
(i) Use Itô's formula to show that $m_k(t)=E[B_t^k]$ satisfies $m_k(t)=\tfrac{k(k-1)}2\int_0^tm_{k-2}(s)\,ds$ for $k\ge2$, and compute $E[B_t^4]$ and $E[B_t^6]$. Justify why the stochastic integral has zero expectation.
(ii) Show that $X_t=e^{t/2}\cos B_t$ is a martingale and deduce $E[\cos B_t]$.

**(c)** (6 points) Let $\lambda>0$, $\sigma>0$, $x\in\mathbb R$, and consider $dX_t=-\lambda X_t\,dt+\sigma\,dB_t$, $X_0=x$.
(i) Show, using the product rule, that $X_t=e^{-\lambda t}x+\sigma\int_0^te^{-\lambda(t-s)}\,dB_s$ solves the equation.
(ii) Compute $E[X_t]$, $\operatorname{Var}(X_t)$ and $\operatorname{Cov}(X_s,X_t)$ for $0\le s\le t$.
(iii) What is the law of $X_t$, and what is its limit in law as $t\to\infty$?

**(d)** (4 points) Using Itô's formula for $X_t^2$, derive an ordinary differential equation for $m(t)=E[X_t^2]$, solve it, and check that the answer agrees with (c)(ii). Justify why the martingale part has zero expectation.

### Problem 5 (12 points): Change of measure

**(a)** (5 points) State and prove Lemma 7.4 (transferring the martingale property).

**(b)** (3 points) State Girsanov's theorem (Theorem 7.5) and Novikov's criterion (Theorem 7.6(a)).

**(c)** (4 points) Fix $T>0$, $\mu\in\mathbb R$, and define $dQ=Z_T\,dP$ with $Z_t=\exp(-\mu B_t-\tfrac12\mu^2t)$.
(i) Show directly that $Z$ is a $P$-martingale.
(ii) Show that $W_t=B_t+\mu t$ is a $Q$-Brownian motion on $[0,T]$.
(iii) Compute $E_Q[B_T]$, $E_Q[B_T^2]$ and $E_Q[e^{B_T}]$; check the last one by a direct $P$-computation.
(iv) For $\mu>0$, is $B$ a $Q$-martingale, a $Q$-supermartingale or a $Q$-submartingale?

### Problem 6 (8 points): True or false?

Answer true or false and give a short proof or counterexample. (2 points each.)

**(a)** If $M$ is a martingale with $M_t\in L^2$ for every $t$, then $M^2$ is a submartingale.

**(b)** A nonnegative local martingale $M$ with $E[M_t]=E[M_0]$ for every $t\ge0$ is a martingale.

**(c)** If $M$ is a continuous martingale with $M_0=0$ and $\tau$ is an a.s. finite stopping time, then $E[M_\tau]=0$.

**(d)** The process $X_t=\int_0^t\cos(s)\,dB_s$ is a Brownian motion.

## Mock Exam 2 (realistic)

*4 hours. No aids. Total: 100 points. Justify every step.*

### Problem 1 (16 points): Stochastic processes and stopping times

**(a)** (5 points) Define what it means for a process to be progressively measurable. State and prove Proposition 1.9: a right-continuous adapted process with values in a metric space is progressively measurable.

**(b)** (4 points) State Carathéodory's criterion and use it to prove Proposition 1.19: if $X$ is a process on $(\Omega,\mathcal F)$ and $P,P'$ are probability measures under which $X$ has the same finite-dimensional distributions, then $P=P'$ on $\sigma(X_t,\,t\in T)$.

**(c)** (3 points) Prove Proposition 1.25: every stopping time is an optional time, and if $(\mathcal F_t)$ is right-continuous then every optional time is a stopping time.

**(d)** (4 points) Let $\sigma,\tau$ be stopping times. Prove (Proposition 1.28): (i) $\sigma\wedge\tau$ and $\sigma\vee\tau$ are stopping times; (ii) if $\sigma\le\tau$ then $\mathcal F_\sigma\subset\mathcal F_\tau$; (iii) $\mathcal F_{\sigma\wedge\tau}=\mathcal F_\sigma\cap\mathcal F_\tau$.

### Problem 2 (20 points): Stopping theorems

**(a)** (7 points) State and prove Theorem 4.6 (stopping theorem for discrete-time supermartingales). You may use that a stopped supermartingale is a supermartingale, but prove any other auxiliary fact you need.

**(b)** (5 points)
(i) Let $s\le t$ and $A\in\mathcal F_s$. Prove that $\tau=s\mathbf 1_A+t\mathbf 1_{A^c}$ is a stopping time.
(ii) (Baldi, Exercise 5.6) Prove that an integrable, adapted, right-continuous process $X$ is a martingale if and only if $E[X_\tau]=E[X_0]$ for every bounded stopping time $\tau$.
(iii) (Baldi, Exercise 5.1) Prove that a supermartingale with $t\mapsto E[X_t]$ constant is a martingale.

**(c)** (8 points) Let $a,b>0$ and $\tau=\inf\{t\ge0:B_t\notin\,]-a,b[\,\}$.
(i) Using the martingale $B_t^2-t$, show that $E[\tau]<\infty$; in particular $\tau<\infty$ a.s.
(ii) Compute $P(B_\tau=b)$.
(iii) Compute $E[\tau]$.
State precisely which stopping theorem you use and verify its hypotheses at each step.

### Problem 3 (16 points): The stochastic integral as a process

**(a)** (7 points) State and prove Theorem 5.16 (martingale property and continuity): for $X\in M^2([0,T])$, $I_t=\int_0^tX_s\,dB_s$ is a square integrable martingale with a continuous version, and $\langle I\rangle_t=\int_0^tX_s^2\,ds$. You may use Theorem 5.9 and Doob's inequality.

**(b)** (5 points) State and prove Proposition 5.36 (increasing process of a stochastic integral) for $X\in M^2_{loc}([0,T])$.

**(c)** (4 points) Let $I_t=\int_0^tB_s\,dB_s$. For $0\le s\le t$ compute $E[I_t^2\mid\mathcal F_s]$ and $E[I_t^4]$.

### Problem 4 (18 points): Itô calculus

**(a)** (6 points) State the product rule (Proposition 6.6) and prove it when the coefficients $F_1,G_1,F_2,G_2$ are elementary processes. You may use the identities $B_t^2=2\int_0^tB_s\,dB_s+t$ and $tB_t=\int_0^tB_s\,ds+\int_0^ts\,dB_s$ (but say where they come from).

**(b)** (5 points) State and prove Proposition 6.13 (stochastic exponential) for real $\lambda$, including the supermartingale property.

**(c)** (7 points) Let $b\in\mathbb R$, $\sigma>0$, $x>0$, and consider $dX_t=bX_t\,dt+\sigma X_t\,dB_t$, $X_0=x$.
(i) Verify that $X_t=x\exp\big((b-\tfrac12\sigma^2)t+\sigma B_t\big)$ is a solution, and explain why it is the only one.
(ii) Compute $E[X_t]$ and $\operatorname{Var}(X_t)$.
(iii) For which $b$ is $X$ a martingale, a supermartingale, a submartingale?
(iv) Show that if $b<\tfrac12\sigma^2$ then $X_t\to0$ a.s. as $t\to\infty$, although $E[X_t]\to\infty$ when $0<b<\tfrac12\sigma^2$. Which result on Brownian paths do you use?

### Problem 5 (14 points): Martingale representation

Let $(\mathcal G_t)$ be the augmented natural filtration of a one-dimensional Brownian motion $B$, and $T>0$.

**(a)** (8 points) State and prove Theorem 7.10 (representation of square integrable random variables) for $m=1$. Following the notes, you may skip the technical step that shows $Q_+=Q_-$, but state exactly what that step asserts and how it is used.

**(b)** (6 points) Find $c\in\mathbb R$ and $H\in M^2([0,T])$ explicitly such that $Z=c+\int_0^TH_s\,dB_s$ for
(i) $Z=\int_0^TB_s\,ds$; (ii) $Z=B_T^3$; (iii) $Z=e^{B_T}$.

### Problem 6 (10 points): Tanaka's example

**(a)** (8 points) State and prove Lemma 8.27 for the equation $dX_t=\operatorname{sgn}(X_t)\,dW_t$, $X_0=0$, with $\operatorname{sgn}(x)=1$ for $x>0$ and $\operatorname{sgn}(x)=-1$ for $x\le0$: weak existence, uniqueness in law, failure of pathwise uniqueness, and non-existence of a strong solution. For the last part you may use Tanaka's formula $\int_0^t\operatorname{sgn}(\beta_s)\,d\beta_s=|\beta_t|-L_t(\beta)$, where the local time $L_t(\beta)$ is a functional of $(|\beta_s|)_{s\le t}$.

**(b)** (2 points) Give the Karatzas–Shreve definition of a strong solution.

### Problem 7 (6 points): True or false?

Answer true or false and justify. (2 points each.)

**(a)** Every martingale (not necessarily square integrable) with respect to the augmented natural filtration of a Brownian motion has a continuous modification.

**(b)** If $M$ is a continuous local martingale with $M_0=0$ and $\langle M\rangle_t=0$ for all $t$, then $M\equiv0$.

**(c)** The integral $\int_0^TB_T\,dB_t$ is defined by the construction of the course.

## Mock Exam 3 (realistic)

*4 hours. No aids. Total: 100 points. Justify every step.*

### Problem 1 (12 points): Paths of Brownian motion and hitting times

**(a)** (4 points) State Paul Lévy's modulus of continuity (Theorem 2.12). State and prove Corollary 2.13.

**(b)** (4 points) Let $E$ be a metric space, $X$ a continuous adapted $E$-valued process, $A\subset E$ open and $\tau_A=\inf\{t\ge0:X_t\notin A\}$. Prove (Proposition 1.27(a)) that $\tau_A$ is a stopping time.

**(c)** (2 points) State Lemma 2.18 and Theorem 2.19 (strong Markov property of Brownian motion).

**(d)** (2 points) State the law of the iterated logarithm (Theorem 2.16) and deduce that $B_t/t\to0$ a.s. as $t\to\infty$, and that a.s. the Brownian path visits every real level at arbitrarily large times.

### Problem 2 (20 points): Martingale convergence

**(a)** (2 points) State the upcrossing inequality (Proposition 4.11).

**(b)** (6 points) State and prove Theorem 4.12 (a.s. convergence of supermartingales).

**(c)** (2 points) State Lemma 4.18 (finite-horizon Doob inequality).

**(d)** (5 points) State and prove Theorem 4.17 (Doob's inequality). For full credit also prove Lemma 4.18, using the maximal inequality of Theorem 4.9.

**(e)** (5 points) Let $(\xi_k)_{k\ge1}$ be i.i.d. with $P(\xi_k=2)=P(\xi_k=0)=\tfrac12$, $M_0=1$, $M_n=\xi_1\cdots\xi_n$, $\mathcal F_n=\sigma(\xi_1,\dots,\xi_n)$.
(i) Show that $M$ is a nonnegative martingale and find its a.s. limit.
(ii) Does $M_n$ converge in $L^1$? Is $M$ bounded in $L^2$? Explain how this is consistent with Theorems 4.12 and 4.19.
(iii) Find the Doob decomposition of $M_n^2$.

### Problem 3 (20 points): Integrals of local integrands

**(a)** (5 points) State and prove Lemma 5.26 (probability estimate for local integrands).

**(b)** (3 points) State and prove Proposition 5.27 (convergence in probability).

**(c)** (5 points) State and prove Proposition 5.28 (left-endpoint Riemann sums; Proposition 5.29 on the slides).

**(d)** (4 points) State and prove Proposition 5.33 (nonnegative local martingales are supermartingales; Proposition 5.34 on the slides).

**(e)** (3 points) Let $\pi_n=\{0=t_0<\dots<t_{m_n}=t\}$ with $|\pi_n|\to0$. Identify the limits in probability of
$$
\sum_kB_{t_{k+1}}(B_{t_{k+1}}-B_{t_k})\qquad\text{and}\qquad\sum_kB_{t_k}^2(B_{t_{k+1}}-B_{t_k}),
$$
expressing the second without stochastic integrals, in terms of $B_t$ and $\int_0^tB_s\,ds$.

### Problem 4 (18 points): Itô's formula

**(a)** (8 points) State Itô's formula (Theorem 6.7) and prove it for $f(x,t)=\sum_{k=0}^ng_k(t)x^k$ with $g_k\in C^1$. You may use the product rule (Proposition 6.6) in its general form.

**(b)** (5 points) State and prove Proposition 6.15 (exponential bound).

**(c)** (5 points)
(i) Show that $Y_t=e^{t/2}\sin B_t$ is a martingale and compute $E[\sin B_t\mid\mathcal F_s]$ for $s\le t$.
(ii) Let $X_t=\int_0^t\cos(B_s)\,dB_s$. Compute $E[X_t^2]$ and give an upper bound for $P(\sup_{0\le t\le T}|X_t|\ge x)$, $x>0$.

### Problem 5 (12 points): Girsanov's theorem

**(a)** (7 points) State Girsanov's theorem (Theorem 7.5) and prove it under the additional assumption $\int_0^T|\Phi_s|^2\,ds\le K$ a.s. for a constant $K$. You may use Lemma 7.4, Theorem 4.42 and Proposition 7.3.

**(b)** (5 points) Let $\theta\in\mathbb R\setminus\{0\}$, $T>0$, and $Z_t=\exp\big(\theta\int_0^tB_s\,dB_s-\tfrac{\theta^2}2\int_0^tB_s^2\,ds\big)$.
(i) Use Corollary 7.7 (if $E[e^{\delta|\Phi_t|^2}]\le C$ for all $t\le T$ and some $\delta>0$, then $Z$ is a martingale) to show that $Z$ is a martingale on $[0,T]$.
(ii) With $dQ=Z_T\,dP$, find the $Q$-dynamics of $B$, solve the resulting SDE, and compute $E_Q[B_T]$ and $E_Q[B_T^2]$.
(iii) Deduce the value of $E_P\Big[B_T^2\exp\Big(\frac\theta2(B_T^2-T)-\frac{\theta^2}2\int_0^TB_s^2\,ds\Big)\Big]$.

### Problem 6 (12 points): SDEs

**(a)** (8 points) State and prove Theorem 8.10 (a priori moment bounds) for $m=d=1$ and $u=0$: both the bound on $E[\sup_{s\le T}|\xi_s|^p]$ and the bound on $E[\sup_{s\le t}|\xi_s-\eta|^p]$. You may use Proposition 6.21 and Gronwall's lemma.

**(b)** (4 points) Let $\mu\in\mathbb R$, $\sigma>0$, $x\in\mathbb R$, and $dX_t=\mu\,dt+\sigma X_t\,dB_t$, $X_0=x$.
(i) With $\Phi_t=\exp(\sigma B_t-\tfrac12\sigma^2t)$, show that $X_t=\Phi_t\big(x+\mu\int_0^t\Phi_s^{-1}\,ds\big)$ is the unique solution.
(ii) Compute $E[X_t]$ and $E[X_t^2]$.

### Problem 7 (6 points): True or false?

Answer true or false and justify. (2 points each.)

**(a)** For a supermartingale $(X_n)$: $\sup_nE[X_n^-]<\infty$ if and only if $\sup_nE|X_n|<\infty$.

**(b)** $\big(\int_0^tB_s\,dB_s\big)_{t\ge0}$ is a Gaussian process.

**(c)** If $X\in M^2_{loc}([0,T])$ and $\int_0^TX_s^2\,ds\le K$ a.s. for a constant $K$, then $\exp\big(\int_0^tX_s\,dB_s-\tfrac12\int_0^tX_s^2\,ds\big)$ is a martingale on $[0,T]$.

## Mock Exam 4 (hard)

*4 hours. No aids. Total: 100 points. Justify every step.*

### Problem 1 (12 points): Conditional expectation and measurability

**(a)** (4 points) Prove the existence and uniqueness part of Definition and Theorem 3.4 for an integrable random variable $X$ (you may quote the Radon–Nikodym theorem).

**(b)** (2 points) Prove Remark 3.6: to show $Z=E[X\mid\mathcal D]$ for integrable $X$ and an integrable $\mathcal D$-measurable $Z$, it suffices to check $E[Z\mathbf 1_D]=E[X\mathbf 1_D]$ for $D$ in a class $\mathcal C$ that contains $\Omega$, is stable under finite intersections and generates $\mathcal D$. You may quote the monotone class theorem (Baldi, Theorem 1.4).

**(c)** (3 points) Compute $E\big[\int_0^1B_s\,ds\ \big|\ B_1\big]$ and the variance of the conditional law of $\int_0^1B_s\,ds$ given $B_1$.

**(d)** (3 points) Prove Proposition 1.29: if $X$ is progressively measurable and $\tau$ is an a.s. finite stopping time, then $X_\tau$ is $\mathcal F_\tau$-measurable.

### Problem 2 (22 points): Martingales in discrete and continuous time

**(a)** (5 points) State and prove Theorem 4.19 (convergence in $L^p$, $p>1$). You may use Theorems 4.12 and 4.17.

**(b)** (5 points) State Theorem 4.37 (martingales with finite variation) and prove it in the case of bounded variation: $V_T(\omega)\le K$ for all $\omega$.

**(c)** (6 points) State and prove Theorem 4.42 (characterization of Brownian motion). Prove also the auxiliary fact you need about conditional characteristic functions and independence.

**(d)** (6 points) Let $W_t=\int_0^t\operatorname{sgn}(B_s)\,dB_s$.
(i) Using Theorem 4.42 (not Lévy's characterization), prove that $W$ is a Brownian motion.
(ii) Show that $\operatorname{Cov}(W_t,B_t)=0$ but $E[B_t^2W_t]\neq0$. Conclude that $W$ and $B$ are not independent.

### Problem 3 (12 points): $L^p$ estimates and time change

**(a)** (6 points) State and prove Proposition 6.21 (maximal $L^p$ estimate), assuming that $\int_0^\cdot X_s\,dB_s$ and $\int_0^\cdot X_s^2\,ds$ are bounded on $[0,T]$.

**(b)** (2 points) State Theorem 6.17 (time change) and Corollary 6.20 (quadratic variation clock).

**(c)** (4 points) Let $M_t=\int_0^te^s\,dB_s$. Prove that
$$
\limsup_{t\to\infty}\frac{M_t}{\sqrt{(e^{2t}-1)\log\log\big(\tfrac12(e^{2t}-1)\big)}}=1\quad\text{a.s.},
$$
and deduce that the Ornstein–Uhlenbeck process $X_t=e^{-t}M_t$ satisfies $\limsup_{t\to\infty}X_t/\sqrt{\log t}=1$ a.s.

### Problem 4 (26 points): Existence, uniqueness and stability for SDEs

Throughout, $b,\sigma:\mathbb R\times[0,T]\to\mathbb R$ satisfy Assumption 8.8 with constants $M,L$ (take $m=d=1$).

**(a)** (12 points) State and prove Theorem 8.13 (strong existence and pathwise uniqueness) for $u=0$ and $\eta\in L^2(\mathcal F_0)$. You may use Theorem 8.10 and the maximal estimate $E[\sup_{t\le T}|\int_0^tH_s\,dB_s|^2]\le4E\int_0^TH_s^2\,ds$.

**(b)** (7 points) State and prove Theorem 8.22 (stability with respect to initial data; Proposition 8.22 on the slides).

**(c)** (7 points) State Assumption 8.24 and prove the weak existence part of Theorem 8.25 (the construction by Girsanov's theorem).

### Problem 5 (20 points): Computations

**(a)** (8 points) Let $\mu\in\mathbb R$, $a>0$, $X_t=B_t+\mu t$ and $\tau_a=\inf\{t\ge0:X_t=a\}$. For $\alpha>0$ show that
$$
E\big[e^{-\alpha\tau_a}\mathbf 1_{\{\tau_a<\infty\}}\big]=\exp\Big(-a\big(\sqrt{\mu^2+2\alpha}-\mu\big)\Big).
$$
Deduce $P(\tau_a<\infty)$ for every $\mu$, and $E[\tau_a]$ for $\mu>0$. Is $E[\tau_a]$ finite when $\mu=0$?

**(b)** (6 points) Let $Z_t=(1-t)\int_0^t\frac{dB_s}{1-s}$ for $0\le t<1$.
(i) Show that $dZ_t=-\frac{Z_t}{1-t}\,dt+dB_t$.
(ii) Show that $Z$ is a centered Gaussian process with $\operatorname{Cov}(Z_s,Z_t)=s(1-t)$ for $s\le t$.
(iii) Show that $Z_t\to0$ in $L^2$ as $t\to1$.

**(c)** (6 points) Find the explicit martingale representation $\int_0^TB_s^2\,ds=c+\int_0^TH_t\,dB_t$ in two ways: (i) by computing the martingale $E[\int_0^TB_s^2ds\mid\mathcal F_t]$ and its stochastic differential; (ii) by Itô's formula applied to $(T-t)B_t^2$.

### Problem 6 (8 points): True or false?

Answer true or false and justify. (2 points each.)

**(a)** Every uniformly integrable martingale is bounded in $L^2$.

**(b)** If an SDE has a weak solution and pathwise uniqueness fails, then uniqueness in law fails.

**(c)** Theorem 4.6 remains true if "bounded stopping times" is replaced by "a.s. finite stopping times".

**(d)** If $Z$ is a positive supermartingale on $[0,T]$ with $Z_0=1$ and $E[Z_T]=1$, then $Z$ is a martingale on $[0,T]$.

## Coverage of the (S&P) and (P) items

| Syllabus item | Exam / Problem |
|---|---|
| Prop 1.9 (S&P) progressive measurability | Exam 2, 1(a) |
| Prop 1.19 (S&P) + Carathéodory | Exam 2, 1(b) |
| Prop 1.25 (P) | Exam 2, 1(c) |
| Prop 1.27 (P) | Exam 3, 1(b) |
| Prop 1.28 (P) | Exam 2, 1(d) |
| Prop 1.29 (P) | Exam 4, 1(d) |
| Prop 2.3 (S&P) | Exam 1, 1(a) |
| Prop 2.4 (P) | Exam 1, 1(b) (time inversion only; practise the other invariance properties from Chapter 1 of this kit) |
| Cor 2.13 (S&P) | Exam 3, 1(a) |
| Prop 2.15 (S&P) | Exam 1, 1(c) |
| Chapter 3 proofs in notes (P): Thm 3.4, Rem 3.6, Prop 3.7(d)(e)(f), Ex 3.16, Ex 3.17 | Thm 3.4, Rem 3.6: Exam 4, 1(a)(b); Prop 3.7(d)(e): Exam 1, 2(a); Exam 1, 2(b) uses the freezing-lemma technique of Ex 3.16. Prop 3.7(f), Ex 3.16 and Ex 3.17 themselves are not examined here: practise them from Chapter 2 of this kit |
| Thm 4.5 (S&P) Doob decomposition | Exam 1, 2(c) |
| Stopped martingale is a martingale (P) | Exam 1, 2(e) |
| Thm 4.6 (S&P) stopping theorem | Exam 2, 2(a) |
| Baldi Ex 5.1 and 5.6 | Exam 2, 2(b); Ex 5.1 also in Exam 4, 6(d) |
| Thm 4.12 (S&P) | Exam 3, 2(b) |
| Thm 4.17 (S&P) | Exam 3, 2(d) |
| Thm 4.19 (S&P) | Exam 4, 2(a) |
| Thm 4.37 (S&P, BV case) | Exam 4, 2(b) |
| Thm 4.42 (S&P) | Exam 4, 2(c) |
| Lemma 5.6 (S&P) | Exam 1, 3(a) |
| Thm 5.9 (S&P) | Exam 1, 3(b) |
| Thm 5.16 (S&P) | Exam 2, 3(a) |
| Lemma 5.26 (S&P) | Exam 3, 3(a) |
| Prop 5.27 (S&P) | Exam 3, 3(b) |
| Prop 5.28 (S&P) | Exam 3, 3(c) |
| Prop 5.33 (S&P) | Exam 3, 3(d) |
| Prop 5.36 (S&P) | Exam 2, 3(b) |
| Prop 6.6 (S&P, elementary) | Exam 2, 4(a) |
| Thm 6.7 (S&P, polynomials) | Exam 3, 4(a) |
| Prop 6.13 (S&P) | Exam 2, 4(b) |
| Prop 6.15 (S&P) | Exam 3, 4(b) |
| Prop 6.21 (S&P, bounded case) | Exam 4, 3(a) |
| Lemma 7.4 (S&P) | Exam 1, 5(a) |
| Thm 7.5 (S&P) | Exam 3, 5(a) |
| Thm 7.10 (S&P) | Exam 2, 5(a) |
| Thm 8.10 (S&P) | Exam 3, 6(a) |
| Thm 8.13 (S&P) | Exam 4, 4(a) |
| Thm 8.22 (S&P) | Exam 4, 4(b) |
| Thm 8.25 (S&P, Girsanov part) | Exam 4, 4(c) |
| Lemma 8.27 (S&P) Tanaka | Exam 2, 6(a) |
