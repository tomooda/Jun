printing
storeOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' fromArray: '.
	self asArray storeOn: aStream.
	aStream nextPutAll: ')'