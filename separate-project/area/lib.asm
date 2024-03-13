include macro.inc
.model small
.data
    str_clean_terminal db 27, "[H"
                       db 27, "[2J"
                       db "$"
.code
                   public  clean_terminal
                   public  read_str
                   public  show_str
                   public  square_area
                   public  triangle_area
                   public  ascii_to_int
                   public  int_to_ascii
    _:             

clean_terminal PROC
                   print   str_clean_terminal
                   ret
clean_terminal ENDP

read_char PROC
                   mov     ah, 1
                   int     21h
                   ret
read_char ENDP

read_str PROC
                   xor     cx, cx

    loopRead:      
                   call    read_char
                   cmp     al,13
                   je      exitRead
                   cmp     al,'0'
                   jl      loopRead
                   cmp     al,'9'
                   jg      loopRead
                   mov     [si], al
                   inc     si
                   inc     cx
                   jmp     loopRead

    exitRead:      
                   ret
read_str ENDP

show_str PROC
                   mov     ah, 9
                   int     21h
                   ret
show_str ENDP

triangle_area PROC
                   sub     al, dl
                   mov     cl, al
                   mov     dl, bl
                   dec     cl

    mult_tr_loop:  
                   add     bl, dl
                   loop    mult_tr_loop

                   mov     ax, bx
                   mov     bl, 2
                   div     bl
                   mov     dl, al

                   ret
triangle_area ENDP

square_area PROC
                   mov     cl, bl
                   mov     dl, al
                   dec     cl

    mult_loop:     
                   add     al, dl
                   loop    mult_loop
                   ret
square_area ENDP

ascii_to_int PROC
                   xor     ax, ax
                   xor     dx, dx
                   mov     bl, 10

    convert_loop:  
                   mov     dl, [si]
                   sub     dl, 30h
                   imul    bl
                   add     al, dl
                   inc     si
                   loop    convert_loop

                   mov     dl, al
                   ret
ascii_to_int ENDP

int_to_ascii PROC
                   xor     cx, cx
                   push    dx

    count_digist:  
                   inc     cx
                   mov     ax, dx
                   mov     bl, 10
                   div     bl
                   mov     dl, al
                   cmp     dx, 0
                   jnz     count_digist

                   pop     dx
                   add     si, cx
                   add_eol si

    convert:       
                   dec     si
                   mov     ax, dx
                   mov     bl, 10
                   div     bl
                   add     ah, 30h
                   mov     [si], ah
                   mov     dl, al
                   cmp     dx, 0
                   jnz     convert

                   ret
int_to_ascii ENDP
end _
