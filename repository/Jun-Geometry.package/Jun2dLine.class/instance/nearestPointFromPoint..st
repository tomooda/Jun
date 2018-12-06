functions
nearestPointFromPoint: aPoint
	"(0 , 0 to: 1 , 1) nearestPointFromPoint: -1 , -1."

	| thePoint denominator x y |
	thePoint := Jun2dPoint coerce: aPoint.
	denominator := f squared + g squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	x := thePoint x - x0.
	y := thePoint y - y0.
	^ self atT: (f * x + (g * y)) / denominator