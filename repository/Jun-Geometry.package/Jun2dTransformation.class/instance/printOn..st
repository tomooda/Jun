printing
printOn: aStream
	aStream nextPutAll: self class printString.
	aStream nextPutAll: ' ('.
	a printOn: aStream.
	aStream nextPutAll: ' '.
	b printOn: aStream.
	aStream nextPutAll: ' '.
	p printOn: aStream.
	aStream nextPutAll: ' , '.
	c printOn: aStream.
	aStream nextPutAll: ' '.
	d printOn: aStream.
	aStream nextPutAll: ' '.
	q printOn: aStream.
	aStream nextPutAll: ' , '.
	m printOn: aStream.
	aStream nextPutAll: ' '.
	n printOn: aStream.
	aStream nextPutAll: ' '.
	s printOn: aStream.
	aStream nextPutAll: ')'