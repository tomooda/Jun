functions
intersectingLineWithPlane: aPlane
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingLineWithPlane: 
			(0 , -2 , -2 plane: 0 , 2 , 0 and: 0 , 0 , 2)."

	| f g h denominator dc db ad x0 y0 z0 |
	f := b * aPlane c - (aPlane b * c).
	g := c * aPlane a - (aPlane c * a).
	h := a * aPlane b - (aPlane a * b).
	denominator := f squared + g squared + h squared.
	denominator < self class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	dc := d * aPlane c - (c * aPlane d).
	db := d * aPlane b - (b * aPlane d).
	ad := a * aPlane d - (d * aPlane a).
	x0 := (g * dc - (h * db)) / denominator.
	y0 := (f * dc + (h * ad)) negated / denominator.
	z0 := (f * db + (g * ad)) / denominator.
	^ Jun3dLine from: (Jun3dPoint x: x0 y: y0 z: z0) to: (Jun3dPoint x: x0 + f y: y0 + g z: z0 + h)