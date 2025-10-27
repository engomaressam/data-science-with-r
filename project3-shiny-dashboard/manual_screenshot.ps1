# PowerShell script to capture screenshots
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Take-Screenshot {
    param([string])
    
    # Get screen bounds
     = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    
    # Create bitmap
     = New-Object System.Drawing.Bitmap .Width, .Height
    
    # Create graphics object
     = [System.Drawing.Graphics]::FromImage()
    
    # Copy screen to bitmap
    .CopyFromScreen(.X, .Y, 0, 0, .Size)
    
    # Save bitmap
    .Save(, [System.Drawing.Imaging.ImageFormat]::Png)
    
    # Cleanup
    .Dispose()
    .Dispose()
    
    Write-Host "Screenshot saved to: "
}

# Take screenshots for all tasks
Write-Host "Please manually navigate to each section and press Enter to capture each screenshot:"

Write-Host "Task 1: Title panel - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task1.png"

Write-Host "Task 2: Country dropdown - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task2.png"

Write-Host "Task 3: Continuous variables panel - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task3.png"

Write-Host "Task 4: Categorical variables panel - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task4.png"

Write-Host "Task 5: Age boxplot - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task5.png"

Write-Host "Task 6: Hours per week histogram - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task6.png"

Write-Host "Task 7: Workclass bar chart - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task7.png"

Write-Host "Task 8: Education bar chart - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task8.png"

Write-Host "Task 9: Final dashboard with Canada selected - Press Enter when ready"
Read-Host
Take-Screenshot "screenshots\task9.png"

Write-Host "All screenshots captured!"
