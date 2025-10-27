# PowerShell script to capture all screenshots
Write-Host "Starting screenshot capture process..."

# Create screenshots directory if it doesn't exist
if (!(Test-Path "screenshots")) {
    New-Item -ItemType Directory -Path "screenshots"
}

Write-Host "Screenshots will be saved to the screenshots folder"
Write-Host "Process completed - please use Puppeteer tool to capture the screenshots"
