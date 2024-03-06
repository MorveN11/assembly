::label: Run
::Run assembly code

tasm common.asm
tasm menu.asm
tasm sum.asm
tasm conmenu.asm
tlib common.lib+common.obj
tlib menu.lib+menu.obj
tlib sum.lib+sum.obj
tlib conmenu.lib+conmenu.obj
tasm %1.asm
tlink %1.obj common.lib menu.lib sum.lib conmenu.lib
del %1.map
del %1.obj
del common.obj
del common.lib
del menu.obj
del menu.lib
del sum.obj
del sum.lib
del conmenu.obj
del conmenu.lib
del common.bak
del menu.bak
del sum.bak
del conmenu.bak
%1.exe
