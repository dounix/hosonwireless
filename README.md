#Hoson PrintExp on a raspberry Pi

PrintExp(win32) is a program for Hoson n10 and other hoson print controller boards.

Hoson boards have their own control protocol, not listening on port 9100 directly.

PrintExp is the translator/configuration UI for Hoson Boards.

It provides a configuration interface, and also listens on port 9100 on the hosting windows PC.


Things that don't work...
When using a raspberry pi(and arm emulation of x86 vs hangover) there will be printing pauses

Some fonts will be invisable unless these are present(available from Windows 10 fonts dir)
msyh.ttc and simsun.ttc
