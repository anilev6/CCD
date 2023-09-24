function Move-To-NextDir {
    $current_dir_name = Split-Path -Leaf (Get-Location)

    # Write-Host "Current Directory: $current_dir_name" # Debug output
    
    # Get all subdirectories
    $dirs = Get-ChildItem -Directory
    
    # Write-Host "Number of Directories Found: $($dirs.Count)" # Debug output
    
    switch ($dirs.Count) {
        0 {
            Write-Host "No directories to navigate into."
        }

        1 {
            $targetDir = ($dirs | Select-Object -First 1).FullName
            # Write-Host "Attempting to navigate to: $targetDir" # Debug output
            Set-Location -Path $targetDir
            Write-Output $targetDir
        }

        default {
            # Write-Host "Multiple directories found. Searching for a match..."
            # Try to find an exact match based on the current directory name
            $exactMatch = ($dirs | Where-Object { $_.Name -eq $current_dir_name } | Select-Object -First 1).FullName

            if ($exactMatch) {
                Set-Location -Path $exactMatch
                Write-Output $exactMatch
            } else {
                # Try to find a similar directory
                $similarMatch = ($dirs | Where-Object { $_.Name -like "*$current_dir_name*" } | Select-Object -First 1).FullName

                if ($similarMatch) {
                    Set-Location -Path $similarMatch
                    Write-Output $similarMatch
                } else {
                    Write-Host "Couldn't find a matching directory. Not navigating automatically."
                }
            }
        }
    }
}

Move-To-NextDir

