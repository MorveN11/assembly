include macro.inc
.model small
     extrn show_str:near
     extrn read_num:near
     extrn ascii_to_int:near
     extrn int_to_ascii:near
.stack 100h
.data
    str_title     db 9, "----- Guess A Number Between 1 - 100 -----", 10, 13
                  db "$"
    str_enter     db 10, 13, 9, "Enter your number: $"
    str_greater   db 9, "The number is greater than the answer", 10, 13
                  db "$"
    str_lower     db 9, "The number is lower than the answer", 10, 13
                  db "$"
    str_wrong     db 9, "Wrong, Try again!", 10, 13
                  db "$"
    str_chances_1 db 9, "You have $"
    str_chances_2 db " More Chances!", 10, 13
                  db "$"
    str_chances   db 100 dup ("$")
    str_ans       db 100 dup ("$")
    str_lose      db 9, "You Lost you Have no More Chances :(", 10, 13
                  db "$"
    str_won       db 9, "You won, Congratulations!", 10, 13
                  db "$"
    str_result    db 9, "The answer was: $"
    str_eol       db 10, 13, 10, 13, "$"
.code
                     public        number
    _:               
number PROC
                     print         str_title
                     call          random
                     push          dx
                     mov           cx, 10

    game:            
                     print         str_enter
                     push          cx
                     read_number   str_ans
                     pop           cx
                     pop           ax
                     cmp           al, dl
                     je            exit_loop
                     dec           cx
                     cmp           cx, 0
                     je            no_opportunities
                     push          ax
                     cmp           dl, al
                     jg            greater_than
                     cmp           dl, al
                     jl            lower_than

    greater_than:    
                     print         str_greater
                     jmp           continue

    lower_than:      
                     print         str_lower
                     jmp           continue

    continue:        
                     mov           dx, cx
                     push          cx
                     itoa          str_chances
                     pop           cx
                     print         str_wrong
                     print_chances
                     jmp           game

    exit_loop:       
                     print_results str_won
                     ret

    no_opportunities:
                     print_results str_lose
                     ret
number ENDP

random PROC
                     get_time
                     mov           ax, dx
                     and           ax, 0FFh
                     xor           dx, dx
                     mov           bl, 100
                     div           bl
                     mov           dl, ah
                     add           dl, 1
                     ret
random ENDP
    end _
