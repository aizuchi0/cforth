cforth
======
This is Mitch Bradley's CForth implementation.

This version was derived from the version at One Laptop Per Child,
then it was improved as follows:

a) Host version now has line editing
b) Host version catches exceptions
c) key and key? implemented property in host versions for Linux and Windows
d) Makefile fragments factored better, and use pattern rules extensively
e) Makefiles in build directories simplified


# Smartfusion additions

added subdirectories in build, src/app, src/platform for the SmartFusion A2F200M3 Eval Kit.

see README.md in buid/arm-smartfusion

### From Jerry's email:
>I have done most of my development and testing on an Ubuntu Linux (19.04) system. I would expect there to be no problem using the examples on any Linux system. The standalone C examples ambles work on my Mac (Catalina) but the CForth does not build on the Mac. I have not tried building them on a Windows 10 system. I suspect it “can be done”.
>
>for compiling you will need the ARM crosscospiler toolchain and have in installed “in your path”
>It can be downloaded from :
>
>https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
>I have been using  Version 9-2019-q4-major
>
>This is a newer release than the one used under SmartConsole. 
>
>You will also need the Segger Link development tools, available from
>
>https://www.segger.com/downloads/jlink/#J-LinkSoftwareAndDocumentationPack
>
>You only need the main Software and Documentation Package ( containing JLinkeExe and JLinkGDBServer)
>
>You also may find the Ozone debugger useful as an alternative to GDB.
>
>JLINK NOTE
>When using the JLink debugger, make sure jumpers JP10 and JP7 have been moved to the (pi n2-3) positions (opposite from the >default0
>Only one USB connection is needed on the USB/UART port hat also powers the board.
>
>If you want to load a new FPGA design via FlashPro you must restore the JP10/JP7 jumpers to the (1-20 position. it’s annoying but it’s not a perfect world...
