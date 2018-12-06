tests
testAddition2
	"adding zero makes the identity"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self assert: p + zero equals: p