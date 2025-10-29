# Check for missing values in the bike sharing dataset

library(readr)
library(dplyr)
library(tidyr)

# Load the dataset
bike_data <- read_csv("data/raw_seoul_bike_sharing.csv")

cat("Dataset dimensions:", dim(bike_data), "\n")
cat("Column names:\n")
print(colnames(bike_data))

cat("\nMissing values by column:\n")
missing_summary <- bike_data %>%
  summarise_all(~sum(is.na(.))) %>%
  pivot_longer(everything(), names_to = "Column", values_to = "Missing_Count") %>%
  arrange(desc(Missing_Count))

print(missing_summary)

cat("\nTotal missing values:", sum(missing_summary$Missing_Count), "\n")

# Check for any infinite values
cat("\nInfinite values by column:\n")
infinite_summary <- bike_data %>%
  select_if(is.numeric) %>%
  summarise_all(~sum(is.infinite(.))) %>%
  pivot_longer(everything(), names_to = "Column", values_to = "Infinite_Count") %>%
  arrange(desc(Infinite_Count))

print(infinite_summary)

# Show rows with missing values
if (sum(missing_summary$Missing_Count) > 0) {
  cat("\nRows with missing values:\n")
  rows_with_na <- bike_data[!complete.cases(bike_data), ]
  print(head(rows_with_na, 10))
}