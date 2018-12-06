tests
testAbs2
	"abs of a point is the one with all abs numbers"

	| x y  p |
	x := 2.
	y := -3.
	p := x _, y.
	self assert: p abs equals: x abs _, y abs