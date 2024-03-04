TAS.model small
.code
        public showStr
        public readStr
        public readChar

        showStr proc
        mov ah,9
        int 21h
        ret
        showStr endp


        readStr proc
ciclo:
        call readChar
        cmp al,13
        je terminar
        mov [di],al
        inc di
        jmp ciclo
terminar:

        mov byte ptr[di],0
        ret
        readStr endp


        readChar proc
        mov ah,1
        int 21h
        ret
        readChar endp
        end
