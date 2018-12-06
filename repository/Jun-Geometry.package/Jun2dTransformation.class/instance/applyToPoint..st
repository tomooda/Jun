applying transformation
applyToPoint: aPoint
	| point nx ny scale |
	point := Jun2dPoint coerce: aPoint.
	nx := point x * a + (point y * c) + m.
	ny := point x * b + (point y * d) + n.
	scale := point x * p + (point y * q) + s.
	scale isZero
		ifTrue: [ scale := self class accuracy ].
	^ Jun2dPoint x: nx / scale y: ny / scale