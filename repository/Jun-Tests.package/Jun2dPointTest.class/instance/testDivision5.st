tests
testDivision5
	"dividing zero makes zero"

	| p zero |
	p := 1 _, -2.
	zero := Jun2dPoint zero.
	self assert: zero // p equals: zero