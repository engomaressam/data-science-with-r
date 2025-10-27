# Census Data Dashboard - Shiny Application

## Project Overview
This is a Shiny dashboard application that explores census data to help identify demographics for targeted advertising. The application allows users to filter data by country and visualize various demographic information through interactive plots.

## Files Structure
- `ui.R` - User interface definition
- `server.R` - Server logic for data processing and plot generation
- `adult.csv` - Census dataset
- `run_app.R` - Script to run the application

## How to Run the Application

### Prerequisites
- R (version 4.0 or higher)
- Required R packages: shiny, tidyverse, ggplot2

### Installation
1. Install required packages in R:
```r
install.packages(c("shiny", "tidyverse", "ggplot2"))
```

### Running the App
1. Open R or RStudio
2. Set working directory to the project folder:
```r
setwd("path/to/project3-shiny-dashboard")
```
3. Run the application:
```r
library(shiny)
runApp()
```

Alternatively, run the provided script:
```r
source("run_app.R")
```

## Application Features

### Task 1: Application Title
- Added "Census Data Dashboard" as the main title

### Task 2: Country Selection
- Dropdown menu to select different countries
- Default selection: United-States
- Includes all countries from the dataset

### Task 3: Continuous Variables Control
- Radio buttons to select continuous variables (Age, Hours per Week)
- Radio buttons to select graph type (Histogram, Boxplot)
- Interactive plotting on the right panel

### Task 4: Categorical Variables Control
- Radio buttons to select categorical variables (Education, Workclass, Sex)
- Radio buttons to select chart type (Faceted Bar Chart, Stacked Bar Chart)
- Interactive plotting on the right panel

### Task 5: Server Logic for Continuous Variables
- **Task 5.1**: Boxplot of Age variable
- **Task 5.2**: Histogram of Hours per Week variable
- Both plots are faceted by income prediction (<=50K, >50K)

### Task 6: Server Logic for Categorical Variables
- **Task 6.1**: Faceted bar chart for Workclass variable
- **Task 6.2**: Stacked bar chart for Education variable
- Charts show distribution across income levels

## Required Screenshots for Submission

### Task 1 Screenshot (task1.png)
- Screenshot of just the title panel

### Task 2 Screenshot (task2.png)
- Screenshot of the country selection dropdown (click to show all countries)

### Task 3 Screenshot (task3.png)
- Screenshot of the continuous variables control panel with radio buttons

### Task 4 Screenshot (task4.png)
- Screenshot of the categorical variables control panel with radio buttons

### Task 5.1 Screenshot (task5_1.png)
- Screenshot of entire second fluid row with "Age" and "Boxplot" selected
- Must include both radio buttons and the resulting boxplot

### Task 5.2 Screenshot (task5_2.png)
- Screenshot of entire second fluid row with "Hours per Week" and "Histogram" selected
- Must include both radio buttons and the resulting histogram

### Task 6.1 Screenshot (task6_1.png)
- Screenshot of entire third fluid row with "Workclass" and "Faceted Bar Chart" selected
- Must include radio buttons and the resulting faceted bar chart

### Task 6.2 Screenshot (task6_2.png)
- Screenshot of entire third fluid row with "Education" and "Stacked Bar Chart" selected
- Must include radio buttons and the resulting stacked bar chart

### Task 7 Screenshot (task7.png)
- Screenshot of the entire dashboard with a country other than "United-States" selected

## Data Description
The dataset contains census information with the following key variables:
- **AGE**: Age of individuals
- **HOURS_PER_WEEK**: Hours worked per week
- **EDUCATION**: Education level
- **WORKCLASS**: Type of work class
- **SEX**: Gender
- **NATIVE_COUNTRY**: Country of origin
- **PREDICTION**: Income level (<=50K or >50K)

## Troubleshooting
1. If plots don't appear, check that all required packages are installed
2. Ensure the adult.csv file is in the same directory as ui.R and server.R
3. If the app doesn't start, check the R console for error messages

## Notes
- The application filters data based on the selected country
- All plots are responsive to user input selections
- The interface uses Bootstrap styling for a clean, professional appearance