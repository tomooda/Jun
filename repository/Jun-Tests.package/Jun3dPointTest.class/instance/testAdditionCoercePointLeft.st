tests
testAdditionCoercePointLeft
	"coerce a number"

	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := -4 @ 5.
	self assert: p2 + p1 equals: (Jun3dPoint x: p1 x + p2 x y: p1 y + p2 y z: p1 z)