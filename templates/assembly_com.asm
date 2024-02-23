; asciiz  db  '12345', 0
; temp    db  3, '123'
; fija    db  '12345'
; estruc  db  4, 3, '123'
.model tiny ; .model small

.code                   ; this is the code segment
         org 100h       ; this is the start of the program

    main:               ; this is the main part of the program


         jmp done       ; this is the end of the program

    done:               ; this is the end of the program
         mov ah, 4ch    ; this is the DOS function for exit
         int 21h        ; this is the system call to exit


  end main          ; this is the end of the main
