tests
testFraction4
	"dividing zero is prohibited"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self should: [ p / zero ] raise: ZeroDivide