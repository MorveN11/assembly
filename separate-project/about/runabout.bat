::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm about.asm
tlink about.obj lib.lib
del about.map
del about.obj
del lib.bak
del lib.obj
del lib.lib
about.exe
