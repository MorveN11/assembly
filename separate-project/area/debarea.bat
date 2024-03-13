::label: debug
::debug assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm /zi area.asm
tlink /v/3 area.obj lib.lib
del area.map
del area.obj
del lib.OBJ
del lib.LIB
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG.TD area.exe
del TDCONFIG.TD
del area.tr
