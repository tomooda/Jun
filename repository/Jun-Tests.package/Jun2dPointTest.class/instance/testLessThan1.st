tests
testLessThan1
	| p1 p2 |
	p1 := 2 _, -3.
	p2 := 3 _, -2.
	self assert: p1 < p2