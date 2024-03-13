include macro.inc
.model small
.stack 100h
.data
.code
                   public show_str
                   public read_num
                   public ascii_to_int
                   public int_to_ascii
read_char PROC
                   mov    ah, 1
                   int    21h
                   ret
read_char ENDP

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
                   ret
read_num ENDP

show_str PROC
                   mov    ah, 9
                   int    21h
                   ret
show_str ENDP

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
    end
