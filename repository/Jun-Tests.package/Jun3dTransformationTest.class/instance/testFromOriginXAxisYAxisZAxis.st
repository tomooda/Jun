tests
testFromOriginXAxisYAxisZAxis
	| o x y z t |
	o := 0 _ , 0 _ , 20.
	x := 1 _ , 0 _ , 0.
	y := 0 _ , 1 _ , 0.
	z := 0 _ , 0 _ , 1.
	t := Jun3dTransformation
		fromOrigin: o
		xAxis: x
		yAxis: y
		zAxis: z.
	self assert: (o transform: t) equals: 0 _ , 0 _ , 0.
	self assert: (x + o transform: t) equals: 1 _ , 0 _ , 0.
	self assert: (y + o transform: t) equals: 0 _ , 1 _ , 0.
	self assert: (z + o transform: t) equals: 0 _ , 0 _ , 1