tests
testFromArray
	| p |
	p := Jun2dPoint fromArray: #(1 -2).
	self assert: 1.0 equals: p x.
	self assert: -2.0 equals: p y