comparing
= aPoint
	self class = aPoint class
		ifTrue: [ ^ x = aPoint x ].
	^ self retry: #= coercing: aPoint