*Jun-UFFIOpenGL
asByteArray3d
	^ (ByteArray new: 24)
		doubleAt: 1 put: x;
		doubleAt: 9 put: y;
		doubleAt: 17 put: z;
		yourself