tests
testAsArray
	| t |
	t := (Jun3dTransformation translate: 2 _ , -3 _ , 4)
		product: (Jun3dTransformation rotate: 30 asDegrees).
	self
		assert: (t asArray in: [ :array | Jun3dTransformation fromArray: array ])
		equals: t