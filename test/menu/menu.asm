include macro.inc
.model small
    extrn read_char:near
    extrn read_str:near
    extrn show_str:near
    extrn clean_terminal:near
    extrn number:near
    extrn hangman:near
    extrn about:near
.stack 100h
.data
    str_menu    db 9, "----- Welcome to the Menu -----", 10, 13
                db 9, "[1] Game Guess my Number", 10, 13
                db 9, "[2] Game Hangman", 10, 13
                db 9, "[3] About Programmers", 10, 13
                db 9, "[0] Exit", 10, 13
                db 9, "Choose an option: $"
    str_invalid db 9, "Invalid option, Try again!", 10, 13
                db "$"
    str_bye     db 10, 13, 9, "----- Thanks :D - Comeback Soon! -----", 10, 13, 10, 13
                db "$"
    str_exit    db 9, "Press any key to exit...$"
    option      db 200 dup ("$")
.code
    main:   
            get_ds
            clean
            call          menu

menu PROC
            print         str_menu
            read          option
            cmp           byte ptr [bx], 48
            jl            invalid
            cmp           byte ptr [bx], 51
            jg            invalid
            cmp           byte ptr [bx], 48
            je            done
            cmp           byte ptr [bx], 49
            je            option1
            cmp           byte ptr [bx], 50
            je            option2
            cmp           byte ptr [bx], 51
            je            option3

    invalid:
            clean
            print         str_invalid
            jmp           menu

    option1:
            menu_option   number

    option2:
            menu_option   hangman

    option3:
            menu_option   about

    done:   
            check_invalid
            clean
            print         str_bye
            exit_process  0
menu ENDP
  end main
