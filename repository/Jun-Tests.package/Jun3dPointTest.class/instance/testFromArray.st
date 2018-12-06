tests
testFromArray
	| p |
	p := Jun3dPoint fromArray: #(1 -2 3).
	self assert: 1.0 equals: p x.
	self assert: -2.0 equals: p y.
	self assert: 3.0 equals: p z