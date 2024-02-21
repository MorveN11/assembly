Lea si, cadASCIIZ
Lea di, cadTemp
XOR cx, cx
ciclo: 
	mov al, [si]
	cmp al, 0
	je terminar 	
	inc cx
	mov [di], al
	inc si
	inc di
	jmp ciclo

cadASCIIZ db �123�, 0
cadTemp db 100 dup(�?�)
