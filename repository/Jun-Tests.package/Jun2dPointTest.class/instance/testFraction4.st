tests
testFraction4
	"dividing zero is prohibited"

	| p zero |
	p := 1 _, -2.
	zero := Jun2dPoint zero.
	self should: [ p / zero ] raise: ZeroDivide