functions
intersectingPointWithPlane: aPlane1 withPlane: aPlane2
	"(-2 , -2 , -2 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingPointWithPlane: (-2 , -2 , -2 plane: 0 , 2 , 0 and: 0 , 0 , 2)
		withPlane: (-2 , -2 , -2 plane: 2 , 0 , 0 and: 0 , 0 , 2)."

	| bc ac ab denominator dc db ad |
	bc := aPlane1 b * aPlane2 c - (aPlane2 b * aPlane1 c).
	ac := aPlane1 a * aPlane2 c - (aPlane2 a * aPlane1 c).
	ab := aPlane1 a * aPlane2 b - (aPlane2 a * aPlane1 b).
	denominator := a * bc - (b * ac) + (c * ab).
	denominator abs < self class accuracy
		ifTrue: [ 
			"parallel two planes"
			^ nil ].
	dc := aPlane1 d * aPlane2 c - (aPlane2 d * aPlane1 c).
	db := aPlane1 d * aPlane2 b - (aPlane2 d * aPlane1 b).
	ad := aPlane1 a * aPlane2 d - (aPlane2 a * aPlane1 d).
	^ Jun3dPoint
		x: (b * dc - (d * bc) - (c * db)) / denominator
		y: (d * ac - (a * dc) - (c * ad)) / denominator
		z: (b * ad + (a * db) - (d * ab)) / denominator