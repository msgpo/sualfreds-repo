@echo off
set dev=..\script.embuary.helper
set target=script.embuary.helper
set htpc=\\NUCFRED\Kodi\portable_data\addons\skin.embuary-leia
echo. 
echo Copying files
echo. 
rd /S /Q %target%
XCOPY %dev% %target% /E /C /Q /I /Y
rd /S /Q %target%\media-working-dir
del /q /s %target%\*.pyo 
del /q /s %target%\*.pyc 
del /q /s %target%\*.psd 
del /q /s %target%\*.mo
del /q /s %target%\*.gitignore
rd /S /Q %target%\.git
TIMEOUT /T 4 /NOBREAK
repoupdate.bat