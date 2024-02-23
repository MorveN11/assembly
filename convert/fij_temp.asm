lea si, cadTemp
mov dl, [si]
inc si
   

xor cl, cl 
ciclo:     
    cmp cl, dl
    je endCiclo
    inc si
    inc cl
    jmp ciclo             
               
endCiclo:  

lea bx, cadFij 
xor cl, cl
cicloConcat:  
    mov al, [bx]
    mov [si], al
    cmp cl, 3 
    je endCicloConcat
    inc cl
    inc dl     
    inc si 
    inc bx
    jmp cicloConcat

endCicloConcat:

lea bx, cadTemp       
mov [bx], dl          
            
cadFij db "123"
cadTemp db 4,"1234"
