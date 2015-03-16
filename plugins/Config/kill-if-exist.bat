@echo off
echo delete this line


if exist "%PROGRAMFILES(X86)%" (set bit=64) else (set bit=32)

tasklist /FI "IMAGENAME eq %1" 2>NUL | "%~dp0find%bit%.exe" "%1">NUL
if "%ERRORLEVEL%"=="0" goto kill

exit /B 0
:kill
taskkill /im "%1" /f >nul
exit /B 1