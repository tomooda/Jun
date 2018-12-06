comparing
equal: aPoint
	self class == aPoint class
		ifFalse: [ ^ false ].
	^ (self x - aPoint x) abs < self accuracy and: [ (self y - aPoint y) abs < self accuracy ]