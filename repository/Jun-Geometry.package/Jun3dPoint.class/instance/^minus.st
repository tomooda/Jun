arithmetic
- aPoint
	(aPoint isKindOf: self class)
		ifTrue: [ ^ self class x: x - aPoint x y: y - aPoint y z: z - aPoint z ].
	^ self retry: #- coercing: aPoint