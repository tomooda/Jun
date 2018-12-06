tests
testMultiplication2
	"multiplying unity makes identity"

	| p1 unity |
	p1 := 1 _ , -2 _ , 3.
	unity := Jun3dPoint unity.
	self assert: p1 * unity equals: p1