1.
Question 1
 Have you successfully established a connection with the database?  

Yes — see `Lab-SQL-EDA_SQlite.ipynb` connection cell creating `conn` to `eda_capstone.sqlite`.

No


1 point
2.
Question 2
 Have you loaded  four datasets into database tables?

Yes — loaded `SEOUL_BIKE_SHARING`, `CITIES_WEATHER_FORECAST`, `BIKE_SHARING_SYSTEMS`, `WORLD_CITIES` via `dbWriteTable`.

No


1 point
3.
Question 3
 Have you used SQL queries with the RSQLite/RODBC  R package to perform EDA? 

Yes — multiple `dbGetQuery` tasks implemented (record count, highs, seasonality, joins).

No


2 points
4.
Question 4
Have you loaded the SEOUL BIKE SHARING dataset in R and cast some data types?

Yes — in `Lab-ggplot2-EDA.ipynb` loaded CSV, cast `DATE` with `dmy`, `HOUR` as ordered factor.

No


2 points
5.
Question 5
Have you used TidyVerse to perform statistical analysis on the data?

Yes — summarised holiday stats, rainfall/snowfall by `SEASONS`, and daily aggregates.

No


2 points
6.
Question 6
Have you used ggplot2 to discover patterns in your data through visualization?

Yes — scatter plots over time and vs. temperature, hist+density, boxplots, and daily lines.

No


2 points
C