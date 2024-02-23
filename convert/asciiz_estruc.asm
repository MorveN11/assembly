lea bx, cadAsciiz
lea si, cadStruct
mov dh ,[si]
inc si
mov dl, [si]  
inc dl
inc dl 
lea si, cadStruct         
             
xor cl, cl
cicloFindEnd:
  mov al, [si]
  cmp cl, dl
  je endFindEnd
  inc si      
  inc cl
  jmp cicloFindEnd

endFindEnd:  

dec dl
dec dl
 lea bx, cadAsciiz
              
cicloConcat:
  mov al, [bx]    
  cmp al, 0
  je endConcat
  cmp dl, dh    
  je endConcat
  mov [si], al
  inc bx
  inc si   
  inc dl
  jmp cicloConcat

endConcat:   

ret

cadStruct db 4,3,"123"   
cadAsciiz db "ABC",0