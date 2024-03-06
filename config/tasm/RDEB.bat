::label: Run
::Run assembly code

tasm common.asm
tasm menu.asm
tasm sum.asm
tlib common.lib+common.obj
tlib menu.lib+menu.obj
tlib sum.lib+sum.obj
tasm /zi %1.asm
tlink /v/3 %1.obj common.lib menu.lib sum.lib
del %1.map
del %1.obj
del common.obj
del common.lib
del menu.obj
del menu.lib
del sum.obj
del sum.lib
del common.bak
del menu.bak
del sum.bak
copy C:\TASM\TDC2.TD TDCONFIG.TD
TD -cTDCONFIG.TD %1.exe
del TDCONFIG.TD
del %1.exe
del %1.tr

