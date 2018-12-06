arithmetic
* aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: x * aPoint x ].
	^ self retry: #* coercing: aPoint