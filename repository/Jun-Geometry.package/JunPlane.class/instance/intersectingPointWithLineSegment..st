functions
intersectingPointWithLineSegment: aLine
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingPointWithLineSegment: (0 , 0 , -2 to: 0 , 0 , 2)."

	"(0 , 0 , 0 plane: 1 , 0 , 0 and: 0 , 1 , 0) 
		intersectingPointWithLineSegment: (0 , 0 , -2 to: 0 , 0 , -1)."

	| thePoint |
	thePoint := self intersectingPointWithLine: aLine.
	thePoint isNil
		ifTrue: [ ^ nil ].
	^ (aLine lineSegmentContainsPoint: thePoint)
		ifTrue: [ thePoint ]
		ifFalse: [ nil ]