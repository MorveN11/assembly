::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm /zi number.asm
tlink /v/3 number.obj lib.lib
del number.map
del number.obj
del lib.bak
del lib.obj
del lib.lib
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG number.exe
del TDCONFIG.TD
del number.tr

