tests
testEquals
	| zero unity |
	zero := Jun3dTransformation zero.
	unity := Jun3dTransformation unity.
	self assert: Jun3dTransformation unity = unity.
	self assert: Jun3dTransformation zero = zero.
	self deny: Jun3dTransformation unity = zero.
	self deny: Jun3dTransformation zero = unity.
