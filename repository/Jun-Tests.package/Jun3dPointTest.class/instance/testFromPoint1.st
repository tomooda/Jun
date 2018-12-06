tests
testFromPoint1
	| p0 p |
	p0 := 1 _ , -2 _ , 3.
	p := Jun3dPoint fromPoint: p0.
	self assert: p equals: p0