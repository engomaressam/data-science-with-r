# Project 4 – Submission Artifacts

This folder contains all artifacts required for Project 4.

## Screenshots
- problem01_create_tables.png
- problem02_read_and_load.png
- problem03_count_farm_prices.png
- problem04_geographies.png
- problem05_rye_1968.png
- problem06_first6_rye.png
- problem07_barley_provinces.png
- problem08_first_last_dates.png
- problem09_crops_ge_350.png
- problem10_rank_sask_2000.png
- problem11_rank_since_2000.png
- problem12_wheat_recent_canada.png
- problem13_canola_prices_recent6.png

Descriptions for each screenshot are in `screenshots/README.md`.

## Notebooks and Scripts
- Project4_Notebook.Rmd – complete solutions with code and SQL.
- project4_notebook.html – rendered notebook for review.
- solve_project4.R – end‑to‑end script building DB and running all queries.

## How to Run Locally
1. Ensure R 4.5+ is installed and `rmarkdown`, `DBI`, `RSQLite`, `readr`, `dplyr` are available.
2. From repo root, render the notebook:
   - `Rscript -e "rmarkdown::render('project4-canada-agri-analysis/Project4_Notebook.Rmd', output_file='project4_notebook.html')"`
3. Or run the full script:
   - `Rscript project4-canada-agri-analysis/solve_project4.R`

## Notes
- Problem 10 may show no rows if Saskatchewan has sparse 2000 yield data; query is robust (`SUBSTR(YEAR,1,4)='2000'`).
- Problem 13 shows CAD and USD via implicit join with `MONTHLY_FX`.