functions
intersectingPointWithLine: aLine
	"(0 , 0 to: 1 , 1) intersectingPointWithLine: (0 , 2 to: 6 , 0)."

	| t |
	t := self intersectingTWithLine: aLine.
	t isNil
		ifTrue: [ ^ nil ].
	^ self atT: t