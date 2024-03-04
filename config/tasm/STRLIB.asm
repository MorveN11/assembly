.model small

.code
    public addeol
    public showStr
    public copyAsciiz
    public copyFij
    public copyStruc
    public copyTmp

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

    copyAsciiz proc

    copyAsciiz endp

    copyFij proc
        cmp  cx, 0
        je   endProc
        mov  al, [si]
        mov  [di], al
        inc  si
        inc  di
        dec  cx
        jmp  copyFij
    copyFij endp

    copyStruc proc

    copyStruc endp

    copyTmp proc

    copyTmp endp

  end
