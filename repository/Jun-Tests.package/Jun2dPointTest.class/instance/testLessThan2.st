tests
testLessThan2
	| p1 p2 |
	p1 := 2 _, -3.
	p2 := 2 _, -2.
	self deny: p1 < p2