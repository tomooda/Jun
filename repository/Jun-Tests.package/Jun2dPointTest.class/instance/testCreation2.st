tests
testCreation2
	| p1 |
	p1 := 1 _, -2.
	self assert: p1 x isFloat.
	self assert: p1 y isFloat.
	self assert: p1 x equals: 1.0.
	self assert: p1 y equals: -2.0