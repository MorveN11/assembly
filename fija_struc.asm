.model small
.stack
.data
  fija   db 5, '12345'
  estruc db 4, 3, '123'

.code
  start:
        lea si, fija
        lea di, estruc+2
        mov cl, [fija]
        xor dx, dx
  ciclo:
        mov al, [si]
        mov [di], al
        inc si
        inc di
        inc dx
        dec cl
        jnz ciclo

        mov [estruc], dl
  end start
