# Run Log – Project 5 Capstone Data Collection

Date: Auto-generated during this session.

## Summary
- Webscraping completed: `output/bike_sharing_systems.csv` created (915 rows).
- Downloads completed: `data/raw_worldcities.csv` and `data/raw_seoul_bike_sharing.csv` saved.
- OpenWeather run attempted: API key set, but requests returned 401 (activation pending); `output/cities_weather_forecast.csv` remains empty until key is active.

## Commands Executed
- `Rscript project5-capstone/scripts/data_collection_webscrape.R`
- `Rscript project5-capstone/scripts/data_collection_downloads.R`
- `Rscript project5-capstone/scripts/data_collection_openweather.R`

## Artifacts
- Outputs:
  - `output/bike_sharing_systems.csv` (182,844 bytes)
  - `output/cities_weather_forecast.csv` (0 bytes – API key activation required)
- Data:
  - `data/raw_worldcities.csv` (2.5 MB)
  - `data/raw_seoul_bike_sharing.csv` (581 KB)
- Logs:
  - `output/run_logs/data_collection_webscrape.log`
  - `output/run_logs/data_collection_downloads.log`
  - `output/run_logs/data_collection_openweather.log`

## Next Steps
- Confirm OpenWeather account email and wait ~10 minutes for key activation.
- Test in browser: `https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=<your_key>` (should return JSON, not 401).
- Re-run `Rscript project5-capstone/scripts/data_collection_openweather.R` to populate forecasts.
- Proceed with data wrangling and EDA for the collected datasets.