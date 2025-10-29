#!/usr/bin/env Rscript

## Unified Weather Data Download Script (Current + 5-day/3-hour Forecast)
## - Reads cities list
## - Calls OpenWeather current and forecast endpoints
## - Saves to output/current_weather_by_city.csv and output/cities_weather_forecast.csv
## - Logs outcomes to output/run_logs/openweather_download.log

suppressPackageStartupMessages({
  library(httr)
  library(jsonlite)
  library(dplyr)
  library(readr)
  library(purrr)
  library(stringr)
  library(lubridate)
})

root_dir <- normalizePath(file.path(dirname("."), "project5-capstone"), winslash = "/", mustWork = TRUE)
data_dir <- file.path(root_dir, "data")
output_dir <- file.path(root_dir, "output")
log_dir <- file.path(output_dir, "run_logs")
if (!dir.exists(log_dir)) dir.create(log_dir, recursive = TRUE)

log_file <- file.path(log_dir, paste0("openweather_download_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".log"))
log <- function(...) {
  msg <- paste(format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "-", paste(..., collapse = " "))
  cat(msg, "\n")
  write(msg, file = log_file, append = TRUE)
}

api_key <- Sys.getenv("OPENWEATHER_API_KEY")
if (is.na(api_key) || api_key == "") {
  log("ERROR: OPENWEATHER_API_KEY is not set in environment.")
}

units <- "metric"

default_cities <- c(
  "Seoul",
  "Washington D.C.",
  "Paris",
  "Suzhou",
  "Toronto",
  "New York",
  "London"
)

# Try to read cities from data/raw_worldcities.csv if present
cities <- default_cities
wc_path <- file.path(data_dir, "raw_worldcities.csv")
if (file.exists(wc_path)) {
  log("Reading cities from", wc_path)
  wc <- tryCatch(read_csv(wc_path, show_col_types = FALSE), error = function(e) NULL)
  if (!is.null(wc) && all(c("city", "country") %in% names(wc))) {
    # Select up to 10 well-known cities to keep API usage modest
    cities <- wc %>% 
      arrange(city) %>% 
      distinct(city) %>% 
      slice_head(n = 10) %>% 
      pull(city)
    log("Using", length(cities), "cities from worldcities.csv")
  } else {
    log("worldcities.csv missing expected columns; falling back to default cities.")
  }
} else {
  log("worldcities.csv not found; using default cities.")
}

encode_city <- function(city) {
  # Replace problematic characters for query; keep spaces
  city <- gsub("\u00A0", " ", city) # non-breaking space
  URLencode(city, reserved = TRUE)
}

fetch_current <- function(city) {
  if (is.na(api_key) || api_key == "") return(NULL)
  url <- sprintf("https://api.openweathermap.org/data/2.5/weather?q=%s&appid=%s&units=%s", encode_city(city), api_key, units)
  resp <- tryCatch(httr::GET(url), error = function(e) NULL)
  if (is.null(resp)) {
    log("REQUEST-ERROR (current):", city, "-", "No response (network error)")
    return(NULL)
  }
  status <- httr::status_code(resp)
  if (status != 200) {
    log("REQUEST-ERROR (current):", city, "- status", status, "-", httr::content(resp, as = "text", encoding = "UTF-8"))
    return(NULL)
  }
  dat <- httr::content(resp, as = "text", encoding = "UTF-8")
  j <- jsonlite::fromJSON(dat)
  # Robustly extract weather fields whether jsonlite produces a data.frame or list-of-lists
  w_main <- tryCatch({
    if (is.data.frame(j$weather)) j$weather$main[[1]] %||% NA_character_ else j$weather[[1]]$main %||% NA_character_
  }, error = function(e) NA_character_)
  w_desc <- tryCatch({
    if (is.data.frame(j$weather)) j$weather$description[[1]] %||% NA_character_ else j$weather[[1]]$description %||% NA_character_
  }, error = function(e) NA_character_)
  tibble(
    city = city,
    dt = as_datetime(j$dt, tz = "UTC"),
    weather_main = w_main,
    weather_desc = w_desc,
    temp = j$main$temp %||% NA_real_,
    temp_min = j$main$temp_min %||% NA_real_,
    temp_max = j$main$temp_max %||% NA_real_,
    pressure = j$main$pressure %||% NA_real_,
    humidity = j$main$humidity %||% NA_real_,
    wind_speed = j$wind$speed %||% NA_real_,
    wind_deg = j$wind$deg %||% NA_real_,
    visibility = j$visibility %||% NA_real_,
    clouds = j$clouds$all %||% NA_real_
  )
}

fetch_forecast <- function(city) {
  if (is.na(api_key) || api_key == "") return(NULL)
  url <- sprintf("https://api.openweathermap.org/data/2.5/forecast?q=%s&appid=%s&units=%s", encode_city(city), api_key, units)
  resp <- tryCatch(httr::GET(url), error = function(e) NULL)
  if (is.null(resp)) {
    log("REQUEST-ERROR (forecast):", city, "-", "No response (network error)")
    return(NULL)
  }
  status <- httr::status_code(resp)
  if (status != 200) {
    log("REQUEST-ERROR (forecast):", city, "- status", status, "-", httr::content(resp, as = "text", encoding = "UTF-8"))
    return(NULL)
  }
  dat <- httr::content(resp, as = "text", encoding = "UTF-8")
  j <- jsonlite::fromJSON(dat)
  if (!"list" %in% names(j)) return(NULL)
  purrr::map_dfr(seq_len(nrow(j$list)), function(i) {
    row <- j$list[i,]
    # Robustly extract nested weather fields for each forecast row
    wm <- tryCatch({
      w <- row$weather[[1]]
      if (is.data.frame(w)) w$main[[1]] %||% NA_character_ else w[[1]]$main %||% NA_character_
    }, error = function(e) NA_character_)
    wd <- tryCatch({
      w <- row$weather[[1]]
      if (is.data.frame(w)) w$description[[1]] %||% NA_character_ else w[[1]]$description %||% NA_character_
    }, error = function(e) NA_character_)
    tibble(
      city = city,
      forecast_dt = as_datetime(row$dt, tz = "UTC"),
      weather_main = wm,
      weather_desc = wd,
      temp = row$main$temp %||% NA_real_,
      temp_min = row$main$temp_min %||% NA_real_,
      temp_max = row$main$temp_max %||% NA_real_,
      pressure = row$main$pressure %||% NA_real_,
      humidity = row$main$humidity %||% NA_real_,
      wind_speed = row$wind$speed %||% NA_real_,
      wind_deg = row$wind$deg %||% NA_real_,
      clouds = row$clouds$all %||% NA_real_
    )
  })
}

`%||%` <- function(x, y) if (is.null(x) || (is.atomic(x) && length(x) == 0)) y else x

log("Starting weather data download for", length(cities), "cities")

current_df <- purrr::map_dfr(cities, function(cty) fetch_current(cty))
forecast_df <- purrr::map_dfr(cities, function(cty) fetch_forecast(cty))

current_path <- file.path(output_dir, "current_weather_by_city.csv")
forecast_path <- file.path(output_dir, "cities_weather_forecast.csv")

if (nrow(current_df) > 0) {
  readr::write_csv(current_df, current_path)
  log("Saved current weather:", current_path, "rows:", nrow(current_df))
} else {
  # Write headers so downstream steps don't fail
  readr::write_csv(tibble(city = character(), dt = as_datetime(numeric()), weather_main = character(), weather_desc = character(), temp = numeric(), temp_min = numeric(), temp_max = numeric(), pressure = numeric(), humidity = numeric(), wind_speed = numeric(), wind_deg = numeric(), visibility = numeric(), clouds = numeric()), current_path)
  log("WARNING: No current weather rows saved (likely API issue). Wrote empty CSV with headers:", current_path)
}

if (nrow(forecast_df) > 0) {
  readr::write_csv(forecast_df, forecast_path)
  log("Saved forecast:", forecast_path, "rows:", nrow(forecast_df))
} else {
  # Write headers so downstream steps don't fail
  readr::write_csv(tibble(city = character(), forecast_dt = as_datetime(numeric()), weather_main = character(), weather_desc = character(), temp = numeric(), temp_min = numeric(), temp_max = numeric(), pressure = numeric(), humidity = numeric(), wind_speed = numeric(), wind_deg = numeric(), clouds = numeric()), forecast_path)
  log("WARNING: No forecast rows saved (likely API issue). Wrote empty CSV with headers:", forecast_path)
}

log("Completed weather data download.")