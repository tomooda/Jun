tests
testEquals
	| zero unity |
	zero := Jun2dTransformation zero.
	unity := Jun2dTransformation unity.
	self assert: Jun2dTransformation unity = unity.
	self assert: Jun2dTransformation zero = zero.
	self deny: Jun2dTransformation unity = zero.
	self deny: Jun2dTransformation zero = unity.
