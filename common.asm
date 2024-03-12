include macro.inc
.model small
.data
        strCleanTerminal db 27,"[H",27,"[2J"
                         db "$"
.code
        public readChar
        public readStr
        public showStr
        public cleanTerminal
        public invalid
        public validString

        endProc proc
            ret
        endProc endp

        readChar proc
            mov  ah, 1
            int  21h
            ret
        readChar endp

        readStr proc
            call  readChar
            cmp   al, 13
            je    endProc
            mov   [bx], al
            inc   bx
            jmp   readStr
        readStr endp

        showStr proc
            mov  ah, 9
            int  21h
            ret
        showStr endp

        cleanTerminal proc
            print strCleanTerminal
            ret
        cleanTerminal endp

        invalid proc
            mov         ax, 1
            ret
        invalid endp
   end
