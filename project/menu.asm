include macro.inc
.model small
    extrn showStr:near
    extrn readStr:near
    extrn cleanTerminal:near
    extrn sumDigits:near
.data
    mainMenu         db "---- Welcome to the Menu! ----", 10, 13
                     db "[1] Digits Sum", 10, 13
                     db "[2] Convert Strings", 10, 13
                     db "[3] Assign Strings", 10, 13
                     db "[4] Concatenate Strings", 10, 13
                     db "[0] Exit", 10, 13
                     db "Choose an Option: $", 10, 13
                     db "$"
    strOption1       db "Digits Sum!", 10, 10, 13
                     db "$"
    strOption2       db "Convert Strings!", 10, 10, 13
                     db "$"
    strOption3       db "Assign Strings!", 10, 10, 13
                     db "$"
    strOption4       db "Concatenate Strings!", 10, 10, 13
                     db "$"
    strInvalidOption db "Previous One was an Invalid Option!", 10, 10, 13
                     db "$"
    strGoodBye       db "------ Thanks :D - Comeback Soon! -----", 10, 13
                     db "$"
    option           db 200 dup("$")
    strexit          db "Press Enter to Exit: $"
.code
        public displayMenu

        exit proc
            print strexit
            read option
            ret
        exit endp

        option1 proc
            menuActionOption sumDigits
        option1 endp

        option2 proc
            menuOption strOption2
        option2 endp

        option3 proc
            menuOption strOption3
        option3 endp

        option4 proc
            menuOption strOption4
        option4 endp

        invalidOption proc
            call cleanTerminal
            print strInvalidOption
            jmp displayMenu
        invalidOption endp

        displayMenu proc
            print mainMenu
            read option
            lea  bx, option
            cmp  byte ptr [bx], 48
            jb   invalidOption
            cmp  byte ptr [bx], 52
            ja   invalidOption
            cmp  byte ptr [bx], 48
            je   done
            cmp  byte ptr [bx], 49
            je   option1
            cmp  byte ptr [bx], 50
            je   option2
            cmp  byte ptr [bx], 51
            je   option3
            cmp  byte ptr [bx], 52
            je   option4
        displayMenu  endp

        done proc
            call cleanTerminal
            print strGoodBye
            ExitProcess 0
            ret
        done endp
    end
