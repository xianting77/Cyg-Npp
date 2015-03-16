@echo off

if exist "%PROGRAMFILES(X86)%" (set bit=64) else (set bit=32)


set C=%~dp0plugins\Dev-Cpp\bin32
ver | "%~dp0plugins\Config\find%bit%" "6.2" > nul
if %ERRORLEVEL% == 0 goto w8
ver | "%~dp0plugins\Config\find%bit%" "6.3" > nul
if %ERRORLEVEL% == 0 goto w8
ver | "%~dp0plugins\Config\find%bit%" "6.4" > nul
if %ERRORLEVEL% == 0 goto w8
goto suite
:w8
set C=%~dp0plugins\Dev-Cpp\bin64
echo Note : Le compilateur de l'EFREI est incompatible avec votre version de windows
echo Utilisation d'un autre compilateur a la place
:suite
set PATH=%C%;%~dp0plugins\Dev-Cpp\bin;%~dp0plugins\Cygwin\bin\;%PATH%
set LD=%C\ld.exe
set AWK=/bin/awk
set CYGWIN=winsymlinks:native

"%~dp0plugins\Cygwin\bin\bash.exe" --login -i -c 'exec /bin/bash.exe;' 
