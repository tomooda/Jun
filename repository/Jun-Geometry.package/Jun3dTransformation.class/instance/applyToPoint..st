applying transformation
applyToPoint: aPoint
	| point nx ny nz scale |
	aPoint class == Jun3dPoint
		ifTrue: [ point := aPoint ]
		ifFalse: [ point := Jun3dPoint coerce: aPoint ].
	nx := point x * a + (point y * d) + (point z * g) + l.
	ny := point x * b + (point y * e) + (point z * h) + m.
	nz := point x * c + (point y * f) + (point z * i) + n.
	scale := point x * p + (point y * q) + (point z * r) + s.
	scale = 0.0
		ifTrue: [ scale := self class accuracy ].
	^ Jun3dPoint x: nx / scale y: ny / scale z: nz / scale