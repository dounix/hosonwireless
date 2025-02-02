#!/bin/bash
echo this ran > /tmp/vmstartup.out
#WINEPREFIX=/home/jims/PrintExP wine PrintExp/PrintExp.exe >> /tmp/wine.log 2>&1
wine PrintExp/PrintExp.exe >> /tmp/wine.log 2>&1

#xterm
