tests
testAddition3
	"addition is exxchangeable"

	| p1 p2 |
	p1 := 1 _ , -2.
	p2 := -2 _ , 3.
	self assert: p1 + p2 equals: p2 + p1