instance creation
on: aPoint1 on: aPoint2 on: aPoint3
	"JunPlane on: (0 , 0 , 0) on: (0 , 1 , 0) on: (1 , 1 , 1)."

	| thePoint1 thePoint2 thePoint3 aPlane |
	thePoint1 := Jun3dPoint coerce: aPoint1.
	thePoint2 := Jun3dPoint coerce: aPoint2.
	thePoint3 := Jun3dPoint coerce: aPoint3.
	thePoint1 = thePoint2
		ifTrue: [ ^ nil ].
	thePoint1 = thePoint3
		ifTrue: [ ^ nil ].
	thePoint2 = thePoint3
		ifTrue: [ ^ nil ].
	aPlane := self new.
	aPlane setP1: thePoint1.
	aPlane setP2: thePoint2.
	aPlane setP3: thePoint3.
	thePoint2 := thePoint2 - thePoint1.
	thePoint3 := thePoint3 - thePoint1.
	aPlane setA: thePoint2 y * thePoint3 z - (thePoint2 z * thePoint3 y).
	aPlane setB: thePoint2 z * thePoint3 x - (thePoint2 x * thePoint3 z).
	aPlane setC: thePoint2 x * thePoint3 y - (thePoint2 y * thePoint3 x).
	aPlane setD: (thePoint1 x * aPlane a + (thePoint1 y * aPlane b) + (thePoint1 z * aPlane c)) negated.
	^ aPlane