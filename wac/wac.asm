[ org 0x7c00 ]

; mov ah, 0x0e

; mov al, the_feck
; int 0x10

; mov al, [the_feck]
; int 0x10

; mov bx, the_feck
; add bx, 0x0
; mov al, [bx]
; int 0x10

mov al,0xba
int 0x10

jmp $

the_feck:
    db "X"


times 510-($-$$) db 0
dw 0xaa55