functions
intersectingPointsLine: aLine viewPoint: aPoint
	"(50 , 50 , -50 to: -50 , -50 , -50) 
		intersectingPointsLine: (-50 , 50 , 50 to: 50 , -50 , 50) 
		viewPoint: 0 , 0 , 100."

	| theLine thePoint planeI planeJ jf jt if it de t1 t2 p1 p2 |
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	thePoint := Jun3dPoint coerce: aPoint.
	planeI := JunPlane on: thePoint on: self from on: self to.
	planeI isNil
		ifTrue: [ ^ Array new ].
	planeJ := JunPlane on: thePoint on: theLine from on: theLine to.
	planeJ isNil
		ifTrue: [ ^ Array new ].
	jf := planeJ valueF: self from.
	jt := planeJ valueF: self to.
	if := planeI valueF: theLine from.
	it := planeI valueF: theLine to.
	(jf * jt < self class accuracy and: [ if * it < self class accuracy ])
		ifTrue: [ 
			(0.0 - jf) abs < self class accuracy
				ifTrue: [ 
					t1 := t2 := 0.0.
					p1 := self atT: t1.
					p2 := self atT: t2.
					^ Array with: p1 with: p2 ]
				ifFalse: [ 
					de := jf - jt.
					de = 0.0
						ifTrue: [ de := self class accuracy ].
					t1 := jf / de ].
			(0 - if) abs < self class accuracy
				ifTrue: [ 
					t1 := t2 := 0.0.
					p1 := theLine atT: t1.
					p2 := theLine atT: t2.
					^ Array with: p1 with: p2 ]
				ifFalse: [ 
					de := if - it.
					de = 0.0
						ifTrue: [ de := self class accuracy ].
					t2 := if / de ].
			p1 := self atT: t1.
			p2 := theLine atT: t2.
			^ Array with: p1 with: p2 ].
	^ Array new