tests
testMultiplication4
	"multiplication is exxchangeable"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -2 _ , 3 _ , 4.
	self assert: (p1 * p2 equal: p2 * p1)