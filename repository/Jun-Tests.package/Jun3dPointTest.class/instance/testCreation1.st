tests
testCreation1
	| p1 |
	p1 := Jun3dPoint x: 1 y: -2 z: 3.
	self assert: p1 x isFloat.
	self assert: p1 y isFloat.
	self assert: p1 z isFloat.
	self assert: p1 x equals: 1.0.
	self assert: p1 y equals: -2.0.
	self assert: p1 z equals: 3.0