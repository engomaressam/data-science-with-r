# Bike-Sharing Demand Capstone – Presentation Brief for Manus AI

Author: Omar Essam
Title: Predicting Bike-Sharing Demand from Weather and Time
Audience: Data science instructors and peers
Goal: Create a professional, data-driven PDF/slide deck communicating the project workflow and results. Use the referenced CSVs to build charts (line/bar) and keep a clean, modern style with readable fonts and consistent color palette.

## Style and Structure
- Theme: minimal, modern; light background, accent blues/oranges.
- Fonts: title `36–44pt`, section headers `28–32pt`, body `20–22pt`.
- Charts: clear axis labels, legends, gridlines subtle, annotations for key values.
- Layout: 1–2 charts per slide, balanced whitespace.

## Slides Outline and Data References

1) Title
- Title, subtitle, author, date.

2) Executive Summary
- Key outcome: best model achieves `RMSE ≈ 364.4` and `R² ≈ 0.669`.
- Demand rises with temperature until mid-range; humidity has negative effect.
- Interactive Shiny dashboard demonstrates city-level forecasts and predictions.

3) Introduction & Data
- Problem statement: forecasting hourly bike demand to aid operations.
- Data sources: Seoul bike sharing (historical), OpenWeather forecast (multi-city), global bike-sharing systems.
- Note normalized values in historical data (0–1 scale).

4) Methodology
- Steps: data collection → cleaning/integration → baseline models → refined/regularized models → selection → dashboard.
- Metrics: `RMSE`, `R²`; validation: 75/25 train/test split.

5) Weather Forecast – Seoul Temperature Trend
- Chart: Line over time.
- Data: `project5-capstone/m06/charts/temperature_forecast_seoul.csv`
- Columns: `forecast_dt`, `temp`
- Axis: `x = forecast_dt (datetime)`, `y = temp (°C)`; annotate highs/lows.

6) Weather Forecast – Seoul Humidity Trend
- Chart: Line over time (secondary to temperature).
- Data: `project5-capstone/m06/charts/humidity_forecast_seoul.csv`
- Columns: `forecast_dt`, `humidity`
- Axis: `x = forecast_dt`, `y = humidity (%)`.

7) Weather Forecast – Wind Speed by City
- Chart: Multi-line line chart (4 cities).
- Data: `project5-capstone/m06/charts/wind_speed_forecast_multi_city.csv`
- Columns: `forecast_dt`, `city`, `wind_speed`
- Axis: `x = forecast_dt`, `y = wind_speed (m/s)`; legend by `city`.

8) Predictive Analysis – Model Performance Comparison
- Chart: Grouped bar chart of `RMSE` with `R²` annotated or secondary.
- Data: `project5-capstone/m06/charts/bike_model_performance.csv`
- Columns: `Model`, `R_squared`, `RMSE`
- Axis: `x = Model`, `y = RMSE`; label each bar with `R²`.
- Callouts: highlight best model (`All Variables`).

9) Model Insights – Coefficient Magnitudes
- Chart: Horizontal bar chart of absolute coefficients (top 15–20).
- Data: `project5-capstone/m06/charts/model_coefficients_best_model.csv`
- Columns: `Variable`, `Coef`, `abs_coefficient`
- Axis: `x = abs_coefficient`, `y = Variable`; note positive/negative sign in labels.

10) Demand vs Temperature (Normalized, Hourly Avg)
- Chart: Dual-line or scatter+line to show relationship by hour.
- Data: `project5-capstone/m06/charts/bike_demand_vs_temperature_norm.csv`
- Columns: `HOUR`, `temperature_norm`, `rented_bike_count_norm`
- Axis: `x = HOUR (0–23)`, `y1 = temperature_norm (0–1)`, `y2 = rented_bike_count_norm (0–1)`; align scales or use two axes.

11) Global Landscape – Top Bike-Share Cities by Bicycles
- Chart: Bar chart (descending).
- Data: `project5-capstone/m06/charts/top_bike_share_cities_by_bikes.csv`
- Columns: `CITY`, `bicycles`
- Axis: `x = CITY`, `y = bicycles`; annotate top 5.

12) Shiny Dashboard Snapshot (Optional)
- Screenshot of the running dashboard (leaflet map, controls, plots).
- If available, include an image reference (e.g., `project5-capstone/m05/screenshots/shiny_dashboard.png`) or capture from `http://localhost:3838/`.
- Caption: “Interactive forecasting and demand prediction dashboard”.

13) Conclusions
- Best model and operational insights (peak hours, weather sensitivity).
- Practical actions: staffing, redistribution, maintenance scheduling.
- Next steps: non-linear models, better missing-data handling, more cities.

14) Appendix
- Notes on normalization and feature engineering.
- Links to source files, scripts, and additional plots.

## Chart Build Notes (for Manus)
- Date parsing: treat `forecast_dt` as UTC ISO-8601 timestamps.
- Normalized series: indicate normalization in legends or in slide footnote.
- Color palette suggestion: temperature (orange), humidity (blue), wind (teal), demand (magenta), coefficients (navy).
- Label important points: best RMSE, top coefficients, top cities by bikes.

## Source Paths (context)
- Weather forecasts: `project5-capstone/output/cities_weather_forecast.csv`
- Historical demand (normalized): `project5-capstone/output/seoul_bike_cleaned.csv`
- Global systems: `project5-capstone/output/bike_sharing_cleaned.csv`
- Saved model coefficients: `project5-capstone/m05/model.csv`

## Deliverable
- Output: a polished, professional PDF slide deck built from the CSVs above.
- Ensure consistent styling and accessible color contrast.