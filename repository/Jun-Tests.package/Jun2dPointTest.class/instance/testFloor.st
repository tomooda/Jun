tests
testFloor
	"floor of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x _, y) floor equals: x floor _, y floor