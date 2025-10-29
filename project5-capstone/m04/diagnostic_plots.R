# Diagnostic Plots for Best Performing Model
# This script creates Q-Q plot and residuals plot for the baseline all-variables model

# Load required libraries
library(tidyverse)
library(ggplot2)
library(patchwork)

# Load the dataset
cat("Loading bike sharing dataset...\n")
bike_data <- read_csv("data/raw_seoul_bike_sharing.csv")

# Data preprocessing (same as in other scripts)
bike_data <- bike_data %>%
  select(-Date, -FUNCTIONING_DAY)

# Remove rows with missing values
cat("Original dataset size:", nrow(bike_data), "rows\n")
cat("Rows with missing values:", sum(!complete.cases(bike_data)), "\n")
bike_data <- bike_data %>%
  filter(complete.cases(.))
cat("Cleaned dataset size:", nrow(bike_data), "rows\n")

# Convert categorical variables to factors
bike_data <- bike_data %>%
  mutate(
    SEASONS = as.factor(SEASONS),
    HOLIDAY = as.factor(HOLIDAY)
  )

# Split data (same as baseline script)
set.seed(123)
train_indices <- sample(1:nrow(bike_data), 0.75 * nrow(bike_data))
bike_train <- bike_data[train_indices, ]
bike_test <- bike_data[-train_indices, ]

cat("Training data dimensions:", nrow(bike_train), ncol(bike_train), "\n")
cat("Testing data dimensions:", nrow(bike_test), ncol(bike_test), "\n")

# Build the best performing model (Baseline All Variables)
cat("\nBuilding best performing model (All Variables)...\n")
model_all_vars <- lm(RENTED_BIKE_COUNT ~ ., data = bike_train)

# Generate predictions for diagnostic plots
predictions <- predict(model_all_vars, bike_test)
residuals <- bike_test$RENTED_BIKE_COUNT - predictions

# Create diagnostic data frame
diagnostic_data <- data.frame(
  fitted = predictions,
  residuals = residuals,
  actual = bike_test$RENTED_BIKE_COUNT
)

# Create Q-Q plot
qq_plot <- ggplot(diagnostic_data, aes(sample = residuals)) +
  stat_qq() +
  stat_qq_line(color = "red", linetype = "dashed") +
  labs(
    title = "Q-Q Plot of Residuals",
    subtitle = "Best Model: All Variables Linear Regression",
    x = "Theoretical Quantiles",
    y = "Sample Quantiles"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12)
  )

# Create residuals vs fitted plot
residuals_plot <- ggplot(diagnostic_data, aes(x = fitted, y = residuals)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  geom_hline(yintercept = 0, color = "red", linetype = "dashed") +
  geom_smooth(method = "loess", se = FALSE, color = "orange") +
  labs(
    title = "Residuals vs Fitted Values",
    subtitle = "Best Model: All Variables Linear Regression",
    x = "Fitted Values",
    y = "Residuals"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12)
  )

# Combine plots
combined_plot <- qq_plot + residuals_plot +
  plot_annotation(
    title = "Diagnostic Plots for Best Performing Model",
    subtitle = paste("R-squared:", round(summary(model_all_vars)$r.squared, 4), 
                     "| RMSE:", round(sqrt(mean(residuals^2)), 4)),
    theme = theme(
      plot.title = element_text(size = 16, face = "bold"),
      plot.subtitle = element_text(size = 14)
    )
  )

# Save the diagnostic plots
ggsave("m04/diagnostic_plots_best_model.png", combined_plot, 
       width = 12, height = 6, dpi = 300)

# Print model summary
cat("\n=== BEST MODEL DIAGNOSTIC SUMMARY ===\n")
cat("Model: All Variables Linear Regression\n")
cat("R-squared:", round(summary(model_all_vars)$r.squared, 4), "\n")
cat("Adjusted R-squared:", round(summary(model_all_vars)$adj.r.squared, 4), "\n")
cat("RMSE:", round(sqrt(mean(residuals^2)), 4), "\n")
cat("Mean Absolute Error:", round(mean(abs(residuals)), 4), "\n")

# Check for normality of residuals
shapiro_test <- shapiro.test(sample(residuals, min(5000, length(residuals))))
cat("Shapiro-Wilk normality test p-value:", format(shapiro_test$p.value, scientific = TRUE), "\n")

cat("\nDiagnostic plots saved: m04/diagnostic_plots_best_model.png\n")
cat("=== DIAGNOSTIC ANALYSIS COMPLETE ===\n")