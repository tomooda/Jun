tests
testSubtraction4
	"subtracting zero makes identity"

	| p zero |
	p := 1 _ , -2 _ , 3.
	zero := Jun3dPoint zero.
	self assert: p - zero equals: p