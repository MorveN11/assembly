Lea si, cadEstr
inc si
mov cl, [si]
inc si

Lea bx, cadAsciiz
ciclo:
  mov al, [si]
  mov [bx], al
  inc si
  inc bx
  Loop ciclo

inc bx
xor al,al

mov [bx], al

ret

cadEstr db 4,3,"123"
cadAsciiz db 100 dup ('?')
