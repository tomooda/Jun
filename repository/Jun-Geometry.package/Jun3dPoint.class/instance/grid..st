functions
grid: aPoint
	| newX newY newZ |
	(aPoint isKindOf: self class)
		ifFalse: [ ^ self retry: #grid: coercing: aPoint ].
	aPoint x = 0
		ifTrue: [ newX := 0 ]
		ifFalse: [ newX := self x roundTo: aPoint x ].
	aPoint y = 0
		ifTrue: [ newY := 0 ]
		ifFalse: [ newY := self y roundTo: aPoint y ].
	aPoint z = 0
		ifTrue: [ newZ := 0 ]
		ifFalse: [ newZ := self z roundTo: aPoint z ].
	^ self class x: newX y: newY z: newZ