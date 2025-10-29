#!/usr/bin/env Rscript

# Ensure required packages
ensure_packages <- function(pkgs) {
  to_install <- setdiff(pkgs, rownames(installed.packages()))
  if (length(to_install) > 0) install.packages(to_install, repos = "https://cloud.r-project.org")
  invisible(lapply(pkgs, require, character.only = TRUE))
}

ensure_packages(c("readr"))

data_dir <- file.path("project5-capstone", "data")
output_dir <- file.path("project5-capstone", "output")
log_dir <- file.path(output_dir, "run_logs")
if (!dir.exists(data_dir)) dir.create(data_dir, recursive = TRUE)
if (!dir.exists(log_dir)) dir.create(log_dir, recursive = TRUE)
log_file <- file.path(log_dir, "data_collection_downloads.log")

log <- function(...) {
  msg <- paste(...)
  cat(format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "-", msg, "\n", file = log_file, append = TRUE)
  message(msg)
}

urls <- list(
  raw_worldcities = "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_worldcities.csv",
  raw_seoul_bike_sharing = "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0321EN-SkillsNetwork/labs/datasets/raw_seoul_bike_sharing.csv"
)

for (name in names(urls)) {
  dest <- file.path(data_dir, paste0(name, ".csv"))
  tryCatch({
    download.file(urls[[name]], destfile = dest, mode = "wb")
    log("Downloaded ", name, " to ", dest)
  }, error = function(e) {
    log("ERROR: Failed to download ", name, " - ", conditionMessage(e))
  })
}

log("Downloads completed")