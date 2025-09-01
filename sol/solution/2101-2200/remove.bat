@echo off
setlocal enabledelayedexpansion

:: Loop through all subfolders in the current directory
for /r %%F in (README.md) do (
    if exist "%%F" (
        del /q "%%F"
        echo Deleted %%F
    )
)

echo All README.md files removed!
pause
