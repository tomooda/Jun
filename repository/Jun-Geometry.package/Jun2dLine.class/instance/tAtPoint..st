accessing
tAtPoint: aPoint
	| dominator x y |
	dominator := f squared + g squared.
	dominator < self class accuracy
		ifTrue: [ ^ self error: 'can''t define a line' ].
	x := aPoint x - x0.
	y := aPoint y - y0.
	^ (f * x + (g * y)) / dominator