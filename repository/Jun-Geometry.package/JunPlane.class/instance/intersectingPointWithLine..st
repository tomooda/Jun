functions
intersectingPointWithLine: aLine
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingPointWithLine: (0 , 0 , -2 to: 0 , 0 , 2)."

	"(0 , 0 , 0 plane: 1 , 0 , 0 and: 0 , 1 , 0) 
		intersectingPointWithLine: (0 , 0 , -2 to: 0 , 0 , -1)."

	| theLine denominator thePoint numerator |
	(aLine isKindOf: Jun3dLine)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	denominator := a * theLine f + (b * theLine g) + (c * theLine h).
	denominator abs < aLine class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	numerator := (a * theLine x0 + (b * theLine y0) + (c * theLine z0) + d) negated.
	thePoint := Jun3dPoint
		x: theLine x0 + (theLine f * numerator / denominator)
		y: theLine y0 + (theLine g * numerator / denominator)
		z: theLine z0 + (theLine h * numerator / denominator).
	^ thePoint