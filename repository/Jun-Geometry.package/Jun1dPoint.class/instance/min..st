accessing
min: aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: (x min: aPoint x) ].
	^ self retry: #min: coercing: aPoint