[org 0x7c00]

mov [BOOT_DRIVE], dl ; BIOS store boot drive in dl so save it in global var

mov bp, 0x8000 ; set stack out of the way at 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 2
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000] ; print the 1st loaded word, stored at address 0x9000
call print_hex

mov dx, [0x9000+ 512] ; print the 1st loaded word,  
call print_hex

%include "print.asm"
%include "print_hex.asm"
%include "disk_load.asm"


BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdaad
times 256 dw 0xface