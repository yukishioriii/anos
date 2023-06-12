disk_load:
    push dx ; store DX so later we can recall how many sectors were request to be read 

    mov ah, 0x02 ; BIOS read sector function
    mov al, dh   ; read DH sector
    mov ch, 0x00 ; select cylinder 0
    mov dh, 0x00 ; select disk 0
    mov cl, 0x02 ; start reading from the 02nd sector (after boot sector)

    int 0x13     ; BIOS interrupt

    jc disk_error ; jump if disk error 

    pop dx  ; restore from stack dx
    cmp dh, al; compare dh (sector expected) vs al (sector read)
    jne disk_error ; 
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print
    jmp $

DISK_ERROR_MSG db "DISK READ ERROR!", 0

int 0x13
