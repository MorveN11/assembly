GetDS macro
        mov ax, @data
        mov ds, ax
endm

ExitProcess macro x
              mov bx, x
              mov ah, 4ch
              int 21h
endm

copyFijDi macro buffer,len
            lea  si, buffer
            mov  cx, len
            call copyFij
endm

print macro buffer
        lea  dx, buffer
        call showStr
endm
