print:
pusha

print_letter:
mov ah, 0x0e
mov al, [bx]
int 0x10
add bx, 0x1
cmp al, 0
jne print_letter

popa
ret

