# Build chart-ready CSVs for Manus AI presentation
# Reads existing project outputs and produces small, tidy CSVs under m06/charts

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(stringr)
})

charts_dir <- file.path("project5-capstone", "m06", "charts")
if (!dir.exists(charts_dir)) dir.create(charts_dir, recursive = TRUE)

# 1) Weather forecasts: Seoul temperature and humidity time series
weather_path <- file.path("project5-capstone", "output", "cities_weather_forecast.csv")
weather_df <- read_csv(weather_path, show_col_types = FALSE)

seoul_weather <- weather_df %>% filter(city == "Seoul")

seoul_temp <- seoul_weather %>% select(forecast_dt, temp)
write_csv(seoul_temp, file.path(charts_dir, "temperature_forecast_seoul.csv"))

seoul_humidity <- seoul_weather %>% select(forecast_dt, humidity)
write_csv(seoul_humidity, file.path(charts_dir, "humidity_forecast_seoul.csv"))

# 2) Multi-city wind speed time series (Seoul, Washington D.C., Paris, Toronto)
wind_cities <- c("Seoul", "Washington D.C.", "Paris", "Toronto")
wind_multi <- weather_df %>% 
  filter(city %in% wind_cities) %>% 
  select(forecast_dt, city, wind_speed)
write_csv(wind_multi, file.path(charts_dir, "wind_speed_forecast_multi_city.csv"))

# 3) Bike demand vs temperature (normalized) — hourly averages for Seoul
seoul_bike_path <- file.path("project5-capstone", "output", "seoul_bike_cleaned.csv")
seoul_bike_df <- read_csv(seoul_bike_path, show_col_types = FALSE)

bike_temp_hourly <- seoul_bike_df %>%
  group_by(HOUR) %>%
  summarise(
    temperature_norm = mean(TEMPERATURE, na.rm = TRUE),
    rented_bike_count_norm = mean(RENTED_BIKE_COUNT, na.rm = TRUE)
  ) %>%
  arrange(HOUR)
write_csv(bike_temp_hourly, file.path(charts_dir, "bike_demand_vs_temperature_norm.csv"))

# 4) Best model coefficients (absolute magnitude) from Module 5 saved coefficients
model_coef_path <- file.path("project5-capstone", "m05", "model.csv")
model_df <- read_csv(model_coef_path, show_col_types = FALSE) %>% 
  mutate(Variable = gsub('"', '', Variable))

coef_df <- model_df %>%
  filter(Variable != "Intercept") %>%
  mutate(abs_coefficient = abs(Coef)) %>%
  arrange(desc(abs_coefficient))

write_csv(coef_df, file.path(charts_dir, "model_coefficients_best_model.csv"))

# 5) Top bike-sharing cities by number of bicycles (from global systems)
bike_systems_path <- file.path("project5-capstone", "output", "bike_sharing_cleaned.csv")
bike_systems_df <- read_csv(bike_systems_path, show_col_types = FALSE)

# Parse BICYCLES column to numeric (remove non-digits like commas, annotations, words)
bike_top <- bike_systems_df %>%
  mutate(
    BICYCLES_NUM = suppressWarnings(as.numeric(str_replace_all(BICYCLES, "[^0-9]", "")))
  ) %>%
  filter(!is.na(BICYCLES_NUM), BICYCLES_NUM > 0) %>%
  group_by(CITY) %>%
  summarise(bicycles = max(BICYCLES_NUM, na.rm = TRUE), .groups = "drop") %>%
  arrange(desc(bicycles)) %>%
  slice(1:15)

write_csv(bike_top, file.path(charts_dir, "top_bike_share_cities_by_bikes.csv"))

cat("Chart CSVs written to:", charts_dir, "\n")