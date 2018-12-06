printing
printOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' degrees: '.
	self deg storeOn: aStream.
	aStream nextPutAll: ')'