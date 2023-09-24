# Custom `cd` command
#### Enter folders in terminal without specifying folder's name using new `ccd` command.

## What is it

Often times, our projects have very complicated folder structure, that involves 'fractals' like `Project\Project\project1\project`. On top of that, from time to time, must travel in terminal up one folder, down one folder, maybe couple of folders in a row. Using `cd ...` reqires path, and it consumes time to `ls .` and then copy-paste into `cd ...` a gigantic folder name, that is incredibly similar to the current folder name, or even type target folder name into `cd ...`. 

I introduce `ccd` command, that:

- Zero Folders: If there are no subdirectories in the current directory, it outputs the message "No directories to navigate into." and doesn't change the current directory.
  
- One folder: enters it
  
- More than one Folder:
    1. It first checks for a subdirectory that has the exact same name as the current directory.
    2. If such a directory is found, it navigates into it.
    3. If there's no exact match, it then looks for a directory whose name contains the name of the current directory as a substring. If such a directory is found, it navigates into it.
    4. If no matching directory (either exact or similar) is found, it outputs "Couldn't find a matching directory. Not navigating automatically." and stays in the current directory.

And therefore, no path input required, just `ccd`.

You are welcome to customize this script to enter folders with respect to different rules. But put and install in correctly first.

## Installation globally 

I assume you have both CMD and PowerShell on your Windows.

PowerShell: Go to System Properties -> Advanced -> Environment Variables -> PATH -> Edit... -> New -> `C:\wherewher\you\downloaded\this\folder\CCD` -> ok -> ok .

CMD: Edit `ccd.bat`. Instead of `C:\CCD\ccd.ps1` type `C:\wherewher\you\downloaded\this\folder\CCD\ccd.ps1`

I recommend doing both steps. 

After that, you are ready to relaunch the terminals, and try applying the command. 

Leave feedback!
