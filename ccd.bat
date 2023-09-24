@echo off
FOR /F "tokens=*" %%i IN ('powershell.exe -ExecutionPolicy Bypass -NoProfile -File "C:\scripts\ccd.ps1" ') DO SET newdir=%%i

if exist "%newdir%\" (
    cd "%newdir%"
) 
