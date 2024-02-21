.model small
.stack
.data
    fija  db '12345'
    struc db 5 dup(?)

.code
    start:
          lea si, fija
          lea di, struc
          mov cl, 5
    ciclo:
          mov al, [si]
          mov [di], al
          inc si
          inc di
          dec cl
          jnz ciclo

  end start
