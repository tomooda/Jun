tests
testApplyToPoint
	| t p |
	t := Jun3dTransformation scale: 2.
	p := 2_, -3_, 4.
	self assert: (t applyToPoint: p) equals: p * 2