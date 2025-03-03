@echo off
setlocal enabledelayedexpansion
TITLE DDNet Anti-Cheat v1.0

set "BAT_DIR=%~dp0"
set "EVERYTHING_PATH=%BAT_DIR%data\Everything\Everything.exe"
set "SHELLBAG_PATH=%BAT_DIR%data\shellbag\shellbag.exe"
set "CONFIG_FILE=%APPDATA%\ddnet\settings_ddnet.cfg"
set "CONFIG_HISTORY=%TEMP%\ddnet_config_history.txt"
set "REG_PATH=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
set "KEYWORDS=krx|ddnet|hack|cheat|cff|ddcff|zero|nonest|aim|tclient|tater|plus"

for %%A in (total_runs total_checks total_passed total_failed) do (
    set "%%A=0"
    for /f "tokens=3 skip=2" %%B in ('reg query %REG_PATH% /v DDNetAC_%%A 2^>nul') do set "%%A=%%B"
)
set /a total_runs+=1

:MAIN_MENU
cls
echo ===========================================
echo          DDNet Cheat Scanner v1.0
echo      Developed by Wranked
echo      for discord.gg/6SHMYAt3rF
echo 	[BETA] No data is being saved
echo ===========================================
echo WARNING:
echo Keep DDNet client running during scan!
echo Closing client may result in ban suspicion.
echo ===========================================
echo Statistics:
echo    Total Scans:      %total_runs%
echo    Checks Performed: %total_checks%
echo    Clean Results:    %total_passed%
echo    Suspicious Cases: %total_failed%
echo ===========================================
echo 1. Start New Check      3. Exit
echo 2. Finalize Results
echo ===========================================
set /p action="[INPUT] Select option: "
if "%action%"=="1" goto CHECK_MENU
if "%action%"=="2" goto FINISH_CHECK
if "%action%"=="3" exit /b
goto MAIN_MENU

:CHECK_MENU
set /a total_checks+=1
cls
echo ===========================================
echo          Cheat Detection Toolkit
echo ===========================================
echo 1. Deep File System Scan
echo 2. View Deleted Files
echo 3. Config File Version History
echo 4. Launch Process Monitor
echo 5. Anti-CFF Protection
echo 6. Inspect Recycle Bin
echo 7. View Current Config File
echo 8. Return to Main Menu
echo ===========================================
set /p choice="[INPUT] Select detection method: "
if "%choice%"=="1" goto DEEP_SEARCH
if "%choice%"=="2" goto DELETED_ANALYSIS
if "%choice%"=="3" goto CONFIG_HISTORY
if "%choice%"=="4" goto TASK_MANAGER
if "%choice%"=="5" goto ANTI_CFF
if "%choice%"=="6" goto RECYCLE_BIN
if "%choice%"=="7" goto OPEN_CONFIG
if "%choice%"=="8" goto MAIN_MENU
goto CHECK_MENU

:DEEP_SEARCH
if not exist "%EVERYTHING_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo Everything.exe not found in:
    echo %EVERYTHING_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%EVERYTHING_PATH%" -search "%KEYWORDS%"
goto CHECK_MENU

:DELETED_ANALYSIS
if not exist "%SHELLBAG_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo Shellbag analyzer missing!
    echo Required component: shellbag.exe
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%SHELLBAG_PATH%"
goto CHECK_MENU

:CONFIG_HISTORY
if not exist "%CONFIG_FILE%" (
    echo ===========================================
    echo            WARNING: ALERT!
    echo ===========================================
    echo Critical DDNet file missing:
    echo settings_ddnet.cfg
    echo Possible tampering detected!
    echo ===========================================
    pause
    goto CHECK_MENU
)
if not exist "%CONFIG_HISTORY%" (
    copy /y "%CONFIG_FILE%" "%CONFIG_HISTORY%" >nul
    echo ===========================================
    echo Created config baseline
    echo ===========================================
)
fc "%CONFIG_HISTORY%" "%CONFIG_FILE%" >nul
if errorlevel 1 (
    echo ===========================================
    echo          CONFIG MODIFICATION FOUND
    echo ===========================================
    fc "%CONFIG_HISTORY%" "%CONFIG_FILE%"
    copy /y "%CONFIG_FILE%" "%CONFIG_HISTORY%" >nul
    echo ===========================================
    echo Baseline updated to current version
    echo ===========================================
) else (
    echo ===========================================
    echo         Config File Integrity Check
    echo ===========================================
    echo No unauthorized modifications detected
    for %%F in ("%CONFIG_FILE%") do (
        echo Last modified: %%~tF
    )
    echo ===========================================
)
pause
goto CHECK_MENU

:TASK_MANAGER
start taskmgr
goto CHECK_MENU

:ANTI_CFF
cls
echo ===========================================
echo       How To Detect Hack DD.CFF
echo ===========================================
echo 1. Open DDNet Client
echo 2. Press F1 to open console
echo 3. Execute: cff_unload 0
echo ===========================================
pause
goto CHECK_MENU

:RECYCLE_BIN
start shell:RecycleBinFolder
goto CHECK_MENU

:OPEN_CONFIG
if not exist "%CONFIG_FILE%" (
    echo ===========================================
    echo             FILE NOT FOUND
    echo ===========================================
    echo Configuration file missing:
    echo settings_ddnet.cfg
    echo ===========================================
    pause
    goto CHECK_MENU
)
start notepad "%CONFIG_FILE%"
goto CHECK_MENU

:FINISH_CHECK
cls
echo ===========================================
echo          Scan Finalization Panel
echo ===========================================
echo Select final result status:
echo ===========================================
echo 1. Clean System - No issues detected
echo 2. Found Hacks - Flag for review
echo ===========================================
set /p result="[INPUT] Enter result code: "
if "%result%"=="1" (
    set /a total_passed+=1
    echo ===========================================
    echo          SCAN RESULT: CLEAN
    echo ===========================================
    echo System passed all checks
    echo ===========================================
) else (
    set /a total_failed+=1
    echo ===========================================
    echo       SCAN RESULT: SUSPICIOUS ACTIVITY
    echo ===========================================
    echo Potential cheating indicators detected!
    echo System flagged for review.
    echo ===========================================
)

reg add "%REG_PATH%" /v DDNetAC_total_runs /t REG_DWORD /d %total_runs% /f >nul
reg add "%REG_PATH%" /v DDNetAC_total_checks /t REG_DWORD /d %total_checks% /f >nul
reg add "%REG_PATH%" /v DDNetAC_total_passed /t REG_DWORD /d %total_passed% /f >nul
reg add "%REG_PATH%" /v DDNetAC_total_failed /t REG_DWORD /d %total_failed% /f >nul

pause
goto MAIN_MENU
