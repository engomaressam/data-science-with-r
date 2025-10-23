# How to Add R to Jupyter Notebook Kernel Selection

## Overview
This guide explains how to add R as a kernel option in Jupyter notebooks within your IDE.

## Prerequisites
- R installed on your system (✓ R 4.5.1 is installed)
- Python with Jupyter installed (✓ Jupyter is installed)
- IRkernel R package (✓ Installed)

## Setup Steps Completed

### 1. R Installation Verification
- ✅ R 4.5.1 is installed at: `C:\Program Files\R\R-4.5.1\bin\R.exe`
- ✅ R is accessible via command line

### 2. IRkernel Package Installation
- ✅ IRkernel package installed in R
- ✅ Required dependencies installed

### 3. Manual Kernel Registration
Since the automatic registration failed due to PATH issues, we manually created the kernel specification:

- ✅ Created kernel directory: `C:\Users\Diaa\AppData\Roaming\jupyter\kernels\ir`
- ✅ Created kernel.json configuration file
- ✅ Kernel specification properly formatted without BOM encoding

### 4. Kernel Configuration
The kernel.json file contains:
```json
{
  "argv": [
    "C:\\Program Files\\R\\R-4.5.1\\bin\\R.exe",
    "--slave",
    "-e",
    "IRkernel::main()",
    "--args",
    "{connection_file}"
  ],
  "display_name": "R",
  "language": "R"
}
```

## Verification
- ✅ R kernel successfully registered with Jupyter
- ✅ Notebook execution with R kernel confirmed working
- ✅ R code execution verified (with expected R-specific errors in the test notebook)

## How to Use
1. **In Jupyter Notebook**: When creating a new notebook, you should now see "R" as an option in the kernel selection dropdown
2. **In JupyterLab**: The R kernel will appear in the launcher under "Notebook" section
3. **In your IDE**: Look for "R" in the kernel selection when creating or changing notebook kernels

## Troubleshooting
If the R kernel doesn't appear:
1. Restart your Jupyter server/IDE
2. Check that the kernel.json file exists at: `C:\Users\Diaa\AppData\Roaming\jupyter\kernels\ir\kernel.json`
3. Verify R installation path in the kernel.json file
4. Ensure IRkernel package is installed in R

## Files Created
- `setup_r_kernel.ps1` - PowerShell script for manual kernel setup
- `install_irkernel.R` - R script for IRkernel installation
- `R_Kernel_Setup_Instructions.md` - This documentation

## Success Confirmation
The R kernel is now successfully installed and functional. You can create R notebooks and execute R code within Jupyter notebooks in your IDE.