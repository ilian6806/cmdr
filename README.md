# CMDR
Windows CMD wrapper with custom commands

![](https://img.shields.io/gemnasium/mathiasbynens/he.svg) ![](https://img.shields.io/npm/l/express.svg)
```
To add custom command just add your .cmd, .bat or .exe in /commands folder and use the file name as command.
You can also modify current commands by your own preferences.
```


#

![screenshot_22](https://user-images.githubusercontent.com/7155803/33938831-90f8df84-e011-11e7-9892-7cdea02a3549.png)



There are some already defined commands, that are similar on Windows and Unix command lines.

| Windows command | Unix command  | Notes                                                    |
| --------------- |---------------|----------------------------------------------------------|
| dir	            | ls	          | "dir" also works on some versions of Unix.               |
| cd              |	pwd	          | On Windows, cd alone prints the current directory.       |
| cd              | cd	          | On Unix cd alone returns the user to his home directory. |
| move	          | mv            |                                                          |
| del	            | rm            |                                                          |	
| deltree	        | rm -r	        | Recursively deletes entire directory tree.               |
| cls             | clear	        | Clear the terminal screen.                               |
| copy	          | cp	          |                                                          |
| xcopy           | cp -R	        | Recursively copy a directory tree.                       |
| help	          | man	          | "help" by itself prints all the commands.                |
| mkdir	          | mkdir	        |                                                          |
| rmdir	          | rmdir	        |                                                          |
| sort	          | sort	        |                                                          |
| ping            | ping          |	                                                         |
| ftp             | ftp           |	                                                         |
| hostname	      | hostname      |                                                          |
| nslookup	      | nslookup      |                                                          |
| ipconfig /all	  | ifconfig -a	  | /all lets you get the MAC address of the Windows PC      |
| systeminfo	    | uname -a      |                                                          |
| ver	            | uname         |                                                          |

