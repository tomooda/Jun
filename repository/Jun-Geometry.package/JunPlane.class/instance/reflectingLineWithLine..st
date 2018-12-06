functions
reflectingLineWithLine: aLine
	| intersectingPoint reflectingPoint reflectingVector |
	intersectingPoint := self intersectingPointWithLine: aLine.
	intersectingPoint isNil
		ifTrue: [ 
			reflectingPoint := aLine last.
			reflectingVector := aLine last - aLine first ]
		ifFalse: [ 
			(self containsPoint: aLine first)
				ifTrue: [ 
					| footPoint |
					footPoint := self nearestPointFromPoint: aLine last.
					reflectingPoint := aLine first.
					reflectingVector := ((aLine last to: footPoint) atT: 2) - reflectingPoint ]
				ifFalse: [ 
					| nearPoint farPoint |
					nearPoint := self nearestPointFromPoint: aLine first.
					farPoint := (nearPoint to: intersectingPoint) atT: 2.
					reflectingPoint := farPoint - (nearPoint - aLine first).
					(self whichSide: aLine first) >= 0
						ifTrue: [ reflectingVector := ((intersectingPoint to: reflectingPoint) normalized atT: aLine length) - intersectingPoint ]
						ifFalse: [ reflectingVector := ((reflectingPoint to: intersectingPoint) normalized atT: aLine length) - reflectingPoint ] ] ].
	^ aLine class from: reflectingPoint to: reflectingPoint + reflectingVector