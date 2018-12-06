tests
testCreation3
	| p |
	p := Jun3dPoint x: 1.0 y: -2.0.
	self assert: p x equals: 1.0.
	self assert: p y equals: -2.0