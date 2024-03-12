.model small

.code
    public addeol
    public showStr

    endProc proc
        ret
    endProc endp

    addeol proc
        mov byte ptr [di], 10
        mov byte ptr [di+1], 13
        mov byte ptr [di+2], "$"
        ret
    addeol endp

    showStr proc
        mov  ah, 9
        int  21h
        ret
    showStr endp

  end
