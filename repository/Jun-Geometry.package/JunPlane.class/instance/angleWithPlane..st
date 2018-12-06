functions
angleWithPlane: aPlane
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		angleWithPlane: 
			(0 , -2 , -2 plane: 0 , 2 , 0 and: 0 , 0 , 2)."

	| denominator numerator gamma |
	denominator := (a squared + b squared + c squared) * (aPlane a squared + aPlane b squared + aPlane c squared).
	denominator < self class accuracy
		ifTrue: [ self error: 'unexpected plane parameters' ].
	numerator := a * aPlane a + (b * aPlane b) + (c * aPlane c).
	gamma := (numerator / denominator sqrt max: -1.0) min: 1.0.
	^ JunAngle fromRad: gamma arcCos