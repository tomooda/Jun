Class {
	#name : #JunBond,
	#superclass : #Object,
	#instVars : [
		'atom1',
		'atom2',
		'order',
		'wedge'
	],
	#category : 'Jun-Chemistry-Atoms'
}

{ #category : #'instance creation' }
JunBond class >> between: aJunAtom1 and: aJunAtom2 [
	^ self new setAtom1: aJunAtom1 atom2: aJunAtom2
]

{ #category : #accessing }
JunBond >> atom1 [
	^ atom1
]

{ #category : #accessing }
JunBond >> atom1: aJunAtom [
	atom1 := aJunAtom
]

{ #category : #accessing }
JunBond >> atom2 [
	^ atom2
]

{ #category : #accessing }
JunBond >> atom2: aJunAtom [
	atom2 := aJunAtom
]

{ #category : #accessing }
JunBond >> awayWedge [
	wedge := #away
]

{ #category : #accessing }
JunBond >> flatWedge [
	wedge := #flat
]

{ #category : #'initialize-release' }
JunBond >> initialize [
	super initialize.
	order := 1.
	wedge := #flat
]

{ #category : #accessing }
JunBond >> order [
	^ order
]

{ #category : #accessing }
JunBond >> order: aNumber [
	order := aNumber
]

{ #category : #accessing }
JunBond >> peerOf: aJunAtom [
	atom1 == aJunAtom
		ifTrue: [ ^ atom2 ].
	atom2 == aJunAtom
		ifTrue: [ ^ atom1 ].
	^ nil
]

{ #category : #rendering }
JunBond >> renderOn: aJunRenderingContext [
	| theDegrees zAxis xAxis dot xAxis0 dot0 yAxis center |
	theDegrees := 30.
	zAxis := atom2 position - atom1 position.
	xAxis := Jun3dPoint x: 1.0 y: 0.0 z: 0.0.
	dot := (zAxis dotProduct: xAxis) abs.
	xAxis0 := Jun3dPoint x: 0.0 y: 1.0 z: 0.0.
	dot0 := (zAxis dotProduct: xAxis0) abs.
	dot0 < dot
		ifTrue: [ 
			dot := dot0.
			xAxis := xAxis0 ].
	xAxis0 := Jun3dPoint x: 0.0 y: 0.0 z: 1.0.
	dot0 := (zAxis dotProduct: xAxis0) abs.
	dot0 < dot
		ifTrue: [ 
			dot := dot0.
			xAxis := xAxis0 ].
	yAxis := (xAxis crossProduct: zAxis) unitVector.
	xAxis := (yAxis crossProduct: zAxis) unitVector.
	center := (atom1 position + atom2 position) * (Jun3dPoint x: 0.5 y: 0.5 z: 0.5).
	aJunRenderingContext color: atom1 color.
	0 to: 360 by: theDegrees do: [ :degrees | 
		| theta1 theta2 x1 y1 v1 x2 y2 v2 |
		theta1 := degrees * Float pi / 180.0.
		theta2 := (degrees + theDegrees) * Float pi / 180.0.
		x1 := theta1 cos * 0.15.
		y1 := theta1 sin * 0.15.
		v1 := xAxis * x1 + (yAxis * y1).
		x2 := theta2 cos * 0.15.
		y2 := theta2 sin * 0.15.
		v2 := xAxis * x2 + (yAxis * y2).
		aJunRenderingContext
			displayPolygon:
				(Array
					with: atom1 position + v1
					with: atom1 position + v2
					with: center + v2
					with: center + v1)
			normalVectors:
				(Array
					with: v1 unitVector
					with: v2 unitVector
					with: v2 unitVector
					with: v1 unitVector) ].
	aJunRenderingContext color: atom2 color.
	0 to: 360 by: theDegrees do: [ :degrees | 
		| theta1 theta2 x1 y1 v1 x2 y2 v2 |
		theta1 := degrees * Float pi / 180.0.
		theta2 := (degrees + theDegrees) * Float pi / 180.0.
		x1 := theta1 cos * 0.15.
		y1 := theta1 sin * 0.15.
		v1 := xAxis * x1 + (yAxis * y1).
		x2 := theta2 cos * 0.15 .
		y2 := theta2 sin * 0.15.
		v2 := xAxis * x2 + (yAxis * y2).
		aJunRenderingContext
			displayPolygon:
				(Array
					with: center + v1
					with: center + v2
					with: atom2 position + v2
					with: atom2 position + v1)
			normalVectors:
				(Array
					with: v1 unitVector
					with: v2 unitVector
					with: v2 unitVector
					with: v1 unitVector) ]
]

{ #category : #rendering }
JunBond >> renderTubeOn: aJunRenderingContext [
	| theDegrees zAxis xAxis dot xAxis0 dot0 yAxis center |
	theDegrees := 30.
	zAxis := atom2 position - atom1 position.
	xAxis := Jun3dPoint x: 1.0 y: 0.0 z: 0.0.
	dot := (zAxis dotProduct: xAxis) abs.
	xAxis0 := Jun3dPoint x: 0.0 y: 1.0 z: 0.0.
	dot0 := (zAxis dotProduct: xAxis0) abs.
	dot0 < dot
		ifTrue: [ 
			dot := dot0.
			xAxis := xAxis0 ].
	xAxis0 := Jun3dPoint x: 0.0 y: 0.0 z: 1.0.
	dot0 := (zAxis dotProduct: xAxis0) abs.
	dot0 < dot
		ifTrue: [ 
			dot := dot0.
			xAxis := xAxis0 ].
	yAxis := (xAxis crossProduct: zAxis) unitVector.
	xAxis := (yAxis crossProduct: zAxis) unitVector.
	zAxis := zAxis unitVector.
	center := (atom1 position + atom2 position) * (Jun3dPoint x: 0.5 y: 0.5 z: 0.5).
	aJunRenderingContext color: atom1 color.
	0 to: 360 by: theDegrees do: [ :degrees | 
		| theta1 theta2 x1 y1 v1 x2 y2 v2 |
		theta1 := degrees * Float pi / 180.0.
		theta2 := (degrees + theDegrees) * Float pi / 180.0.
		x1 := theta1 cos * 0.15.
		y1 := theta1 sin * 0.15.
		v1 := xAxis * x1 + (yAxis * y1).
		x2 := theta2 cos * 0.15.
		y2 := theta2 sin * 0.15.
		v2 := xAxis * x2 + (yAxis * y2).
		aJunRenderingContext
			displayPolygon:
				(Array
					with: atom1 position + v1
					with: atom1 position + v2
					with: center + v2
					with: center + v1)
			normalVectors:
				(Array
					with: v1 unitVector
					with: v2 unitVector
					with: v2 unitVector
					with: v1 unitVector) ].
	aJunRenderingContext disableCullface.
	aJunRenderingContext
		displayPolygon:
			((0 to: 360 by: theDegrees)
				collect: [ :degrees | 
					| theta1 theta2 x1 y1 v1 |
					theta1 := degrees * Float pi / 180.0.
					theta2 := (degrees + theDegrees) * Float pi / 180.0.
					x1 := theta1 cos * 0.15.
					y1 := theta1 sin * 0.15.
					v1 := xAxis * x1 + (yAxis * y1).
					atom1 position + v1 ])
		normalVectors: ((0 to: 360 by: theDegrees) collect: [ :degrees | zAxis negated ]).
	aJunRenderingContext color: atom2 color.
	0 to: 360 by: theDegrees do: [ :degrees | 
		| theta1 theta2 x1 y1 v1 x2 y2 v2 |
		theta1 := degrees * Float pi / 180.0.
		theta2 := (degrees + theDegrees) * Float pi / 180.0.
		x1 := theta1 cos * 0.15.
		y1 := theta1 sin * 0.15.
		v1 := xAxis * x1 + (yAxis * y1).
		x2 := theta2 cos * 0.15.
		y2 := theta2 sin * 0.15.
		v2 := xAxis * x2 + (yAxis * y2).
		aJunRenderingContext
			displayPolygon:
				(Array
					with: center + v1
					with: center + v2
					with: atom2 position + v2
					with: atom2 position + v1)
			normalVectors:
				(Array
					with: v1 unitVector
					with: v2 unitVector
					with: v2 unitVector
					with: v1 unitVector) ].
	aJunRenderingContext
		displayPolygon:
			((0 to: 360 by: theDegrees)
				collect: [ :degrees | 
					| theta1 theta2 x1 y1 v1 |
					theta1 := degrees * Float pi / 180.0.
					theta2 := (degrees + theDegrees) * Float pi / 180.0.
					x1 := theta1 cos * 0.15.
					y1 := theta1 sin * 0.15.
					v1 := xAxis * x1 + (yAxis * y1).
					atom2 position + v1 ])
		normalVectors: ((0 to: 360 by: theDegrees) collect: [ :degrees | zAxis  ])
]

{ #category : #private }
JunBond >> setAtom1: aJunAtom1 atom2: aJunAtom2 [
	atom1 := aJunAtom1.
	atom2 := aJunAtom2
]

{ #category : #accessing }
JunBond >> towardsWedge [
	wedge := #towards
]

{ #category : #accessing }
JunBond >> unknownWedge [
	wedge := #unknown
]

{ #category : #accessing }
JunBond >> wedge [
	^ wedge
]
