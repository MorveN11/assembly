include macro.inc
.model small
     extrn show_str:near
.data
    str_hangman db 9, 9, "----- Hagnman -----", 10, 13
                db "$"
.code
            public hangman

    _:      
hangman PROC
            print  str_hangman
            ret
hangman ENDP
    end _
