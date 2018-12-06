tests
testAddition4
	"addition is distributable"

	| p1 p2 p3 |
	p1 := 1 _, -2 _, 3.
	p2 := -2 _, 3 _, 4.
	p3 := 10 _, 20 _, -30.
	self assert: p1 + p2 + p3 equals: p1 + (p2 + p3)