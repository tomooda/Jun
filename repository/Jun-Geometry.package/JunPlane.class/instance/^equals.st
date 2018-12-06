comparing
= aPlane
	self class == aPlane class
		ifFalse: [ ^ false ].
	^ ((self a = aPlane a and: [ self b = aPlane b ]) and: [ self c = aPlane c ]) and: [ self d = aPlane d ]