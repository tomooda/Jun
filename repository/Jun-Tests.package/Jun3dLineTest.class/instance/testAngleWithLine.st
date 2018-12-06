tests
testAngleWithLine
	| phi angle1 angle2 line1 line2 |
	phi := 45 asDegrees.
	angle1 := 30 asDegrees.
	angle2 := 125 asDegrees.
	line1 := Jun3dLine from: (Jun3dPoint rho: 2 phi: phi theta: angle1) to: (Jun3dPoint rho: 3 phi: phi theta: angle1).
	line2 := Jun3dLine from: (Jun3dPoint rho: 0.5 phi: phi theta: angle2) to: (Jun3dPoint rho: 5 phi: phi theta: angle2).
	self assert: (line1 angleWithLine: line2) equals: (angle2 - angle1) uniformed