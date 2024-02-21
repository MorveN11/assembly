Lea si, cadASCIIZ
lea di, cadFija

mov cx, 3
ciclo:
mov al, [si]
mov [di], al
inc si
inc di
dec cx
jnz ciclo

cadASCIIZ db "123", 0  
cadFija db 100 dup(‘?’) 

