printing
storeOn: aStream
	aStream nextPutAll: '('.
	self x storeOn: aStream.
	aStream nextPutAll: ' _)'.
