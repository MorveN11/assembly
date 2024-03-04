.model small

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
            call copy
            lea  si, cad2
            mov  cx, len2
            call copy
            lea  si, cad3
            mov  cx, len3
            call copy
            lea  dx, cad4
            call addeol
            call showStr
            jmp  done

    endProc:
            ret

    addeol: 
            mov  byte ptr [di], 10
            mov  byte ptr [di+1], 13
            mov  byte ptr [di+2], '$'

    copy:   
            cmp  cx, 0
            jz   endProc
            mov  al, [si]
            mov  [di], al
            inc  di
            inc  si
            dec  cx
            jmp  copy

    showStr:
            mov  ah,9
            int  21h
            ret

    done:   
            mov  ah, 4ch
            int  21h

  end main
