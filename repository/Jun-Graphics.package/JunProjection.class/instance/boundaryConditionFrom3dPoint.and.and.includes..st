boundary
boundaryConditionFrom3dPoint: aJun3dPoint1 and: aJun3dPoint2 and: aJun3dPoint3 includes: aJun3dPoint4
	| plane leftHand a b c d |
	plane := JunPlane on: aJun3dPoint1 on: aJun3dPoint2 on: aJun3dPoint3.
	plane isNil
		ifTrue: [ ^ [ :p | false ] ].
	a := plane a.
	b := plane b.
	c := plane c.
	d := plane d.
	leftHand := a * aJun3dPoint4 x + (b * aJun3dPoint4 y) + (c * aJun3dPoint4 z) + d.
	leftHand < 0
		ifTrue: [ ^ [ :p | a * p x + (b * p y) + (c * p z) + d < 0 ] ].
	leftHand > 0
		ifTrue: [ ^ [ :p | a * p x + (b * p y) + (c * p z) + d > 0 ] ].
	leftHand = 0
		ifTrue: [ ^ [ :p | a * p x + (b * p y) + (c * p z) + d = 0 ] ]