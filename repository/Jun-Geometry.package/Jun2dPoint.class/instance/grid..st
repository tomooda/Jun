functions
grid: aPoint
	| newX newY |
	(aPoint isKindOf: self class)
		ifFalse: [ ^ self retry: #grid: coercing: aPoint ].
	aPoint x = 0
		ifTrue: [ newX := 0 ]
		ifFalse: [ newX := self x roundTo: aPoint x ].
	aPoint y = 0
		ifTrue: [ newY := 0 ]
		ifFalse: [ newY := self y roundTo: aPoint y ].
	^ self class x: newX y: newY