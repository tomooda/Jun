tests
testMinMax3
	| p1 min max |
	p1 := 2 _, -3.
	min := -10_, -1.
	max := -5 _, 10.
	self assert: (p1 min: max max: min) equals: max x _, min y