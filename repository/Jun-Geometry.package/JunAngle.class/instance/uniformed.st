converting
uniformed
	| radians pi2 |
	pi2 := Float pi * 2.0.
	radians := rad \\ pi2.
	radians negative
		ifTrue: [ radians := pi2 + radians ].
	^ self class fromRad: radians