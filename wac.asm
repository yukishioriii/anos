[org 0x7c00]

mov bx, MSG
call print

jmp $

MSG:
    db "What's up gamers", 0

%include "print.asm"
times 510-($-$$) db 0
dw 0xaa55