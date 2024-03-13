::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm area.asm
tlink area.obj lib.lib
del area.map
del area.obj
del lib.bak
del lib.obj
del lib.lib
area.exe
