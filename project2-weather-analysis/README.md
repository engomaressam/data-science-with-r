# Project 2 — NOAA Weather EDA & Modeling (R)

Exploratory data analysis and predictive modeling using NOAA weather data. Compares multiple regression models and saves train/test RMSEs.

## Key Artifacts
- `weather_analysis_complete.R` — end-to-end script (EDA → modeling → outputs)
- EDA figures: `eda_temperature.png`, `eda_wind_speed.png`, `eda_relative_humidity.png`, `eda_station_pressure.png`
- Scatterplots: `scatter_temperature.png`, `scatter_humidity.png`, `scatter_wind.png`, `scatter_pressure.png`
- Model comparison table: `model_comparison.csv` (Train_RMSE, Test_RMSE)

## How to Run
- `Rscript project2-weather-analysis/weather_analysis_complete.R`
  - Produces EDA plots and `model_comparison.csv`

## Highlights
- Clean, tidy EDA with consistent visuals
- Multiple models evaluated (humidity, temperature, wind, pressure, polynomial, multiple)
- Best Test RMSE identified and saved to `model_comparison.csv`

## Example Visuals
- `eda_temperature.png` — temperature distribution
- `scatter_humidity.png` — humidity vs precipitation

## Tech Stack
- R (tidyverse), base modeling

---
Results and plots are written locally; large artifacts are not committed.