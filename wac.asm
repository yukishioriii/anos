mov dx, WAC
call print_string_pm
jmp $

%include "print32.asm"


BOOT_DRIVE: db 0

WAC: db "what's up gamer", 0

times 510-($-$$) db 0
dw 0xaa55
