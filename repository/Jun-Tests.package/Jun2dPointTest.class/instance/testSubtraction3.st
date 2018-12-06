tests
testSubtraction3
	"subtracting itself makes zero"

	| p |
	p := 1 _, -2.
	self assert: (p - p) isZero