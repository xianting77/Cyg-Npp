@echo off
echo delete this line
if exist "%PROGRAMFILES(X86)%" (set bit=64) else (set bit=32)
cd "%~dp1">nul

dir | "%~dp0find%bit%.exe" "Makefile" > nul
if %ERRORLEVEL% == 0 goto oui
dir | "%~dp0find%bit%.exe" "*.cbp" > nul
if %ERRORLEVEL% == 0 goto oui_2
exit /B 0
:oui
exit /B 1
:oui_2
exit /B 2
