@echo off
set dev=..\skin.embuary
set target=skin.embuary
set htpc=\\NUCFRED\Kodi\portable_data\addons\skin.embuary
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