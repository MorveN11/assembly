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
         mov  ax, @data
         mov  ds, ax
         lea  di, cad4
         lea  si, cad1
         mov  cx, len1
         call copyFij
         lea  si, cad2
         mov  cx, len2
         call copyFij
         lea  si, cad3
         mov  cx, len3
         call copyFij
         call addeol
         lea  dx, cad4
         call showStr
         jmp  done

    done:
         mov  ah, 4ch
         int  21h

  end main
