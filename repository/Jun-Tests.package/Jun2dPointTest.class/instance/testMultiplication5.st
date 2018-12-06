tests
testMultiplication5
	"multiplication is distributable"

	| p1 p2 p3 |
	p1 := 1 _, -2.
	p2 := -2 _, 3.
	p3 := 10 _, 20.
	self assert: p1 * p2 * p3 equals: p1 * (p2 * p3)