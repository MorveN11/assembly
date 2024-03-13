include macro.inc
.model small
.stack 100h
.data
    str_clean_terminal db 27, "[H"
                       db 27, "[2J"
                       db "$"
.code
                   public read_char
                   public read_str
                   public ascii_to_int
                   public read_num
                   public show_str
                   public clean_terminal
                   public int_to_ascii
    _:             
read_char PROC
                   mov    ah, 1
                   int    21h
                   ret
read_char ENDP

read_str PROC
                   call   read_char
                   cmp    al, 13
                   je     exit_read
                   mov    [bx], al
                   inc    bx
                   jmp    read_str

    exit_read:     
                   mov    byte ptr [bx], "$"
                   ret
read_str ENDP

ascii_to_int PROC
                   xor    ax, ax
                   xor    dx, dx
                   mov    bl, 10

    convert_loop:  
                   mov    dl, [si]
                   sub    dl, 30h
                   imul   bl
                   add    al, dl
                   inc    si
                   loop   convert_loop

                   mov    dl, al
                   ret
ascii_to_int ENDP

read_num PROC
                   xor    cx, cx

    loopRead:      
                   call   read_char
                   cmp    al,13
                   je     exitRead
                   cmp    al,'0'
                   jl     loopRead
                   cmp    al,'9'
                   jg     loopRead
                   mov    [si], al
                   inc    si
                   inc    cx
                   jmp    loopRead

    exitRead:      
                   mov    byte ptr [si], "$"
                   ret
read_num ENDP

show_str PROC
                   mov    ah, 9
                   int    21h
                   ret
show_str ENDP

clean_terminal PROC
                   print  str_clean_terminal
                   ret
clean_terminal ENDP

int_to_ascii PROC
                   xor    cx, cx
                   push   dx

    count_digist:  
                   inc    cx
                   mov    ax, dx
                   mov    bl, 10
                   div    bl
                   mov    dl, al
                   cmp    dx, 0
                   jnz    count_digist

                   pop    dx
                   add    si, cx
                   mov    byte ptr [si], "$"

    convert:       
                   dec    si
                   mov    ax, dx
                   mov    bl, 10
                   div    bl
                   add    ah, 30h
                   mov    [si], ah
                   mov    dl, al
                   cmp    dx, 0
                   jnz    convert

                   ret
int_to_ascii ENDP
    end _
