tests
testSubtraction4
	"subtracting zero makes identity"

	| p zero |
	p := 1 _, -2.
	zero := Jun2dPoint zero.
	self assert: p - zero equals: p