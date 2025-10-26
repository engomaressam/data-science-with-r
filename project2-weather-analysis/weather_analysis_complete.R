# Weather Data Analysis - Complete Implementation
# IBM Data Science with R - Project 2
# All 10 Tasks Implementation

# Load required libraries
library(tidymodels)
library(tidyverse)
library(ggplot2)

# Set working directory
setwd("c:/Users/Diaa/data.science.with.r/project2-weather-analysis")

print("=== WEATHER DATA ANALYSIS PROJECT ===")
print("Starting comprehensive analysis...")

# ============================================================================
# TASK 1: Download and Unzip NOAA Weather Dataset
# ============================================================================
print("\n--- TASK 1: Download and Unzip NOAA Weather Dataset ---")

# Download the dataset
url <- 'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/ENn4iRKnW2szuR-zPKslwg/noaa-weather-sample-data-tar.gz'
download.file(url, destfile = "noaa-weather-sample-data-tar.gz", mode = "wb")
print("Dataset downloaded successfully!")

# Untar the file
untar("noaa-weather-sample-data-tar.gz")
print("Dataset extracted successfully!")

# List files to confirm
if(file.exists("noaa-weather-sample-data/jfk_weather_sample.csv")) {
    print("✓ Dataset file found: noaa-weather-sample-data/jfk_weather_sample.csv")
} else {
    print("✗ Dataset file not found!")
}

# ============================================================================
# TASK 2: Read Dataset into Project
# ============================================================================
print("\n--- TASK 2: Read Dataset into Project ---")

# Read the dataset
weather_data <- read_csv("noaa-weather-sample-data/jfk_weather_sample.csv")
print("Dataset loaded successfully!")

# Display first few rows
print("First 6 rows of the dataset:")
print(head(weather_data))

# Get dataset overview
print("\nDataset structure:")
print(glimpse(weather_data))

print(paste("Dataset dimensions:", nrow(weather_data), "rows x", ncol(weather_data), "columns"))

# ============================================================================
# TASK 3: Select Subset of Columns
# ============================================================================
print("\n--- TASK 3: Select Subset of Columns ---")

# Select the key columns for analysis
weather_subset <- weather_data %>%
  select(HOURLYRelativeHumidity, 
         HOURLYDRYBULBTEMPF, 
         HOURLYPrecip, 
         HOURLYWindSpeed, 
         HOURLYStationPressure)

print("Selected columns:")
print(colnames(weather_subset))

print("\nFirst 10 rows of subset:")
print(head(weather_subset, 10))

# ============================================================================
# TASK 4: Clean Up Columns
# ============================================================================
print("\n--- TASK 4: Clean Up Columns ---")

# Check unique values in HOURLYPrecip
print("Unique values in HOURLYPrecip before cleaning:")
print(unique(weather_subset$HOURLYPrecip))

# Clean the HOURLYPrecip column
weather_cleaned <- weather_subset %>%
  mutate(HOURLYPrecip = case_when(
    HOURLYPrecip == "T" ~ "0.0",
    TRUE ~ str_remove(HOURLYPrecip, "s$")
  ))

print("\nUnique values in HOURLYPrecip after cleaning:")
print(unique(weather_cleaned$HOURLYPrecip))

# ============================================================================
# TASK 5: Convert Columns to Numerical Types
# ============================================================================
print("\n--- TASK 5: Convert Columns to Numerical Types ---")

# Check current data types
print("Data types before conversion:")
print(glimpse(weather_cleaned))

# Convert HOURLYPrecip to numeric
weather_numeric <- weather_cleaned %>%
  mutate(HOURLYPrecip = as.numeric(HOURLYPrecip))

print("\nData types after conversion:")
print(glimpse(weather_numeric))

# ============================================================================
# TASK 6: Rename Columns
# ============================================================================
print("\n--- TASK 6: Rename Columns ---")

# Rename columns to more readable names
weather_final <- weather_numeric %>%
  rename(
    relative_humidity = HOURLYRelativeHumidity,
    dry_bulb_temp_f = HOURLYDRYBULBTEMPF,
    precip = HOURLYPrecip,
    wind_speed = HOURLYWindSpeed,
    station_pressure = HOURLYStationPressure
  )

print("Final column names:")
print(colnames(weather_final))

print("\nFinal dataset preview:")
print(head(weather_final))

# ============================================================================
# TASK 7: Exploratory Data Analysis
# ============================================================================
print("\n--- TASK 7: Exploratory Data Analysis ---")

# Set seed for reproducibility
set.seed(1234)

# Split data into training and testing (80/20)
data_split <- initial_split(weather_final, prop = 0.8)
train_data <- training(data_split)
test_data <- testing(data_split)

print(paste("Training set:", nrow(train_data), "rows"))
print(paste("Testing set:", nrow(test_data), "rows"))

# Create histograms for each variable
print("\nCreating exploratory visualizations...")

# Histogram for relative humidity
p1 <- ggplot(train_data, aes(x = relative_humidity)) +
  geom_histogram(bins = 30, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Relative Humidity", 
       x = "Relative Humidity (%)", 
       y = "Frequency") +
  theme_minimal()

# Histogram for dry bulb temperature
p2 <- ggplot(train_data, aes(x = dry_bulb_temp_f)) +
  geom_histogram(bins = 30, fill = "lightcoral", color = "black") +
  labs(title = "Distribution of Dry Bulb Temperature", 
       x = "Temperature (°F)", 
       y = "Frequency") +
  theme_minimal()

# Histogram for precipitation
p3 <- ggplot(train_data, aes(x = precip)) +
  geom_histogram(bins = 30, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of Precipitation", 
       x = "Precipitation (inches)", 
       y = "Frequency") +
  theme_minimal()

# Histogram for wind speed
p4 <- ggplot(train_data, aes(x = wind_speed)) +
  geom_histogram(bins = 30, fill = "lightyellow", color = "black") +
  labs(title = "Distribution of Wind Speed", 
       x = "Wind Speed (mph)", 
       y = "Frequency") +
  theme_minimal()

# Histogram for station pressure
p5 <- ggplot(train_data, aes(x = station_pressure)) +
  geom_histogram(bins = 30, fill = "lightpink", color = "black") +
  labs(title = "Distribution of Station Pressure", 
       x = "Station Pressure (in Hg)", 
       y = "Frequency") +
  theme_minimal()

# Save plots
ggsave("eda_relative_humidity.png", p1, width = 8, height = 6, bg = "white")
ggsave("eda_temperature.png", p2, width = 8, height = 6, bg = "white")
ggsave("eda_precipitation.png", p3, width = 8, height = 6, bg = "white")
ggsave("eda_wind_speed.png", p4, width = 8, height = 6, bg = "white")
ggsave("eda_station_pressure.png", p5, width = 8, height = 6, bg = "white")

print("EDA plots saved successfully!")

# ============================================================================
# TASK 8: Linear Regression
# ============================================================================
print("\n--- TASK 8: Linear Regression ---")

# Create simple linear regression models
print("Creating simple linear regression models...")

# Model 1: precip ~ relative_humidity
model1 <- lm(precip ~ relative_humidity, data = train_data)
print("\nModel 1 (precip ~ relative_humidity):")
print(summary(model1))

# Model 2: precip ~ dry_bulb_temp_f
model2 <- lm(precip ~ dry_bulb_temp_f, data = train_data)
print("\nModel 2 (precip ~ dry_bulb_temp_f):")
print(summary(model2))

# Model 3: precip ~ wind_speed
model3 <- lm(precip ~ wind_speed, data = train_data)
print("\nModel 3 (precip ~ wind_speed):")
print(summary(model3))

# Model 4: precip ~ station_pressure
model4 <- lm(precip ~ station_pressure, data = train_data)
print("\nModel 4 (precip ~ station_pressure):")
print(summary(model4))

# Create scatter plots with regression lines
print("Creating scatter plots with regression lines...")

# Scatter plot 1
s1 <- ggplot(train_data, aes(x = relative_humidity, y = precip)) +
  geom_point(alpha = 0.6, color = "blue") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Precipitation vs Relative Humidity", 
       x = "Relative Humidity (%)", 
       y = "Precipitation (inches)") +
  theme_minimal()

# Scatter plot 2
s2 <- ggplot(train_data, aes(x = dry_bulb_temp_f, y = precip)) +
  geom_point(alpha = 0.6, color = "green") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Precipitation vs Dry Bulb Temperature", 
       x = "Temperature (°F)", 
       y = "Precipitation (inches)") +
  theme_minimal()

# Scatter plot 3
s3 <- ggplot(train_data, aes(x = wind_speed, y = precip)) +
  geom_point(alpha = 0.6, color = "orange") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Precipitation vs Wind Speed", 
       x = "Wind Speed (mph)", 
       y = "Precipitation (inches)") +
  theme_minimal()

# Scatter plot 4
s4 <- ggplot(train_data, aes(x = station_pressure, y = precip)) +
  geom_point(alpha = 0.6, color = "purple") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Precipitation vs Station Pressure", 
       x = "Station Pressure (in Hg)", 
       y = "Precipitation (inches)") +
  theme_minimal()

# Save scatter plots
ggsave("scatter_humidity.png", s1, width = 8, height = 6, bg = "white")
ggsave("scatter_temperature.png", s2, width = 8, height = 6, bg = "white")
ggsave("scatter_wind.png", s3, width = 8, height = 6, bg = "white")
ggsave("scatter_pressure.png", s4, width = 8, height = 6, bg = "white")

print("Scatter plots saved successfully!")

# ============================================================================
# TASK 9: Improve the Model
# ============================================================================
print("\n--- TASK 9: Improve the Model ---")

# Multiple linear regression model
model_multiple <- lm(precip ~ relative_humidity + dry_bulb_temp_f + wind_speed + station_pressure, 
                    data = train_data)
print("\nMultiple Linear Regression Model:")
print(summary(model_multiple))

# Polynomial model (quadratic terms)
model_poly <- lm(precip ~ relative_humidity + I(relative_humidity^2) + 
                dry_bulb_temp_f + I(dry_bulb_temp_f^2), 
                data = train_data)
print("\nPolynomial Model (with quadratic terms):")
print(summary(model_poly))

# Calculate training performance metrics
train_pred1 <- predict(model1, train_data)
train_pred2 <- predict(model2, train_data)
train_pred3 <- predict(model3, train_data)
train_pred4 <- predict(model4, train_data)
train_pred_multiple <- predict(model_multiple, train_data)
train_pred_poly <- predict(model_poly, train_data)

# Calculate RMSE for training data
train_rmse1 <- sqrt(mean((train_data$precip - train_pred1)^2, na.rm = TRUE))
train_rmse2 <- sqrt(mean((train_data$precip - train_pred2)^2, na.rm = TRUE))
train_rmse3 <- sqrt(mean((train_data$precip - train_pred3)^2, na.rm = TRUE))
train_rmse4 <- sqrt(mean((train_data$precip - train_pred4)^2, na.rm = TRUE))
train_rmse_multiple <- sqrt(mean((train_data$precip - train_pred_multiple)^2, na.rm = TRUE))
train_rmse_poly <- sqrt(mean((train_data$precip - train_pred_poly)^2, na.rm = TRUE))

print("\nTraining RMSE values:")
print(paste("Model 1 (humidity):", round(train_rmse1, 4)))
print(paste("Model 2 (temperature):", round(train_rmse2, 4)))
print(paste("Model 3 (wind):", round(train_rmse3, 4)))
print(paste("Model 4 (pressure):", round(train_rmse4, 4)))
print(paste("Multiple model:", round(train_rmse_multiple, 4)))
print(paste("Polynomial model:", round(train_rmse_poly, 4)))

# ============================================================================
# TASK 10: Find Best Model
# ============================================================================
print("\n--- TASK 10: Find Best Model ---")

# Evaluate all models on test data
test_pred1 <- predict(model1, test_data)
test_pred2 <- predict(model2, test_data)
test_pred3 <- predict(model3, test_data)
test_pred4 <- predict(model4, test_data)
test_pred_multiple <- predict(model_multiple, test_data)
test_pred_poly <- predict(model_poly, test_data)

# Calculate test RMSE
test_rmse1 <- sqrt(mean((test_data$precip - test_pred1)^2, na.rm = TRUE))
test_rmse2 <- sqrt(mean((test_data$precip - test_pred2)^2, na.rm = TRUE))
test_rmse3 <- sqrt(mean((test_data$precip - test_pred3)^2, na.rm = TRUE))
test_rmse4 <- sqrt(mean((test_data$precip - test_pred4)^2, na.rm = TRUE))
test_rmse_multiple <- sqrt(mean((test_data$precip - test_pred_multiple)^2, na.rm = TRUE))
test_rmse_poly <- sqrt(mean((test_data$precip - test_pred_poly)^2, na.rm = TRUE))

# Create comparison table
model_names <- c("Humidity Model", "Temperature Model", "Wind Model", 
                "Pressure Model", "Multiple Model", "Polynomial Model")
train_rmse <- c(train_rmse1, train_rmse2, train_rmse3, train_rmse4, 
               train_rmse_multiple, train_rmse_poly)
test_rmse <- c(test_rmse1, test_rmse2, test_rmse3, test_rmse4, 
              test_rmse_multiple, test_rmse_poly)

comparison_df <- data.frame(
  Model = model_names,
  Train_RMSE = round(train_rmse, 4),
  Test_RMSE = round(test_rmse, 4)
)

print("\nModel Comparison Table:")
print(comparison_df)

# Find best model
best_model_idx <- which.min(test_rmse)
best_model_name <- model_names[best_model_idx]
print(paste("\nBest Model:", best_model_name))
print(paste("Best Test RMSE:", round(test_rmse[best_model_idx], 4)))

# Save comparison table
write.csv(comparison_df, "model_comparison.csv", row.names = FALSE)
print("\nModel comparison saved to model_comparison.csv")

print("\n=== ANALYSIS COMPLETE ===")
print("All tasks completed successfully!")
print("Files created:")
print("- EDA plots: eda_*.png")
print("- Scatter plots: scatter_*.png") 
print("- Model comparison: model_comparison.csv")