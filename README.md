# Data Science with R — Portfolio (5 Featured Projects)

Polished, employer-ready portfolio demonstrating practical data science using R, Shiny, SQL, and reproducible reporting. Each project includes a short description, how to run, and curated artifacts (figures, reports, and dashboards).

## Projects at a Glance

- `project1-covid-analysis` — Web scrape, clean, and analyze COVID-19 data; ratio analyses and comparative EDA. Run `covid19_analysis.R` or open `final_jupyter_covid19.ipynb`.
- `project2-weather-analysis` — NOAA weather EDA and regression modeling; model comparison with train/test RMSE. Run `weather_analysis_complete.R`.
- `project3-shiny-dashboard` — Interactive census Shiny dashboard with plots, tables, and downloads. Launch with `Rscript project3-shiny-dashboard/run_app.R`.
- `project4-canada-agri-analysis` — Canadian agriculture and FX metrics with SQL and RSQLite; automated report. Run `Rscript project4-canada-agri-analysis/solve_project4.R`.
- `project5-capstone` — Bike-sharing demand prediction + Shiny dashboard; presentation deck in `m06/capstone_presentation.pdf`.

## Highlights

- End-to-end pipelines: data collection → cleaning → EDA → modeling → reporting.
- Reproducible runs via `Rscript` entry points in each project.
- Interactive Shiny app (Projects 3 and 5) with leaflet maps and dynamic plots.
- Professional slide deck (Beamer PDF) for the capstone: `project5-capstone/m06/capstone_presentation.pdf`.
- Alternative deck prompt for Manus AI: `project5-capstone/m06/manus_ai_prompt.md` with chart-ready CSVs in `m06/charts/`.

## Quick Start

Prerequisites: R (>= 4.3) available on your PATH.

- Install common packages (optional): see `project2-weather-analysis/install_packages.R` and `project5-capstone/m04/install_packages.R`.
- Example runs:
  - Project 2 (Weather): `Rscript project2-weather-analysis/weather_analysis_complete.R`
  - Project 3 (Shiny): `Rscript project3-shiny-dashboard/run_app.R` → open the printed `http://localhost:<port>`
  - Project 5 (Capstone Shiny): `Rscript project5-capstone/m05/run_app.R` → `http://localhost:3838`

## Portfolio Screenshots

- Project 2 EDA: `project2-weather-analysis/eda_temperature.png`, `eda_wind_speed.png`
- Project 3 Dashboard: `project3-shiny-dashboard/screenshots/task7_data_table.png`
- Project 5 Model Diagnostics: `project5-capstone/m04/diagnostic_plots_best_model.png`

## Repository Layout

- `project1-covid-analysis/` — COVID EDA and analysis (README included)
- `project2-weather-analysis/` — NOAA EDA and modeling (README included)
- `project3-shiny-dashboard/` — Shiny census dashboard
- `project4-canada-agri-analysis/` — Agriculture and FX analysis (README included)
- `project5-capstone/` — Bike-sharing capstone with Shiny + deck
- `scripts/setup/` — optional helpers to configure R kernel and PATH
- `docs/` — lab guides and submission references

## About

Author: Omar Essam
Focus: Practical analytics, clean code, and clear communication.

## License & Contributions

This is a personal portfolio. Feel free to explore and reference; contributions via PRs are welcome if they improve clarity or reproducibility.