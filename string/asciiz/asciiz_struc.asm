lea si, cadAsciiz
lea di, cadEstr
mov cx, 3

ciclo:
mov al, [si]
cmp al, 0
je finCiclo
mov [di], al
inc si
inc di
dec cx
jnz ciclo
finCiclo:
mov [di], 0
inc di
mov [cadEstr], cx

cadAsciiz: .db "123", 0 
cadEstr: .db 4, 3, "123", 4 dup(?) 

