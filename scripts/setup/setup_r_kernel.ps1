# PowerShell script to manually set up R kernel for Jupyter

# Define paths
$kernelDir = "$env:APPDATA\jupyter\kernels\ir"
$kernelJson = "$kernelDir\kernel.json"

# Create kernel directory
Write-Host "Creating kernel directory: $kernelDir"
New-Item -ItemType Directory -Path $kernelDir -Force | Out-Null

# Create kernel.json content
$kernelContent = @"
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
"@

# Write kernel.json file with proper encoding (no BOM)
Write-Host "Creating kernel.json file: $kernelJson"
[System.IO.File]::WriteAllText($kernelJson, $kernelContent, [System.Text.UTF8Encoding]::new($false))

Write-Host "R kernel has been manually registered with Jupyter!"
Write-Host "You should now see 'R' as an option when creating a new notebook."

# Verify the installation
if (Test-Path $kernelJson) {
    Write-Host "Success: Kernel specification created successfully"
    Write-Host "Location: $kernelJson"
} else {
    Write-Host "Error: Failed to create kernel specification"
}