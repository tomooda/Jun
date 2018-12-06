tests
testMinMax2
	| p1 min max |
	p1 := 2 _, -3.
	min := 5 _, -10.
	max := 10 _, -5.
	self assert: (p1 min: max max: min) equals: min x_, max y