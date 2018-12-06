*Jun-UFFIOpenGL
asByteArray4f
	^ (ByteArray new: 16)
		floatAt: 1 put: x;
		floatAt: 5 put: y;
		floatAt: 9 put: 0.0;
		floatAt: 13 put: 1.0;
		yourself