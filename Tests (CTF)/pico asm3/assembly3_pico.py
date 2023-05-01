w0 = 1048110976
result = 0

# 	and	w0, w0, 1 //perform AND on 1048110976 an 1 and stores the result in w0
#	cmp	w0, 0
#	beq	.L3 //jump if equal

while w0 != 0:
	if w0 & 1 != 0:
		result +=3
	# left shift by 1
	w0 >>=1
	
hex_result = hex(result)[2:].zfill(8)
print(hex_result)