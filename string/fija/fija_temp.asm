.model small
.stack
.data
    fija db '12345'
    temp db 6 dup(?)

.code
    start:
          lea si, fija
          lea di, temp
          mov cl, 5
    ciclo:
          mov al, [si]
          mov [di], al
          inc si
          inc di
          dec cl
          jnz ciclo

  end start
