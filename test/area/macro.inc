get_ds macro
               mov ax, @data
               mov ds, ax
endm

exit_process macro x
                     mov bx, x
                     mov ah, 4ch
                     int 21h
endm

print macro buffer
              lea  dx, buffer
              call show_str
endm

read_number macro
                    lea  si, number
                    call read_str
                    lea  si, number
                    call ascii_to_int
endm

itoa macro buffer
             lea  si, buffer
             call int_to_ascii
endm

add_eol macro rgs
                mov byte ptr [rgs], 10
                mov byte ptr [rgs + 1], 13
                mov byte ptr [rgs + 2], "$"
endm

clean macro
              call clean_terminal
endm
