# MAT4720: exam prep kit

A self-contained prep kit for **MAT4720/9720 Stochastic Analysis and Stochastic Differential Equations** (UiO, Autumn 2026). The exam is a **written exam on 30 November 2026, 09:00, 4 hours**.

It was built from the course's final syllabus (19 Nov 2026), the lecturer's notes and slides, Baldi's *Stochastic Calculus*, Øksendal's *SDEs*, the mandatory assignments, and the oral-exam question lists from earlier years.

## Contents

| File | What |
|---|---|
| [`prep/00-overview-and-study-plan.md`](prep/00-overview-and-study-plan.md) | Exam facts, likely exam structure, 8-day plan, syllabus checklist |
| [`prep/01-stochastic-processes-and-brownian-motion.md`](prep/01-stochastic-processes-and-brownian-motion.md) | Processes, measurability, Kolmogorov, Brownian motion |
| [`prep/02-conditional-expectation-and-martingales.md`](prep/02-conditional-expectation-and-martingales.md) | Conditional expectation, discrete and continuous martingales |
| [`prep/03-stochastic-integral.md`](prep/03-stochastic-integral.md) | Construction of the Itô integral, isometry, local integrands |
| [`prep/04-stochastic-calculus.md`](prep/04-stochastic-calculus.md) | Itô formula, product rule, exponentials, maximal estimates |
| [`prep/05-girsanov-and-representation.md`](prep/05-girsanov-and-representation.md) | Girsanov, Novikov/Kazamaki, martingale representation |
| [`prep/06-stochastic-differential-equations.md`](prep/06-stochastic-differential-equations.md) | Existence and uniqueness, stability, weak solutions, Tanaka |
| [`prep/07-mock-exams.md`](prep/07-mock-exams.md) | Four full 4-hour mock exams |
| [`prep/08-mock-exam-solutions.md`](prep/08-mock-exam-solutions.md) | Model solutions with grading notes |
| [`prep/09-formula-sheet.md`](prep/09-formula-sheet.md) | Everything to memorize on a few pages |

PDF versions are in [`pdf/`](pdf/). `MAT4720-prep-kit.pdf` is the full kit, and each chapter also has its own PDF.

## Rebuilding the PDFs

```bash
./build.sh            # needs pandoc + xelatex
```

## Note on sources

The textbooks, lecture notes and other course PDFs are **not** in this repo (see `.gitignore`). Put them in the repo root or in `sources/` locally.
