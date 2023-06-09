mov ah, 0x0e
mov al, 'H'
mov al, 'a'
mov al, 'v'
mov al, 'e'
mov al, 's'
mov al, 'e'
int 0x10
mov al, 'x'
int 0x10


times 510-($-$$) db 0
dw 0xaa55