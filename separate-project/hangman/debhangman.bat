::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm /zi hangman.asm
tlink /v/3 hangman.obj lib.lib
del hangman.map
del hangman.obj
del lib.bak
del lib.obj
del lib.lib
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG hangman.exe
del TDCONFIG.TD
del hangman.tr

