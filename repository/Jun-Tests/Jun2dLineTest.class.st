Class {
	#name : #Jun2dLineTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
Jun2dLineTest >> testAngleWithLine [
	| angle1 angle2 line1 line2 |
	angle1 := 30 asDegrees.
	angle2 := 125 asDegrees.
	line1 := Jun2dLine from: (Jun2dPoint rho: 2 theta: angle1) to: (Jun2dPoint rho: 3 theta: angle1).
	line2 := Jun2dLine from: (Jun2dPoint rho: 0.5 theta: angle2) to: (Jun2dPoint rho: 5 theta: angle2).
	self assert: (line1 angleWithLine: line2) equals: (angle2 - angle1) uniformed
]

{ #category : #tests }
Jun2dLineTest >> testBetween [
	| p1 p2 |
	p1 := 2 _, -3.
	p2 := -4 _, 5.
	self
		assert:
			((Jun2dLine between: p1 and: p2) in: [ :line | (line to - line from dotProduct: p2 - p1) < Jun2dLine accuracy ])
]
