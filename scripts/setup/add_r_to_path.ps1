# PowerShell script to add R to system PATH environment variable
# Run as Administrator

Write-Host "Adding R to system PATH environment variable..." -ForegroundColor Green

# Define R installation path
$RPath = "C:\Program Files\R\R-4.5.1\bin\x64"

# Check if R path exists
if (Test-Path $RPath) {
    Write-Host "R installation found at: $RPath" -ForegroundColor Green
    
    # Get current system PATH
    $currentPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
    
    # Check if R is already in PATH
    if ($currentPath -split ";" -contains $RPath) {
        Write-Host "R is already in the system PATH!" -ForegroundColor Yellow
    } else {
        # Add R to system PATH
        $newPath = $currentPath + ";" + $RPath
        [Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")
        Write-Host "R has been added to the system PATH!" -ForegroundColor Green
        Write-Host "Please restart your terminal or PowerShell session for changes to take effect." -ForegroundColor Cyan
    }
    
    # Also add to current session PATH for immediate use
    $env:PATH += ";$RPath"
    Write-Host "R has been added to current session PATH for immediate use." -ForegroundColor Green
    
} else {
    Write-Host "Error: R installation not found at $RPath" -ForegroundColor Red
    Write-Host "Please verify the R installation path." -ForegroundColor Red
}

Write-Host "`nTesting R accessibility..." -ForegroundColor Cyan
try {
    & "R" --version
    Write-Host "R is now accessible!" -ForegroundColor Green
} catch {
    Write-Host "R is not yet accessible. You may need to restart your terminal." -ForegroundColor Yellow
}