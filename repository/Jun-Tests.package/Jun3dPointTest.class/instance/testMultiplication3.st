tests
testMultiplication3
	"multiplying zero makes zero"

	| p1 zero |
	p1 := 1 _ , -2 _ , 3.
	zero := Jun3dPoint zero.
	self assert: p1 * zero equals: zero