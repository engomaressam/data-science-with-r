# Run Log – Project 5 Capstone Data Collection

Date: 2025-10-29

## Summary
- Webscraping completed: `output/bike_sharing_systems.csv` created (915 rows).
- Downloads completed: `data/raw_worldcities.csv` and `data/raw_seoul_bike_sharing.csv` saved.
- OpenWeather keys validated (old and new). Direct checks returned `cod: 200` for `weather` and `forecast` on Seoul and Paris.
- OpenWeather scripts executed successfully:
  - `data_collection_openweather.R` → `output/cities_weather_forecast.csv` (160 rows)
  - `data_collection_weather_download.R` → `output/current_weather_by_city.csv` (7 rows), `output/cities_weather_forecast.csv` (280 rows). Log written to `output/run_logs/openweather_download_*.log`.

## Commands Executed
- `Rscript project5-capstone/scripts/data_collection_webscrape.R`
- `Rscript project5-capstone/scripts/data_collection_downloads.R`
- `Invoke-RestMethod` quick probes for both keys
- `Rscript project5-capstone/scripts/data_collection_openweather.R`
- `Rscript project5-capstone/scripts/data_collection_weather_download.R`

## Artifacts
- Outputs:
  - `output/bike_sharing_systems.csv` (182,844 bytes)
  - `output/current_weather_by_city.csv` (7 rows)
  - `output/cities_weather_forecast.csv` (280 rows)
- Data:
  - `data/raw_worldcities.csv` (~2.5 MB)
  - `data/raw_seoul_bike_sharing.csv` (~581 KB)
- Logs:
  - `output/run_logs/data_collection_webscrape.log`
  - `output/run_logs/data_collection_downloads.log`
  - `output/run_logs/data_collection_openweather.log`
  - `output/run_logs/openweather_download_*.log`

## Notes
- Free plan used on `/data/2.5/weather` and `/data/2.5/forecast` with `units=metric`.
- One Call API 3.0 requires a separate subscription and is not necessary for this project scope.

## Next Steps
- Proceed with Module 2 wrangling using populated weather CSVs.
- Optionally schedule periodic refresh respecting rate limits (≤60 calls/min).