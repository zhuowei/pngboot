
CC = gcc

CFLAGS = -Wall -pedantic -Os -nostdlib -nostartfiles -ffreestanding -std=gnu99 -m32
OBJS = start.o main.o
LIBGCC = 

all : final.png

clean :
	rm -f *.o
	rm -f *.bin
	rm -f *.hex
	rm -f *.elf
	rm -f *.list
	rm -f *.img
	rm -f *.bc
	rm -f *.clang.s

%.o : %.c
	$(CC) $(CFLAGS) -c $^ -o $@

%.o : %.s
	$(CC) $(CFLAGS) -c $^ -o $@

%.o : %.S
	$(CC) $(CFLAGS) -c $^ -o $@

kernel.img : ldscript $(OBJS)
	ld $(OBJS) $(LIBGCC) -m elf_i386 -T ldscript -o bootldscript05.elf
	objcopy bootldscript05.elf -O binary kernel.img

final.png : kernel.img
	python3 makepng.py
