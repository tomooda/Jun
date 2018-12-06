tests
testToOriginXAxisYAxisZAxis
	| o vx vy vz t |
	o := 1 _ , 2.
	vx := 2 _ , 3 _ , 4.
	vy := -3 _ , 2 _ , 0.
	vz := vx product: vy.
	vy := vz product: vx.
	t := Jun3dTransformation
		toOrigin: o
		xAxis: vx
		yAxis: vy
		zAxis: vz.
	self
		assert: (4 _ , -5 _ , 6 transform: t)
		equals: vx * 4 + (vy * -5) + (vz * 6) + o