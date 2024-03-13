include macro.inc
.model small
     extrn show_str:near
.stack 100h
.data
    str_about db 10, 13, 9, "----- This program was developed by Manuel Morales -----", 10, 13
              db 9, 9, "  Email: morales.patty.jose@gmail.com", 10, 13
              db 9, 9, 9, "    GitHub: MorveN11", 10, 13
              db 9, 9, 9, "  Phone: +591 75463290", 10, 13, 10, 13
              db "$"
.code
    main: 
          GetDs
          call        about
          ExitProcess 0

about PROC
          print       str_about
          ret
about ENDP
    end main
