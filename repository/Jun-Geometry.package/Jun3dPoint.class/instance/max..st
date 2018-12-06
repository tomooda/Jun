comparing
max: aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: (x max: aPoint x) y: (y max: aPoint y) z: (z max: aPoint z) ].
	^ self retry: #max: coercing: aPoint