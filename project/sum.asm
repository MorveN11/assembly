include macro.inc
.model small
    extrn readChar:near
    extrn showStr:near
.data
    strEnterNumber db "Enter the Number: $"
    strResult      db "The sum is: $"
    number         db 20 dup("?")
.code
        public sumDigits

        sumDigits proc
            print  strEnterNumber
            call   readNumber
            push   dx
            print  strResult
            pop    dx
            xor    cx, cx
            mov    ax, dx
            push   dx
            call   countDigist
            pop    dx
            lea    si, number
            dec    cx
            add    si, cx
            addeol si
            call   intToAsciiz
            print  number
            ret
        sumDigits endp

        readNumber proc
            xor    dx,dx

            loopRead:
                call   readChar
                cmp    al,13
                je     exitRead
                cmp    al,'0'
                jl     loopRead
                cmp    al,'9'
                jg     loopRead
                sub    al,30h
                add    dx,ax
                jmp    loopRead

            exitRead:
                xor    dh,dh
                ret
        readNumber endp

        countDigist proc
            inc    cx
            mov    ax, dx
            mov    bl, 10
            div    bl
            mov    dl, al
            cmp    dx, 0
            jnz    countDigist
            ret
        countDigist endp

        intToAsciiz proc
            mov    ax, dx
            mov    bl, 10
            div    bl
            add    ah, 30h
            mov    [si], ah
            dec    si
            mov    dl, al
            cmp    dx, 0
            jnz    intToAsciiz
            ret
        intToAsciiz endp
    end
