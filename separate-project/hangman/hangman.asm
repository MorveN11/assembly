include macro.inc
.model small
     extrn show_str:near
     extrn read_str:near
     extrn int_to_ascii:near
.stack 100h
.data
    str_title        db 9, 9, "----- Hangman -----", 10, 13
                     db 9, " You have 6 Chances to Guess a word", 10, 13
                     db 9, "All the characters are in lower case", 10, 13
                     db 9, 9, "    Good Luck!", 10, 13
                     db "$"
    str_invalid      db 9, "Invalid Input", 10, 13
                     db 9, "Try Again!", 10 ,13, 10, 13
                     db "$"
    str_enter        db 9, "Enter a letter: $"
    str_not_match    db 9, "No matches found :(", 10, 13
                     db "$"
    str_chances_1    db 9, "You have $"
    str_chances_2    db " More Chanes!", 10, 13
                     db "$"
    str_lose         db 9, "You Lost you Have no More Chances :(", 10, 13
                     db "$"
    str_won          db 9, "You won, Congratulations!", 10, 13
                     db "$"
    str_actual_guess db 9, "Actual Guess: $"
    str_guess_won    db 9, "You Guessed the Word, The word was: $"
    str_words        db "weather"
                     db "brother"
                     db "morning"
                     db "evening"
                     db "bedroom"
                     db "country"
                     db "promise"
                     db "husband"
                     db "freedom"
                     db "weekend"
    str_word         db 7 dup("."), 0
                     db "$"
    str_guess        db 7 dup("."), 10, 13, 10, 13
                     db "$"
    str_input        db 100 dup("$")
    str_chances      db 100 dup("$")
.code
    main:                
                         GetDs
                         call          hangman
                         ExitProcess   0

hangman PROC
                         call          reset_game
                         call          get_random_word
                         print         str_title
                         mov           cx, 6

    guess:               
                         cmp           cx, 0
                         je            loss
                         print         str_enter
                         read          str_input
                         push          cx
                         call          count_char
                         cmp           cx, 1
                         jne           invalid
                         call          verify_chain
                         pop           cx
                         cmp           dx, 1
                         je            no_matches
                         call          verify_win
                         cmp           dx, 1
                         je            win
                         print         str_actual_guess
                         print         str_guess
                         jmp           guess

    no_matches:          
                         print         str_not_match
                         dec           cx
                         cmp           cx, 0
                         je            loss
                         mov           dx, cx
                         push          cx
                         itoa          str_chances
                         pop           cx
                         print_chances
                         print         str_actual_guess
                         print         str_guess
                         jmp           guess

    invalid:             
                         pop           cx
                         print         str_invalid
                         jmp           guess

    loss:                
                         print         str_lose
                         ret

    win:                 
                         print         str_won
                         print         str_guess_won
                         print         str_guess
                         ret
hangman ENDP

count_char PROC
                         xor           cx, cx

    count_loop:          
                         mov           al, [bx]
                         cmp           al, "$"
                         je            exit_count
                         inc           cx
                         inc           bx
                         jmp           count_loop

    exit_count:          
                         lea           bx, str_input
                         ret
count_char ENDP

verify_chain PROC
                         mov           dx, 1
                         xor           cx, cx
                         lea           si, str_word

    verify_loop:         
                         mov           al, [si]
                         cmp           al, 0
                         je            exit_verify
                         cmp           al, [bx]
                         jne           verify_fail
                         jmp           continue

    continue:            
                         mov           dx, 0
                         push          si
                         push          bx
                         lea           si, str_guess
                         mov           bx, cx
                         mov           [si+bx], al
                         pop           bx
                         pop           si
                         inc           si
                         inc           cx
                         jmp           verify_loop

    verify_fail:         
                         inc           si
                         inc           cx
                         jmp           verify_loop

    exit_verify:         
                         ret
verify_chain ENDP

verify_win PROC
                         lea           si, str_word
                         lea           bx, str_guess
                         mov           dx, 1

    verify_win_loop:     
                         mov           al, [si]
                         cmp           al, 0
                         je            exit_verify_win
                         cmp           al, [bx]
                         jne           not_win
                         inc           si
                         inc           bx
                         jmp           verify_win_loop

    not_win:             
                         mov           dx, 0
                         ret

    exit_verify_win:     
                         ret
verify_win ENDP

random PROC
                         get_time
                         mov           ax, dx
                         and           ax, 0FFh
                         xor           dx, dx
                         mov           bl, 10
                         div           bl
                         mov           dl, ah
                         ret
random ENDP

reset_game PROC
                         lea           si, str_guess
                         mov           cx, 7
    reset_loop:          
                         mov           byte ptr [si], "."
                         inc           si
                         loop          reset_loop

                         ret
reset_game ENDP

get_random_word PROC
                         call          random
                         call          get_index_mult
                         lea           si, str_words
                         lea           bx, str_word
                         mov           cx, 7
    get_random_word_loop:
                         push          bx
                         mov           bx, dx
                         mov           al, [si+bx]
                         pop           bx
                         mov           [bx], al
                         inc           si
                         inc           bx
                         loop          get_random_word_loop

                         ret
get_random_word ENDP

get_index_mult PROC
                         xor           ax, ax

                         mov           al, 7
                         imul          dl
                         mov           dx, ax
                         ret
get_index_mult ENDP
    end main
