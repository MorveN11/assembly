.model small

.stack 100h

.data
    cad1 db '123'
    cad2 db '456'
    cad3 db '789', 0

.code
    main:
         mov ax, @data
         mov ds, ax



         jmp done

    done:
         mov ah, 4ch
         int 21h

  end main
