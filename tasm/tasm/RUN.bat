::label: Run
::Run assembly code

tasm %1.asm
tlink %1.obj
del %1.map
del %1.obj
%1.exe
del %1.exe
