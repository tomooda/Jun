tests
testMultiplication2
	"multiplying unity makes identity"
	| p1 unity |
	p1 := 1_, -2.
	unity := Jun2dPoint unity.
	self assert: p1 * unity equals: p1