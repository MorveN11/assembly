; asciiz  db  '12345', 0
; temp    db  3, '123'
; fija    db  '12345'
; estruc  db  4, 3, '123'

.model small
.stack
.data
  cad1 db '100'
  cad2 db 100 dup('?')

.code
  start:
        lea si, cad1
        lea bx, cad2
        inc bx
        mov cl, 3
        xor dx, dx
  ciclo:
        mov al,[si]
        mov [bx],al
        inc si
        inc bx
        inc dx
        dec cl
        jnz ciclo

        lea bx, cad2
        mov [bx], dl
  end start

