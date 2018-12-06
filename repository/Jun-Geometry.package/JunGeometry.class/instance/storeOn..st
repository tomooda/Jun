printing
storeOn: aStream 
	
	[| aString |
	aString := self toLispList saveString.
	aStream nextPutAll: '('.
	aStream nextPutAll: self class printString.
	aStream nextPutAll: ' fromString: '.
	aString storeOn: aStream.
	aStream nextPutAll: ')'] 
			on: Error
			do: [:exception | super storeOn: aStream]