# Hoson PrintExp wireless

PrintExp(win32) is a program for Hoson(hosonsoft) print controller boards.

Hoson boards are used in DTF/DTG/Large format printers from China.

PrintExp is the configuration/control/status UI for Hoson board.
PrintExp also serves as the raw port listner TCP interface for your raster image processor(RIP), 
The print job is sent to PrintExp(listening on 9100), not directly to the printer.

The IP stack on Hoson boards is hardcoded to 192.168.127.10(ugh..), so not really an IP stack, but some Lync FPGA approximation.
The customer is expected to dedicate a computer and network interface(with a static IP on in the 192.168.127.0/24 net) to this "dummy" network.
The cable that is wired into the board appears to be a crossover, but that hasn't be verified.

This makes multiple printers or non local printers somewhere between cumbersome and impossible.

I wanted to print remotely, my printer is across my workshop.

The solution, A miniPC(NUC spec or similar)  running some flavor of linuxn(raspberry Pi 5 had dropped connection during large print spooling)

PrintExp works mostly fine in wine with default settings, without installing the strange Chinese VC runtimes required on windows.

Things that don't work...

Going to the advanced/net settings crashes PrintExp, these settings are curious in any case.
After getting wireless working, set your ethernet interface staticlly to 192.168.172.11/24, the above settings won't be needed

The Adjust calibration instructions don't show in the window, I have this problem on windows 10 as well

As stated above, when using a raspberry pi(and arm emulation of x86 vs hangover) there will be printing pauses
It's possible print calibration fails to print the number scale(likely font issue, may be resolved)

Menus with invisible text, resolved after finding the font collection dependancies.
msyh.ttc and simsun.ttc from windows 10(winetricks doesn't seem to have these) added to wine c_drive/windows/Fonts


Making it useful remote

PrintExp only listens on localhost:9100 by default.
Change project.ini in the PrintExp directory to listen on all interfaces(0.0.0.0)

With a headless setup, remote display is nessessary.
Speed and client ubiquity for RDP lead to xrdp

install xrdp
copy startwm.sh to the user home directory, and set execute bits.
prespawn.service will run PrintExp before connecting via RDP, so spooling will work at boot.

On windows make a shortcut to mstsc, setting the resolution is optional
C:\Windows\System32\mstsc.exe /v dtf /w:1344 /h:806

Set your RIP destination to ip of miniPC(or dns names if your RIP/network support it)  192.168.0.222:9100 

If you can't get PrintExp working on windows, this will not fix that.

Automation
wget https://catalog.s.download.windowsupdate.com/msdownload/update/software/updt/2009/10/windows-en-us-kb971513_c18df80f512a6d9cea206825b981e33c0973abec.exe

wintricks winxp, which runs
wine winecfg -v winxp
 wine windows-en-us-kb971513_c18df80f512a6d9cea206825b981e33c0973abec.exe
wintricks win10, which runs
git clone https://github.com/blackrosezy/gui-inspect-tool
wintricks win10
https://www.python.org/ftp/python/3.11.9/python-3.11.9.exe
wine pip install pywinauto
wine python -m pip install --upgrade pip
wine pip install pywinauto keyboard

