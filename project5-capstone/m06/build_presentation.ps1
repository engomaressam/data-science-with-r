<#
Build the AI-grading Beamer presentation for the capstone.

Usage:
  Windows PowerShell:
    cd $PSScriptRoot
    ./build_presentation.ps1

This script locates Rscript and renders
`capstone_presentation_ai_grading.Rmd` to PDF.
#>

param(
  [string]$Rmd = "capstone_presentation_ai_grading.Rmd"
)

Write-Host "[build] Rendering $Rmd..." -ForegroundColor Cyan

# Try to find Rscript on PATH first
$rscriptCmd = Get-Command Rscript.exe -ErrorAction SilentlyContinue
if (-not $rscriptCmd) {
  # Fallback to common install location
  $fallback = "C:\Program Files\R\R-4.5.1\bin\Rscript.exe"
  if (Test-Path $fallback) {
    $rscriptCmd = $fallback
  } else {
    Write-Error "Rscript.exe not found. Please install R or add it to PATH."
    exit 1
  }
} else {
  $rscriptCmd = $rscriptCmd.Path
}

Write-Host "[build] Using Rscript: $rscriptCmd" -ForegroundColor Green

& $rscriptCmd -e "pkgs <- c('rmarkdown','tidyverse','lubridate','ggplot2','sqldf','knitr','viridis'); to_install <- setdiff(pkgs, rownames(installed.packages())); if(length(to_install)>0) install.packages(to_install, repos='https://cloud.r-project.org'); rmarkdown::render('$Rmd', output_format='beamer_presentation')"

if ($LASTEXITCODE -eq 0) {
  Write-Host "[build] Done. Open: $PSScriptRoot\\capstone_presentation_ai_grading.pdf" -ForegroundColor Green
} else {
  Write-Error "[build] Render failed. Check R output/logs."
}