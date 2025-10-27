# Syntax verification script for Shiny application
# This script checks if the ui.R and server.R files have correct syntax

cat("Checking syntax of ui.R and server.R files...\n")

# Check if files exist
if (!file.exists("ui.R")) {
  stop("ui.R file not found!")
}

if (!file.exists("server.R")) {
  stop("server.R file not found!")
}

if (!file.exists("adult.csv")) {
  stop("adult.csv file not found!")
}

# Try to parse the files
tryCatch({
  parse("ui.R")
  cat("✓ ui.R syntax is valid\n")
}, error = function(e) {
  cat("✗ ui.R syntax error:", e$message, "\n")
})

tryCatch({
  parse("server.R")
  cat("✓ server.R syntax is valid\n")
}, error = function(e) {
  cat("✗ server.R syntax error:", e$message, "\n")
})

# Check if required packages can be loaded (if available)
required_packages <- c("shiny", "tidyverse", "ggplot2")

for (pkg in required_packages) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat("✓", pkg, "package is available\n")
  } else {
    cat("⚠", pkg, "package is not installed\n")
  }
}

cat("\nSyntax verification complete!\n")
cat("To run the application, use: runApp() in R\n")