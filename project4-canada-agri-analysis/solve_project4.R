#!/usr/bin/env Rscript

# Project 4: Canadian Agri Market Insights — Complete Solution Script
# This script creates an RSQLite database, loads all datasets, and executes
# all queries from Problems 3–13, printing results to the console.

message("==== Project 4 Solution: Starting ====")

# Auto-install and load required packages
required_pkgs <- c("DBI", "RSQLite", "readr", "dplyr")
for (p in required_pkgs) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p, repos = "https://cloud.r-project.org")
  }
  suppressPackageStartupMessages(library(p, character.only = TRUE))
}

project_dir <- file.path(getwd(), "project4-canada-agri-analysis")
db_path <- file.path(project_dir, "FinalDB.sqlite")

# Create DB connection
if (file.exists(db_path)) file.remove(db_path)
conn <- DBI::dbConnect(RSQLite::SQLite(), db_path)
on.exit(DBI::dbDisconnect(conn))

message("Creating tables and loading datasets...")

# Read CSVs
crop_df <- readr::read_csv(file.path(project_dir, "Annual_Crop_Data.csv"), show_col_types = FALSE)
farm_df <- readr::read_csv(file.path(project_dir, "Monthly_Farm_Prices.csv"), show_col_types = FALSE)
daily_fx_df <- readr::read_csv(file.path(project_dir, "Daily_FX.csv"), show_col_types = FALSE)
monthly_fx_df <- readr::read_csv(file.path(project_dir, "Monthly_FX.csv"), show_col_types = FALSE)

# Write tables (overwrite ensures idempotent runs)
DBI::dbWriteTable(conn, "CROP_DATA", crop_df, overwrite = TRUE)
DBI::dbWriteTable(conn, "FARM_PRICES", farm_df, overwrite = TRUE)
DBI::dbWriteTable(conn, "DAILY_FX", daily_fx_df, overwrite = TRUE)
DBI::dbWriteTable(conn, "MONTHLY_FX", monthly_fx_df, overwrite = TRUE)

message("Tables created: ", paste(DBI::dbListTables(conn), collapse = ", "))

# Helper to run a query and print nicely
run_query <- function(title, sql) {
  cat("\n--- ", title, " ---\n", sep = "")
  cat(sql, "\n\n")
  res <- DBI::dbGetQuery(conn, sql)
  print(res)
  invisible(res)
}

# Problem 3: How many records are in the farm prices dataset?
run_query(
  "Problem 3: Count FARM_PRICES records",
  "SELECT COUNT(*) AS record_count FROM FARM_PRICES;"
)

# Problem 4: Which geographies are included in the farm prices dataset?
run_query(
  "Problem 4: Geographies in FARM_PRICES",
  "SELECT DISTINCT GEO FROM FARM_PRICES ORDER BY GEO;"
)

# Problem 5: How many hectares of Rye were harvested in Canada in 1968?
run_query(
  "Problem 5: Rye harvested area in Canada (1968)",
  "SELECT HARVESTED_AREA FROM CROP_DATA
   WHERE CROP_TYPE = 'Rye' AND GEO = 'Canada' AND YEAR LIKE '1968%';"
)

# Problem 6: First 6 rows of farm prices table for Rye
run_query(
  "Problem 6: First 6 FARM_PRICES rows for Rye",
  "SELECT * FROM FARM_PRICES
   WHERE CROP_TYPE = 'Rye'
   ORDER BY DATE ASC
   LIMIT 6;"
)

# Problem 7: Which provinces grew Barley?
run_query(
  "Problem 7: Provinces that grew Barley",
  "SELECT DISTINCT GEO FROM CROP_DATA
   WHERE CROP_TYPE = 'Barley' AND GEO <> 'Canada'
   ORDER BY GEO;"
)

# Problem 8: First and last dates for the farm prices data
run_query(
  "Problem 8: First and last FARM_PRICES dates",
  "SELECT MIN(DATE) AS first_date, MAX(DATE) AS last_date FROM FARM_PRICES;"
)

# Problem 9: Crops with price >= $350 per metric tonne
run_query(
  "Problem 9: Crops with PRICE_PRERMT >= 350",
  "SELECT DISTINCT CROP_TYPE FROM FARM_PRICES
   WHERE PRICE_PRERMT >= 350
   ORDER BY CROP_TYPE;"
)

# Problem 10: Rank crop types harvested in Saskatchewan in 2000 by average yield
run_query(
  "Problem 10: Saskatchewan 2000 crop types ranked by average yield",
  "SELECT CROP_TYPE, AVG(AVG_YIELD) AS avg_yield
   FROM CROP_DATA
   WHERE TRIM(GEO) = 'Saskatchewan' AND CAST(SUBSTR(YEAR,1,4) AS INTEGER) = 2000
   GROUP BY CROP_TYPE
   ORDER BY avg_yield DESC;"
)

# Problem 11: Rank crops and geographies by average yield since 2000
run_query(
  "Problem 11: Average yield by crop and geography since 2000",
  "SELECT CROP_TYPE, GEO, AVG(AVG_YIELD) AS avg_yield
   FROM CROP_DATA
   WHERE SUBSTR(YEAR,1,4) >= '2000'
   GROUP BY CROP_TYPE, GEO
   ORDER BY avg_yield DESC;"
)

# Problem 12: Most recent wheat harvested area in Canada using subquery
run_query(
  "Problem 12: Wheat harvested in Canada (most recent year)",
  "SELECT HARVESTED_AREA FROM CROP_DATA
   WHERE CROP_TYPE = 'Wheat' AND GEO = 'Canada' AND YEAR = (
     SELECT MAX(YEAR) FROM CROP_DATA WHERE CROP_TYPE = 'Wheat' AND GEO = 'Canada'
   );"
)

# Problem 13: Implicit inner join for Canola price in CAD and USD (most recent 6 months)
run_query(
  "Problem 13: Canola prices in Saskatchewan (CAD & USD), recent 6 months",
  "SELECT fp.DATE,
          fp.CROP_TYPE,
          fp.GEO,
          fp.PRICE_PRERMT AS price_cad,
          (fp.PRICE_PRERMT / fx.FXUSDCAD) AS price_usd
   FROM FARM_PRICES fp, MONTHLY_FX fx
   WHERE fp.DATE = fx.DATE
     AND fp.CROP_TYPE = 'Canola'
     AND fp.GEO = 'Saskatchewan'
   ORDER BY fp.DATE DESC
   LIMIT 6;"
)

message("==== Project 4 Solution: Completed successfully ====")