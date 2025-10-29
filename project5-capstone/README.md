# Project 5 – Capstone Data Collection

This folder contains the capstone data collection assets: notebooks, scripts, and outputs.

## Structure
- `notebooks/`: Jupyter notebooks moved from the repository root.
- `scripts/`: R scripts for data collection (webscraping, API calls, downloads).
- `data/`: Raw datasets downloaded from cloud storage.
- `output/`: Generated CSVs and run logs.

## Prerequisites
- R (>= 4.4) installed and available on PATH.
- Internet access for Wikipedia, OpenWeather API, and IBM Cloud object storage.
- Set the environment variable `OPENWEATHER_API_KEY` for the OpenWeather script.

## How to Run
1. Webscraping (Wikipedia bike sharing systems)
   - Command: `Rscript project5-capstone/scripts/data_collection_webscrape.R`
   - Output: `project5-capstone/output/bike_sharing_systems.csv`

2. File downloads (world cities, Seoul bike sharing dataset)
   - Command: `Rscript project5-capstone/scripts/data_collection_downloads.R`
   - Output: CSVs in `project5-capstone/data/`

3. OpenWeather 5-day forecasts
   - Set API key: `setx OPENWEATHER_API_KEY "<your_key>"` (PowerShell)
   - Restart shell after `setx` or use `$env:OPENWEATHER_API_KEY = "<your_key>"` for current session.
   - Command: `Rscript project5-capstone/scripts/data_collection_openweather.R`
   - Output: `project5-capstone/output/cities_weather_forecast.csv`

## Notes
- Scripts auto-install missing R packages from CRAN.
- Run logs are saved in `output/run_logs/` for troubleshooting.
- Adjust city lists or target pages in scripts as needed.