Lea si, cadEstr
inc si
mov cl, [si]
inc si

Lea bx, cadFij
ciclo:
  mov al, [si]
  mov [bx], al
  inc si
  inc bx
  Loop ciclo

ret

cadEstr db 4,3,"123"
cadFij db 100 dup ('?')
