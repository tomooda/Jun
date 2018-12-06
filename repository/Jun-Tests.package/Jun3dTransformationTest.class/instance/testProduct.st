tests
testProduct
	| t1 t2 p |
	t1 := Jun3dTransformation translate: 2 _ , -3 _ , 4.
	t2 := Jun3dTransformation rotate: 30 asDegrees.
	p := 13 _ , 17 _ , 19.
	self
		assert: ((t1 product: t2) in: [ :t | p transform: t ])
		equals: ((p transform: t1) transform: t2)