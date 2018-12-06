utilities
torusRadius: torusRadius normalizedTheta: normalizedTheta tubeRadius: tubeRadius normalizedPhi: normalizedPhi 
	"JunGeometry torusRadius: (2/3) normalizedTheta: 0 tubeRadius: (1/3) normalizedPhi: 0."

	"
	x = (R + (r * cos(phi))) * cos(theta) 
	y = (R + (r * cos(phi))) * sin(theta) 
	z = r * sin(phi)
	"

	| theta phi x y z point |
	theta := JunAngle fromRad: self doublePi * normalizedTheta.
	phi := JunAngle fromRad: self doublePi * normalizedPhi.
	x := (torusRadius + (tubeRadius * phi cos)) * theta cos.
	y := (torusRadius + (tubeRadius * phi cos)) * theta sin.
	z := tubeRadius * phi sin.
	x abs < self accuracy ifTrue: [x := 0.0].
	y abs < self accuracy ifTrue: [y := 0.0].
	z abs < self accuracy ifTrue: [z := 0.0].
	point := x _, y _, z.
	^point