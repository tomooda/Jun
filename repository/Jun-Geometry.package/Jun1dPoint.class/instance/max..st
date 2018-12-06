accessing
max: aPoint
	self class = aPoint class
		ifTrue: [ ^ self class x: (x max: aPoint x) ].
	^ self retry: #max: coercing: aPoint