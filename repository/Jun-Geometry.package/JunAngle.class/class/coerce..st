coercing
coerce: anObject
	(anObject isKindOf: self)
		ifTrue: [ ^ anObject ].
	^ self fromRad: anObject