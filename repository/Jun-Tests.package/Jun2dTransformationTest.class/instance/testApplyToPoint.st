tests
testApplyToPoint
	| t p |
	t := Jun2dTransformation scale: 2.
	p := 2 _ , -3.
	self assert: (t applyToPoint: p) equals: p * 2