::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm /zi about.asm
tlink /v/3 about.obj lib.lib
del about.map
del about.obj
del lib.bak
del lib.obj
del lib.lib
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG about.exe
del TDCONFIG.TD
del about.tr

