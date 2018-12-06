Extension { #name : #Jun3dPoint }

{ #category : #'*Jun-UFFIOpenGL' }
Jun3dPoint >> asByteArray3d [
	^ (ByteArray new: 24)
		doubleAt: 1 put: x;
		doubleAt: 9 put: y;
		doubleAt: 17 put: z;
		yourself
]

{ #category : #'*Jun-UFFIOpenGL' }
Jun3dPoint >> asByteArray3f [
	^ (ByteArray new: 12)
		floatAt: 1 put: x;
		floatAt: 5 put: y;
		floatAt: 9 put: z;
		yourself
]

{ #category : #'*Jun-UFFIOpenGL' }
Jun3dPoint >> asByteArray4d [
	^ (ByteArray new: 32)
		doubleAt: 1 put: x;
		doubleAt: 9 put: y;
		doubleAt: 17 put: z;
		doubleAt: 25 put: 1.0;
		yourself
]

{ #category : #'*Jun-UFFIOpenGL' }
Jun3dPoint >> asByteArray4f [
	^ (ByteArray new: 16)
		floatAt: 1 put: x;
		floatAt: 5 put: y;
		floatAt: 9 put: z;
		floatAt: 13 put: 1.0;
		yourself
]
