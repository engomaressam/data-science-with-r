1.
Question 1
Have you standardized column names to be all uppercase and use underscore to separate words?



Yes



No

Status: Completed
Evidence: `output/bike_sharing_cleaned.csv`, `output/worldcities_cleaned.csv`, `output/seoul_bike_cleaned.csv`, `output/cities_weather_forecast_cleaned.csv` all have uppercase underscore column names.


1 point
2.
Question 2
Have you removed undesired Wiki reference links `[ ]`?



Yes



No

Status: Completed
Evidence: `output/bike_sharing_cleaned.csv` CITY and SYSTEM fields stripped of patterns like `[12]`.


2 points
3.
Question 3
Have you extracted only the numeric bike count?



Yes



No

Status: Completed
Evidence: `output/bike_sharing_cleaned.csv` BICYCLES column contains numeric values extracted from annotated strings.


1 point
4.
Question 4
Have you handled missing values for `RENTED_BIKE_COUNT` and 'TEMPERATURE` variables?



Yes



No

Status: Completed
Evidence: `output/seoul_bike_cleaned.csv` median imputation applied to `RENTED_BIKE_COUNT` and `TEMPERATURE`.


2 points
5.
Question 5
Have you created indicator (dummy) variables for all categorical variables?



Yes



No

Status: Completed
Evidence: `output/seoul_bike_cleaned.csv` includes dummy columns for `SEASONS`, `HOLIDAY`, `FUNCTIONING_DAY`.


2 points
6.
Question 6
Have you normalized all numeric variables with min-max scaling?



Yes



No

Status: Completed
Evidence: `output/seoul_bike_cleaned.csv` numeric columns min-max scaled; bike sharing numeric fields preserved.


2 points
C