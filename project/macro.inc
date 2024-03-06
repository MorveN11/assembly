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

verify macro buffer,validBuffer,exit
         mov  ax, 0
         lea  bx, buffer
         lea  si, validBuffer
         call validString
         cmp  ax, 1
         je   exit
         ret
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

menuActionOption macro func
                   call cleanTerminal
                   call func
                   call exit
                   call cleanTerminal
                   jmp  displayMenu
endm

addeol macro register
         mov byte ptr [register + 1], 10
         mov byte ptr [register + 2], 13
         mov byte ptr [register + 3], "$"
endm

copyFijDi macro buffer,len
            lea  si, buffer
            mov  cx, len
            call copyFij
endm

addPrefix macro bufferQuest,buffer,len
            print bufferQuest
            lea   bx, buffer
            add   bx, len
            call  readStr
endm

LOCALS @@
readConcatenate macro firstBuffer,secondBuffer,len
                  cmp       cx, 0
                  je        @@firstBufferSelected
                  jmp       @@secondBufferSelected
                  jmp       @@endOfSelection

@@firstBufferSelected:
                  addPrefix firstStringQuest,firstBuffer,len
                  jmp       @@endOfSelection

@@secondBufferSelected:
                  addPrefix secondStringQuest,secondBuffer,len

@@endOfSelection:
                  inc       cx
                  call      cleanTerminal
                  call      displayConcatenateMenu
endm

printInvalidOption macro buffer,menu
                     call  cleanTerminal
                     print buffer
                     jmp   menu
endm

printTitle macro buffer,menu
             print buffer
             jmp   menu
endm
