GetDs macro
             mov ax, @data
             mov ds, ax
endm

ExitProcess macro x
                   mov bx, x
                   mov ah, 4ch
                   int 21h
endm

print macro buffer
             lea  dx, buffer
             call show_str
endm
