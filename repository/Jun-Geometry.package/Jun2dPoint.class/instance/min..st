comparing
min: aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: (x min: aPoint x) y: (y min: aPoint y) ].
	^ self retry: #min: coercing: aPoint