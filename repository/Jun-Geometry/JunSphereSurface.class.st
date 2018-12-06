"
A JunSphereSurface is a set of points with radius distance from a center.

Instance Variables
	center:		<Jun3dPoint>
	radius:		<Float>

"
Class {
	#name : #JunSphereSurface,
	#superclass : #JunSurface,
	#instVars : [
		'center',
		'radius'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #'instance creation' }
JunSphereSurface class >> center: aJun3dPoint radius: aNumber [
	| sphere |
	sphere := self new.
	sphere center: aJun3dPoint.
	sphere radius: aNumber.
	^ sphere
]

{ #category : #'constants access' }
JunSphereSurface class >> unity [
	^ self center: Jun3dPoint zero radius: 1.0
]

{ #category : #'constants access' }
JunSphereSurface class >> zero [
	^ self center: Jun3dPoint zero radius: 0.0
]

{ #category : #comparing }
JunSphereSurface >> = sphereSurface [ 
	self class == sphereSurface class ifFalse: [^false].
	^self radius = sphereSurface radius 
		and: [self center = sphereSurface center]
]

{ #category : #accessing }
JunSphereSurface >> center [
	^ center
]

{ #category : #private }
JunSphereSurface >> center: aJun3dPoint [
	center := self pointClass coerce: aJun3dPoint
]

{ #category : #testing }
JunSphereSurface >> containsPoint: aPoint [
	^ (center distance: aPoint) <= radius
]

{ #category : #functions }
JunSphereSurface >> crossPointsWithLine: aJun3dLine [
	| nearestPointOnLine distance shift shiftVector |
	nearestPointOnLine := aJun3dLine nearestPointFromPoint: self center.
	distance := self center distance: nearestPointOnLine.
	distance > self radius
		ifTrue: [ ^ Array new ].
	(distance - self radius) abs < self class accuracy
		ifTrue: [ ^ Array with: nearestPointOnLine ].
	shift := (radius * radius - (distance * distance)) sqrt.
	shiftVector := (aJun3dLine to - aJun3dLine from) unitVector * shift.
	^ Array with: nearestPointOnLine + shiftVector with: nearestPointOnLine - shiftVector
]

{ #category : #comparing }
JunSphereSurface >> hash [
	^ center hash + radius hash
]

{ #category : #testing }
JunSphereSurface >> is3d [
	^ true
]

{ #category : #accessing }
JunSphereSurface >> radius [
	^ radius
]

{ #category : #private }
JunSphereSurface >> radius: aNumber [
	radius := aNumber asFloat
]

{ #category : #printing }
JunSphereSurface >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' center: '.
	self center storeOn: aStream.
	aStream nextPutAll: ' radius: '.
	self radius storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #testing }
JunSphereSurface >> whichSideOf: bisector [
	| sign |
	sign := self center whichSideOf: bisector.
	sign = 0
		ifTrue: [ ^ 0 ].
	(bisector distanceFromPoint: self center) <= self radius
		ifTrue: [ ^ 0 ].
	^ sign
]
