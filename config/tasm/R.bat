::label: Run
::Run assembly code

tasm common.asm
tasm menu.asm
tlib common.lib+common.obj
tlib menu.lib+menu.obj
tasm %1.asm
tlink %1.obj common.lib menu.lib
del %1.map
del %1.obj
del common.obj
del common.lib
del menu.obj
del menu.lib
del common.bak
del menu.bak
%1.exe
