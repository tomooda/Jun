printing
storeOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' center: '.
	self center storeOn: aStream.
	aStream nextPutAll: ' radius: '.
	self radius storeOn: aStream.
	aStream nextPutAll: ')'