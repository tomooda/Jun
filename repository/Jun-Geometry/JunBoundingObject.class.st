"
A JunBoundingObject is a region in space that encloses a certain geometric or display object.


"
Class {
	#name : #JunBoundingObject,
	#superclass : #JunGeometry,
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #'instance creation' }
JunBoundingObject class >> fromObject: anObject [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
JunBoundingObject class >> fromPoints: aCollectionOfJunPoint [
	^ self subclassResponsibility 
]

{ #category : #converting }
JunBoundingObject >> asBoundingBall [
	^ self boundingBall
]

{ #category : #converting }
JunBoundingObject >> asBoundingBox [
	^ self boundingBox
]

{ #category : #accessing }
JunBoundingObject >> boundingBall [
	^ self subclassResponsibility 
]

{ #category : #accessing }
JunBoundingObject >> boundingBox [
		^ self subclassResponsibility
]

{ #category : #testing }
JunBoundingObject >> contains: aJunBoundingObject [
	^ self subclassResponsibility
]

{ #category : #testing }
JunBoundingObject >> containsPoint: aPoint [
	^ self subclassResponsibility
]

{ #category : #testing }
JunBoundingObject >> intersects: aBoundingObject [
	^ self subclassResponsibility
]

{ #category : #testing }
JunBoundingObject >> isBoundingObject [
	^ true
]

{ #category : #testing }
JunBoundingObject >> isEmpty [
	self is3d
		ifTrue: [ ^ self volume < self class accuracy ].
	self is2d
		ifTrue: [ ^ self area < self class accuracy ].
	^ false
]

{ #category : #testing }
JunBoundingObject >> touches: aBoundingObject [
	^ self subclassResponsibility
]

{ #category : #testing }
JunBoundingObject >> touchesPoint: aPoint [
	^ self subclassResponsibility
]

{ #category : #testing }
JunBoundingObject >> whichSideOf: bisector [
	^ self subclassResponsibility
]
