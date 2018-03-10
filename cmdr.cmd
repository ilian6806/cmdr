::
:: Windows CMD wrapper with custom commands
::
:: Author: Ilian Iliev
:: Since: 12.12.17
::

@echo OFF
setlocal EnableDelayedExpansion

title CMDR

set ROOT_DIR=%~dp0
set INITILIZED=0

set helpers_dir=%~dp0helpers
set commands_dir=%~dp0commands

:: Include all other used paths
call paths

set POSITIVE_COMMANDS="y" "Y" "yes" "YES" "ok" "OK"
set NEGATIVE_COMMANDS="n" "N" "no" "NO"
set CLEARING_COMMANDS="cls" "CLS" "clear" "CLEAR" "clean" "CLEAN"
set MODULE_EXTENSIONS="cmd" "bat" "exe"

cd %USERPROFILE%

:init
cls

if !INITILIZED!==0 call %ROOT_DIR%helpers/banner

echo.
:start

:: Chech if current directory is git repo
set git_branch_name=""
set git_origin=""
set git_repo=""

if exist .git (
    for /F "tokens=* USEBACKQ" %%F in (`git rev-parse --abbrev-ref HEAD`) do (set git_branch_name=%%F)
    for /F "tokens=* USEBACKQ" %%F in (`git config --get remote.origin.url`) do (set git_origin=%%F)
    for %%F in ("!git_origin:/=\!") do (
        call %helpers_dir%\color_print light_yellow "%%~nxF on !git_branch_name:/= !"
    )
)

:: Ask for command
set /p command="%cd%> "
set params=

set INITILIZED=1

:: Trim left and right
for /l %%a in (1,1,100) do if "!command:~-1!"==" " set command=!command:~0,-1!
for /f "tokens=* delims= " %%a in ("%command%") do set command=%%a

:: Split command and params
set input=!command!
set temp=%input%
set /a count=0

:loop
for /f "tokens=1*" %%a in ("%temp%") do (
    if !count!==0 (
        set command=%%a
    ) else (
        set params=!params! %%a
    )
    set temp=%%b
    set /a count += 1
)
if defined temp goto :loop

:: Check for clearing
(for %%a in (%CLEARING_COMMANDS%) do (
    if %%a=="!command!" (
        goto :init
    )
))

:: Check for enter
if !command!=="" goto :start

:: Check for command input
if exist !ROOT_DIR!commands/!command!.* (

    :: custom command was found - execute and ask for next one
    set done=0
    (for %%a in (%MODULE_EXTENSIONS%) do (
        if exist !ROOT_DIR!commands/!command!.%%a (
            call !ROOT_DIR!commands/!command!.%%a !params!
            set done=1
        )
    ))

    if !done!==1 (
        call !ROOT_DIR!helpers/color_print green "Done"
    ) else (
        !command! !params!
    )
) else (
     :: no custom command was found - execute user command
     !command! !params!
)
echo.

set command=""
goto :start

endlocal