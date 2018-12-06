tests
testMinMax3
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := -10_, -1_, -10.
	max := -5 _, 10 _, 1.
	self assert: (p1 min: max max: min) equals: max x_, min y_, max z