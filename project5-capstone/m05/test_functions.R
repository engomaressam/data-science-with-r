# Test script to verify model_prediction functions work
source("model_prediction.R")

# Test the data generation function
cat("Testing data generation function...\n")
tryCatch({
  city_weather_bike_df <- generate_city_weather_bike_data()
  cat("Success! Generated data with", nrow(city_weather_bike_df), "rows\n")
  cat("Columns:", colnames(city_weather_bike_df), "\n")
  cat("First few rows:\n")
  print(head(city_weather_bike_df))
}, error = function(e) {
  cat("Error:", e$message, "\n")
})