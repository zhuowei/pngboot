with open("thepic.png", "rb") as infile:
	inpng = infile.read()

with open("kernel.img", "rb") as infile:
	inelf = infile.read()

paddinglen = (4 - (len(inpng) % 4)) % 4
outarr = inpng + bytes(paddinglen) + inelf + bytes(0x4000 - len(inelf))
with open("final.png", "wb") as outfile:
	outfile.write(outarr)
