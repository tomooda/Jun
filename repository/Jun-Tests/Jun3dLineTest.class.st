Class {
	#name : #Jun3dLineTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
Jun3dLineTest >> testAngleWithLine [
	| phi angle1 angle2 line1 line2 |
	phi := 45 asDegrees.
	angle1 := 30 asDegrees.
	angle2 := 125 asDegrees.
	line1 := Jun3dLine from: (Jun3dPoint rho: 2 phi: phi theta: angle1) to: (Jun3dPoint rho: 3 phi: phi theta: angle1).
	line2 := Jun3dLine from: (Jun3dPoint rho: 0.5 phi: phi theta: angle2) to: (Jun3dPoint rho: 5 phi: phi theta: angle2).
	self assert: (line1 angleWithLine: line2) equals: (angle2 - angle1) uniformed
]

{ #category : #tests }
Jun3dLineTest >> testContainsLineSegment1 [
	| line1 line2 |
	line1 := 0_, 0_, 0 to: 1_, 2_, 3.
	line2 := 0.1_, 0.2_, 0.3 to: 0.5_, 1_, 1.5.
	self assert: (line1 containsLineSegment: line2)
]

{ #category : #tests }
Jun3dLineTest >> testContainsLineSegment2 [
	| line1 line2 |
	line1 := 0_, 0_, 0 to: 1_, 2_, 3.
	line2 := 0.1_, 0.2_, 0.3 to: 0.5_, 1_, 1.5.
	self deny: (line2 containsLineSegment: line1)
]

{ #category : #tests }
Jun3dLineTest >> testContainsLineSegment3 [
	| line1 line2 |
	line1 := 0_, 0_, 0 to: 1_, 2_, 3.
	line2 := 0.1_, 0.2_, 0.3 to: 0.5_, 1_, 2.
	self deny: (line1 containsLineSegment: line2)
]

{ #category : #tests }
Jun3dLineTest >> testDistanceFromLine [
	| line1 line2 |
	line1 := -1 _ , -2 _ , 0 to: 1 _ , 2 _ , 0.
	line2 := 3 _ , -4 _ , 1 to: -3 _ , 4 _ , 1.
	self assert: (line1 distanceFromLine: line2) equals: 1
]

{ #category : #tests }
Jun3dLineTest >> testIntersectingPointWithLine1 [
	| t line1 line2 |
	t := (Jun3dTransformation rotate: 30 asDegrees) product: (Jun3dTransformation translate: 2 _, -3 _, 4).
	line1 := (-1 _, -2 _, 0 to: 1 _, 2 _, 0) transform: t.
	line2 := (3 _, -4 _, 0 to: -3 _, 4 _, 0) transform: t.
	self assert: (line1 intersectingPointWithLine: line2) equals: (0 _, 0 _, 0 transform: t)
]

{ #category : #tests }
Jun3dLineTest >> testIntersectingPointWithLine2 [
	| t line1 line2 |
	t := (Jun3dTransformation rotate: 30 asDegrees) product: (Jun3dTransformation translate: 2 _, -3 _, 4).
	line1 := (-1 _, -2 _, 0 to: 1 _, 2 _, 0) transform: t.
	line2 := (3 _, -4 _, 0 to: -3 _, 4 _, 1) transform: t.
	self assert: (line1 intersectingPointWithLine: line2) equals: nil
]
