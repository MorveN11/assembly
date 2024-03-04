::label: debug
::debug assembly code

tasm /zi %1.asm
tlink /v/3 %1.obj
del %1.map
del %1.obj
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG.TD %1.exe
del TDCONFIG.TD
del %1.exe
del %1.tr

