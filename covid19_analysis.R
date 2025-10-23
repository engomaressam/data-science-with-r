# COVID-19 Data Analysis Project
# Analysis of Global COVID-19 Pandemic Data
# Author: Data Science Student
# Date: October 2025

# Load required libraries
cat("Loading required libraries...\n")
library(httr)
library(rvest)

# Define the preprocessing function
preprocess_covid_data_frame <- function(data_frame) {
  shape <- dim(data_frame)
  
  # Remove the first row which contains column names
  data_frame <- data_frame[-1, ]
  
  # Update column names
  names(data_frame) <- c("country", "tested", "confirmed", "confirmed.tested.ratio", "tested.population.ratio", "confirmed.population.ratio")
  
  # Convert columns to appropriate types
  data_frame$tested <- as.numeric(gsub(",", "", data_frame$tested))
  data_frame$confirmed <- as.numeric(gsub(",", "", data_frame$confirmed))
  data_frame$confirmed.tested.ratio <- as.numeric(data_frame$confirmed.tested.ratio)
  data_frame$tested.population.ratio <- as.numeric(data_frame$tested.population.ratio)
  data_frame$confirmed.population.ratio <- as.numeric(data_frame$confirmed.population.ratio)
  
  return(data_frame)
}

cat("=== COVID-19 Data Analysis Project ===\n\n")

# Task 1: Get COVID-19 Wiki page
cat("Task 1: Getting COVID-19 Wiki page...\n")
get_wiki_covid19_page <- function() {
  wiki_url <- "https://en.wikipedia.org/w/index.php"
  response <- GET(wiki_url, query = list(
    title = "Template:COVID-19_testing_by_country",
    action = "render"
  ))
  return(response)
}

# Execute Task 1
wiki_page_data <- get_wiki_covid19_page()
cat("✓ Successfully retrieved COVID-19 Wiki page\n")
cat("Response status:", status_code(wiki_page_data), "\n")
cat("Content type:", headers(wiki_page_data)$`content-type`, "\n\n")

# Task 2: Extract COVID-19 testing data table
cat("Task 2: Extracting COVID-19 testing data table...\n")
root_node <- read_html(content(wiki_page_data, "text"))
table_node <- html_nodes(root_node, "table")[[2]]  # Get the second table
covid_data_frame_raw <- html_table(table_node, fill = TRUE)
cat("✓ Successfully extracted data table\n")
cat("Raw data dimensions:", dim(covid_data_frame_raw), "\n")
cat("Column names:", names(covid_data_frame_raw), "\n\n")

# Task 3: Preprocess the data frame and export to CSV
cat("Task 3: Preprocessing data and exporting to CSV...\n")
covid_data_frame_all <- preprocess_covid_data_frame(covid_data_frame_raw)
write.csv(covid_data_frame_all, "covid.csv", row.names = FALSE)
covid_data_frame_csv <- read.csv("covid.csv")
cat("✓ Data preprocessed and exported to covid.csv\n")
cat("Processed data dimensions:", dim(covid_data_frame_csv), "\n")
cat("First few rows:\n")
print(head(covid_data_frame_csv, 3))
cat("\n")

# Task 4: Subset the data frame
cat("Task 4: Subsetting data (rows 5-10, country and confirmed columns)...\n")
subset_data <- covid_data_frame_csv[5:10, c("country", "confirmed")]
cat("✓ Data subset created\n")
print(subset_data)
cat("\n")

# Task 5: Calculate worldwide COVID testing positive ratio
cat("Task 5: Calculating worldwide COVID testing positive ratio...\n")
total_confirmed <- sum(covid_data_frame_csv$confirmed, na.rm = TRUE)
total_tested <- sum(covid_data_frame_csv$tested, na.rm = TRUE)
positive_ratio <- total_confirmed / total_tested
cat("✓ Worldwide positive ratio calculated\n")
cat("Total confirmed cases:", format(total_confirmed, big.mark = ","), "\n")
cat("Total tested cases:", format(total_tested, big.mark = ","), "\n")
cat("Worldwide positive ratio:", round(positive_ratio, 4), "\n\n")

# Task 6: Get list of countries and sort them
cat("Task 6: Getting and sorting country list...\n")
countries_list <- as.character(covid_data_frame_csv$country)
countries_ascending <- sort(countries_list)
countries_descending <- sort(countries_list, decreasing = TRUE)
cat("✓ Country lists created\n")
cat("Total number of countries:", length(countries_list), "\n")
cat("First 5 countries (A-Z):", paste(countries_ascending[1:5], collapse = ", "), "\n")
cat("First 5 countries (Z-A):", paste(countries_descending[1:5], collapse = ", "), "\n\n")

# Task 7: Find countries starting with "United"
cat("Task 7: Finding countries starting with 'United'...\n")
united_countries_indices <- grep("^United", covid_data_frame_csv$country)
united_countries <- covid_data_frame_csv$country[united_countries_indices]
cat("✓ Countries starting with 'United' found\n")
cat("Countries starting with 'United':", paste(united_countries, collapse = ", "), "\n")
cat("Number of such countries:", length(united_countries), "\n\n")

# Task 8: Select specific countries for analysis
cat("Task 8: Selecting United States and Germany for detailed analysis...\n")
selected_countries <- c("United States", "Germany")
selected_data <- covid_data_frame_csv[covid_data_frame_csv$country %in% selected_countries, 
                                      c("country", "confirmed", "confirmed.population.ratio")]
cat("✓ Selected countries data extracted\n")
print(selected_data)
cat("\n")

# Task 9: Compare confirmed-to-population ratios
cat("Task 9: Comparing confirmed-to-population ratios...\n")
us_ratio <- selected_data[selected_data$country == "United States", "confirmed.population.ratio"]
germany_ratio <- selected_data[selected_data$country == "Germany", "confirmed.population.ratio"]

if (length(us_ratio) > 0 && length(germany_ratio) > 0) {
  if (us_ratio > germany_ratio) {
    cat("✓ United States has a higher confirmed-to-population ratio than Germany\n")
    cat("United States ratio:", us_ratio, "\n")
    cat("Germany ratio:", germany_ratio, "\n")
  } else {
    cat("✓ Germany has a higher confirmed-to-population ratio than United States\n")
    cat("Germany ratio:", germany_ratio, "\n")
    cat("United States ratio:", us_ratio, "\n")
  }
} else {
  cat("⚠ Could not find data for one or both countries\n")
}
cat("\n")

# Task 10: Filter countries with low confirmed-to-population ratio
cat("Task 10: Filtering countries with confirmed-to-population ratio < 1%...\n")
threshold <- 0.01  # 1%
low_ratio_countries <- covid_data_frame_csv[covid_data_frame_csv$confirmed.population.ratio < threshold & 
                                            !is.na(covid_data_frame_csv$confirmed.population.ratio), ]
cat("✓ Low-risk countries identified\n")
cat("Number of countries with ratio < 1%:", nrow(low_ratio_countries), "\n")
cat("Countries with low confirmed-to-population ratio:\n")
print(low_ratio_countries[, c("country", "confirmed.population.ratio")])

cat("\n=== Analysis Complete ===\n")
cat("All 10 tasks have been successfully completed!\n")
cat("Data saved to: covid.csv\n")
cat("Total countries analyzed:", nrow(covid_data_frame_csv), "\n")