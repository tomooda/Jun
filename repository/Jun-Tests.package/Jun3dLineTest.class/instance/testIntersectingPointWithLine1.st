tests
testIntersectingPointWithLine1
	| t line1 line2 |
	t := (Jun3dTransformation rotate: 30 asDegrees) product: (Jun3dTransformation translate: 2 _, -3 _, 4).
	line1 := (-1 _, -2 _, 0 to: 1 _, 2 _, 0) transform: t.
	line2 := (3 _, -4 _, 0 to: -3 _, 4 _, 0) transform: t.
	self assert: (line1 intersectingPointWithLine: line2) equals: (0 _, 0 _, 0 transform: t)