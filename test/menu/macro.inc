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

read macro buffer
       lea  bx, buffer
       call read_str
       lea  bx, buffer
endm

add_eol macro rgs
          mov byte ptr [rgs], 10
          mov byte ptr [rgs + 1], 13
          mov byte ptr [rgs + 2], "$"
endm

clean macro
        call clean_terminal
endm

exit macro
       print str_exit
       call  read_char
endm

check_invalid macro
                cmp byte ptr [bx + 1], "$"
                jne invalid
endm

menu_option macro func
              check_invalid
              clean
              call          func
              exit
              clean
              jmp           menu
endm
