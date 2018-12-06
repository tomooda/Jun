tests
testZero
	| zero |
	zero := Jun3dPoint zero.
	self assert: zero x equals: 0.0.
	self assert: zero y equals: 0.0.
	self assert: zero z equals: 0.0