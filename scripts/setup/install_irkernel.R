# Install IRkernel for Jupyter notebook support
# This script registers the R kernel with Jupyter

# Load the IRkernel library
library(IRkernel)

# Set the PATH to include Python Scripts directory temporarily
current_path <- Sys.getenv("PATH")
python_path <- system("where python", intern = TRUE)
if (length(python_path) > 0) {
  python_dir <- dirname(python_path[1])
  scripts_dir <- file.path(python_dir, "Scripts")
  new_path <- paste(scripts_dir, current_path, sep = ";")
  Sys.setenv(PATH = new_path)
}

# Try to register the R kernel with Jupyter
tryCatch({
  IRkernel::installspec(user = TRUE, name = 'ir', displayname = 'R')
  cat("IRkernel registration completed successfully!\n")
  cat("R kernel should now be available in Jupyter notebooks.\n")
}, error = function(e) {
  cat("Error during registration:", e$message, "\n")
  cat("Manual registration may be required.\n")
})