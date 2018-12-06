Class {
	#name : #JunAngleTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
JunAngleTest >> testAbs [
	self assert: (JunAngle fromDeg: -30) abs equals: (JunAngle fromDeg: 30)
]

{ #category : #tests }
JunAngleTest >> testAddition [
	self assert: (JunAngle fromRad: 3) + (JunAngle fromRad: 2) equals: (JunAngle fromRad: 3 + 2)
]

{ #category : #tests }
JunAngleTest >> testAsDeg [
	self assert: (JunAngle fromDeg: 30) deg equals: 30
]

{ #category : #tests }
JunAngleTest >> testAsDegrees [
	self assert: (JunAngle fromDeg: 30) degrees equals: 30
]

{ #category : #tests }
JunAngleTest >> testAsRad [
	self assert: (JunAngle fromRad: Float pi * 1.5) rad equals: Float pi * 1.5
]

{ #category : #tests }
JunAngleTest >> testAsRadians [
	self assert: (JunAngle fromRad: Float pi * 1.5) radians equals: Float pi * 1.5
]

{ #category : #tests }
JunAngleTest >> testCoerce [
	self assert: (JunAngle coerce: Float pi) equals: JunAngle pi
]

{ #category : #tests }
JunAngleTest >> testCos [
	self assert: (JunAngle fromDeg: 120) cos equals: -0.5
]

{ #category : #tests }
JunAngleTest >> testDivision [
	self
		assert: (JunAngle fromRad: 3) // (JunAngle fromRad: Float pi / 10)
		equals: (JunAngle fromRad: 3 // (Float pi / 10))
]

{ #category : #tests }
JunAngleTest >> testEqual [
	self assert: ((JunAngle fromDeg: 180) equal: (JunAngle fromRad: Float pi))
]

{ #category : #tests }
JunAngleTest >> testFraction [
	self assert: (JunAngle fromRad: 3) / 2 equals: (JunAngle fromRad: 3 / 2)
]

{ #category : #tests }
JunAngleTest >> testMultiplicaton [
	self assert: (JunAngle fromRad: 3) * 2 equals: (JunAngle fromRad: 3 * 2)
]

{ #category : #tests }
JunAngleTest >> testSin [
	self assert: (JunAngle fromDeg: -30) sin equals: -0.5
]

{ #category : #tests }
JunAngleTest >> testSubtraction [
	self assert: (JunAngle fromRad: 3) - (JunAngle fromRad: 2) equals: (JunAngle fromRad: 3 - 2)
]
