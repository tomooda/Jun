tests
testFromPoint3
	| p0 p |
	p0 := 1 @ -2.
	p := Jun2dPoint fromPoint: p0.
	self assert: p x equals: p0 x.
	self assert: p y equals: p0 y