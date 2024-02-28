.model tiny

.code
                     org  100h

    main:            
                     call cleanTerminal

                     lea  dx, usuarioStr
                     call showStr
                     lea  bx, user
                     call readStr

                     lea  dx, passwrdStr
                     call showStr
                     lea  bx, pass
                     call readStr

                     call verifyUser
                     call verifyPass

                     call cleanTerminal
                     call showMenu

                     jmp  done

    showStr:         
                     mov  ah, 9
                     int  21h
                     ret

    readChar:        
                     mov  ah, 1
                     int  21h
                     ret

    endProcedure:    
                     ret

    readStr:         
                     call readChar
                     cmp  al, 13
                     je   endProcedure
                     mov  [bx], al
                     inc  bx
                     jmp  readStr

    invalid:         
                     mov  ax, 1
                     ret

    validString:     
                     mov  al, [si]
                     cmp  [bx], al
                     jne  invalid
                     inc  si
                     cmp  byte ptr [si], 0
                     je   endProcedure
                     inc  bx
                     cmp  byte ptr [bx], 36
                     je   invalid
                     jmp  validString

    exitInvalidUser: 
                     lea  dx, invalidUser
                     call showStr
                     jmp  done

    exitInvalidPass: 
                     lea  dx, invalidPass
                     call showStr
                     jmp  done

    verifyUser:      
                     lea  bx, user
                     lea  si, validUser
                     call validString
                     cmp  ax, 1
                     je   exitInvalidUser
                     ret

    verifyPass:      
                     lea  bx, pass
                     lea  si, validPass
                     call validString
                     cmp  ax, 1
                     je   exitInvalidPass
                     ret

    cleanTerminal:   
                     lea  dx, strCleanTerminal
                     call showStr
                     ret

    option1:         
                     lea  dx, strOption1
                     call showStr
                     jmp  showMenu

    option2:         
                     lea  dx, strOption2
                     call showStr
                     jmp  showMenu

    option3:         
                     lea  dx, strOption3
                     call showStr
                     jmp  showMenu

    invalidOption:   
                     lea  dx, strInvalidOption
                     call showStr
                     jmp  showMenu

    showMenu:        
                     lea  dx, mainMenu
                     call showStr
                     lea  bx, option
                     call readStr
                     lea  bx, option
                     mov  al, [bx]
                     cmp  al, 49
                     jb   invalidOption
                     cmp  al, 52
                     ja   invalidOption
                     cmp  al, 49
                     je   option1
                     cmp  al, 50
                     je   option2
                     cmp  al, 51
                     je   option3
                     cmp  al, 52
                     je   done

    done:            
                     mov  ah, 4ch
                     int  21h

    usuarioStr       db   "User: $"
    passwrdStr       db   "Password: $"
    user             db   20 dup("$")
    pass             db   20 dup("$")
    validUser        db   "admin", 0
    validPass        db   "1234", 0
    invalidUser      db   "Invalid User!", 10, 13
                     db   "$"
    invalidPass      db   "Incorrect Password!", 10, 13
                     db   "$"
    strCleanTerminal db   27,"[H",27,"[2J"
                     db   "$"
    mainMenu         db   "---- Welcome to the main menu! ----", 10, 13
                     db   "1. Option 1", 10, 13
                     db   "2. Option 2", 10, 13
                     db   "3. Option 3", 10, 13
                     db   "4. Exit", 10, 13
                     db   "Choose an option: $", 10, 13
    option           db   100 dup("$")
    strOption1       db   "Option 1", 10, 10, 13
                     db   "$"
    strOption2       db   "Option 2", 10, 10, 13
                     db   "$"
    strOption3       db   "Option 3", 10, 10, 13
                     db   "$"
    strInvalidOption db   "Invalid Option!", 10, 10, 13
                     db   "$"

  end main
