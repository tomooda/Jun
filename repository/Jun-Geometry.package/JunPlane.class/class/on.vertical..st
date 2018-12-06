instance creation
on: aPoint vertical: aLine
	"JunPlane 
		on: (0 , 0 , 0) 
		vertical: ((0 , 0 , 0) to: (1 , 1 , 1))."

	| thePoint theLine aPlane p1 firstLine threeAxes firstAxis aTransformation p2 secondLine secondAxis p3 thirdLine thirdAxis |
	thePoint := Jun3dPoint coerce: aPoint.
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	aPlane := self new.
	aPlane setP1: thePoint.
	aPlane setA: theLine f.
	aPlane setB: theLine g.
	aPlane setC: theLine h.
	aPlane setD: (theLine f * thePoint x + (theLine g * thePoint y) + (theLine h * thePoint z)) negated.
	aPlane a squared + aPlane b squared + aPlane c squared < self accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	p1 := thePoint.
	firstLine := theLine.
	threeAxes := Array with: (0 _, 0 _, 0 to: 1 _, 0 _, 0) with: (0 _, 0 _, 0 to: 0 _, 1 _, 0) with: (0 _, 0 _, 0 to: 0 _, 0 _, 1).
	firstAxis := threeAxes detect: [ :line | (firstLine isParallelWithLine: line) not ].
	aTransformation := Jun3dTransformation translate: firstAxis to.
	thePoint := nil.
	[ thePoint isNil or: [ thePoint equal: p1 ] ]
		whileTrue: [ 
			firstLine := firstLine transform: aTransformation.
			thePoint := aPlane intersectingPointWithLine: firstLine ].
	p2 := thePoint.
	secondLine := firstLine.
	threeAxes := Array with: (0 _, 0 _, 0 to: 0 _, 1 _, 0) with: (0 _, 0 _, 0 to: 0 _, 0 _, 1) with: (0 _, 0 _, 0 to: 1 _, 0 _, 0).
	secondAxis := threeAxes
		detect: [ :line | (secondLine isParallelWithLine: line) not and: [ (line to = firstAxis to) not ] ].
	aTransformation := Jun3dTransformation translate: secondAxis to.
	thePoint := nil.
	[ thePoint isNil or: [ (thePoint equal: p2) or: [ thePoint equal: p1 ] ] ]
		whileTrue: [ 
			secondLine := secondLine transform: aTransformation.
			thePoint := aPlane intersectingPointWithLine: secondLine ].
	p3 := thePoint.
	((p1 to: p2) isParallelWithLine: (p1 to: p3))
		ifTrue: [ 
			thirdLine := firstLine.
			threeAxes := Array with: (0 _, 0 _, 0 to: 0 _, 0 _, 1) with: (0 _, 0 _, 0 to: 1 _, 0 _, 0) with: (0 _, 0 _, 0 to: 0 _, 1 _, 0).
			thirdAxis := threeAxes detect: [ :line | (line to = firstAxis to) not and: [ (line to = secondAxis to) not ] ].
			aTransformation := Jun3dTransformation translate: thirdAxis to.
			thePoint := nil.
			[ thePoint isNil or: [ thePoint equal: p2 ] ]
				whileTrue: [ 
					thirdLine := thirdLine transform: aTransformation.
					thePoint := aPlane intersectingPointWithLine: thirdLine ].
			p3 := thePoint ].
	[ 
	| normalUnitVector anotherUnitVector |
	normalUnitVector := aPlane normalUnitVector.
	anotherUnitVector := (self on: p1 on: p2 on: p3) normalUnitVector.
	(normalUnitVector equal: anotherUnitVector)
		ifTrue: [ 
			aPlane
				setP2: p2;
				setP3: p3 ]
		ifFalse: [ 
			aPlane
				setP2: p3;
				setP3: p2 ] ]
		on: Error
		do: [ :exception | 
			aPlane
				setP2: p2;
				setP3: p3 ].
	^ aPlane