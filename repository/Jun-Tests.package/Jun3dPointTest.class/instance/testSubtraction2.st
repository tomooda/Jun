tests
testSubtraction2
	"subtraction is adding negated"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -4 _ , 5 _ , 6.
	self assert: p1 - p2 equals: p1 + p2 negated