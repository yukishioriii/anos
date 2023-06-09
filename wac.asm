[ org 0x7c00 ]

mov ah, 0x0e

; mov al, the_fuck
; int 0x10

mov al, [the_fuck]
int 0x10

mov bx, the_fuck
add bx, 0x0
mov al, [bx]
int 0x10

mov al, [0x7c09]
int 0x10

jmp $

the_fuck:
    db "X"


times 510-($-$$) db 0
dw 0xaa55