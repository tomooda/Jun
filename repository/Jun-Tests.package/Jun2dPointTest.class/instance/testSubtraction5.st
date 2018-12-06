tests
testSubtraction5
	"subtracting from zero makes negation"

	| p zero |
	p := 1 _, -2.
	zero := Jun2dPoint zero.
	self assert: zero - p equals: -1 _, 2