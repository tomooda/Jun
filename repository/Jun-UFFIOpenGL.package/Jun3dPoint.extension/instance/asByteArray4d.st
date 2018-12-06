*Jun-UFFIOpenGL
asByteArray4d
	^ (ByteArray new: 32)
		doubleAt: 1 put: x;
		doubleAt: 9 put: y;
		doubleAt: 17 put: z;
		doubleAt: 25 put: 1.0;
		yourself