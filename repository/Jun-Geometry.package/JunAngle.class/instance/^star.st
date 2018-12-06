arithmetic
* anAngle
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad * anAngle rad ].
	^ self retry: #* coercing: anAngle