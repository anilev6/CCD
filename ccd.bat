@echo off
FOR /F "tokens=*" %%i IN ('powershell.exe -ExecutionPolicy Bypass -NoProfile -File "C:\scripts\ccd.ps1" ') DO SET newdir=%%i
echo Navigating to: %newdir%
cd "%newdir%"
