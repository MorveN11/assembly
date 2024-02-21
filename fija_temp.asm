.model small
.stack
.data
  fija db 5, '12345'
  temp db 5 dup(?)

.code
  start:
        lea si, fija
        lea di, temp
        mov cl, [si]
        inc si
  ciclo:
        mov al, [si]
        mov [di], al
        inc si
        inc di
        dec cl
        jnz ciclo

  end start
