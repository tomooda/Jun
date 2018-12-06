tests
testContainsLineSegment2
	| line1 line2 |
	line1 := 0_, 0_, 0 to: 1_, 2_, 3.
	line2 := 0.1_, 0.2_, 0.3 to: 0.5_, 1_, 1.5.
	self deny: (line2 containsLineSegment: line1)