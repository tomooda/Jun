functions
lineSegmentDistanceFromPoint: aPoint
	"(0 , 0 , 0 to: 1 , 1 , 1) lineSegmentDistanceFromPoint: -1 , 1 , 1."

	| thePoint denominator x y z pointOnMe t |
	thePoint := Jun3dPoint coerce: aPoint.
	denominator := f squared + g squared + h squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	x := aPoint x - x0.
	y := aPoint y - y0.
	z := aPoint z - z0.
	t := (f * x + (g * y) + (h * z)) / denominator.
	(t < 0.0 or: [ 1 < t ])
		ifTrue: [ 
			t < 0.0
				ifTrue: [ pointOnMe := self atT: 0.0 ]
				ifFalse: [ pointOnMe := self atT: 1.0 ] ]
		ifFalse: [ pointOnMe := self atT: t ].
	^ thePoint distance: pointOnMe