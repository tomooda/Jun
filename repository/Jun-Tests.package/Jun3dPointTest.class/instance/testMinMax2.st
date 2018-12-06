tests
testMinMax2
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := 5 _, -10 _, 6.
	max := 10 _, -5 _, 10.
	self assert: (p1 min: max max: min) equals: min x _, max y _, min z