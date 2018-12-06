tests
testDivision
	self
		assert: (JunAngle fromRad: 3) // (JunAngle fromRad: Float pi / 10)
		equals: (JunAngle fromRad: 3 // (Float pi / 10))