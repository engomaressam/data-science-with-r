# Run Log – Project 5 Capstone Data Collection

Date: Auto-generated during this session.

## Summary
- Webscraping completed: `output/bike_sharing_systems.csv` created (915 rows).
- Downloads completed: `data/raw_worldcities.csv` and `data/raw_seoul_bike_sharing.csv` saved.
- OpenWeather run skipped: `OPENWEATHER_API_KEY` not set; created empty `output/cities_weather_forecast.csv`.

## Commands Executed
- `Rscript project5-capstone/scripts/data_collection_webscrape.R`
- `Rscript project5-capstone/scripts/data_collection_downloads.R`
- `Rscript project5-capstone/scripts/data_collection_openweather.R`

## Artifacts
- Outputs:
  - `output/bike_sharing_systems.csv` (182,844 bytes)
  - `output/cities_weather_forecast.csv` (0 bytes – set API key to populate)
- Data:
  - `data/raw_worldcities.csv` (2.5 MB)
  - `data/raw_seoul_bike_sharing.csv` (581 KB)
- Logs:
  - `output/run_logs/data_collection_webscrape.log`
  - `output/run_logs/data_collection_downloads.log`
  - `output/run_logs/data_collection_openweather.log`

## Next Steps
- Set `OPENWEATHER_API_KEY` in your environment and re-run the OpenWeather script:
  - PowerShell (persist): `setx OPENWEATHER_API_KEY "<your_key>"`
  - PowerShell (current session): `$env:OPENWEATHER_API_KEY = "<your_key>"`
- Proceed with data wrangling and EDA for the collected datasets.