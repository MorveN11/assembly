::label: debug
::debug assembly code

copy C:\TASM\STRMACRO.INC macro.inc
copy C:\TASM\STRLIB.ASM STRLIB.ASM
tasm STRLIB.ASM
tlib STRLIB.LIB+STRLIB.OBJ
tasm /zi %1.asm
tlink /v/3 %1.obj STRLIB.LIB
del %1.map
del %1.obj
del STRLIB.ASM
del STRLIB.OBJ
del STRLIB.LIB
del macro.inc
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG.TD %1.exe
del TDCONFIG.TD
del %1.exe
del %1.tr
