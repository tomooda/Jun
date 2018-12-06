tests
testBetween
	| p1 p2 |
	p1 := 2 _, -3.
	p2 := -4 _, 5.
	self
		assert:
			((Jun2dLine between: p1 and: p2) in: [ :line | (line to - line from dotProduct: p2 - p1) < Jun2dLine accuracy ])