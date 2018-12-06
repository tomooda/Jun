printing
storeOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' on: '.
	self p1 storeOn: aStream.
	aStream nextPutAll: ' on: '.
	self p2 storeOn: aStream.
	aStream nextPutAll: ' on: '.
	self p3 storeOn: aStream.
	aStream nextPutAll: ')'