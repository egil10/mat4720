#!/usr/bin/env bash
# Build the prep kit into one PDF (plus one PDF per file) from prep/*.md.
# Needs pandoc and xelatex (TinyTeX / MacTeX). Override with PANDOC=/path/to/pandoc.
set -euo pipefail
cd "$(dirname "$0")"
PANDOC="${PANDOC:-pandoc}"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
mkdir -p pdf
# Latin Modern lacks a few symbols: swap them for LaTeX math equivalents.
for f in prep/[0-9]*.md; do
  sed -e 's/★/$\\star$/g' -e 's/✓/$\\checkmark$/g' "$f" > "$TMP/$(basename "$f")"
done
OPTS=(--pdf-engine=xelatex -V geometry:margin=2.2cm -V fontsize=11pt
      -V colorlinks=true -V linkcolor=blue -H prep/header.tex
      --from markdown+tex_math_dollars+pipe_tables+task_lists)
"$PANDOC" "$TMP"/[0-9]*.md -o pdf/MAT4720-prep-kit.pdf --toc --toc-depth=2 \
  -V title="MAT4720 Exam Prep Kit" \
  -V subtitle="Stochastic Analysis and SDEs, written exam 30 Nov 2026" \
  -V documentclass=report --top-level-division=chapter "${OPTS[@]}"
for f in "$TMP"/[0-9]*.md; do
  "$PANDOC" "$f" -o "pdf/$(basename "${f%.md}").pdf" --toc --toc-depth=2 "${OPTS[@]}"
done
echo "Built pdf/"
