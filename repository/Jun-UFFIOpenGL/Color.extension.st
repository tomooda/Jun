Extension { #name : #Color }

{ #category : #'*Jun-UFFIOpenGL' }
Color >> asByteArray4f [
	^ (ByteArray new: 16)
		floatAt: 1 put: self red;
		floatAt: 5 put: self green;
		floatAt: 9 put: self blue;
		floatAt: 13 put: self alpha;
		yourself
]
