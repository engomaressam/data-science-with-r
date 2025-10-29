# Linear Regression Models for Bike Sharing Demand Prediction
## Final Summary Report

### Project Overview
This report summarizes the development and evaluation of linear regression models to predict hourly bike rental demand using the Seoul Bike Sharing dataset. The analysis included baseline models, refined models with polynomial terms and interactions, and regularized models.

### Dataset Information
- **Original Dataset Size**: 8,760 rows, 14 columns
- **Missing Values**: 306 rows (primarily in RENTED_BIKE_COUNT column)
- **Cleaned Dataset Size**: 8,454 rows, 12 columns (after removing missing values and unnecessary columns)
- **Training/Testing Split**: 75%/25% (6,340 training, 2,114 testing observations)

### Variables Used
**Response Variable:**
- `RENTED_BIKE_COUNT` - Count of bikes rented at each hour

**Weather Predictor Variables:**
- `TEMPERATURE` - Temperature in Celsius
- `HUMIDITY` - Humidity percentage
- `WIND_SPEED` - Wind speed in m/s
- `Visibility` - Visibility (multiplied by 10m)
- `DEW_POINT_TEMPERATURE` - Dew point temperature in Celsius
- `SOLAR_RADIATION` - Solar radiation in MJ/m²
- `RAINFALL` - Rainfall in mm
- `Snowfall` - Snowfall in cm

**Date/Time Predictor Variables:**
- `Hour` - Hour of the day
- `SEASONS` - Winter, Spring, Summer, Autumn (categorical)
- `HOLIDAY` - Holiday/No holiday (categorical)

### Model Results Summary

#### Baseline Models
1. **Weather-Only Model**
   - R-squared: 0.4389
   - RMSE: 474.6247
   - Uses only weather variables

2. **All Variables Model** ⭐ **Best Performing**
   - R-squared: 0.6690
   - RMSE: 364.4235
   - Uses both weather and temporal variables

#### Refined Models
3. **Polynomial Model**
   - R-squared: 0.5754
   - RMSE: 415.2086
   - Includes polynomial terms for key variables

4. **Interaction Model**
   - R-squared: 0.6016
   - RMSE: 402.1833
   - Includes interaction terms between variables

5. **Polynomial + Interaction Model**
   - R-squared: 0.6168
   - RMSE: 394.4072
   - Combines polynomial and interaction terms

#### Regularized Models
6. **Ridge Regression**
   - R-squared: 0.5468
   - RMSE: 428.9222
   - L2 regularization to prevent overfitting

7. **Lasso Regression**
   - R-squared: 0.5473
   - RMSE: 428.6227
   - L1 regularization for feature selection

8. **Elastic Net Regression**
   - R-squared: 0.5474
   - RMSE: 428.5443
   - Combination of L1 and L2 regularization

### Key Findings

#### Best Model Performance
- **Best Model**: Baseline All Variables Linear Regression
- **R-squared**: 0.669 (explains 66.9% of variance)
- **RMSE**: 364.4235 bikes per hour
- **Mean Absolute Error**: 321.7491 bikes per hour

#### Variable Importance
The most important variables by absolute coefficient value in the best model include:
1. HUMIDITY
2. Hour-related variables (temporal patterns)
3. TEMPERATURE
4. DEW_POINT_TEMPERATURE
5. SEASONS

#### Model Insights
1. **Temporal factors are crucial**: The inclusion of hour and seasonal variables significantly improved model performance compared to weather-only models.

2. **Diminishing returns from complexity**: While polynomial and interaction terms added complexity, they did not improve performance beyond the baseline all-variables model.

3. **Regularization trade-offs**: Regularized models showed lower performance but may be more robust to overfitting and provide better generalization.

4. **Weather impact**: Weather variables alone explain 43.9% of the variance, indicating significant but not complete predictive power.

### Model Diagnostics
- **Normality of Residuals**: Shapiro-Wilk test p-value: 4.15e-26 (residuals are not normally distributed)
- **Residuals Pattern**: Shows some heteroscedasticity and non-linear patterns
- **Model Assumptions**: Some violations suggest potential for further improvement with non-linear models

### Visualizations Created
1. **Coefficient Importance Plot**: Shows the relative importance of variables in the baseline model
2. **Model Performance Comparison**: Bar chart comparing R-squared and RMSE across all models
3. **Diagnostic Plots**: Q-Q plot and residuals vs fitted values for the best model

### Recommendations

#### For Production Use
- **Recommended Model**: Baseline All Variables Linear Regression
- **Rationale**: Best performance with interpretable results and reasonable complexity

#### For Further Improvement
1. **Feature Engineering**: Create additional temporal features (day of week, weekend indicator)
2. **Non-linear Models**: Consider tree-based models or neural networks to capture complex patterns
3. **Data Quality**: Investigate and potentially impute missing values more sophisticatedly
4. **Outlier Treatment**: Remove or transform extreme values that may be affecting model performance

### Technical Implementation
- **Tools Used**: R with tidymodels, tidyverse, ggplot2, glmnet
- **Data Processing**: Missing value removal, categorical variable encoding
- **Model Validation**: Train/test split with consistent random seed (123)
- **Evaluation Metrics**: R-squared and RMSE for model comparison

### Conclusion
The analysis successfully developed predictive models for bike sharing demand with the best model achieving an R-squared of 0.669 and RMSE of 364.4 bikes per hour. The results demonstrate that temporal patterns (hour, season) combined with weather conditions provide strong predictive power for bike rental demand. While more complex models with polynomial terms and regularization were explored, the baseline all-variables linear regression model provided the best balance of performance and interpretability.

---
*Report generated on: December 2024*  
*Analysis conducted using R and tidymodels framework*