[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; print null terminated string
print_string_pm:
pusha
mov edx, VIDEO_MEMORY ;  set edx to start of video mem

print_string_pm_loop:
mov al,[ebx] ; Store the char at ebx to AL 
mov ah, WHITE_ON_BLACK ; attribute in AH

cmp al,0;
je done;

mov [edx], ax ; store the char and attr at current char cell

add ebx, 1; ebx next char in string
add edx, 2; edx next char cell

jmp print_string_pm_loop

done:
popa
ret