functions
angleWithLine: aLine
	"(0 , 0 to: 1 , 1) angleWithLine: (0 , 0 to: -1 , -1)."

	| theLine denominator numerator gamma |
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun2dLine from: aLine first to: aLine last ].
	denominator := (f squared + g squared) * (theLine f squared + theLine g squared).
	denominator := denominator sqrt.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'unexpected line parameters' ].
	numerator := f * theLine f + (g * theLine g).
	gamma := (numerator / denominator max: -1.0) min: 1.0.
	^ JunAngle fromRad: gamma arcCos