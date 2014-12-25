	.section .text.boot
	.global _start
_start:
	mov $0x80000, %esp
	call start
crash:
	jmp crash
	.section .multiboot
	.global _multiboot
_multiboot:
	.int 0x1badb002
	.int (1 << 16)
	.int (0-0x1badb002-(1 << 16))
	.int _multiboot
	.int _text_start
	.int _data_end
	.int _bss_end
	.int _start
