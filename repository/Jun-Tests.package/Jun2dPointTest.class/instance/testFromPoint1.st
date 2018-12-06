tests
testFromPoint1
	| p0 p |
	p0 := 1_, -2.
	p := Jun2dPoint fromPoint: p0.
	self assert: p equals: p0