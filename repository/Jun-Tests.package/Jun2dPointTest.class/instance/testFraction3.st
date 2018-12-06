tests
testFraction3
	"dividing itself makes unity"

	| p |
	p := 1 _, -2.
	self assert: (p / p) equals: Jun2dPoint unity