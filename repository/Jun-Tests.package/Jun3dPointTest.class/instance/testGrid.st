tests
testGrid
	"floor of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self assert: (x _, y _, z grid: 1.0) equals: x rounded _, y rounded _, z rounded