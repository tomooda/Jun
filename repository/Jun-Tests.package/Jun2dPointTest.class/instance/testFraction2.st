tests
testFraction2
	"division is multiplying reciprocal"

	| p1 p2 |
	p1 := 1 _, -2.
	p2 := -4 _, 5.
	self assert: p1 / p2 equals: p1 * p2 reciprocal