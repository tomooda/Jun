coercing
coerce: anObject
	(anObject isKindOf: self)
		ifTrue: [ ^ anObject ].
	((anObject respondsTo: #x) and: [ anObject respondsTo: #y ])
		ifTrue: [ ^ self fromPoint: anObject ].
	anObject isNumber
		ifTrue: [ ^ self fromNumber: anObject ].
	^ self fromArray: anObject