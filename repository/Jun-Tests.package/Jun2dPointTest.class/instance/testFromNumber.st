tests
testFromNumber
	| p |
	p := Jun2dPoint fromNumber: 3 / 2.
	self assert: p x equals: 1.5.
	self assert: p y equals: 1.5