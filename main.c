void start() {
	unsigned char* fb = (unsigned char*) (0xa0000);
	const char message[64] = "Happy holidays and thanks for the Christmas card. -@zhuowei";
	for (int i = 0; i < 0x10000; i++) {
		fb[i << 1] = message[i & 63];
	}
	unsigned int seed = 0xabad1dea;
	while(1){
		for (int i = 0; i < 0x10000; i++) {
			seed = (unsigned int) ((seed * 1103515245L) + 12345);
			fb[(i << 1) | 1] = ((seed >> 16) & 0x70) | 0xf;
		}
	}
}
