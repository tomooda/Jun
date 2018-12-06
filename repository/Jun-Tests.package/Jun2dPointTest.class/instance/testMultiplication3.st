tests
testMultiplication3
	"multiplying zero makes zero"
	| p1 zero |
	p1 := 1_, -2.
	zero := Jun2dPoint zero.
	self assert: p1 * zero equals: zero