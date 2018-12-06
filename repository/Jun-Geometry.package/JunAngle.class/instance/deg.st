accessing
deg
	deg isNil
		ifTrue: [ deg := rad radiansToDegrees ].
	^ deg