tests
testAlignPoints
	| maps t |
	maps := Array
		with: (0 _ , 0 _ , 0) -> (0 _ , -1 _ , 0)
		with: (1 _ , 0 _ , 0) -> (-1 _ , 0 _ , 0)
		with: (0 _ , 2 _ , 0) -> (0 _ , 1 _ , 0)
		with: (0 _ , 0 _ , 1) -> (0 _ , 0 _ , 1).
	t := Jun3dTransformation alignPoints: maps.
	maps
		do: [ :assoc | self assert: (assoc key transform: t) equals: assoc value ]