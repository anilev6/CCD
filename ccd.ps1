# function Move-To-NextDir {
#     $current_dir_name = Split-Path -Leaf (Get-Location)
    
#     # Get all subdirectories
#     $dirs = Get-ChildItem -Directory
    
#     switch ($dirs.Count) {
#         0 {
#             Write-Output "No directories to navigate into."
#         }
#         1 {
#             Set-Location -Path $dirs.FullName
#         }
#         default {
#             # Try to find an exact match based on the current directory name
#             $exactMatch = $dirs | Where-Object { $_.Name -eq $current_dir_name }
            
#             if ($exactMatch) {
#                 Set-Location -Path $exactMatch.FullName
#             } else {
#                 # Try to find a similar directory
#                 $similarMatch = $dirs | Where-Object { $_.Name -like "*$current_dir_name*" } | Select-Object -First 1
                
#                 if ($similarMatch) {
#                     Set-Location -Path $similarMatch.FullName
#                 } else {
#                     Write-Output "Couldn't find a matching directory. Not navigating automatically."
#                 }
#             }
#         }
#     }
# }

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
                return $exactMatch.FullName  # <- This one is redundant
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
    # Write-Output "Debug: path is $path"
}
