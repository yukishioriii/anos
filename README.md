# anos
an-os
```
nasm -f bin wac.asm -o wac.bin && qemu -drive format=raw,file=wac.bin

```

```
i686-elf-gcc -ffreestanding -c basic.c -o basic.o
i686-elf-ld -o basic.bin -Ttext 0x1000 kernel_entry.o basic.o --oformat binaryilium
cat boot_sector.Bin basic.bin > os-image
qemu -fda os-image
```