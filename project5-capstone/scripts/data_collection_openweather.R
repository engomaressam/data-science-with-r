#!/usr/bin/env Rscript

# Ensure required packages
ensure_packages <- function(pkgs) {
  to_install <- setdiff(pkgs, rownames(installed.packages()))
  if (length(to_install) > 0) install.packages(to_install, repos = "https://cloud.r-project.org")
  invisible(lapply(pkgs, require, character.only = TRUE))
}

ensure_packages(c("httr", "jsonlite", "dplyr", "purrr", "readr"))

`%||%` <- function(x, y) if (is.null(x)) y else x

get_season <- function(dt) {
  m <- as.integer(format(dt, "%m"))
  if (m %in% c(12, 1, 2)) return("Winter")
  if (m %in% c(3, 4, 5)) return("Spring")
  if (m %in% c(6, 7, 8)) return("Summer")
  return("Autumn")
}

output_dir <- file.path("project5-capstone", "output")
log_dir <- file.path(output_dir, "run_logs")
if (!dir.exists(log_dir)) dir.create(log_dir, recursive = TRUE)
log_file <- file.path(log_dir, "data_collection_openweather.log")
out_csv <- file.path(output_dir, "cities_weather_forecast.csv")

log <- function(...) {
  msg <- paste(...)
  cat(format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "-", msg, "\n", file = log_file, append = TRUE)
  message(msg)
}

api_key <- Sys.getenv("OPENWEATHER_API_KEY", "")
if (api_key == "") {
  log("OPENWEATHER_API_KEY not set; skipping API calls. Set it and re-run.")
  readr::write_csv(dplyr::tibble(), out_csv)
  quit(status = 0)
}

cities <- c("Seoul", "Washington, D.C.", "Paris", "Suzhou")

get_city_forecast <- function(city) {
  url <- "https://api.openweathermap.org/data/2.5/forecast"
  resp <- httr::GET(url, query = list(q = city, appid = api_key, units = "metric"))
  sc <- httr::status_code(resp)
  if (sc != 200) {
    log("WARN: ", city, " request failed with status ", sc)
    return(NULL)
  }
  json <- httr::content(resp, as = "parsed")
  lst <- json$list
  dplyr::bind_rows(lapply(lst, function(x) {
    ts <- as.POSIXct(x$dt, origin = "1970-01-01", tz = "UTC")
    dplyr::tibble(
      city = city,
      forecast_datetime = ts,
      season = get_season(ts),
      weather = x$weather[[1]]$main %||% NA_character_,
      description = x$weather[[1]]$description %||% NA_character_,
      visibility = x$visibility %||% NA_real_,
      temp = x$main$temp %||% NA_real_,
      temp_min = x$main$temp_min %||% NA_real_,
      temp_max = x$main$temp_max %||% NA_real_,
      pressure = x$main$pressure %||% NA_real_,
      humidity = x$main$humidity %||% NA_real_,
      wind_speed = x$wind$speed %||% NA_real_,
      wind_deg = x$wind$deg %||% NA_real_
    )
  }))
}

df_list <- purrr::map(cities, get_city_forecast)
df <- dplyr::bind_rows(df_list)

if (nrow(df) > 0) {
  readr::write_csv(df, out_csv)
  log("Saved ", nrow(df), " rows to ", out_csv)
} else {
  readr::write_csv(df, out_csv)
  log("No rows saved (invalid/missing API key or request failure).")
}

log("OpenWeather data collection script finished")