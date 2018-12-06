comparing
equal: aLine
	self class == aLine class
		ifFalse: [ ^ false ].
	^ (self first equal: aLine first) and: [ self last equal: aLine last ]