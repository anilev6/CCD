# Custom `cd` command

Navigate through folders in the terminal without specifying the folder's name using the new `ccd` command.

## What is it

Often, our projects have a complicated folder structure, resembling fractals like `Project\Project\project1\Project`. Additionally, occasionally, we must navigate up or down one or multiple folders in the terminal. Using `cd ...` requires specifying the path, which can be time-consuming, especially when needing to list with `ls .` and then copy-pasting a long target folder name (that may closely resemble the current folder's name) or manually typing the target folder name into `cd ...`.

Enter the `ccd` command, which:

- Zero Folders: If no subdirectories exist in the current directory, it displays the message "No directories to navigate into." and retains the current directory.

- One folder: It navigates into it.

- More than one Folder:
    1. Checks for a subdirectory with the exact same name as the current directory.
    2. If such a directory is found, it navigates into it.
    3. If there's no exact match, it then searches for a directory containing the current directory's name as a substring. If found, it navigates into that directory.
    4. If no matching directory (either exact or similar) is found, it displays `"Couldn't find a matching directory. Not navigating automatically."` and stays in the current directory.

Therefore, no path input is required; simply use `ccd`.

Feel free to customize this script to navigate folders based on different rules. But first, ensure you install it correctly.

## Global Installation

I assume you have both CMD and PowerShell on your Windows.

For PowerShell:

  - Navigate to System Properties -> Advanced -> Environment Variables -> PATH.
  - Click on Edit... -> New.
  - Add the path `C:\where\you\downloaded\this\folder\CCD`.
  - Click on OK twice.

For CMD:

  - Edit ccd.bat : replace `C:\CCD\ccd.ps1` with `C:\where\you\downloaded\this\folder\CCD\ccd.ps1`.

I recommend completing both steps. Alternatively, just put the scripts into one of the already existing `PATH` folders.

Once done, relaunch your terminals and test the ccd command.

Please share your feedback!
