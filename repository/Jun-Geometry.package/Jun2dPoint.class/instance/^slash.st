arithmetic
/ aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: x / aPoint x y: y / aPoint y ].
	^ self retry: #/ coercing: aPoint