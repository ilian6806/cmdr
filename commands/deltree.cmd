:: DelTree.cmd
:: Delete a folder plus all files and subfolders
@echo OFF
set _folder=%1
if [%_folder%]==[] goto:eof
Pushd %_folder%
del /f /q /s *.* >NUL
cd \
rd /s /q %_folder%
:: repeat because RD is sometimes buggy
if exist %_folder% RD /s /q %_folder%
Popd