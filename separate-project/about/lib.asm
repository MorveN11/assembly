include macro.inc
.model small
.stack 100h
.data
.code
                   public show_str
show_str PROC
                   mov    ah, 9
                   int    21h
                   ret
show_str ENDP
    end
