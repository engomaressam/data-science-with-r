# Capstone: End‑to‑End Data Science Project (R)

This capstone demonstrates a complete, production‑style workflow in R — from data collection and wrangling to EDA, statistical modeling, an interactive Shiny app, and a polished presentation. It ties together multiple public datasets (bike sharing, world cities, weather) and builds an interpretable demand model with actionable visuals.

## Structure
- `m01/` Data collection plan and OpenWeather API docs.
- `m02/` Data wrangling notebooks and scripts (`dplyr`, regex).
- `m03/` EDA notebooks (SQLite, `ggplot2`) and checklists.
- `m04/` Modeling scripts (baseline and refined linear models, diagnostics).
- `m05/` Shiny app (bike demand predictor with city insights).
- `m06/` Final presentation (`capstone_presentation.Rmd` + beamer PDF) and Manus AI prompt with chart CSVs.
- `scripts/` Data collection scripts (webscrape, API calls, downloads).
- `data/` Raw inputs (downloaded artifacts).
- `output/` Cleaned, analysis‑ready CSVs and logs.
- `notebooks/` Jupyter notebooks for collection tasks.

## Quick Start
- R (>= 4.4) installed and available on PATH (Windows: `C:\Program Files\R\R-<version>\bin\R.exe`).
- Recommended R packages: `tidyverse`, `ggplot2`, `dplyr`, `readr`, `lubridate`, `shiny`, `leaflet`, `DT`.
- Optional: Pandoc + LaTeX (TinyTeX or MiKTeX) for PDF rendering.

### 1) Collect data
1. Bike sharing systems (Wikipedia webscrape)
   - Run: `Rscript project5-capstone/scripts/data_collection_webscrape.R`
   - Output: `project5-capstone/output/bike_sharing_systems.csv`
2. Download base datasets (world cities, Seoul bikes)
   - Run: `Rscript project5-capstone/scripts/data_collection_downloads.R`
   - Output: files in `project5-capstone/data/`
3. Weather forecasts (OpenWeather One Call)
   - Set API key (PowerShell): `setx OPENWEATHER_API_KEY "<your_key>"` then restart shell
   - Or for current session: `$env:OPENWEATHER_API_KEY = "<your_key>"`
   - Run: `Rscript project5-capstone/scripts/data_collection_openweather.R`
   - Output: `project5-capstone/output/cities_weather_forecast.csv`

### 2) Wrangle + Explore
- See `m02/overview.md` and notebooks for cleaning pipelines.
- See `m03` notebooks for SQLite joins and visual EDA.

### 3) Model bike demand (R)
- Enter `m04/` and run scripts in order:
  - `install_packages.R` (one‑time prerequisites)
  - `baseline_linear_models.R` (compare candidate specs)
  - `refined_linear_models.R` (select best model, export reports)
  - `diagnostic_plots.R` (residuals, leverage, coefficient importance)
- Outputs: `model_performance_comparison.png`, `diagnostic_plots_best_model.png`, `final_model_summary_report.md`.

### 4) Interactive app (Shiny)
- Enter `m05/` and run: `source("run_app.R")`
- Features:
  - Predict demand with weather + city features.
  - Leaflet map of selected cities.
  - Tabbed diagnostics and downloadable predictions.

### 5) Present results
- Enter `m06/` and render: `R -e "rmarkdown::render('capstone_presentation.Rmd')"`
- Or use Manus AI with `manus_ai_prompt.md` and CSVs in `m06/charts/`.

## Key Artifacts
- `output/bike_sharing_cleaned.csv` — model input data.
- `output/cities_weather_forecast.csv` — multi‑city 5‑day forecasts.
- `m04/model_performance_comparison.png` — RMSE comparison.
- `m04/diagnostic_plots_best_model.png` — residuals & influence.
- `m05/` Shiny app (`ui.R`, `server.R`, `run_app.R`).
- `m06/capstone_presentation.pdf` — beamer slides ready to share.
- `m06/charts/*.csv` — chart‑ready datasets for Manus AI.

## Highlights
- Full pipeline: collection → cleaning → EDA → modeling → app → slides.
- Interpretable linear model with diagnostics; reproducible CSV outputs.
- Shiny app demonstrates product thinking and stakeholder UX.
- Presentation built in R Markdown with professional beamer styling.

## Notes
- Scripts auto‑install missing R packages from CRAN.
- Run logs are saved in `output/run_logs/` for troubleshooting.
- Adjust city lists and variables in scripts to adapt the analysis.