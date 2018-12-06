tests
testDivision3
	"dividing itself makes unity"

	| p |
	p := 1 _, -2 _, 3.
	self assert: (p // p) equals: Jun3dPoint unity