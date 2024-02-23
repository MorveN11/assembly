.model small

.stack 100h

.data
    msg  db "Hello, World!", 10, 13
         db "$"

.code
         org 100h

    main:
         mov ax, @data
         mov ds, ax

         lea dx, msg
         mov ah, 09h
         int 21h

         jmp done

    done:
         mov ah, 4ch
         int 21h

  end main
