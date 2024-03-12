include macro.inc
.model small
     extrn show_str:near
.data
    str_number db 9, "----- Guess My Number -----", 10, 13
               db "$"
.code
           public number

    _:     
number PROC
           print  str_number
           ret
number ENDP
    end _
