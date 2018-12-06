tests
testDivision6
	"multiplication and division of the same argument makes identity"
	| p1 p2 |
	p1 := 1 _, -2.
	p2 := 4 _, 4.
	self assert: p1 * p2 // p2 equals: p1