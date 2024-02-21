.model small
.stack
.data
  asciiz db 10 dup(0)
  fija   db 5, '12345'

.code
  start:    
            lea si, fija
            lea di, asciiz
            mov cl, [si]
            inc si
  copy_loop:
            mov al, [si]
            mov [di], al
            inc si
            inc di
            dec cl
            jnz copy_loop

  end start
