@echo OFF
setlocal EnableDelayedExpansion

echo -------------------------------------------------------------------------------------
echo                        Welcome to CMDR                         ,_.-=` ` ` ` ~,_     *
echo                                                                '--,.     .-.  ,=.   *
echo            Windows CMD wrapper with custom commands               /     { * )`;-.}  *
echo                                                                   :      '-' /__ :  *
echo                                                                   /          \_,\:  *
echo                 Copyright (c) 2017 Ilian Iliev                    :          (      *
echo -------------------------------------------------------------------------------------

set v=
for /f "tokens=4-7 delims=[.] " %%i in ('ver') do @(if %%i==Version (set v=%%j.%%k.%%l) else (set v=%%i.%%j.%%k))
call %~dp0/color_print bright_white "Microsoft Windows [Version !v!]"

endlocal