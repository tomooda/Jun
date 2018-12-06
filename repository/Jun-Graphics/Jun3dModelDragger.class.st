Class {
	#name : #Jun3dModelDragger,
	#superclass : #Object,
	#instVars : [
		'origin',
		'projection'
	],
	#category : 'Jun-Graphics-Morphs'
}

{ #category : #computing }
Jun3dModelDragger >> grab3dPoint: aPoint [
	| depth |
	depth := (1.0 - aPoint x squared - aPoint y squared max: 0.0) sqrt negated.
	^ projection sightPoint + (projection unitUpVector * aPoint y) + (projection unitRightVector * aPoint x)
		+ (projection unitSightVector * depth)
]

{ #category : #accessing }
Jun3dModelDragger >> origin [
	^ origin
]

{ #category : #accessing }
Jun3dModelDragger >> origin: aPoint [
	origin := aPoint
]

{ #category : #accessing }
Jun3dModelDragger >> projection [
	^ projection
]

{ #category : #accessing }
Jun3dModelDragger >> projection: aJunProjection [
	projection := aJunProjection
]

{ #category : #accessing }
Jun3dModelDragger >> thetaAccuracy [
	^ 0.001
]

{ #category : #accessing }
Jun3dModelDragger >> to: aPoint [
	| center fromPoint toPoint rotationAngle rotationAxis transformation upPoint |
	center := projection sightPoint.
	fromPoint := self grab3dPoint: origin.
	toPoint := self grab3dPoint: aPoint.
	rotationAngle := (Jun3dLine from: center to: toPoint) angleWithLine: (Jun3dLine from: center to: fromPoint).
	rotationAngle rad abs > self thetaAccuracy
		ifFalse: [ ^ self ].
	rotationAxis := Jun3dLine from: center to: center - (fromPoint - center product: toPoint - center).
	transformation := Jun3dTransformation rotate: rotationAngle around: rotationAxis.
	upPoint := projection sightPoint + projection unitUpVector.
	projection eyePoint: (transformation applyTo: projection eyePoint).
	projection upVector: ((transformation applyTo: upPoint) - projection sightPoint) unitVector.
	origin := aPoint
]
