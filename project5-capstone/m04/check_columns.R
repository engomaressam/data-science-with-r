# Check column names in the bike sharing dataset

library(readr)

# Load the dataset
bike_data <- read_csv("data/raw_seoul_bike_sharing.csv")

# Display column names
cat("Column names in the dataset:\n")
print(colnames(bike_data))

# Check for hour-related columns
hour_cols <- grep("hour|HOUR|Hour", colnames(bike_data), ignore.case = TRUE, value = TRUE)
cat("\nHour-related columns:\n")
print(hour_cols)

# Display first few rows to understand the structure
cat("\nFirst 5 rows:\n")
print(head(bike_data, 5))

# Check data types
cat("\nData types:\n")
print(sapply(bike_data, class))