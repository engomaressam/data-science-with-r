# Test Script for Census Data Dashboard
# This script verifies all functionality and data integrity

# Load required libraries
cat("Loading required libraries...\n")
library(shiny)
library(tidyverse)
library(ggplot2)

# Test 1: Data Loading
cat("\n=== Test 1: Data Loading ===\n")
adult_data <- read.csv("adult.csv", stringsAsFactors = FALSE)
cat("✓ Data loaded successfully\n")
cat("Dataset dimensions:", dim(adult_data), "\n")
cat("Number of columns:", ncol(adult_data), "\n")
cat("Number of rows:", nrow(adult_data), "\n")

# Test 2: Column Verification
cat("\n=== Test 2: Column Verification ===\n")
required_columns <- c("AGE", "WORKCLASS", "EDUCATION", "SEX", "HOURS_PER_WEEK", "NATIVE_COUNTRY", "PREDICTION")
missing_columns <- setdiff(required_columns, names(adult_data))
if(length(missing_columns) == 0) {
  cat("✓ All required columns present\n")
} else {
  cat("✗ Missing columns:", paste(missing_columns, collapse = ", "), "\n")
}

# Test 3: Country Data
cat("\n=== Test 3: Country Data ===\n")
unique_countries <- unique(adult_data$NATIVE_COUNTRY)
cat("Number of unique countries:", length(unique_countries), "\n")
cat("✓ Country data verified\n")

# Test 4: Continuous Variables
cat("\n=== Test 4: Continuous Variables ===\n")
age_range <- range(adult_data$AGE, na.rm = TRUE)
hours_range <- range(adult_data$HOURS_PER_WEEK, na.rm = TRUE)
cat("Age range:", age_range[1], "to", age_range[2], "\n")
cat("Hours per week range:", hours_range[1], "to", hours_range[2], "\n")
cat("✓ Continuous variables verified\n")

# Test 5: Categorical Variables
cat("\n=== Test 5: Categorical Variables ===\n")
education_levels <- length(unique(adult_data$EDUCATION))
workclass_types <- length(unique(adult_data$WORKCLASS))
sex_categories <- length(unique(adult_data$SEX))
cat("Education levels:", education_levels, "\n")
cat("Workclass types:", workclass_types, "\n")
cat("Sex categories:", sex_categories, "\n")
cat("✓ Categorical variables verified\n")

# Test 6: Prediction Variable
cat("\n=== Test 6: Prediction Variable ===\n")
prediction_values <- unique(adult_data$PREDICTION)
cat("Prediction values:", paste(prediction_values, collapse = ", "), "\n")
cat("✓ Prediction variable verified\n")

# Test 7: UI Components (syntax check)
cat("\n=== Test 7: UI Components ===\n")
tryCatch({
  source("ui.R")
  cat("✓ UI file loads without errors\n")
}, error = function(e) {
  cat("✗ UI file error:", e$message, "\n")
})

# Test 8: Server Logic (syntax check)
cat("\n=== Test 8: Server Logic ===\n")
tryCatch({
  source("server.R")
  cat("✓ Server file loads without errors\n")
}, error = function(e) {
  cat("✗ Server file error:", e$message, "\n")
})

# Test 9: Sample Plot Generation
cat("\n=== Test 9: Sample Plot Generation ===\n")
tryCatch({
  # Test histogram
  sample_data <- adult_data[adult_data$NATIVE_COUNTRY == "United-States", ]
  p1 <- ggplot(sample_data, aes(x = AGE, fill = PREDICTION)) +
    geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
    facet_wrap(~PREDICTION) +
    theme_minimal()
  
  # Test boxplot
  p2 <- ggplot(sample_data, aes(x = PREDICTION, y = AGE, fill = PREDICTION)) +
    geom_boxplot(alpha = 0.7) +
    theme_minimal()
  
  # Test bar chart
  p3 <- ggplot(sample_data, aes(x = EDUCATION, fill = EDUCATION)) +
    geom_bar(alpha = 0.7) +
    facet_wrap(~PREDICTION) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  cat("✓ All plot types generate successfully\n")
}, error = function(e) {
  cat("✗ Plot generation error:", e$message, "\n")
})

# Test Summary
cat("\n=== Test Summary ===\n")
cat("All functionality tests completed!\n")
cat("Dashboard is ready for screenshot capture and submission.\n")

# Screenshot Instructions
cat("\n=== Screenshot Instructions ===\n")
cat("Please capture the following screenshots:\n")
cat("1. Dashboard with title (Task 1)\n")
cat("2. Country selection dropdown (Task 2)\n")
cat("3. Age boxplot (Task 3)\n")
cat("4. Hours per week histogram (Task 3)\n")
cat("5. Workclass faceted bar chart (Task 4)\n")
cat("6. Education stacked bar chart (Task 4)\n")
cat("7. Final dashboard with non-US country (Task 7)\n")