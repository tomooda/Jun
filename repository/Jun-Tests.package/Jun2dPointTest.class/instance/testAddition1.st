tests
testAddition1
	" adding a poin to point is point with added members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 _, y1.
	p2 := x2 _, y2.
	self assert: p1 + p2 equals: (Jun2dPoint x: x1 + x2 y: y1 + y2)