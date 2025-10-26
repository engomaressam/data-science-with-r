# Install required R packages for weather analysis
print("Installing required R packages...")

# Set CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# List of required packages
packages <- c("tidyverse", "tidymodels", "ggplot2", "dplyr", "readr")

# Install packages if not already installed
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    print(paste("Installing package:", pkg))
    install.packages(pkg, dependencies = TRUE)
  } else {
    print(paste("Package already installed:", pkg))
  }
}

print("Package installation complete!")

# Test loading packages
print("Testing package loading...")
library(tidyverse)
library(tidymodels)
library(ggplot2)

print("All packages loaded successfully!")