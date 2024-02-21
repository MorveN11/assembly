lea si, cadtemp
mov cl, [si]
inc si        
lea bx, cad2 
mov al, 10
mov [bx], al
inc bx
mov [bx], cl
inc bx
ciclo:
    mov al, [si]  
    mov [bx], al
    inc si
    inc bx
loop ciclo  

cadtemp db 3, "123"
