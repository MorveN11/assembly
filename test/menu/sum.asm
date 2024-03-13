include macro.inc
.model small
    extrn show_str:near
    extrn read_num:near
    extrn int_to_ascii:near
    extrn ascii_to_int:near
.stack 100h
.data
    str_enter_1  db 9, "Enter the number 1: $"
    str_enter_2  db 9, "Enter the number 2: $"
    str_number_1 db 50 dup ("$")
    str_number_2 db 50 dup ("$")
    str_word     db 50 dup ("$")
.code
         public      sum
    _:   
sum PROC
         print       str_enter_1
         read_number str_number_1
         push        dx
         print       str_enter_2
         read_number str_number_2
         pop         ax
         add         dx, ax
         itoa        str_word
         print       str_word
         ret
sum ENDP
  end _
