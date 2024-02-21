Lea si, cadEstr
inc si
mov cl, [si]
inc cl
Lea bx, cadTemp
ciclo:
mov al, [si]
mov [bx], al
inc si
inc bx
Loop ciclo

ret

cadEstr db 4,3,"123"
cadTemp db 100 dup ('?')
