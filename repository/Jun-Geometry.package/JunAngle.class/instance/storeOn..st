printing
storeOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' radians: '.
	self rad storeOn: aStream.
	aStream nextPutAll: ')'