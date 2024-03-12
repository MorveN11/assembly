include macro.inc
.model small
.data
    str_clean_terminal db 27, "[H"
                       db 27, "[2J"
                       db "$"
.code
                   public read_char
                   public read_str
                   public show_str
                   public clean_terminal

    _:             
read_char PROC
                   mov    ah, 1
                   int    21h
                   ret
read_char ENDP

read_str PROC
                   call   read_char
                   cmp    al, 13
                   je     exit_read
                   mov    [bx], al
                   inc    bx
                   jmp    read_str

    exit_read:     
                   mov    [bx], "$"
                   ret
read_str ENDP

show_str PROC
                   mov    ah, 9
                   int    21h
                   ret
show_str ENDP

clean_terminal PROC
                   print  str_clean_terminal
                   ret
clean_terminal ENDP
    end _
