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

    exitInvalidUser:
                    exitInvCrd  invalidUser

    verifyUser:     
                    verify      user,validUser,exitInvalidUser

    exitInvalidPass:
                    exitInvCrd  invalidPass

    verifyPass:     
                    verify      pass,validPass,exitInvalidPass
  end main
