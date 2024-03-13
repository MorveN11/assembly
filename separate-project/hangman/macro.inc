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

read macro buffer
            lea  bx, buffer
            call read_str
            lea  bx, buffer
endm

itoa macro buffer
            lea  si, buffer
            call int_to_ascii
endm

print_chances macro
                     print str_chances_1
                     print str_chances
                     print str_chances_2
endm

get_time macro
                mov ah, 00h
                int 1AH
endm
