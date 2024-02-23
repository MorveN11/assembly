.model small
.stack 100h

.data
    cadEstruc db 6, 4, "1234", 2 dup('.')
    cadTmp    db 3, "567"

.code
    start:     
               mov ax, @data
               mov ds, ax

               lea si, cadEstruc
               lea bx, cadTmp
               mov dl, [si]
               inc si
               mov ch, [si]
               mov cl, [si]
               inc si

    ciclo_mov: 
               inc si
               dec cl
               jnz ciclo_mov

               mov cl, ch
               mov ch, [bx]
               inc bx

    ciclo_copy:
               cmp cl, dl
               jae done
               mov al, [bx]
               mov [si], al
               inc si
               inc bx
               inc cl
               dec ch
               jnz ciclo_copy

    done:      
               mov ax, 4c00h
               int 21h

  end start
