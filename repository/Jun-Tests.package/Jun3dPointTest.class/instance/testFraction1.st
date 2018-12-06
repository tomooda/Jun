tests
testFraction1
	" dividing a point over point is point with divided members"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _ , y1 _ , z1.
	p2 := x2 _ , y2 _ , z2.
	self
		assert: ((Jun3dPoint x: x1 / x2 y: y1 / y2 z: z1 / z2) equal: p1 / p2)