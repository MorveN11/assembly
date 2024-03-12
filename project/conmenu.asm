include macro.inc
.model small
    extrn readStr:near
    extrn showStr:near
    extrn cleanTerminal:near
.data
    firstStringTitle        db "---- Enter the Type of the First String ----", 10, 13
                            db "$"
    secondStringTitle       db "---- Enter the Type of the Second String ----", 10, 13
                            db "$"
    concatenateMenu         db "[1] Asciiz", 10, 13
                            db "[2] Fixed Length", 10, 13
                            db "[3] Structure", 10, 13
                            db "[4] Temporary", 10, 13
                            db "[0] Exit", 10, 13
                            db "Enter your choice: $"
    option                  db  200 dup("$")
    firstStringQuest        db "Enter the First String: $"
    secondStringQuest       db "Enter the Second String: $"
    strInvalidOption        db 9, "Previous One was an Invalid Option!", 10, 10, 13
                            db "$"
    resultString            db 200 dup("?")
.code
        public          displayConcatenateMenu

        printFirstStringTitle proc
            printTitle      firstStringTitle,menu
        printFirstStringTitle endp

        printSecondStringTitle proc
            printTitle      secondStringTitle,menu
        printSecondStringTitle endp

        resetCount proc
            xor            cx, cx
            jmp            displayConcatenateMenu
        resetCount endp

        invalidOption proc
            printInvalidOption strInvalidOption,displayConcatenateMenu
        invalidOption endp

        displayConcatenateMenu proc
            cmp             cx, 2
            je              resetCount
            cmp             cx, 0
            je              printFirstStringTitle
            cmp             cx, 1
            je              printSecondStringTitle
        displayConcatenateMenu endp

        exit proc
            ret
        exit endp

        asciizString proc
            readConcatenate firstAsciizString,secondAsciizString,0
        asciizString endp

        menu proc
            print           concatenateMenu
            read            option
            lea             bx, option
            cmp             byte ptr [bx], 48
            jb              invalidOption
            cmp             byte ptr [bx], 52
            ja              invalidOption
            cmp             byte ptr [bx], 48
            je              exit
            cmp             byte ptr [bx], 49
            je              asciizString
            cmp             byte ptr [bx], 50
            je              fixedLengthString
            cmp             byte ptr [bx], 51
            je              structureString
            cmp             byte ptr [bx], 52
            je              temporaryString
        menu endp

        fixedLengthString proc
            readConcatenate fristFixedLengthString,secondFixedLengthString,0
        fixedLengthString endp

        temporaryString proc
            readConcatenate firstTemporaryString,secondTemporaryString,1
        temporaryString endp

        structureString proc
            readConcatenate firstStructureString,secondStructureString,2
        structureString endp
    end
