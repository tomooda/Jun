functions
lineSegmentIntersectingPointWithLineSegment: aLine
	"(0 , 0 to: 1 , 1) intersectingPointWithLine: (0 , 2 to: 6 , 0)."

	| intersectingPoint |
	intersectingPoint := self intersectingPointWithLine: aLine.
	^ (intersectingPoint notNil
		and: [ (self lineSegmentContainsPoint: intersectingPoint) and: [ aLine lineSegmentContainsPoint: intersectingPoint ] ])
		ifTrue: [ intersectingPoint ]
		ifFalse: [ nil ]