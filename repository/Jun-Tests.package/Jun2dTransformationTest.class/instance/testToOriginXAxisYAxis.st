tests
testToOriginXAxisYAxis
	| o vx vy t |
	o := 1 _, 2.
	vx := 2 _, 3.
	vy := -3 _, 2.
	t := Jun2dTransformation toOrigin: o xAxis: vx yAxis: vy.
	self assert: (4 _, -5 transform: t) equals: vx * 4 + (vy * -5) + o