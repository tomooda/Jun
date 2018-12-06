tests
testLessThan3
	| p1 p2 |
	p1 := 2 _, -3 _, 4.
	p2 := 3 _, -3 _, 5.
	self deny: p1 < p2