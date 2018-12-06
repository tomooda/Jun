utilities
mobiusRadius: mobiusRadius normalizedTheta: normalizedTheta stripRadius: stripRadius normalizedRadius: normalizedRadius
	"JunGeometry mobiusRadius: (2/3) normalizedTheta: 0 stripRadius: (1/3) normalizedRadius: 1."

	"
	x = (R + (r * cos(theta / 2))) * cos(theta) 
	y = (R + (r * cos(theta / 2))) * sin(theta) 
	z = r * sin(theta / 2)
	"

	| theta phi point center x y z |
	theta := JunAngle fromRad: self doublePi * normalizedTheta.
	phi := theta * 2.0 reciprocal.
	x := (mobiusRadius + (stripRadius * phi cos)) * theta cos.
	y := (mobiusRadius + (stripRadius * phi cos)) * theta sin.
	z := stripRadius * phi sin.
	x abs < self accuracy
		ifTrue: [ x := 0.0 ].
	y abs < self accuracy
		ifTrue: [ y := 0.0 ].
	z abs < self accuracy
		ifTrue: [ z := 0.0 ].
	point := x _ , y _ , z.
	x := mobiusRadius * theta cos.
	y := mobiusRadius * theta sin.
	x abs < self accuracy
		ifTrue: [ x := 0.0 ].
	y abs < self accuracy
		ifTrue: [ y := 0.0 ].
	center := x _ , y _ , 0.0.
	^ (center to: point) atT: normalizedRadius