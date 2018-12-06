tests
testFloor
	"floor of all components"
	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self assert: (x _, y _, z) floor equals: x floor _, y floor _, z floor