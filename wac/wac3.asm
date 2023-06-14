[org 0x7c00]

mov bx, MSG2
call print

mov dx, ax
call print_hex
jmp $

%include "print.asm"
%include "print_hex.asm"

MSG1:
    db "What's up gamers", 0

MSG2:
    db "Don't say that youre in love with me"

times 510-($-$$) db 0
dw 0xaa55