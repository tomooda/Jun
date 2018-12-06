functions
distanceFromPoint: aPoint
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		distanceFromPoint: 0 , 0 , 2."

	| thePoint denominator numerator |
	thePoint := Jun3dPoint coerce: aPoint.
	denominator := a squared + b squared + c squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'unexpect plane parameters' ].
	numerator := (a * thePoint x + (b * thePoint y) + (c * thePoint z) + d) squared.
	^ (numerator / denominator) sqrt