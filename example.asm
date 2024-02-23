; asciiz  db  '12345', 0
; temp    db  3, '123'
; fija    db  '12345'
; estruc  db  4, 3, '123'
.model small                      ; use small memory model
.stack 100h                       ; reserve 100h bytes for stack

.data         ; declare variables in data segment

.code                      ; start of code segment
    start:                 ; tell linker where code starts
          mov ax, @data    ; set up addressability to data segment
          mov ds, ax       ; by initializing DS register



          jmp done

    done:                  ; finish execution
          mov ax, 4c00h    ; terminate program
          int 21h          ; call DOS

  end start                        ; tell linker that 'start' is the starting point
