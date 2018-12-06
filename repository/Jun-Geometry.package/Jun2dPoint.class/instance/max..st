comparing
max: aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: (x max: aPoint x) y: (y max: aPoint y) ].
	^ self retry: #max: coercing: aPoint