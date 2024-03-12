::label: Run
::Run assembly code

tasm common.asm
tasm number.asm
tasm hangman.asm
tasm about.asm
tlib common.lib + common.obj
tlib number.lib + number.obj
tlib hangman.lib + hangman.obj
tlib about.lib + about.obj
tasm /zi menu.asm
tlink /v/3 menu.obj common.lib number.lib hangman.lib about.lib
del menu.map
del menu.obj
del common.bak
del common.obj
del common.lib
del number.bak
del number.obj
del number.lib
del hangman.bak
del hangman.obj
del hangman.lib
del about.bak
del about.obj
del about.lib
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG.TD menu.exe
del TDCONFIG.TD
del menu.tr
