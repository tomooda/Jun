tests
testMinMax4
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := -10_, -1_, 5.
	max := -5 _, 10 _, 10.
	self assert: (p1 min: max max: min) equals: max x _, min y _, min z