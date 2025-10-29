# Data Science with R — Portfolio Projects

This repository showcases several end-to-end data science projects implemented in R (and a Shiny dashboard). It is structured for clarity and ease of review by employers and collaborators.

## Projects

- `project1-covid-analysis`
  - Web-scraping, cleaning, EDA, and ratio analysis on COVID-19 data.
  - How to run: open `final_jupyter_covid19.ipynb` or run `covid19_analysis.R`.

- `project2-weather-analysis`
  - NOAA weather EDA and regression modeling in R.
  - How to run: open `IBM-DS-with-R-2-Data-Analysis-with-R.ipynb` or run `weather_analysis_complete.R`.

- `project3-shiny-dashboard`
  - Interactive census dashboard built with Shiny.
  - How to run: `Rscript project3-shiny-dashboard/run_app.R` then open the local URL printed.

- `project4-canada-agri-analysis`
  - Canadian crop production and pricing analysis with RSQLite and SQL.
  - How to run: `Rscript project4-canada-agri-analysis/solve_project4.R` (creates DB, loads data, executes all queries).

## Repository Layout

- `docs/` — setup guides, lab notebooks, and submission references
- `scripts/setup/` — helper scripts to configure the R kernel and environment
- Per-project folders — code, data, and artifacts scoped to each project

## Prerequisites

- R (>= 4.2) and `Rscript` available in PATH
- Recommended R packages will be auto-installed by the scripts if missing

## Quick Start

1. Clone the repo: `git clone https://github.com/engomaressam/data-science-with-r.git`
2. Navigate to the repo: `cd data-science-with-r`
3. Run a project (example Project 4): `Rscript project4-canada-agri-analysis/solve_project4.R`

## Notes

- Large binaries, temporary artifacts, and local databases are ignored via `.gitignore`.
- Each project folder is self-contained with data and runnable code.