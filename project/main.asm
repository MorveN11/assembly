include macro.inc
.model small
    extrn cleanTerminal:near
    extrn showStr:near
    extrn readStr:near
    extrn displayMenu:near
    extrn validString:near
.stack 100h
.data
    usuarioStr  db "User: $"
    passwrdStr  db "Password: $"
    validUser   db "admin", 0
    validPass   db "1234", 0
    invalidUser db "Invalid User!", 10, 13
                db "$"
    invalidPass db "Incorrect Password!", 10, 13
                db "$"
    user        db 50 dup("$")
    pass        db 50 dup("$")
.code
    main:           
                    GetDS
                    call        cleanTerminal
                    print       usuarioStr
                    read        user
                    call        verifyUser
                    print       passwrdStr
                    read        pass
                    call        verifyPass
                    call        cleanTerminal
                    call        displayMenu
                    ExitProcess 0

exitInvalidUser proc
                    exitInvCrd  invalidUser
exitInvalidUser endp

verifyUser proc
                    verify      user,validUser
                    cmp         ax, 1
                    je          exitInvalidUser
                    ret
verifyUser endp

exitInvalidPass proc
                    exitInvCrd  invalidPass
exitInvalidPass endp

verifyPass proc
                    verify      pass,validPass
                    cmp         ax, 1
                    je          exitInvalidPass
                    ret
verifyPass endp
  end main
