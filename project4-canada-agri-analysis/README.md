# Project 4 — Canada Agriculture & FX Analysis (R + SQL)

Analyzes Canadian agriculture production/prices alongside foreign exchange rates using R and SQL with RSQLite.

## Key Artifacts
- `solve_project4.R` — main script: loads CSVs, builds SQLite DB, runs queries, and summarizes insights
- `Project4_Notebook.Rmd` / `project4_notebook.html` — narrative report
- Data sources: StatsCanada series (e.g., `32100077.csv`, `32100359.csv`)

## How to Run
- `Rscript project4-canada-agri-analysis/solve_project4.R`
  - Creates SQLite DB, executes queries, and prints summaries

## Highlights
- SQL-powered exploration with tidy interfaces
- Time-series summaries and FX correlations
- Clean outputs and notebook HTML for easy review

## Tech Stack
- R, RSQLite, tidyverse; SQL embedded in R workflow

---
Local databases and large artifacts are ignored in VCS via `.gitignore`.