# Formula Sheet (memorize)

## Gaussian facts

- $X\sim N(\mu,\sigma^2)$: $E[e^{\lambda X}]=e^{\lambda\mu+\frac12\lambda^2\sigma^2}$ and $E[e^{iuX}]=e^{iu\mu-\frac12u^2\sigma^2}$.
- $Z\sim N(0,\sigma^2)$: $E[Z^{2k}]=(2k-1)!!\,\sigma^{2k}$, so $E Z^2=\sigma^2$, $EZ^4=3\sigma^4$, $EZ^6=15\sigma^6$. All odd moments are $0$.
- $E|Z|=\sigma\sqrt{2/\pi}$.
- $E[Z^2e^{\lambda Z}]=(\sigma^2+\lambda^2\sigma^4)e^{\lambda^2\sigma^2/2}$ (differentiate the mgf twice).
- $E[e^{aZ^2}]=(1-2a\sigma^2)^{-1/2}$ for $a<\frac1{2\sigma^2}$, and $=\infty$ otherwise. So $e^{B_t^2}\in L^1$ iff $t<\tfrac12$.
- A vector is Gaussian iff every linear combination is (univariate) Gaussian. Jointly Gaussian and uncorrelated implies independent.
- Tail bound: $P(Z>x)\le \frac{\sigma}{x\sqrt{2\pi}}e^{-x^2/(2\sigma^2)}$.

## Brownian motion

- Definition: $B_0=0$, continuous paths, independent increments, $B_t-B_s\sim N(0,t-s)$. An $(\mathcal F_t)$-BM additionally has $B_t-B_s\perp\mathcal F_s$.
- Gaussian characterization: centered, continuous, $\operatorname{Cov}(B_s,B_t)=s\wedge t$.
- Invariances (each again a BM):
  - $-B_t$
  - $B_{t+s}-B_s$
  - $c^{-1/2}B_{ct}$
  - $tB_{1/t}$ (with value $0$ at $t=0$)
  - $UB$ for orthogonal $U$ (in $d$ dimensions)
- Quadratic variation: $\sum (B_{t_{i+1}}-B_{t_i})^2\to t$ in $L^2$, and $E[(\sum\Delta_i^2-t)^2]=2\sum(\Delta t_i)^2\le 2t|\pi|$.
- Paths are a.s. nowhere differentiable, have infinite variation on every interval, and are $\alpha$-Hölder for every $\alpha<\tfrac12$ but not for $\alpha=\tfrac12$.
- Lévy modulus: $\limsup_{h\downarrow0}\sup_{|t-s|\le h}\frac{|B_t-B_s|}{\sqrt{2h\log(1/h)}}=1$ a.s.
- LIL: $\limsup_{t\to\infty}\frac{B_t}{\sqrt{2t\log\log t}}=1$ a.s.
- Kolmogorov continuity: $E|X_t-X_s|^\beta\le c|t-s|^{1+\alpha}$ gives a continuous modification, $\gamma$-Hölder for every $\gamma<\alpha/\beta$. For BM, $E|B_t-B_s|^{2k}=c_k|t-s|^k$, so $\gamma<\frac{k-1}{2k}\uparrow\frac12$.

## Martingales from BM (with $\mathcal F_t$-BM)

| Process | Type |
|---|---|
| $B_t$, $B_t^2-t$, $B_t^3-3tB_t$, $B_t^4-6tB_t^2+3t^2$ | martingales |
| $e^{\lambda B_t-\frac12\lambda^2t}$ | martingale (for every $\lambda\in\mathbb R$; complex $\lambda$ too) |
| $e^{B_t}$, $B_t^2$, $|B_t|$ | submartingales (convex function of a martingale) |
| $\int_0^t X_s\,dB_s$, $X\in M^2$ | $L^2$ martingale |
| $(\int_0^tX\,dB)^2-\int_0^tX^2ds$, $X\in M^2$ | martingale |
| $\int_0^tX\,dB$, $X\in M^2_{loc}$ | local martingale only |
| $\mathcal E(X)_t=e^{\int_0^tX\,dB-\frac12\int_0^tX^2ds}$ | positive local martingale, hence a supermartingale; a martingale if Novikov holds |

The space-time harmonic polynomials come from $H_n$: $e^{\lambda x-\lambda^2t/2}=\sum\frac{\lambda^n}{n!}H_n(x,t)$.

## Hitting times of BM ($a<0<b$, $\tau=\inf\{t:B_t\notin(a,b)\}$)

- $P(B_\tau=b)=\frac{-a}{b-a}$ and $E\tau=-ab=|a|b$ (from $B_t$ and $B_t^2-t$ with optional stopping and monotone convergence).
- With drift, $X_t=B_t+\mu t$: use $e^{-2\mu X_t}$, which is a martingale.
- One-sided: $\tau_a=\inf\{t:B_t=a\}$ has $E[e^{-\lambda\tau_a}]=e^{-|a|\sqrt{2\lambda}}$. Also $\tau_a<\infty$ a.s. but $E\tau_a=\infty$.
- Reflection principle: $P(\sup_{s\le t}B_s\ge a)=2P(B_t\ge a)$.

## Martingale toolkit

- Doob decomposition: $X_n=X_0+M_n+A_n$, with $A_n=\sum_{k=1}^n E[X_k-X_{k-1}\mid\mathcal F_{k-1}]$ predictable. The compensator of $M^2$ is $\langle M\rangle_n=\sum E[(\Delta M_k)^2\mid\mathcal F_{k-1}]$.
- Optional sampling: for a supermartingale and bounded stopping times $\tau_1\le\tau_2$, $E[X_{\tau_2}\mid\mathcal F_{\tau_1}]\le X_{\tau_1}$.
- Doob's maximal inequality: $P(\max_{k\le n}X_k\ge\lambda)\le\frac1\lambda E[X_n^+]$ for a submartingale.
- Doob's $L^p$ inequality: $\|\sup_{k\le n}|M_k|\|_p\le\frac{p}{p-1}\|M_n\|_p$ for $p>1$. With $p=2$: $E[\sup_{t\le T}M_t^2]\le 4E[M_T^2]$.
- Convergence:
  - an $L^1$-bounded supermartingale converges a.s.
  - an $L^p$-bounded martingale, $p>1$, converges a.s. and in $L^p$
  - a UI martingale converges a.s. and in $L^1$, and $M_n=E[M_\infty\mid\mathcal F_n]$
- UI criteria: domination by an integrable variable; $\sup E[\Phi(|X|)]<\infty$ with $\Phi(x)/x\to\infty$; $\{E[X\mid\mathcal G]:\mathcal G\subset\mathcal F\}$ is UI.
- Counterexample: $M_n=\prod\xi_k$ with $\xi_k\in\{0,2\}$ fair is $L^1$-bounded and converges to $0$ a.s., but not in $L^1$, so it is not UI.
- Lévy characterization: $M$ continuous local martingale, $M_0=0$, $\langle M\rangle_t=t$ implies $M$ is a BM. Proof idea: show $e^{iuM_t+\frac12u^2t}$ is a martingale, which gives $E[e^{iu(M_t-M_s)}\mid\mathcal F_s]=e^{-\frac12u^2(t-s)}$.

## Stochastic integral

- Elementary $X=\sum X_i\mathbf 1_{[t_i,t_{i+1})}$ with $X_i\in L^2(\mathcal F_{t_i})$: $\int X\,dB=\sum X_i(B_{t_{i+1}}-B_{t_i})$.
- Isometry: $E[(\int_0^T X\,dB)^2]=E\int_0^TX_s^2ds$ for $X\in M^2$.
- Covariance: $E[\int X\,dB\int Y\,dB]=E\int XY\,ds$.
- Conditional versions: $E[\int_s^tX\,dB\mid\mathcal F_s]=0$ and $E[(\int_s^tX\,dB)^2\mid\mathcal F_s]=E[\int_s^tX^2du\mid\mathcal F_s]$.
- Deterministic $f\in L^2[0,T]$: $\int_0^tf\,dB$ is a Gaussian process, centered, with $\operatorname{Cov}=\int_0^{s\wedge t}f^2$, and it has independent increments.
- $\int_0^tB_s\,dB_s=\tfrac12(B_t^2-t)$. With midpoint (Stratonovich) sums the limit is $\tfrac12B_t^2$.
- Riemann sums: for $X$ continuous and adapted, $\sum X_{t_i}(B_{t_{i+1}}-B_{t_i})\to\int X\,dB$ in probability.
- Locality: on $\{X=0 \text{ on } [0,T]\}$ we have $\int_0^TX\,dB=0$ a.s.
- Stopping: $\int_0^{t\wedge\tau}X\,dB=\int_0^tX\mathbf 1_{\{s<\tau\}}dB$.
- Nonnegative local martingale: by Fatou it is a supermartingale. So it is a martingale iff $E[M_t]=E[M_0]$ for all $t$.
- Increasing process: $\langle \int X\,dB\rangle_t=\int_0^tX_s^2ds$.
- Probability estimate (Lemma 5.26): $P(|\int_0^TX\,dB|>\epsilon)\le \frac{\rho}{\epsilon^2}+P(\int_0^TX^2ds>\rho)$.

## Itô calculus

- Itô process: $dX=F\,dt+G\,dB$, with $d\langle X\rangle=G^2dt$.
- Multiplication table: $dB\,dB=dt$, $dB\,dt=dt\,dt=0$, $dB^i dB^j=\delta_{ij}dt$.
- **Itô formula**: $df(t,X_t)=\big(f_t+Ff_x+\tfrac12G^2f_{xx}\big)dt+Gf_x\,dB$.
- Product rule: $d(XY)=X\,dY+Y\,dX+d\langle X,Y\rangle$.
- In $d$ dimensions: $df(X)=\sum_i f_i\,dX^i+\frac12\sum_{ij}f_{ij}\,d\langle X^i,X^j\rangle$.
- Moments via Itô: $d(B_t^n)=nB^{n-1}dB+\tfrac{n(n-1)}2B^{n-2}dt$, so $E[B_t^n]=\frac{n(n-1)}2\int_0^tE[B_s^{n-2}]ds$ (use a true martingale; $B^{n-1}\in M^2$).
- Stochastic exponential: $Z=\mathcal E(\int X\,dB)$ solves $dZ=ZX\,dB$, $Z_0=1$.
- Exponential bound (Prop 6.15): if $\int_0^TX^2ds\le k$ a.s., then $P(\sup_{t\le T}|\int_0^tX\,dB|\ge x)\le 2e^{-x^2/(2k)}$.
- BDG-type estimate (Prop 6.21): $E[\sup_{t\le T}|\int_0^tX\,dB|^p]\le c_p\,E[(\int_0^TX^2ds)^{p/2}]$ for $p\ge2$, and also $\le c_pT^{\frac p2-1}E\int_0^T|X_s|^pds$.
- Time change: a continuous local martingale with $M_0=0$ and $\langle M\rangle_\infty=\infty$ a.s. is $M_t=W_{\langle M\rangle_t}$ for some BM $W$ (Dambis–Dubins–Schwarz). Course version (Thm 6.17, Cor 6.20): for $X\in M^2_{loc}([0,\infty))$ with $\int_0^\infty X_s^2ds=\infty$ a.s., $\int_0^tX\,dB=W_{A_t}$, $A_t=\int_0^tX_s^2ds$.

## Girsanov / representation

- $Z_t=\mathcal E(\int\theta\,dB)_t$ a true martingale and $dQ=Z_T\,dP$ imply that $\tilde B_t=B_t-\int_0^t\theta_s\,ds$ is a $Q$-BM.
- Sign check: to remove drift $\mu$ from $dX=\mu\,dt+dB$, take $\theta=-\mu$, i.e. $Z_T=e^{-\mu B_T-\frac12\mu^2T}$. Then $X_t=\tilde B_t$ is a $Q$-BM.
- Novikov: $E[e^{\frac12\int_0^T\theta^2ds}]<\infty$ gives a martingale. Kazamaki: $\sup_{\tau}E[e^{\frac12\int_0^\tau\theta\,dB}]<\infty$ gives a martingale.
- Bayes: $E_Q[Y\mid\mathcal F_s]=\frac{E[Z_TY\mid\mathcal F_s]}{Z_s}$. Lemma 7.4: $M$ is a $Q$-martingale iff $ZM$ is a $P$-martingale.
- Representation: $F\in L^2(\mathcal F_T^B)$ gives a unique $\varphi\in M^2$ with $F=E[F]+\int_0^T\varphi\,dB$. Recipe: compute $M_t=E[F\mid\mathcal F_t]=u(t,B_t)$, and then $\varphi_t=u_x(t,B_t)$.

| $F$ | $\varphi_t$ |
|---|---|
| $B_T^2$ | $2B_t$, with $E[F]=T$ |
| $B_T^3$ | $3(B_t^2+T-t)$ |
| $e^{B_T}$ | $e^{B_t+\frac12(T-t)}$, with $E[F]=e^{T/2}$ |
| $\int_0^TB_sds$ | $T-t$, with $E[F]=0$ |
| $\sin B_T$ | $e^{-\frac12(T-t)}\cos B_t$, with $E[F]=0$ |

## SDEs

- $dX=b(t,X)dt+\sigma(t,X)dB$. Strong existence and pathwise uniqueness hold under global Lipschitz conditions in $x$, linear growth, and $X_0\in L^p$ independent of $B$.
- Moment bound: $E[\sup_{t\le T}|X_t|^p]\le c(1+E|X_0|^p)$.
- Stability: $E[\sup_t|X_t-Y_t|^p]\le c\,E|X_0-Y_0|^p$.
- Gronwall: $u(t)\le a+b\int_0^tu$ implies $u(t)\le ae^{bt}$.
- Proof tools: Picard iteration, BDG/Doob plus Hölder for the $dt$ term, Gronwall, Borel–Cantelli (for a.s. uniform convergence).

Explicit solutions:

| SDE | Solution | Mean | Variance |
|---|---|---|---|
| GBM $dX=\mu X\,dt+\sigma X\,dB$ | $X_t=x\exp\big((\mu-\tfrac12\sigma^2)t+\sigma B_t\big)$ | $xe^{\mu t}$ | $x^2e^{2\mu t}(e^{\sigma^2t}-1)$ |
| OU $dX=-\lambda X\,dt+\sigma\,dB$ | $X_t=e^{-\lambda t}x+\sigma\int_0^te^{-\lambda(t-s)}dB_s$ | $e^{-\lambda t}x$ | $\frac{\sigma^2}{2\lambda}(1-e^{-2\lambda t})$ |
| Bridge $dX=\frac{b-X}{1-t}dt+dB$, $X_0=a$ | $X_t=a(1-t)+bt+(1-t)\int_0^t\frac{dB_s}{1-s}$ | $a(1-t)+bt$ | $t(1-t)$ |

- General linear SDE $dX=(a+bX)dt+(c+dX)dB$: let $\Phi_t=e^{(b-\frac12 d^2)t+dB_t}$. Then $X_t=\Phi_t\Big(x+\int_0^t\Phi_s^{-1}(a-cd)\,ds+\int_0^t\Phi_s^{-1}c\,dB_s\Big)$.
- Solution concepts:
  - **Strong solution**: on a given space with a given BM, adapted to the (completed) filtration generated by $X_0$ and $B$.
  - **Weak solution**: a triple (space, BM, $X$) exists.
  - **Pathwise uniqueness**: two solutions on the same space with the same BM are indistinguishable.
  - **Uniqueness in law**: all solutions have the same law.
  - Yamada–Watanabe: weak existence plus pathwise uniqueness gives a strong solution.
- **Tanaka**: $dX=\operatorname{sgn}(X)\,dB$, $X_0=0$. Weak solutions exist and are unique in law (each solution is a BM, by Lévy). Pathwise uniqueness fails, because $-X$ is also a solution, and there is no strong solution.
- Weak existence via Girsanov: for $dX=b(t,X)dt+dW$ with $b$ bounded, take a BM $X$ under $P$ and set $dQ=\mathcal E(\int b(s,X_s)dX_s)_T\,dP$. Then $W_t=X_t-\int_0^tb(s,X_s)ds$ is a $Q$-BM.

## Classic pitfalls (check before handing in)

1. Forgot the $\tfrac12 f_{xx}G^2$ term, or used $G$ instead of $G^2$.
2. Claimed a local martingale is a martingale without justification, e.g. $\int e^{B_s^2}dB_s$ for large $t$.
3. Martingale check without integrability. Or confusing $E[X_t\mid\mathcal F_s]=X_s$ with $E[X_t]=E[X_s]$, which is necessary but not sufficient.
4. Optional stopping with unbounded $\tau$ and no justification. Always use $\tau\wedge n$ and pass to the limit with dominated or monotone convergence.
5. Girsanov sign errors. Check that the $Q$-drift of $B$ is $+\theta$.
6. Itô isometry applied to a non-adapted integrand, or to $X\notin M^2$.
7. Writing $E[\int_0^t X\,dB\mid\mathcal F_s]=\int_0^tX\,dB$ instead of $\int_0^sX\,dB$.
8. In a Gronwall argument, forgetting to make sure $u$ is finite (the reason for the localization and a priori bounds).
