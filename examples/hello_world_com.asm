.model tiny

.code
           org 100h

    main:  
           lea dx, cadena
           mov ah, 9
           int 21h

           jmp done

    done:  
           mov ah, 4ch
           int 21h

    cadena db  "Hola mundo", 10, 13
           db  "$"

  end main
