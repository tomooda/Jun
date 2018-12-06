tests
testAsArray
	| t |
	t := (Jun2dTransformation translate: 2 _ , -3)
		product: (Jun2dTransformation rotate: 30 asDegrees).
	self
		assert: (t asArray in: [ :array | Jun2dTransformation fromArray: array ])
		equals: t