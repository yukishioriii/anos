all: os-image

run: all
	qemu-system-x86_64 -fda os-image

os-image: boot_sector.bin kernel.bin
	cat $^ > os-image


# $^ is substituted with all of the target ’s dependancy files
kernel.bin: kernel_entry.o kernel.o
	i686-elf-ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# $< is the first dependancy and $@ is the target file
kernel.o: kernel.c
	i686-elf-gcc -ffreestanding -c $< -o $@

# $@ is the target file
kernel_entry.o: kernel_entry.asm
	nasm kernel_entry.asm -f elf -o $@

boot_sector.bin: boot_sector.asm
	nasm $< -f bin -o $@

clean:
	rm *.bin *.o *.dis os-image *.map

kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

