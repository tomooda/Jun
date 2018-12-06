printing
storeOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' from: '.
	self from storeOn: aStream.
	aStream nextPutAll: ' to: '.
	self to storeOn: aStream.
	aStream nextPutAll: ')'