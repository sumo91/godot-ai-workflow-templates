@echo off
setlocal

set "SCRIPT_DIR=%~dp0"

where pwsh >nul 2>nul
if %errorlevel%==0 (
    set "PS_EXE=pwsh"
) else (
    set "PS_EXE=powershell"
)

"%PS_EXE%" -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%install-workflow.ps1" -Interactive
set "EXIT_CODE=%ERRORLEVEL%"

echo.
if %EXIT_CODE%==0 (
    echo Installation finished.
) else (
    echo Installation failed with exit code %EXIT_CODE%.
)

echo.
pause
exit /b %EXIT_CODE%
