::label: Run
::Run assembly code

tasm lib.asm
tlib lib.lib + lib.obj
tasm hangman.asm
tlink hangman.obj lib.lib
del hangman.map
del hangman.obj
del lib.bak
del lib.obj
del lib.lib
hangman.exe
