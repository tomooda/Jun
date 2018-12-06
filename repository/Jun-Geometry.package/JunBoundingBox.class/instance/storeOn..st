functions
storeOn: aStream
	aStream nextPutAll: '('.
	aStream nextPutAll: self origin printString.
	aStream nextPutAll: ' box: '.
	aStream nextPutAll: self corner printString.
	aStream nextPutAll: ')'