include macro.inc
.model small
    extrn clean_terminal:near
    extrn read_str:near
    extrn show_str:near
    extrn square_area:near
    extrn triangle_area:near
    extrn ascii_to_int:near
    extrn int_to_ascii:near
.stack 100h
.data
    str_welcome  db 9, "Welcome to the area calculator!", 10, 13
                 db 9, 9, "  |\       ", 10, 13
                 db 9, 9, "  | \      ", 10, 13
                 db 9, 9, "  |  \     ", 10, 13
                 db 9, 9, "  |   \    ", 10, 13
                 db 9, 9, "A |    \   ", 10, 13
                 db 9, 9, "  |     |  ", 10, 13
                 db 9, 9, "  |     | C", 10, 13
                 db 9, 9, "  |_____|  ", 10, 13
                 db 9, 9, "     B     ", 10, 13
                 db "$"
    str_number_a db "Enter the number of A: $"
    str_number_b db "Enter the number of B: $"
    str_number_c db "Enter the number of C: $"
    str_ans      db "The total area is: $"
    number       db 100 dup ("$")
    area         db 100 dup ("$")
.code
    main:
         get_ds
         clean
         print        str_welcome
         print        str_number_a
         read_number
         push         dx
         print        str_number_b
         read_number
         push         dx
         print        str_number_c
         read_number
         pop          bx
         pop          ax
         push         bx
         push         dx
         call         triangle_area
         pop          bx
         pop          ax
         push         dx
         call         square_area
         pop          dx
         add          dl, al
         itoa         area
         print        str_ans
         print        area
         exit_process 0
  end main
