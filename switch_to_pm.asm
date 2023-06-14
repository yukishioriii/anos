[bits 16]

switch_to_pm:
cli ; switch off interrupt
lgdt [gdt_descriptor] ; load global description table, which define pm mode segments (for code and data)

mov eax, cr0 ; switch 2 protected mode , set 1st bit of CR0, a control register
or eax, 0x1
mov cr0, eax

jmp CODE_SEG:init_pm ; made a far Jump to 32bit seg to flush (forcefully execute all old instructions before the new 32 bits ones get loaded)

[bits 32]
;init register and stack once in pm 
init_pm:

mov ax, DATA_SEG ; now in PM old segment are meaningless, point segment register to data selector defined in GDT
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

mov ebp, 0x90000 ; update stack position so it's on top of free space (cause you know it grow down)
mov esp, ebp

call BEGIN_PM ; call some well-known label
