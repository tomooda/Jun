printing
printOn: aStream
	aStream nextPutAll: self class printString.
	aStream nextPutAll: ' ('.
	a printOn: aStream.
	aStream nextPutAll: ' '.
	b printOn: aStream.
	aStream nextPutAll: ' '.
	c printOn: aStream.
	aStream nextPutAll: ' '.
	p printOn: aStream.
	aStream nextPutAll: ' , '.
	d printOn: aStream.
	aStream nextPutAll: ' '.
	e printOn: aStream.
	aStream nextPutAll: ' '.
	f printOn: aStream.
	aStream nextPutAll: ' '.
	q printOn: aStream.
	aStream nextPutAll: ' , '.
	g printOn: aStream.
	aStream nextPutAll: ' '.
	h printOn: aStream.
	aStream nextPutAll: ' '.
	i printOn: aStream.
	aStream nextPutAll: ' '.
	r printOn: aStream.
	aStream nextPutAll: ' , '.
	l printOn: aStream.
	aStream nextPutAll: ' '.
	m printOn: aStream.
	aStream nextPutAll: ' '.
	n printOn: aStream.
	aStream nextPutAll: ' '.
	s printOn: aStream.
	aStream nextPutAll: ')'