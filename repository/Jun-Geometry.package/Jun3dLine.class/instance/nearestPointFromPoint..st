functions
nearestPointFromPoint: aPoint
	"(0 , 0 , 0 to: 1 , 1 , 1) nearestPointFromPoint: -1 , 1 , 1."

	| thePoint denominator x y z t pointOnMe |
	thePoint := Jun3dPoint coerce: aPoint.
	denominator := f squared + g squared + h squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	x := thePoint x - x0.
	y := thePoint y - y0.
	z := thePoint z - z0.
	t := (f * x + (g * y) + (h * z)) / denominator.
	pointOnMe := self atT: t.
	^ pointOnMe