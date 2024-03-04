enterNumber macro msg,buffer
                    showString msg

                    lea        di,buffer
                    call       readStr
endm

showString macro msg
                   lea  dx,msg
                   call showStr
endm
