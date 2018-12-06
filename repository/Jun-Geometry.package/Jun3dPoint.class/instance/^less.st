comparing
< aPoint
	self class = aPoint class
		ifTrue: [ ^ x < aPoint x and: [ y < aPoint y and: [ z < aPoint z ] ] ].
	^ self retry: #< coercing: aPoint