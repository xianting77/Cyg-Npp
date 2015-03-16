@echo off
echo delete this line

if exist "%PROGRAMFILES(X86)%" (set bit=64) else (set bit=32)


ver | "%~dp0find%bit%.exe" "6.2" > nul
if %ERRORLEVEL%%bit%.exe == 0 goto w8
ver | "%~dp0find%bit%.exe" "6.3" > nul
if %ERRORLEVEL% == 0 goto w8
ver | "%~dp0find%bit%.exe" "6.4" > nul
if %ERRORLEVEL% == 0 goto w8
exit /B 0
:w8
exit /B 1