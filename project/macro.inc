GetDS macro
        mov ax, @data
        mov ds, ax
endm

ExitProcess macro x
              mov bx, x
              mov ah, 4ch
              int 21h
endm

print macro buffer
        lea  dx, buffer
        call showStr
endm

read macro buffer
       lea  bx, buffer
       call readStr
endm

verify macro buffer,validBuffer
         mov  ax, 0
         lea  bx, buffer
         lea  si, validBuffer
         call validString
endm

exitInvCrd macro buffer
             print       buffer
             ExitProcess 1
endm

menuOption macro buffer
             call  cleanTerminal
             print buffer
             call  exit
             call  cleanTerminal
             jmp   displayMenu
endm

copyFijDi macro buffer,len
            lea  si, buffer
            mov  cx, len
            call copyFij
endm
