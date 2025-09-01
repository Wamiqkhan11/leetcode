@echo off
setlocal enabledelayedexpansion

:: Loop through each folder in the current directory
for /d %%F in (*) do (
    if not exist "%%F\README.md" (
        type nul > "%%F\README.md"
        echo Created blank README.md in folder %%F
    ) else (
        echo README.md already exists in folder %%F
    )
)

echo Done!
pause
