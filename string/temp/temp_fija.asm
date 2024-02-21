lea si, cadtemp
mov cl, [si]
inc si        
lea bx, cad2
ciclo:
mov al, [si]  
mov [bx], al
inc si
inc bx
loop ciclo

cadtemp db 3, "123"
cad2 db 10 dup("?")
