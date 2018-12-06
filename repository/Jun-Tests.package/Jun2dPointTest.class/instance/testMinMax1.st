tests
testMinMax1
	| p1 min max |
	p1 := 2 _, -3.
	min := -10 _, -10.
	max := 10 _, 10.
	self assert: (p1 min: max max: min) equals: p1