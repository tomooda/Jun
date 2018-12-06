tests
testGrid
	"floor of all components"

	| x y  |
	x := 1.1.
	y := -2.1.
	self assert: (x _, y grid: 1.0) equals: x rounded _, y rounded