tests
testZero
	| zero |
	zero := Jun2dPoint zero.
	self assert: zero x equals: 0.0.
	self assert: zero y equals: 0.0