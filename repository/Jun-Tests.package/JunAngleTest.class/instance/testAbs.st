tests
testAbs
	self assert: (JunAngle fromDeg: -30) abs equals: (JunAngle fromDeg: 30)