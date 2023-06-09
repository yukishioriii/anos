print_letter:
    pusha
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    popa
    ret

print:
    pusha
    call print_letter
    add bx, 0x1
    cmp bx, 0
    jne print

    popa
    ret

; done:
;     popa
;     ret