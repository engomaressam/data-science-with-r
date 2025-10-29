#!/usr/bin/env Rscript

# Ensure required packages
ensure_packages <- function(pkgs) {
  to_install <- setdiff(pkgs, rownames(installed.packages()))
  if (length(to_install) > 0) install.packages(to_install, repos = "https://cloud.r-project.org")
  invisible(lapply(pkgs, require, character.only = TRUE))
}

ensure_packages(c("rvest", "dplyr", "stringr", "readr", "purrr"))

output_dir <- file.path("project5-capstone", "output")
log_dir <- file.path(output_dir, "run_logs")
if (!dir.exists(log_dir)) dir.create(log_dir, recursive = TRUE)
log_file <- file.path(log_dir, "data_collection_webscrape.log")

log <- function(...) {
  msg <- paste(...)
  cat(format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "-", msg, "\n", file = log_file, append = TRUE)
  message(msg)
}

log("Starting Wikipedia webscrape for bike sharing systems")

url <- "https://en.wikipedia.org/wiki/List_of_bicycle-sharing_systems"

page <- tryCatch(read_html(url), error = function(e) {
  log("ERROR: Failed to read page - ", conditionMessage(e))
  stop(e)
})

tables <- tryCatch(html_table(page, fill = TRUE), error = function(e) {
  log("ERROR: Failed to parse HTML tables - ", conditionMessage(e))
  stop(e)
})

df <- dplyr::bind_rows(tables)

# Normalize column names
df <- df |> dplyr::rename_with(~ stringr::str_replace_all(tolower(.x), "[^a-z0-9]+", "_"))

# Add metadata
df <- df |> dplyr::mutate(source_url = url, scrape_time = as.character(Sys.time()))

out_csv <- file.path(output_dir, "bike_sharing_systems.csv")

readr::write_csv(df, out_csv)
log("Saved ", nrow(df), " rows to ", out_csv)

log("Webscrape completed successfully")

