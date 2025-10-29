#!/usr/bin/env Rscript

## Module 2 – Data Wrangling Preparation Script
## - Standardize column names (UPPERCASE + underscore)
## - Remove Wiki reference links [n] from CITY and SYSTEM
## - Extract numeric bike counts from BICYCLES
## - Handle missing values for RENTED_BIKE_COUNT and TEMPERATURE
## - Create indicator (dummy) variables for categorical variables
## - Normalize numeric variables with min-max scaling
## - Write cleaned outputs to project5-capstone/output/

suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(stringr)
  library(tidyr)
  library(purrr)
})

`%||%` <- function(x, y) if (is.null(x)) y else x

root_dir <- normalizePath(file.path(dirname("."), "project5-capstone"), winslash = "/", mustWork = TRUE)
data_dir <- file.path(root_dir, "data")
output_dir <- file.path(root_dir, "output")
log_dir <- file.path(output_dir, "run_logs")
if (!dir.exists(log_dir)) dir.create(log_dir, recursive = TRUE)
log_file <- file.path(log_dir, paste0("m02_wrangling_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".log"))
log <- function(...) {
  msg <- paste(format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "-", paste(..., collapse = " "))
  cat(msg, "\n")
  write(msg, file = log_file, append = TRUE)
}

# Ensure optional raw datasets are present for lab parity
ensure_download <- function(url, dest) {
  if (!file.exists(dest)) {
    tryCatch({
      download.file(url, destfile = dest, quiet = TRUE)
      log("Downloaded", basename(dest), "to", dest)
    }, error = function(e) {
      log("WARNING: Failed to download", url, "->", dest, "::", e$message)
    })
  }
}

# Paths
raw_bike_path <- file.path(data_dir, "raw_bike_sharing_systems.csv")
raw_world_path <- file.path(data_dir, "raw_worldcities.csv")
raw_seoul_path <- file.path(data_dir, "raw_seoul_bike_sharing.csv")
raw_weather_path <- file.path(data_dir, "raw_cities_weather_forecast.csv")

# Optional downloads for Module 2 labs
ensure_download("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_bike_sharing_systems.csv", raw_bike_path)
ensure_download("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_cities_weather_forecast.csv", raw_weather_path)

std_names <- function(nms) {
  nms <- toupper(nms)
  nms <- str_replace_all(nms, "[^A-Z0-9]+", "_")
  nms <- str_replace_all(nms, "_+", "_")
  nms <- str_replace(nms, "^_", "")
  nms <- str_replace(nms, "_$", "")
  nms
}

remove_refs <- function(x) {
  # Remove patterns like [12], [abc]
  x <- str_replace_all(x, "\\[[^\\]]+\\]", " ")
  x <- str_squish(x)
  x
}

extract_numeric_first <- function(x) {
  if (is.numeric(x)) return(x)
  num <- str_extract(x, "[0-9]+")
  suppressWarnings(as.numeric(num))
}

min_max_scale <- function(x) {
  if (!is.numeric(x)) return(x)
  rng <- range(x, na.rm = TRUE)
  if (diff(rng) == 0) return(rep(0, length(x)))
  (x - rng[1]) / (rng[2] - rng[1])
}

safe_read_csv <- function(path) {
  if (!file.exists(path)) {
    log("WARNING: File missing:", path)
    return(NULL)
  }
  tryCatch({ read_csv(path, show_col_types = FALSE) }, error = function(e) {
    log("ERROR: Cannot read", path, "::", e$message); NULL
  })
}

log("Starting Module 2 wrangling")

# 1) Bike sharing systems
bike_df <- NULL
if (file.exists(raw_bike_path)) {
  bike_df <- safe_read_csv(raw_bike_path)
  source_tag <- "raw_bike_sharing_systems.csv"
} else {
  # Fallback: use scraped output if available
  scrape_path <- file.path(output_dir, "bike_sharing_systems.csv")
  bike_df <- safe_read_csv(scrape_path)
  source_tag <- "output/bike_sharing_systems.csv"
}

if (!is.null(bike_df)) {
  names(bike_df) <- std_names(names(bike_df))
  # Identify likely columns by name contains
  city_col <- names(bike_df)[str_detect(names(bike_df), "CITY")] %||% NA
  system_col <- names(bike_df)[str_detect(names(bike_df), "SYSTEM")] %||% NA
  bikes_col <- names(bike_df)[str_detect(names(bike_df), "BICYCLE")] %||% NA

  bike_df <- bike_df %>% mutate(
    !!city_col := if (!is.na(city_col)) remove_refs(.data[[city_col]]) else .data[[city_col]],
    !!system_col := if (!is.na(system_col)) remove_refs(.data[[system_col]]) else .data[[system_col]],
    !!bikes_col := if (!is.na(bikes_col)) extract_numeric_first(.data[[bikes_col]]) else .data[[bikes_col]]
  )
  # Save cleaned
  out_bike <- file.path(output_dir, "bike_sharing_cleaned.csv")
  write_csv(bike_df, out_bike)
  log("Bike sharing cleaned ->", out_bike, "(source:", source_tag, ")")
} else {
  log("WARNING: Bike sharing dataset not available; skipped cleaning.")
}

# 2) Worldcities
world_df <- safe_read_csv(raw_world_path)
if (!is.null(world_df)) {
  names(world_df) <- std_names(names(world_df))
  out_world <- file.path(output_dir, "worldcities_cleaned.csv")
  write_csv(world_df, out_world)
  log("Worldcities cleaned ->", out_world)
}

# 3) Seoul bike sharing demand dataset
seoul_df <- safe_read_csv(raw_seoul_path)
if (!is.null(seoul_df)) {
  names(seoul_df) <- std_names(names(seoul_df))
  # Handle missing values for RENTED_BIKE_COUNT and TEMPERATURE (median imputation)
  for (col in c("RENTED_BIKE_COUNT", "TEMPERATURE")) {
    if (col %in% names(seoul_df)) {
      med <- median(seoul_df[[col]], na.rm = TRUE)
      seoul_df[[col]] <- ifelse(is.na(seoul_df[[col]]), med, seoul_df[[col]])
    }
  }
  # Create indicator variables for categorical columns: SEASONS, HOLIDAY, FUNCTIONING_DAY (if present)
  cat_cols <- intersect(c("SEASONS", "HOLIDAY", "FUNCTIONING_DAY"), names(seoul_df))
  if (length(cat_cols) > 0) {
    # Use model.matrix to create dummies without intercept
    dummies <- purrr::map(cat_cols, function(cc) {
      mm <- model.matrix(~ . - 1, data = seoul_df[cc])
      as_tibble(mm)
    }) %>% bind_cols()
    # Remove original cat columns and bind dummies
    seoul_df <- bind_cols(seoul_df %>% select(-all_of(cat_cols)), dummies)
  }
  # Normalize numeric columns with min-max scaling
  num_cols <- names(seoul_df)[sapply(seoul_df, is.numeric)]
  seoul_df[num_cols] <- lapply(seoul_df[num_cols], min_max_scale)

  out_seoul <- file.path(output_dir, "seoul_bike_cleaned.csv")
  write_csv(seoul_df, out_seoul)
  log("Seoul bike sharing cleaned ->", out_seoul)
}

# 4) Weather forecast (optional if present)
weather_df <- safe_read_csv(raw_weather_path)
if (is.null(weather_df)) {
  # Fallback to previously generated forecast output
  forecast_path <- file.path(output_dir, "cities_weather_forecast.csv")
  weather_df <- safe_read_csv(forecast_path)
}
if (!is.null(weather_df)) {
  names(weather_df) <- std_names(names(weather_df))
  out_weather <- file.path(output_dir, "cities_weather_forecast_cleaned.csv")
  write_csv(weather_df, out_weather)
  log("Weather forecast cleaned ->", out_weather)
}

log("Completed Module 2 wrangling preparation.")