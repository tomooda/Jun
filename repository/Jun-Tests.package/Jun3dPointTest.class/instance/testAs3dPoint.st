tests
testAs3dPoint
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _ , y _ , z.
	self assert: p as3dPoint equals: x _ , y _ , z