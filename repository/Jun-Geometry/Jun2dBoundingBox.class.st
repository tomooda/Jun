"
A Jun2dBoundingBox is a 2D region in form of rectangle.

"
Class {
	#name : #Jun2dBoundingBox,
	#superclass : #JunBoundingBox,
	#category : 'Jun-Geometry-Basic'
}

{ #category : #accessing }
Jun2dBoundingBox >> area [
	^ self width * self height
]

{ #category : #converting }
Jun2dBoundingBox >> asPointArray [
	^ Array
		with: self origin
		with: self corner x ,, self origin y
		with: self corner
		with: self origin x ,, self corner y
]

{ #category : #testing }
Jun2dBoundingBox >> is2d [
	^ true
]
