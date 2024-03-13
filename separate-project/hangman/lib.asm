include macro.inc
.model small
.stack 100h
.data
.code
                   public read_char
                   public read_str
                   public show_str
                   public int_to_ascii
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
