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

read_number macro buffer
              lea  si, buffer
              call read_num
              lea  si, buffer
              call ascii_to_int
endm

add_eol macro rgs
          mov byte ptr [rgs], 10
          mov byte ptr [rgs + 1], 13
          mov byte ptr [rgs + 2], "$"
endm

itoa macro buffer
       lea  si, buffer
       call int_to_ascii
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

print_results macro buffer
                mov   dx, ax
                itoa  str_ans
                print buffer
                print str_result
                print str_ans
                print str_eol
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
