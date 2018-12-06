tests
testRounded
	"round of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self
		assert: (x _ , y _ , z) rounded
		equals: x rounded _ , y rounded _ , z rounded