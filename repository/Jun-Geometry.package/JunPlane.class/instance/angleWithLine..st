functions
angleWithLine: aLine
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		angleWithLine: (0 , 0 , -2 to: 0 , 0 , 2)."

	| theLine denominator numerator gamma |
	(aLine isKindOf: Jun3dLine)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	denominator := (a squared + b squared + c squared) * (theLine f squared + theLine g squared + theLine h squared).
	denominator := denominator sqrt.
	denominator < self class accuracy
		ifTrue: [ self error: 'unexpected line or plane parameters' ].
	numerator := a * theLine f + (b * theLine g) + (c * theLine h).
	gamma := (numerator / denominator max: -1.0) min: 1.0.
	^ JunAngle fromRad: Float pi / 2.0 - gamma arcCos