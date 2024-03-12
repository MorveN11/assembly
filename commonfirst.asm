include macro.inc
.model small
.code
        public show_str
        public read_number
        public square_area
        public triangle_area

        read_number PROC
            xor    dx,dx

            loopRead:
                call   readChar
                cmp    al,13
                je     exitRead
                cmp    al,'0'
                jl     loopRead
                cmp    al,'9'
                jg     loopRead
                sub    al,30h
                add    dl,al
                jmp    loopRead

            exitRead:
                ret
        read_number ENDP

        show_str PROC
            mov  ah, 9
            int  21h
            ret
        show_str ENDP

        square_area PROC
            push ax
            push bx
            mov cx, dx
            mov al, bx

            mult_loop:
                add bx, al
                loop square_area
            ret
        square_area ENDP

        triangle_area PROC

        triangle_area ENDP
   end
