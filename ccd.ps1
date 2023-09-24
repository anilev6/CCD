# Move-To-NextDir
function Move-To-NextDir {
    $current_dir_name = Split-Path -Leaf (Get-Location)
    
    # Get all subdirectories
    $dirs = Get-ChildItem -Directory
    
    switch ($dirs.Count) {
        0 {
            Write-Host "No directories to navigate into."
            return $false
        }
        1 {
            return ($dirs | Select-Object -First 1).FullName
        }

        default {
            # Try to find an exact match based on the current directory name
            $exactMatch = ($dirs | Where-Object { $_.Name -eq $current_dir_name } | Select-Object -First 1).FullName

            if ($exactMatch) {
                return $exactMatch.FullName  
            } else {
                # Try to find a similar directory
                $similarMatch = ($dirs | Where-Object { $_.Name -like "*$current_dir_name*" } | Select-Object -First 1).FullName

                if ($similarMatch) {
                    return $similarMatch.FullName
                } else {
                    Write-Host "Couldn't find a matching directory. Not navigating automatically."
                    return $false
                }
            }
        }
    }
}

$path = Move-To-NextDir
if ($path) {
    Set-Location -Path $path
}
