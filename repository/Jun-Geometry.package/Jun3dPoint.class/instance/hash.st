comparing
hash
	^ ((x hash bitShift: 3) bitXor: (y hash bitShift: 2)) bitXor: z hash