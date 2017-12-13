@echo OFF
setlocal

set showcmdr=0

if "%1"=="cmdr" (set showcmdr=1)
if "%1"=="CMDR" (set showcmdr=1)

if %showcmdr%==1 (

echo ---------------------------------------------------------------------------------------------------------------
echo                                         Welcome to CMDR                                 ,_.-=` ` ` ` ~,_      :
echo                                                                                         '--,.     .-.  ,=.    :
echo                             Windows CMD wrapper with custom commands                       /     { * }`;-.}   :
echo                                                                                            :      '-' /__ :   :
echo                                                                                            /          \_,\:   :
echo                                    Copyright 2017 Ilian Iliev                              :          {       :
echo ---------------------------------------------------------------------------------------------------------------
echo.                                                                                                              :
echo  To add custom command just add your .cmd, .bat or .exe in /commands folder and use the file name as command. :
echo  You can also modify current commands by your own preferences.                                                :
echo.                                                                                                              :
echo  There are some already defined commands, that are similar on Windows and Unix command lines:                 :
echo.                                                                                                              :
echo ---------------------------------------------------------------------------------------------------------------
echo : Windows command : Unix command  : Notes                                                                     :
echo ---------------------------------------------------------------------------------------------------------------
echo : dir             : ls            : "dir" also works on some versions of Unix.                                :
echo : cd              : pwd           : On Windows, cd alone prints the current directory.                        :
echo : cd              : cd            : On Unix cd alone returns the user to his home directory.                  :
echo : move            : mv            :                                                                           :
echo : del             : rm            :                                                                           :
echo : deltree         : rm -r         : Recursively deletes entire directory tree.                                :
echo : cls             : clear         : Clear the terminal screen.                                                :
echo : copy            : cp            :                                                                           :
echo : xcopy           : cp -R         : Recursively copy a directory tree.                                        :
echo : help            : man           : "help" by itself prints all the commands.                                 :
echo : mkdir           : mkdir         :                                                                           :
echo : rmdir           : rmdir         :                                                                           :
echo : sort            : sort          :                                                                           :
echo : ping            : ping          :                                                                           :
echo : ftp             : ftp           :                                                                           :
echo : hostname        : hostname      :                                                                           :
echo : nslookup        : nslookup      :                                                                           :
echo : ipconfig /all   : ifconfig -a   : /all lets you get the MAC address of the Windows PC                       :
echo : systeminfo      : uname -a      :                                                                           :
echo : ver             : uname         :                                                                           :
echo ---------------------------------------------------------------------------------------------------------------
echo.

) else (
    help %1
)

endlocal