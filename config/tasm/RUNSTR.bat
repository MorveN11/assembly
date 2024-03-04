::label: Run
::Run assembly code

copy C:\TASM\STRMACRO.INC macro.inc
copy C:\TASM\STRLIB.ASM STRLIB.ASM
tasm STRLIB.ASM
tlib STRLIB.LIB+STRLIB.OBJ
tasm %1.asm
tlink %1.obj STRLIB.LIB
del %1.map
del %1.obj
del STRLIB.ASM
del STRLIB.OBJ
del STRLIB.LIB
del macro.inc
%1.exe
del %1.exe
