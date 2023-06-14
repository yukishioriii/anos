# Automatically generate lists of sources using wildcards .
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

# Convert the *.c filenames to *.o to give a list of object files to build 
OBJ = $(C_SOURCES:.c=.o)

# Default build target
all: os-image

run: all
	qemu-system-x86_64 -fda os-image

os-image: boot/boot_sector.bin kernel.bin
	cat $^ > os-image


# $^ is substituted with all of the target ’s dependancy files
kernel.bin: kernel/kernel_entry.o ${OBJ}
	i686-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

# generic to build o from c, c files depends on header files
%.o:%.c ${HEADERS}
	i686-elf-gcc -ffreestanding -c $< -o $@

# assemble kernel_entry
%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -I './boot' -o $@

clean:
	rm -fr *.bin *.o *.dis os-image 
	rm -fr kernel/*.o boot/*.bin drivers/*.o

kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

