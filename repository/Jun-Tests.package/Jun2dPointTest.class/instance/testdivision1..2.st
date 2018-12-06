tests
testdivision1
	" dividing a point over point is point with divided members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 _, y1.
	p2 := x2 _, y2.
	self assert: ((Jun2dPoint x: x1 // x2 y: y1 // y2) equal: p1 // p2)