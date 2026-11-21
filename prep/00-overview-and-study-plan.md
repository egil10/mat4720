# Overview, Exam Facts and Study Plan

## The exam: hard facts

| | |
|---|---|
| **Format** | Written school exam, **4 hours**, no aids (standard UiO MAT school exam) |
| **When** | **Monday 30 November 2026, 09:00–13:00**. Meet 30 minutes early |
| **Where** | Silurveien 2, Sal 3C / 3D. Check Studentweb for your room |
| **Lecturer** | Salvador Ortiz-Latorre (new in 2026) |
| **Main book** | P. Baldi, *Stochastic Calculus* (the slides follow Ch 4, 5, 7, 8, 9, 12) |
| **Binding syllabus** | "Final Syllabus MAT4720/MAT9720", published 19 Nov 2026 (summarised below) |
| **Prerequisite** | Mandatory assignment approved (deadline was 5 Nov) |

> **Important context:** from 2020 to 2025 the exam was **oral** (lecturer G. Di Nunno), so **no past written exams exist**. The old oral question lists (2020, 2022, 2024) still say which *topics* the department considers central, and they overlap heavily with this year's syllabus. The 2026 written exam is the first one from the new lecturer. His final syllabus is very explicit, with (S) = statement, (P) = proof and (S&P) = both. **Treat every (S&P) and (P) item as a potential "state and prove" question.** Expect the computational problems to look like the mandatory assignment.

## What the exam will most likely contain

From the syllabus structure, the assignment, and the usual UiO MAT4xxx written-exam pattern:

1. **One or two "state and prove" problems.** These are drawn from the (S&P)/(P) list. The prime candidates, in rough order of likelihood:
   - Itô isometry (Thm 5.9) and the conditional moment lemma (Lemma 5.6)
   - Doob decomposition (Thm 4.5) and optional sampling (Thm 4.6)
   - Doob's inequality (Thm 4.17) and $L^p$ convergence (Thm 4.19)
   - Lévy characterization of BM (Thm 4.42)
   - Girsanov (Thm 7.5) with Lemma 7.4
   - Strong existence and uniqueness for SDEs (Thm 8.13) and stability (Thm 8.22)
   - Itô's formula for polynomials (Thm 6.7) and the product rule (Prop 6.6)
   - quadratic variation of BM in $L^2$ (Prop 2.15)
   - BM as a Gaussian process (Prop 2.3)
   - nonnegative local martingales are supermartingales (Prop 5.33)
   - stochastic exponential (Prop 6.13) and exponential bound (Prop 6.15)
   - representation of $L^2$ variables (Thm 7.10)
   - Tanaka's example (Lemma 8.27)
2. **One or two "computation" problems** like the oblig:
   - martingale/sub/super checks for functions of $B$
   - conditional expectations of polynomials in BM increments
   - $E[(\int\!\int \dots dB\,dB)^2]$ via isometry
   - showing a process is an Itô process via Itô's formula
   - solving linear SDEs (OU, GBM, bridge) and their mean and variance
   - Girsanov drift removal with Novikov
   - the explicit integrand in martingale representation
   - finite-space Doob decomposition and compensator
   - optional stopping for BM exit times
3. **Definitions and "state precisely" items**:
   - progressive measurability, modification vs indistinguishable, filtration conditions
   - Kolmogorov continuity (Thm 1.15), Daniell–Kolmogorov (Thm 1.20)
   - Lévy modulus (Thm 2.12), LIL (Thm 2.16)
   - upcrossing (Prop 4.11), continuous optional sampling (Thm 4.33)
   - $M^2$ vs $\Lambda^2$/$M^2_{loc}$, local martingale
   - Novikov/Kazamaki (Thm 7.6), time change (Thm 6.17)
   - strong/weak solutions, pathwise uniqueness vs uniqueness in law
4. **Conceptual true/false items with counterexamples**:
   - a local martingale that is not a martingale
   - an $L^1$-bounded martingale that is not UI
   - a martingale with finite variation must be constant
   - BM has infinite variation
   - pathwise uniqueness fails for Tanaka

## How to write proofs on the exam

1. **Start with a 2–4 line roadmap** ("We first prove it for elementary processes, then extend by density using the isometry…"). The lecturer's predecessors explicitly rewarded this, and it earns partial credit even if you run out of time.
2. **State the hypotheses you use** at the point where you use them (integrability, adaptedness, $\mathcal F_s$-measurability, independence of increments).
3. **Integrability first.** For martingale checks, always show (1) adapted, (2) integrable, (3) the conditional expectation property. Points are routinely lost for skipping (2).
4. **For limits, name the mode of convergence** ($L^2$, in probability, a.s.) and the theorem used (dominated or monotone convergence, Fatou, Doob, Borel–Cantelli).
5. **Localization**: if a statement is for $M^2_{loc}$, say "by localization with $\tau_n=\inf\{t:\int_0^t X_s^2ds\ge n\}\wedge T$ it suffices to treat $X\in M^2$". The syllabus often lets you skip localization (Prop 6.21), so say explicitly that you are using that simplification.

## 4-hour time management

- **0:00–0:10**: read the whole exam. Mark each sub-question **A** (I know it cold), **B** (I know the method) or **C** (unsure).
- Do all **A**s first, then **B**s. Budget roughly **points ÷ total × 220 minutes** per question, keeping 20 minutes as a reserve.
- Never spend more than 1.5× the budget on one sub-question. Write the roadmap and the key step, and move on.
- Leave the last 10 minutes to check signs, the $\tfrac12$ in Itô terms, and missing integrability statements.

## 8-day study plan (Sun 22 Nov → Mon 30 Nov)

You have **8 days** (not 10): the exam is on **30 November**.

| Day | Date | Focus | Files | Target |
|---|---|---|---|---|
| 1 | Sun 22 | Processes + BM; measurability, Kolmogorov, Gaussian, QV | `01` | All S&P proofs of ch. 1–2 written once from memory |
| 2 | Mon 23 | Conditional expectation + discrete martingales | `02` (first half) | Doob decomposition, optional sampling, a.s. convergence, Doob inequality |
| 3 | Tue 24 | Continuous martingales, Lévy characterization; **Mock Exam 1** (evening, timed) | `02`, `07` | Thm 4.19, 4.37, 4.42; mark Mock 1 |
| 4 | Wed 25 | Stochastic integral: construction, isometry, local integrands, Riemann sums | `03` | Lemma 5.6, Thm 5.9, 5.16, Prop 5.27, 5.28, 5.33, 5.36 |
| 5 | Thu 26 | Itô formula, product rule, exponentials, BDG; **heavy computation day** | `04` | 20 Itô computations; Prop 6.6, Thm 6.7, Prop 6.13, 6.15, 6.21 |
| 6 | Fri 27 | Girsanov, Novikov, representation; **Mock Exam 2** (timed) | `05`, `07` | Lemma 7.4, Thm 7.5, Thm 7.10 |
| 7 | Sat 28 | SDEs: existence/uniqueness, stability, weak solutions, Tanaka; **Mock Exam 3** | `06`, `07` | Thm 8.10, 8.13, 8.22, 8.25, Lemma 8.27 |
| 8 | Sun 29 | **Mock Exam 4** (morning, 09:00–13:00, exactly like the real one), then the formula sheet and flashcards only; early night | `07`, `09`, flashcards | No new material after 16:00 |

**Daily routine (about 8–10 hours):**

1. Read the chapter's *Exam relevance* table and *Statements* (45 min).
2. Read each proof's roadmap, then **close the file and write the proof from memory** on paper. Compare and repeat until it is clean (3–4 h).
3. Do the exercises **before** reading the solutions; read *Strategy* only if you are stuck for more than 10 minutes (2–3 h).
4. Flashcards from all chapters done so far (20 min, spaced repetition).

## Syllabus checklist (tick when you can reproduce it on paper)

### 1. Stochastic processes
- [ ] All definitions, examples, remarks (filtrations, adapted, progressive, modification, indistinguishable, …)
- [ ] Prop 1.9 (S&P): sufficient condition for progressive measurability
- [ ] Thm 1.15 (S): Kolmogorov continuity
- [ ] Prop 1.19 (S&P), including the statement of Carathéodory
- [ ] Thm 1.20 (S): Daniell–Kolmogorov extension
- [ ] Props 1.25, 1.27, 1.28, 1.29 (P only)

### 2. Brownian motion
- [ ] Definitions, examples, remarks (except Remark 2.7)
- [ ] Prop 2.3 (S&P): BM as a Gaussian process
- [ ] Prop 2.4 (P): invariance properties
- [ ] Thm 2.12 (S): Lévy modulus; Cor 2.13 (S&P)
- [ ] Prop 2.15 (S&P): $L^2$ convergence of the QV
- [ ] Thm 2.16 (S): LIL
- [ ] Lemma 2.18, Thm 2.19 (S)

### 3. Conditional expectation
- [ ] All results in the slides (S); what is proven in the handwritten notes (P)

### 4. Martingales
- [ ] Everything in the slides
- [ ] Thm 4.5 (S&P): Doob decomposition
- [ ] A stopped martingale is a martingale (P)
- [ ] Thm 4.6 (S&P): optional sampling
- [ ] Baldi Exercises 5.1 and 5.6: characterization of martingales
- [ ] Prop 4.11 (S): upcrossing
- [ ] Thm 4.12 (S&P): a.s. convergence of supermartingales
- [ ] Lemma 4.18 (S); Thm 4.17 (S&P): Doob's inequality
- [ ] Thm 4.19 (S&P): $L^p$ convergence
- [ ] Thm 4.33 (S): continuous-time optional sampling
- [ ] Thm 4.37 (S&P): finite-variation martingales are constant (BV case)
- [ ] Thm 4.42 (S&P): Lévy characterization

### 5. The stochastic integral
- [ ] Everything in the slides
- [ ] Lemma 5.6 (S&P), Lemma 5.7 (S), Thm 5.9 (S&P): Itô isometry
- [ ] Thm 5.14 (S), Thm 5.16 (S&P), Thm 5.21 (S)
- [ ] Lemma 5.26 (S&P), Prop 5.27 (S&P), Prop 5.28 (S&P)
- [ ] Prop 5.33 (S&P), Prop 5.36 (S&P)

### 6. Stochastic calculus (excluding the multidimensional integral)
- [ ] Prop 6.6 (S&P, elementary case): product rule
- [ ] Thm 6.7 (S&P, polynomial case): Itô formula
- [ ] Prop 6.13 (S&P): stochastic exponential; Prop 6.15 (S&P): exponential bound
- [ ] Thm 6.17, Cor 6.20 (S): time change
- [ ] Prop 6.21 (S&P, bounded case): maximal $L^p$ estimate

### 7. More stochastic calculus
- [ ] Prop 7.3 (S); Lemma 7.4 (S&P); Thm 7.5 Girsanov (S&P); Thm 7.6 Novikov/Kazamaki (S)
- [ ] Thm 7.10 (S&P, skipping $Q^+=Q^-$); Thms 7.11–7.13 (S)

### 8. SDEs (excluding locally Lipschitz coefficients)
- [ ] Thm 8.10 (S&P): moment bounds; Thm 8.13 (S&P): strong existence + pathwise uniqueness
- [ ] Thm 8.22 (S&P): stability; Thm 8.25 (S&P, Girsanov construction only)
- [ ] Lemma 8.27 (S&P): Tanaka's example; Karatzas–Shreve definition of a strong solution

## Sources: what we found and used

Everything in this kit comes from the documents below. Nothing comes from a past written exam, because **none exists** (see above).

### From the course website (uio.no/studier/emner/matnat/math/MAT4720, semester pages H21–H26)

| Document | Used for |
|---|---|
| **Final Syllabus MAT4720/MAT9720** (19 Nov 2026) | The backbone: which results need statements, proofs or both |
| Lecture notes 0–8 (handwritten, H26): introduction; stochastic processes; Brownian motion; conditional expectation; martingales; stochastic integral; stochastic calculus; more stochastic calculus; SDEs | Course numbering, the lecturer's own proofs, Tanaka's example (Lemma 8.27) |
| Slides 3–8 (H26, based on Baldi Ch. 4, 5, 7, 8, 12, 9) | Definitions, statements, examples |
| Review of measure theory; review of probability theory (H26 additional material) | Background facts |
| Mandatory assignment H26 | Template for the computational exam problems |
| Mandatory assignments H22 and H25 | More problems in the same style (finite-space martingales, Itô processes) |
| Oral exam question lists 2020 (H21 page), 2022, 2024 | Which topics the department considers central |
| Exam page H26 | Exam format, date and place |

### From the books in this repo

| Book | Used for |
|---|---|
| P. Baldi, *Stochastic Calculus: An Introduction Through Theory and Exercises* (Springer) | Main text. Proofs, and exercises **with Baldi's worked solutions** (Ch. 3, 4, 5, 7, 8, 9, 12), rewritten here in full detail |
| B. Øksendal, *Stochastic Differential Equations* (6th ed.) | Extra exercises (Ch. 3, 4, 5, 8) and alternative explanations |

### What we could not get

- **Past written exams**: none exist. The course used oral exams from 2020 to 2025, and older semester pages are offline.
- Canvas content (exercise-session solutions, recordings): this needs a login.
- The question list attached to the H24 "Information about the exam" announcement is login-protected. The same list appears in the "mat4720 eksamen.pdf" you supplied.

## About the grade

No prep kit can *guarantee* an A or B. What it can do is make sure that **every syllabus item is covered** at the depth the exam asks for, and that you have **practised under exam conditions**. A realistic recipe for an A/B:

1. You can write **every (S&P)/(P) proof** from memory, at least as the "memorize-this skeleton", plus the key estimates.
2. You can do the **standard computations** quickly and without sign errors: Itô formula, isometry, conditional expectations, linear SDEs, Girsanov, representation.
3. You have done **all four mock exams timed** and checked them against the solutions honestly.
4. You can **state every (S) theorem with all its hypotheses**. Missing hypotheses are the most common way to lose points on "state" questions.

If you can do all four, you are very well placed for the top grades.

## How this kit is organised

| File | Content |
|---|---|
| `00` | This overview and plan |
| `01` | Stochastic processes and Brownian motion |
| `02` | Conditional expectation and martingales |
| `03` | The stochastic integral |
| `04` | Stochastic calculus (Itô formula, exponentials, BDG) |
| `05` | Girsanov and martingale representation |
| `06` | Stochastic differential equations |
| `07` | Four full mock exams (questions only) |
| `08` | Model solutions with grading notes |
| `09` | Formula sheet: the things to have memorized |

Every chapter file has the same structure: exam relevance → definitions → statements → proofs (roadmap, full proof, pitfalls, skeleton) → exercises with strategy, solution and pitfalls → predicted questions → flashcards.
