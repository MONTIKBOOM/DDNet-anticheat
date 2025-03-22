@echo off
setlocal enabledelayedexpansion
TITLE DDNet Anti-Cheat v1.1

set "BAT_DIR=%~dp0"
set "EVERYTHING_PATH=%BAT_DIR%data\Everything\Everything.exe"
set "SHELLBAG_PATH=%BAT_DIR%data\shellbag\shellbag.exe"
set "JOURNALTRACE_PATH=%BAT_DIR%data\JournalTrace\JournalTrace.exe"
set "PREVFILESREC_PATH=%BAT_DIR%data\PreviousFilesRecovery\PreviousFilesRecovery.exe"
set "USBDRIVELOG_PATH=%BAT_DIR%data\USB-DriveLog\USB-DriveLog.exe"
set "USBDEVIEW_PATH=%BAT_DIR%data\USB-Deview\USB-Deview.exe"
set "EXEPROGLIST_PATH=%BAT_DIR%data\ExecutedProgramsList\ExecutedProgramsList.exe"
set "WINPREFETCH_PATH=%BAT_DIR%data\WinPrefetchView\WinPrefetchView.exe"
set "LASTACTIVITY_PATH=%BAT_DIR%data\LastActivityView\LastActivityView.exe"
set "CACHEDPROGS_PATH=%BAT_DIR%data\CachedProgramsList\CachedProgramsList.exe"
set "CONFIG_FILE=%APPDATA%\ddnet\settings_ddnet.cfg"
set "KEYWORDS=krx|ddnet|hack|cheat|ddcff|zyro|nonest|nstwave|aimbot|tclient|taterclientplus"

:MAIN_MENU
cls
echo ===========================================
echo          DDNet Cheat Scanner v1.1
echo      Developed by Wranked
echo      for discord.gg/6SHMYAt3rF
echo ===========================================
echo WARNING:
echo Keep DDNet client running during scan!
echo Closing client may result in ban suspicion.
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
cls
echo ===========================================
echo          Cheat Detection Toolkit
echo ===========================================
echo 1. Deep File System Scan
echo 2. View Deleted Files
echo 3. Journal File System Trace
echo 4. Previous Files Recovery
echo 5. USB Drive Activity Log
echo 6. USB Device Viewer
echo 7. Executed Programs List
echo 8. Windows Prefetch Viewer
echo 9. Last Activity View
echo 10. Cached Programs List
echo 11. Anti-CFF Protection
echo 12. Inspect Recycle Bin
echo 13. View Current Config File
echo 14. Launch Process Monitor
echo 15. Return to Main Menu
echo ===========================================
set /p choice="[INPUT] Select detection method: "
if "%choice%"=="1" goto DEEP_SEARCH
if "%choice%"=="2" goto DELETED_ANALYSIS
if "%choice%"=="3" goto JOURNAL_TRACE
if "%choice%"=="4" goto PREV_FILES_RECOVERY
if "%choice%"=="5" goto USB_DRIVE_LOG
if "%choice%"=="6" goto USB_DEVIEW
if "%choice%"=="7" goto EXECUTED_PROGS
if "%choice%"=="8" goto WIN_PREFETCH
if "%choice%"=="9" goto LAST_ACTIVITY
if "%choice%"=="10" goto CACHED_PROGS
if "%choice%"=="11" goto ANTI_CFF
if "%choice%"=="12" goto RECYCLE_BIN
if "%choice%"=="13" goto OPEN_CONFIG
if "%choice%"=="14" goto TASK_MANAGER
if "%choice%"=="15" goto MAIN_MENU
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

:JOURNAL_TRACE
if not exist "%JOURNALTRACE_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo JournalTrace.exe not found in:
    echo %JOURNALTRACE_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%JOURNALTRACE_PATH%"
goto CHECK_MENU

:PREV_FILES_RECOVERY
if not exist "%PREVFILESREC_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo PreviousFilesRecovery.exe not found in:
    echo %PREVFILESREC_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%PREVFILESREC_PATH%"
goto CHECK_MENU

:USB_DRIVE_LOG
if not exist "%USBDRIVELOG_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo USB-DriveLog.exe not found in:
    echo %USBDRIVELOG_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%USBDRIVELOG_PATH%"
goto CHECK_MENU

:USB_DEVIEW
if not exist "%USBDEVIEW_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo USB-Deview.exe not found in:
    echo %USBDEVIEW_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%USBDEVIEW_PATH%"
goto CHECK_MENU

:EXECUTED_PROGS
if not exist "%EXEPROGLIST_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo ExecutedProgramsList.exe not found in:
    echo %EXEPROGLIST_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%EXEPROGLIST_PATH%"
goto CHECK_MENU

:WIN_PREFETCH
if not exist "%WINPREFETCH_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo WinPrefetchView.exe not found in:
    echo %WINPREFETCH_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%WINPREFETCH_PATH%"
goto CHECK_MENU

:LAST_ACTIVITY
if not exist "%LASTACTIVITY_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo LastActivityView.exe not found in:
    echo %LASTACTIVITY_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%LASTACTIVITY_PATH%"
goto CHECK_MENU

:CACHED_PROGS
if not exist "%CACHEDPROGS_PATH%" (
    echo ===========================================
    echo                 ERROR!
    echo ===========================================
    echo CachedProgramsList.exe not found in:
    echo %CACHEDPROGS_PATH%
    echo Please verify anti-cheat files integrity
    echo ===========================================
    pause
    goto CHECK_MENU
)
start "" "%CACHEDPROGS_PATH%"
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
echo 4. Open DDNet menu and watch if there DD.CFF menu
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
    echo This could indicate tampering!
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
    echo ===========================================
    echo          SCAN RESULT: CLEAN
    echo ===========================================
    echo User passed all checks
    echo ===========================================
) else (
    echo ===========================================
    echo       SCAN RESULT: SUSPICIOUS ACTIVITY
    echo ===========================================
    echo Dont play with hacks anymore
    echo ===========================================
)
pause
goto MAIN_MENU
