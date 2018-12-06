tests
testFromPoint2
	| p0 p |
	p0 := 1 _, -2.
	p := Jun2dPoint fromPoint: p0.
	self assert: p x equals: p0 x.
	self assert: p y equals: p0 y