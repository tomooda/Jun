arithmetic
abs
	^ self negative
		ifTrue: [ self negated ]
		ifFalse: [ self ]