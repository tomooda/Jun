tests
testAsTranslation
	| translation transformation |
	translation := 2 _ , -3 _ , 4.
	transformation := Jun3dTransformation translate: translation.
	self assert: transformation asTranslation equals: translation