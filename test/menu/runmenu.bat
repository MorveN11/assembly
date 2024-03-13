::label: Run
::Run assembly code

tasm common.asm
tasm number.asm
tasm hangman.asm
tasm about.asm
tasm sum.asm
tlib common.lib + common.obj
tlib number.lib + number.obj
tlib hangman.lib + hangman.obj
tlib about.lib + about.obj
tlib sum.lib + sum.obj
tasm menu.asm
tlink menu.obj common.lib number.lib hangman.lib about.lib sum.lib
del menu.map
del menu.obj
del common.bak
del common.obj
del common.lib
del number.bak
del number.obj
del number.lib
del hangman.bak
del hangman.obj
del hangman.lib
del about.bak
del about.obj
del about.lib
del sum.bak
del sum.obj
del sum.lib
menu.exe
