printing
storeOn: aStream
	aStream nextPutAll: '('.
	self x storeOn: aStream.
	aStream nextPutAll: ' _, '.
	self y storeOn: aStream.
	aStream nextPutAll: ')'