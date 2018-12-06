functions
lineSegmentNearestPointFromPoint: aPoint
	"(0 , 0 to: 1 , 1) lineSegmentNearestPointFromPoint: -1 , -1."

	| thePoint denominator x y t |
	thePoint := Jun2dPoint coerce: aPoint.
	denominator := f squared + g squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	x := thePoint x - x0.
	y := thePoint y - y0.
	t := (f * x + (g * y)) / denominator.
	t < 0
		ifTrue: [ t := 0.0 ].
	t > 1
		ifTrue: [ t := 1.0 ].
	^ self atT: t