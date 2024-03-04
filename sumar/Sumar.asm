include macro.inc
.model small
        extrn showStr:near
        extrn readStr:near
        extrn readChar:near
.stack 100h
.data
    msg1    db 9,"=========================",10,13
            db 9,"Add two numbers",10,13
            db 9,,"=========================$"
    msg2    db 10,13,"Enter Number1: $"
    msg3    db 10,13,"Enter Number2: $"

    buffer1 db 20 dup (?)
    buffer2 db 20 dup (?)
.code
    main:
         mov         ax,@data
         mov         ds,ax

         showString  msg1
    ; ========
         enterNumber msg2,buffer1
         enterNumber msg3,buffer2

    ;====================
         mov         ah,4ch
         int         21h

        end main

