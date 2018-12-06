tests
testAbs1
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := -2.
	y := 3.
	z := 4.
	p := x _, y _, z.
	self assert: p abs equals: x abs _, y abs _, z abs