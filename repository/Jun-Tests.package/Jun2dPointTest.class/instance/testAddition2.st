tests
testAddition2
	"adding zero makes the identity"

	| p zero |
	p := 1 _ , -2.
	zero := Jun2dPoint zero.
	self assert: p + zero equals: p