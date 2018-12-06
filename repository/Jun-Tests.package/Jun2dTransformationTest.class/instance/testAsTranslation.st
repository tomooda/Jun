tests
testAsTranslation
	| translation transformation |
	translation := 2 _, -3.
	transformation := Jun2dTransformation translate: translation.
	self assert: transformation asTranslation equals: translation