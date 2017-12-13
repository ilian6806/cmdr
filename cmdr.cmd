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

set POSITIVE_COMMANDS="y" "Y" "yes" "YES" "ok" "OK"
set NEGATIVE_COMMANDS="n" "N" "no" "NO"
set CLEARING_COMMANDS="cls" "CLS" "clear" "CLEAR" "clean" "CLEAN"
set MODULE_EXTENSIONS="cmd" "bat" "exe"

:init
cls

if !INITILIZED!==0 call %ROOT_DIR%helpers/banner

echo.
:start

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
if !commands!=="" goto :start

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

goto :start

endlocal