include macro.inc
.model small
     extrn show_str:near
.data
    str_about db 9, "----- This program was developed by MorveN11 -----", 10, 13
              db "$"
.code
          public about

    _:    
about PROC
          print  str_about
          ret
about ENDP
    end _
