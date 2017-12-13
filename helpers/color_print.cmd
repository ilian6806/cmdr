@echo off

:: Usage: CALL [color_print] [color] ["text"]
:: color_print     - file path to color_print.cmd
:: color           - all colors are listed bellow
:: text            - your colored text

setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

set name=%1%
set text="%~2%"
set color=7

:: You can change this to your default background
set backgroud=0

if "%name%"=="black"        set color=0
if "%name%"=="blue"         set color=1
if "%name%"=="green"        set color=2
if "%name%"=="aqua"         set color=3
if "%name%"=="red"          set color=4
if "%name%"=="purple"       set color=5
if "%name%"=="yellow"       set color=6
if "%name%"=="white"        set color=7
if "%name%"=="gray"         set color=8
if "%name%"=="light_blue"   set color=9
if "%name%"=="light_green"  set color=a
if "%name%"=="light_aqua"   set color=b
if "%name%"=="light_red"    set color=c
if "%name%"=="light_purple" set color=d
if "%name%"=="light_yellow" set color=e
if "%name%"=="bright_white" set color=f

<nul set /p ".=%DEL%" > %text%
findstr /v /a:%backgroud%%color% /R "^$" %text% nul
del %text% > nul 2>&1
echo.

exit /b