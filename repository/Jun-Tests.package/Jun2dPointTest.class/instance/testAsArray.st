tests
testAsArray
	"array of its components"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _, y.
	self
		assert: p asArray
		equals:
			{x.
			y}