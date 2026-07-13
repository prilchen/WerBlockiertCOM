@echo off
:: Prüfen ob Admin-Rechte vorhanden sind
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :run
) else (
    echo Fordere Administratorrechte an...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs" >nul 2>&1
    exit /B
)

:run
cd /d "%~dp0"
echo ==============================================================
echo COM-Port Analyse: Suche nach blockierenden Programmen...
echo ==============================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0WerBlockiertCOM.ps1"

echo.
echo ==============================================================
pause
