tests
testSubtraction5
	"subtracting from zero makes negation"

	| p zero |
	p := 1 _ , -2 _ , 3.
	zero := Jun3dPoint zero.
	self assert: zero - p equals: -1 _ , 2 _ , -3