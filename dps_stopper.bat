@echo off
:check_srvc
timeout /t 5 /nobreak >nul
sc query "DPS" | find "STATE" | find "RUNNING" >nul
if errorlevel 1 (
    goto check_srvc
) else (
    sc stop "DPS" | find "FAILED" >nul
    if errorlevel 1 (
        echo Stopped DPS Service Successfully.
    ) else (
        echo Error, Elevated Permissions Required.
    )
    goto check_srvc
)