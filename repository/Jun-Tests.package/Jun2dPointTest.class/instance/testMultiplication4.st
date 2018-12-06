tests
testMultiplication4
	"multiplication is exxchangeable"
	| p1 p2 |
	p1 := 1 _, -2.
	p2 := -2 _, 3.
	self assert: (p1 * p2 equal: p2 * p1)