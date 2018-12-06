Extension { #name : #Jun2dPoint }

{ #category : #'*Jun-UFFIOpenGL' }
Jun2dPoint >> asByteArray3d [
	^ (ByteArray new: 24)
		doubleAt: 1 put: x;
		doubleAt: 9 put: y;
		doubleAt: 17 put: 0.0;
		yourself
]

{ #category : #'*Jun-UFFIOpenGL' }
Jun2dPoint >> asByteArray3f [
	^ (ByteArray new: 12)
		floatAt: 1 put: x;
		floatAt: 5 put: y;
		floatAt: 9 put: 0.0;
		yourself
]

{ #category : #'*Jun-UFFIOpenGL' }
Jun2dPoint >> asByteArray4d [
	^ (ByteArray new: 32)
		doubleAt: 1 put: x;
		doubleAt: 9 put: y;
		doubleAt: 17 put: 0.0;
		doubleAt: 25 put: 1.0;
		yourself
]

{ #category : #'*Jun-UFFIOpenGL' }
Jun2dPoint >> asByteArray4f [
	^ (ByteArray new: 16)
		floatAt: 1 put: x;
		floatAt: 5 put: y;
		floatAt: 9 put: 0.0;
		floatAt: 13 put: 1.0;
		yourself
]
