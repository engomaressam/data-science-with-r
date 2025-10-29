# Refined Linear Regression Models for Bike Sharing Demand Prediction
# This script builds advanced regression models with polynomial terms, interactions, and regularization

# Load required libraries
library(tidymodels)
library(tidyverse)
library(glmnet)
library(patchwork)

# Load the bike sharing dataset
cat("Loading bike sharing dataset...\n")
bike_data <- read_csv("data/raw_seoul_bike_sharing.csv")

# Remove Date and FUNCTIONING_DAY columns as specified
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

# Split data into training and testing datasets
set.seed(1234)
bike_split <- initial_split(bike_data, prop = 0.75)
bike_train <- training(bike_split)
bike_test <- testing(bike_split)

cat("Training data dimensions:", dim(bike_train), "\n")
cat("Testing data dimensions:", dim(bike_test), "\n")

# Define model specifications
lm_spec <- linear_reg() %>%
  set_engine("lm") %>%
  set_mode("regression")

# Ridge regression specification
ridge_spec <- linear_reg(penalty = tune(), mixture = 0) %>%
  set_engine("glmnet") %>%
  set_mode("regression")

# Lasso regression specification
lasso_spec <- linear_reg(penalty = tune(), mixture = 1) %>%
  set_engine("glmnet") %>%
  set_mode("regression")

# Elastic net specification
elastic_spec <- linear_reg(penalty = tune(), mixture = tune()) %>%
  set_engine("glmnet") %>%
  set_mode("regression")

cat("\n=== BUILDING REFINED MODELS ===\n")

# Model 1: Polynomial terms for key weather variables
cat("\n1. Building model with polynomial terms...\n")
poly_formula <- RENTED_BIKE_COUNT ~ poly(TEMPERATURE, 2) + poly(HUMIDITY, 2) + 
                poly(WIND_SPEED, 2) + poly(Visibility, 2) + 
                poly(DEW_POINT_TEMPERATURE, 2) + poly(SOLAR_RADIATION, 2) + 
                RAINFALL + Snowfall + Hour + SEASONS + HOLIDAY

model_poly <- lm_spec %>%
  fit(poly_formula, data = bike_train)

# Model 2: Interaction terms between important variables
cat("2. Building model with interaction terms...\n")
interaction_formula <- RENTED_BIKE_COUNT ~ TEMPERATURE * HUMIDITY + 
                       TEMPERATURE * Hour + HUMIDITY * WIND_SPEED + 
                       Hour * SEASONS + Hour * HOLIDAY + 
                       TEMPERATURE + HUMIDITY + WIND_SPEED + Visibility + 
                       DEW_POINT_TEMPERATURE + SOLAR_RADIATION + RAINFALL + 
                       Snowfall + Hour + SEASONS + HOLIDAY

model_interaction <- lm_spec %>%
  fit(interaction_formula, data = bike_train)

# Model 3: Combined polynomial and interaction terms
cat("3. Building model with polynomial and interaction terms...\n")
poly_interaction_formula <- RENTED_BIKE_COUNT ~ poly(TEMPERATURE, 2) + poly(HUMIDITY, 2) + 
                           TEMPERATURE * Hour + HUMIDITY * WIND_SPEED + 
                           Hour * SEASONS + WIND_SPEED + Visibility + 
                           DEW_POINT_TEMPERATURE + SOLAR_RADIATION + RAINFALL + 
                           Snowfall + Hour + SEASONS + HOLIDAY

model_poly_interaction <- lm_spec %>%
  fit(poly_interaction_formula, data = bike_train)

# For regularized models, we need to create a recipe for preprocessing
cat("4. Preparing data for regularized models...\n")
bike_recipe <- recipe(RENTED_BIKE_COUNT ~ ., data = bike_train) %>%
  step_dummy(all_nominal_predictors()) %>%
  step_normalize(all_numeric_predictors())

# Create workflows for regularized models
ridge_wf <- workflow() %>%
  add_recipe(bike_recipe) %>%
  add_model(ridge_spec)

lasso_wf <- workflow() %>%
  add_recipe(bike_recipe) %>%
  add_model(lasso_spec)

elastic_wf <- workflow() %>%
  add_recipe(bike_recipe) %>%
  add_model(elastic_spec)

# Set up cross-validation for tuning
set.seed(1234)
bike_folds <- vfold_cv(bike_train, v = 5)

# Define penalty grid for tuning
penalty_grid <- grid_regular(penalty(), levels = 20)
elastic_grid <- grid_regular(penalty(), mixture(), levels = 10)

# Model 4: Ridge regression
cat("4. Building Ridge regression model...\n")
ridge_tune <- ridge_wf %>%
  tune_grid(resamples = bike_folds, grid = penalty_grid)

model_ridge <- ridge_wf %>%
  finalize_workflow(select_best(ridge_tune, metric = "rmse")) %>%
  fit(data = bike_train)

# Model 5: Lasso regression
cat("5. Building Lasso regression model...\n")
lasso_tune <- lasso_wf %>%
  tune_grid(resamples = bike_folds, grid = penalty_grid)

model_lasso <- lasso_wf %>%
  finalize_workflow(select_best(lasso_tune, metric = "rmse")) %>%
  fit(data = bike_train)

# Model 6: Elastic Net regression
cat("6. Building Elastic Net regression model...\n")
elastic_tune <- elastic_wf %>%
  tune_grid(resamples = bike_folds, grid = elastic_grid)

model_elastic <- elastic_wf %>%
  finalize_workflow(select_best(elastic_tune, metric = "rmse")) %>%
  fit(data = bike_train)

# Function to evaluate models
evaluate_model <- function(model, test_data, model_name) {
  predictions <- predict(model, test_data)
  
  results <- test_data %>%
    select(RENTED_BIKE_COUNT) %>%
    bind_cols(predictions) %>%
    metrics(truth = RENTED_BIKE_COUNT, estimate = .pred)
  
  rsq <- results %>% filter(.metric == "rsq") %>% pull(.estimate)
  rmse <- results %>% filter(.metric == "rmse") %>% pull(.estimate)
  
  return(data.frame(
    Model = model_name,
    R_squared = rsq,
    RMSE = rmse
  ))
}

# Evaluate all models
cat("\n=== EVALUATING MODELS ===\n")

results_list <- list(
  evaluate_model(model_poly, bike_test, "Polynomial"),
  evaluate_model(model_interaction, bike_test, "Interaction"),
  evaluate_model(model_poly_interaction, bike_test, "Poly + Interaction"),
  evaluate_model(model_ridge, bike_test, "Ridge"),
  evaluate_model(model_lasso, bike_test, "Lasso"),
  evaluate_model(model_elastic, bike_test, "Elastic Net")
)

# Combine results
model_results <- bind_rows(results_list)

# Load baseline results for comparison
baseline_weather <- data.frame(Model = "Baseline (Weather)", R_squared = 0.4389, RMSE = 474.6247)
baseline_all <- data.frame(Model = "Baseline (All Variables)", R_squared = 0.669, RMSE = 364.4235)

# Combine all results
all_results <- bind_rows(baseline_weather, baseline_all, model_results)

# Display results
cat("\n=== MODEL PERFORMANCE COMPARISON ===\n")
print(all_results)

# Create grouped bar chart for R-squared
rsq_plot <- all_results %>%
  ggplot(aes(x = reorder(Model, R_squared), y = R_squared, fill = Model)) +
  geom_col() +
  coord_flip() +
  labs(title = "Model Performance: R-squared",
       x = "Model",
       y = "R-squared") +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_fill_viridis_d()

# Create grouped bar chart for RMSE
rmse_plot <- all_results %>%
  ggplot(aes(x = reorder(Model, -RMSE), y = RMSE, fill = Model)) +
  geom_col() +
  coord_flip() +
  labs(title = "Model Performance: RMSE",
       x = "Model",
       y = "RMSE") +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_fill_viridis_d()

# Combine plots
performance_plot <- rsq_plot / rmse_plot
ggsave("m04/model_performance_comparison.png", performance_plot, width = 12, height = 10, dpi = 300)

# Identify best model
best_model_idx <- which.max(all_results$R_squared)
best_model_name <- all_results$Model[best_model_idx]
best_rsq <- all_results$R_squared[best_model_idx]
best_rmse <- all_results$RMSE[best_model_idx]

cat("\n=== BEST MODEL SELECTION ===\n")
cat("Best performing model:", best_model_name, "\n")
cat("R-squared:", round(best_rsq, 4), "\n")
cat("RMSE:", round(best_rmse, 4), "\n")

# Get the best refined model object
if (best_model_name == "Polynomial") {
  best_model <- model_poly
} else if (best_model_name == "Interaction") {
  best_model <- model_interaction
} else if (best_model_name == "Poly + Interaction") {
  best_model <- model_poly_interaction
} else if (best_model_name == "Ridge") {
  best_model <- model_ridge
} else if (best_model_name == "Lasso") {
  best_model <- model_lasso
} else if (best_model_name == "Elastic Net") {
  best_model <- model_elastic
}

# Create Q-Q plot for best model (if it's not a baseline model)
if (!grepl("Baseline", best_model_name)) {
  cat("\nCreating Q-Q plot for best model...\n")
  
  # Get predictions and residuals
  best_predictions <- predict(best_model, bike_test)
  residuals_data <- bike_test %>%
    select(RENTED_BIKE_COUNT) %>%
    bind_cols(best_predictions) %>%
    mutate(residuals = RENTED_BIKE_COUNT - .pred)
  
  # Q-Q plot
  qq_plot <- residuals_data %>%
    ggplot(aes(sample = residuals)) +
    stat_qq() +
    stat_qq_line() +
    labs(title = paste("Q-Q Plot for", best_model_name, "Model"),
         x = "Theoretical Quantiles",
         y = "Sample Quantiles") +
    theme_minimal()
  
  # Residuals vs Fitted plot
  residuals_plot <- residuals_data %>%
    ggplot(aes(x = .pred, y = residuals)) +
    geom_point(alpha = 0.6) +
    geom_hline(yintercept = 0, color = "red", linetype = "dashed") +
    labs(title = paste("Residuals vs Fitted for", best_model_name, "Model"),
         x = "Fitted Values",
         y = "Residuals") +
    theme_minimal()
  
  # Combine diagnostic plots
  diagnostic_plots <- qq_plot / residuals_plot
  ggsave("m04/best_model_diagnostics.png", diagnostic_plots, width = 10, height = 8, dpi = 300)
}

# Calculate improvement over baseline
baseline_rsq <- 0.669  # All variables baseline
improvement <- ((best_rsq - baseline_rsq) / baseline_rsq) * 100

cat("\n=== SUMMARY REPORT ===\n")
cat("Total models evaluated: 8 (2 baseline + 6 refined)\n")
cat("Best performing model:", best_model_name, "\n")
cat("Best R-squared:", round(best_rsq, 4), "\n")
cat("Best RMSE:", round(best_rmse, 4), "\n")
cat("Improvement over baseline:", round(improvement, 2), "%\n")
cat("\nVisualizations saved:\n")
cat("- m04/model_performance_comparison.png\n")
if (!grepl("Baseline", best_model_name)) {
  cat("- m04/best_model_diagnostics.png\n")
}

cat("\n=== REFINED MODELS ANALYSIS COMPLETE ===\n")