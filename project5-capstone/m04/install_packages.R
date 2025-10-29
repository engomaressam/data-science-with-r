# Install required packages for refined linear regression models

cat("Installing required packages...\n")

# List of required packages
packages <- c("glmnet", "patchwork")

# Install packages if not already installed
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    cat(sprintf("Installing %s...\n", pkg))
    install.packages(pkg, repos = "https://cran.r-project.org/")
    library(pkg, character.only = TRUE)
  } else {
    cat(sprintf("%s is already installed.\n", pkg))
  }
}

cat("All required packages are installed!\n")