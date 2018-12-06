tests
testFraction5
	"dividing zero makes zero"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self assert: zero / p equals: zero