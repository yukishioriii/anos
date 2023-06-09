mov ah, 0x0e
mov bp, 0x8000
mov sp, bp

push 'd'
push 'e'
push 'z'
push 'z'

pop bx 
mov al, bl
int 0x10

pop bx
mov al, bl 
int 0x10


mov al, [0x7ffc]
int 0x10

; pop bx
; mov al, bl 
; int 0x10


print:
    pusha
    mov ah, 0x0e
    int 0x10
    popa
    ret

jmp $

times 510-($-$$) db 0
dw 0xaa55