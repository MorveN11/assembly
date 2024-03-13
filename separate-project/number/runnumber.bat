::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm number.asm
tlink number.obj lib.lib
del number.map
del number.obj
del lib.bak
del lib.obj
del lib.lib
number.exe
