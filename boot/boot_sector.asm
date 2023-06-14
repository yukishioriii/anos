[org 0x7c00]
KERNEL_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl

mov bp, 0x9000 ; set the stack
mov sp, bp 

mov bx, MSG_REAL_MODE
call print

call load_kernel

call switch_to_pm

jmp $

%include "print.asm"
%include "disk_load.asm"
%include "gdt.asm"
%include "print32.asm"
%include "switch_to_pm.asm"


[bits 16]
load_kernel:
mov bx, MSG_LOAD_KERNEL
call print

mov bx, KERNEL_OFFSET
mov dh, 15
mov dl, [BOOT_DRIVE]
call disk_load

ret


[bits 32]
BEGIN_PM:
mov ebx, MSG_PROT_MODE
call print_string_pm

call KERNEL_OFFSET ; something

jmp $

BOOT_DRIVE db 0
MSG_REAL_MODE db "started in 16 bits real mode", 0
MSG_PROT_MODE db "Successfully landed in 69 bits protected mode", 0
MSG_LOAD_KERNEL db " Loading kernel into memory. " , 0

times 510-($-$$) db 0
dw 0xaa55