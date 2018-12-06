comparing
= aLine
	self class == aLine class
		ifFalse: [ ^ false ].
	^ self first = aLine first and: [ self last = aLine last ]