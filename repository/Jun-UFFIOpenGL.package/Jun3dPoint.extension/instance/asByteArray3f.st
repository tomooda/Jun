*Jun-UFFIOpenGL
asByteArray3f
	^ (ByteArray new: 12)
		floatAt: 1 put: x;
		floatAt: 5 put: y;
		floatAt: 9 put: z;
		yourself