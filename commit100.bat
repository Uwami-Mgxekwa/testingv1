@echo off
setlocal enabledelayedexpansion

REM Navigate to your repo folder
cd /d "C:\Users\ZiloTech\Desktop\testingv1"

REM Loop 300 times
for /l %%i in (1,1,300) do (
    REM Generate timestamp
    for /f "tokens=1-4 delims=:. " %%a in ("%time%") do (
        set hh=%%a
        set mm=%%b
        set ss=%%c
    )
    set timestamp=%date% %hh%:%mm%:%ss%

    REM Generate random string (5 chars from %random%)
    set randstr=!random!!random!
    set randstr=!randstr:~0,5!

    REM Append to test.txt
    echo Commit %%i at %timestamp% with random: !randstr! >> test.txt

    REM Stage and commit
    git add test.txt
    git commit -m "Commit %%i: Added line with timestamp and random string !randstr!"

    REM Show progress
    echo [Brelinx] Commit %%i/300 created at %timestamp% with random: !randstr!
)

REM Push all commits at once
git push origin main

pause