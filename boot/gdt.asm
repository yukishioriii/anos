gdt_start:

gdt_null: ; mandatory null descriptor
dd 0x0   ; define double word
dd 0x0 ; 

gdt_code: ; code segment descriptor
; base = 0x0, limit 0xfffff
; 1st flags : (present) 1 (privilege) 00 (descriptor type) 1 -> 1001b  
; type flags: (code) 1  (conforming) 0  (readable) 1 (accesssed) 0 -> 1010b
; 2nd flags :(granularity) 1 (32 bit default) 1  (64 bit seg) 0 (AVL) 0 -> 1100b
dw 0xffff ; limit (bits 0-15)
dw 0x0    ; base (0-15)
db 0x0    ; base (16-23)
db 10011010b  ; 1st flag + type flag
db 11001111b  ; 2nd flag + limit (bits 16-19)
db 0x0        ; base (bits 24 - 31)

gdt_data:; data segment descriptor
; same as code segment except for the type flags;
;type flags: (code) 0 (expand down) 0 (writable) 1 (accessed) 0 -> 0010b
dw 0xffff; limit
dw 0x0   ; base
db 0x0   ; base
db 10010010b ; 1st flag and type flag
db 11001111b ; 2nd flag and limit
db 0x0 ; base 

gdt_end: ; for calculation purposes label

gdt_descriptor:
 
dw gdt_end - gdt_start - 1 ; size of GDT, always less one of true size 

dd gdt_start ; start address of GDT

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start



