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

read_number macro buffer
                   lea  si, buffer
                   call read_num
                   lea  si, buffer
                   call ascii_to_int
endm

itoa macro buffer
            lea  si, buffer
            call int_to_ascii
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
