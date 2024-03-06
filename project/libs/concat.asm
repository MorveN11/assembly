.model small
    extern endProc:near
.code
    public copyAsciiz
    public copyFij
    public copyStruc
    public copyTmp

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
