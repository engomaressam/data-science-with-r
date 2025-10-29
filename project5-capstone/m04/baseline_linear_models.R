# Predict Hourly Rented Bike Count using Basic Linear Regression Models
# Module 04 - Baseline Linear Regression Models

# Load required libraries
library(tidymodels)
library(tidyverse)
library(stringr)

# Set seed for reproducibility
set.seed(1234)

# Load the dataset
cat("Loading bike sharing dataset...\n")
dataset_url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/seoul_bike_sharing_converted_normalized.csv"
bike_sharing_df <- read_csv(dataset_url)

# Display dataset structure
cat("Dataset structure:\n")
spec(bike_sharing_df)

# Remove DATE and FUNCTIONING_DAY columns as specified
bike_sharing_df <- bike_sharing_df %>% 
  select(-DATE, -FUNCTIONING_DAY)

cat("Dataset after removing DATE and FUNCTIONING_DAY columns:\n")
cat("Dimensions:", dim(bike_sharing_df), "\n")
cat("Columns:", colnames(bike_sharing_df), "\n")

# TASK 1: Split data into training and testing datasets
cat("\n=== TASK 1: Splitting data into training and testing datasets ===\n")

# Use initial_split() with 75% for training
data_split <- initial_split(bike_sharing_df, prop = 3/4)
train_data <- training(data_split)
test_data <- testing(data_split)

cat("Training data dimensions:", dim(train_data), "\n")
cat("Testing data dimensions:", dim(test_data), "\n")

# TASK 2: Build a linear regression model using weather variables only
cat("\n=== TASK 2: Building linear regression model with weather variables only ===\n")

# Define linear regression model specification
lm_spec <- linear_reg() %>%
  set_engine("lm") %>%
  set_mode("regression")

# Weather variables: TEMPERATURE, HUMIDITY, WIND_SPEED, VISIBILITY, 
# DEW_POINT_TEMPERATURE, SOLAR_RADIATION, RAINFALL, SNOWFALL
weather_formula <- RENTED_BIKE_COUNT ~ TEMPERATURE + HUMIDITY + WIND_SPEED + 
                   VISIBILITY + DEW_POINT_TEMPERATURE + SOLAR_RADIATION + 
                   RAINFALL + SNOWFALL

# Fit the weather-only model
lm_model_weather <- lm_spec %>%
  fit(weather_formula, data = train_data)

cat("Weather-only model fitted successfully!\n")
cat("Model summary:\n")
print(lm_model_weather$fit)

# TASK 3: Build a linear regression model using all variables
cat("\n=== TASK 3: Building linear regression model with all variables ===\n")

# Fit model with all variables
all_formula <- RENTED_BIKE_COUNT ~ .

lm_model_all <- lm_spec %>%
  fit(all_formula, data = train_data)

cat("All-variables model fitted successfully!\n")
cat("Model summary:\n")
summary(lm_model_all$fit)

# TASK 4: Model evaluation and identification of important variables
cat("\n=== TASK 4: Model evaluation and variable importance ===\n")

# Make predictions on test data
test_results_weather <- predict(lm_model_weather, test_data) %>%
  bind_cols(test_data %>% select(RENTED_BIKE_COUNT)) %>%
  rename(truth = RENTED_BIKE_COUNT, estimate = .pred)

test_results_all <- predict(lm_model_all, test_data) %>%
  bind_cols(test_data %>% select(RENTED_BIKE_COUNT)) %>%
  rename(truth = RENTED_BIKE_COUNT, estimate = .pred)

# Calculate R-squared and RMSE metrics
rsq_weather <- rsq(test_results_weather, truth, estimate)
rsq_all <- rsq(test_results_all, truth, estimate)

rmse_weather <- rmse(test_results_weather, truth, estimate)
rmse_all <- rmse(test_results_all, truth, estimate)

# Display results
cat("Weather-only model performance:\n")
cat("R-squared:", rsq_weather$.estimate, "\n")
cat("RMSE:", rmse_weather$.estimate, "\n")

cat("\nAll-variables model performance:\n")
cat("R-squared:", rsq_all$.estimate, "\n")
cat("RMSE:", rmse_all$.estimate, "\n")

# Create performance comparison dataframe
performance_comparison <- data.frame(
  Model = c("Weather Only", "All Variables"),
  R_squared = c(rsq_weather$.estimate, rsq_all$.estimate),
  RMSE = c(rmse_weather$.estimate, rmse_all$.estimate)
)

cat("\nPerformance Comparison:\n")
print(performance_comparison)

# Analyze coefficients of the all-variables model
cat("\n=== Coefficient Analysis ===\n")
coefficients <- lm_model_all$fit$coefficients
cat("All coefficients:\n")
print(coefficients)

# Sort coefficients by absolute value (excluding intercept)
coeff_df <- data.frame(
  Variable = names(coefficients)[-1],  # Exclude intercept
  Coefficient = coefficients[-1]
) %>%
  mutate(Abs_Coefficient = abs(Coefficient)) %>%
  arrange(desc(Abs_Coefficient))

cat("\nCoefficients sorted by absolute value:\n")
print(coeff_df)

# Visualize coefficients
cat("\nCreating coefficient visualization...\n")
coeff_plot <- coeff_df %>%
  ggplot(aes(x = reorder(Variable, Abs_Coefficient), y = Abs_Coefficient)) +
  geom_bar(stat = "identity", fill = "steelblue", alpha = 0.7) +
  coord_flip() +
  labs(
    title = "Variable Importance by Absolute Coefficient Value",
    subtitle = "Linear Regression Model with All Variables",
    x = "Variables",
    y = "Absolute Coefficient Value"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text = element_text(size = 10)
  )

# Save the plot
ggsave("m04/coefficient_importance_plot.png", coeff_plot, 
       width = 10, height = 8, dpi = 300)

print(coeff_plot)

# Create a detailed summary report
cat("\n=== SUMMARY REPORT ===\n")
cat("Baseline Linear Regression Models for Bike Sharing Demand Prediction\n")
cat("====================================================================\n")
cat("Dataset: Seoul Bike Sharing (Normalized)\n")
cat("Training samples:", nrow(train_data), "\n")
cat("Testing samples:", nrow(test_data), "\n")
cat("\nModel Performance Comparison:\n")
cat("1. Weather-only model:\n")
cat("   - R-squared:", round(rsq_weather$.estimate, 4), "\n")
cat("   - RMSE:", round(rmse_weather$.estimate, 4), "\n")
cat("2. All-variables model:\n")
cat("   - R-squared:", round(rsq_all$.estimate, 4), "\n")
cat("   - RMSE:", round(rmse_all$.estimate, 4), "\n")
cat("\nImprovement with all variables:\n")
cat("   - R-squared improvement:", round(rsq_all$.estimate - rsq_weather$.estimate, 4), "\n")
cat("   - RMSE improvement:", round(rmse_weather$.estimate - rmse_all$.estimate, 4), "\n")

cat("\nTop 5 most important variables (by absolute coefficient):\n")
for(i in 1:min(5, nrow(coeff_df))) {
  cat(sprintf("%d. %s: %.4f\n", i, coeff_df$Variable[i], coeff_df$Coefficient[i]))
}

cat("\nConclusion: The all-variables model performs significantly better than the weather-only model.\n")
cat("This suggests that temporal factors (hour, season, holiday) are crucial for predicting bike demand.\n")

cat("\nBaseline models completed successfully!\n")