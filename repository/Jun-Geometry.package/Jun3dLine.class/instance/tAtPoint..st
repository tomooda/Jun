private
tAtPoint: aPoint
	| dominator x y z |
	dominator := f squared + g squared + h squared.
	dominator < self class accuracy
		ifTrue: [ ^ self error: 'Can''t define a line' ].
	x := aPoint x - x0.
	y := aPoint y - y0.
	z := aPoint z - z0.
	^ (f * x + (g * y) + (h * z)) / dominator