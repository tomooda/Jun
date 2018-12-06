functions
intersectingTWithLine: aLine
	"(0 , 0 to: 1 , 1) intersectingPointWithLine: (0 , 2 to: 6 , 0)."

	| theLine yourF yourG denominator |
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun2dLine from: aLine first to: aLine last ].
	yourF := theLine f.
	yourG := theLine g.
	denominator := yourF * g - (f * yourG).
	denominator abs < self class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	^ (yourF * (theLine y0 - y0) - (yourG * (theLine x0 - x0))) / denominator