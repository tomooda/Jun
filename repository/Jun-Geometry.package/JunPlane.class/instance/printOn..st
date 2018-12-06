printing
printOn: aStream
	aStream nextPutAll: '('.
	self p1 printOn: aStream.
	aStream nextPutAll: ' plane: '.
	self p2 printOn: aStream.
	aStream nextPutAll: ' and: '.
	self p3 printOn: aStream.
	aStream nextPutAll: ')'