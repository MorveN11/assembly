include macro.inc
.model small
    extrn copyFij:near
    extrn addeol:near
    extrn showStr:near
.stack 100h
.data
    cad1 db  "123"
    len1 equ $-cad1
    cad2 db  "456"
    len2 equ $-cad2
    cad3 db  "789"
    len3 equ $-cad3
    cad4 db  ""
.code
    main:
         GetDS
         lea         di, cad4
         copyFijDi   cad1,len1
         copyFijDi   cad2,len2
         copyFijDi   cad3,len3
         call        addeol
         print       cad4
         ExitProcess 0
  end main
