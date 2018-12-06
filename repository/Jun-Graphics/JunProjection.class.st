"
A JunProjection is camera settings in a scene rendering.

Instance Variables
	eyePoint:		<Jun3dPoint>
	sightPoint:		<Jun3dPoint>
	upVector:		<Jun3dPoint>

eyePoint
	- location of your eyes

sightPoint
	- the point you are starring at

upVector
	- the direction of the top of the sight frame.

"
Class {
	#name : #JunProjection,
	#superclass : #Object,
	#instVars : [
		'eyePoint',
		'sightPoint',
		'upVector',
		'near',
		'far',
		'viewFactor'
	],
	#category : 'Jun-Graphics-Projection'
}

{ #category : #constants }
JunProjection class >> default [
	^ self defaultPerspective
]

{ #category : #defaults }
JunProjection class >> defaultEyePoint [
	^ 30 _, 30 , 30
]

{ #category : #defaults }
JunProjection class >> defaultFar [
	^ 1000
]

{ #category : #defaults }
JunProjection class >> defaultNear [
	^ 0.001
]

{ #category : #constants }
JunProjection class >> defaultParallelProjection [
	^ self defaultParallelProjectionClass default
]

{ #category : #defaults }
JunProjection class >> defaultParallelProjectionClass [
	^ JunParallelProjection
]

{ #category : #constants }
JunProjection class >> defaultPerspective [
	^ self defaultPerspectiveClass default
]

{ #category : #defaults }
JunProjection class >> defaultPerspectiveClass [
	^ JunPerspectiveProjection
]

{ #category : #defaults }
JunProjection class >> defaultSightPoint [
	^ Jun3dPoint zero
]

{ #category : #defaults }
JunProjection class >> defaultUpVector [
	^ 0 _, 0 , 1
]

{ #category : #'instance creation' }
JunProjection class >> parallelProjectionEyePoint: eyePoint sightPoint: sightPoint upVector: upVector height: height [
	| distance |
	distance := sightPoint distance: eyePoint.
	^ self
		parallelProjectionEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		height: height
		near: distance / 10.0
		far: distance * 10.0
]

{ #category : #'instance creation' }
JunProjection class >> parallelProjectionEyePoint: a3dPoint1 sightPoint: a3dPoint2 upVector: a3dPoint3 height: aNumber1 near: aNumber2 far: aNumber3 [
	^ self defaultParallelProjectionClass
		eyePoint: a3dPoint1
		sightPoint: a3dPoint2
		upVector: a3dPoint3
		height: aNumber1
		near: aNumber2
		far: aNumber3
]

{ #category : #'instance creation' }
JunProjection class >> perspectiveEyePoint: eyePoint sightPoint: sightPoint upVector: upVector fovy: aJunAngle [
	| distance |
	distance := sightPoint distance: eyePoint.
	^ self
		perspectiveEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		fovy: aJunAngle
		near: distance / 10.0
		far: distance * 10.0
]

{ #category : #'instance creation' }
JunProjection class >> perspectiveEyePoint: eyePoint sightPoint: sightPoint upVector: upVector fovy: aJunAngle near: near far: far [
	^ self defaultPerspectiveClass
		eyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		fovy: aJunAngle
		near: near
		far: far
]

{ #category : #'applying transformation' }
JunProjection >> applyTo: anObject [
	^ anObject transform: self
]

{ #category : #'applying transformation' }
JunProjection >> applyToPoint: aJun3dPoint [
	^ self translateToPointFrom3dPoint: aJun3dPoint
]

{ #category : #converting }
JunProjection >> asEyeTransformation [
	^ self subclassResponsibility
]

{ #category : #converting }
JunProjection >> asParallelProjection [
	^ self subclassResponsibility
]

{ #category : #converting }
JunProjection >> asPerspectiveProjection [
	^ self subclassResponsibility
]

{ #category : #converting }
JunProjection >> asPickingProjectionAt: aPoint [
	| pickingCenter pickingZoomHeight projection |
	pickingCenter := self translateTo3dPointFromPoint: aPoint.
	pickingZoomHeight := (pickingCenter - (self translateTo3dPointFromPoint: aPoint + (0 _, -0.01))) length.
	projection := self copy.
	projection sightPoint: pickingCenter.
	self isParallel
		ifTrue: [ projection eyePoint: self eyePoint + pickingCenter - self sightPoint ].
	projection zoomHeight: pickingZoomHeight.
	^ projection
]

{ #category : #converting }
JunProjection >> asTransformation [
	^ self subclassResponsibility
]

{ #category : #boundary }
JunProjection >> boundaryConditionForRectangle: aRectangle [
	| leftBlock rightBlock topBlock bottomBlock topLeft topRight bottomLeft bottomRight anotherTopLeft anotherBottomRight |
	topLeft := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle topLeft.
	topRight := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle topRight.
	bottomLeft := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle bottomLeft.
	bottomRight := self translateTo3dPointInFarBoundaryPlaneFromPoint: aRectangle bottomRight.
	anotherTopLeft := self translateTo3dPointInNearBoundaryPlaneFromPoint: aRectangle topLeft.
	anotherBottomRight := self translateTo3dPointInNearBoundaryPlaneFromPoint: aRectangle bottomRight.
	leftBlock := self
		boundaryConditionFrom3dPoint: topLeft
		and: bottomLeft
		and: anotherTopLeft
		includes: topRight.
	rightBlock := self
		boundaryConditionFrom3dPoint: topRight
		and: bottomRight
		and: anotherBottomRight
		includes: topLeft.
	topBlock := self
		boundaryConditionFrom3dPoint: topLeft
		and: topRight
		and: anotherTopLeft
		includes: bottomLeft.
	bottomBlock := self
		boundaryConditionFrom3dPoint: bottomLeft
		and: bottomRight
		and: anotherBottomRight
		includes: topLeft.
	^ [ :p | (leftBlock value: p) and: [ (rightBlock value: p) and: [ (topBlock value: p) and: [ bottomBlock value: p ] ] ] ]
]

{ #category : #boundary }
JunProjection >> boundaryConditionFrom3dPoint: aJun3dPoint1 and: aJun3dPoint2 and: aJun3dPoint3 includes: aJun3dPoint4 [
	| plane leftHand a b c d |
	plane := JunPlane on: aJun3dPoint1 on: aJun3dPoint2 on: aJun3dPoint3.
	plane isNil
		ifTrue: [ ^ [ :p | false ] ].
	a := plane a.
	b := plane b.
	c := plane c.
	d := plane d.
	leftHand := a * aJun3dPoint4 x + (b * aJun3dPoint4 y) + (c * aJun3dPoint4 z) + d.
	leftHand < 0
		ifTrue: [ ^ [ :p | a * p x + (b * p y) + (c * p z) + d < 0 ] ].
	leftHand > 0
		ifTrue: [ ^ [ :p | a * p x + (b * p y) + (c * p z) + d > 0 ] ].
	leftHand = 0
		ifTrue: [ ^ [ :p | a * p x + (b * p y) + (c * p z) + d = 0 ] ]
]

{ #category : #accessing }
JunProjection >> distance [
	^ eyePoint distance: sightPoint
]

{ #category : #accessing }
JunProjection >> eyePoint [
	^ eyePoint
]

{ #category : #moving }
JunProjection >> eyePoint: a3dPoint [
	self setEyePoint: a3dPoint.
	self fitDistance.
	self normalizeUpVector
]

{ #category : #accessing }
JunProjection >> eyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2 [
	(aJun3dPoint1 equal: aJun3dPoint2)
		ifTrue: [ ^ nil ].
	self setEyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2
]

{ #category : #accessing }
JunProjection >> far [
	^ far
]

{ #category : #accessing }
JunProjection >> far: aNumber [
	far := aNumber asFloat
]

{ #category : #accessing }
JunProjection >> farCenter [
	^ self eyePoint + (self unitSightVector * self far)
]

{ #category : #private }
JunProjection >> fitDistance [
	| factor |
	factor := self viewFactor.
	far := self distance * factor.
	near := self distance / factor
]

{ #category : #testing }
JunProjection >> isParallel [
	^ false
]

{ #category : #testing }
JunProjection >> isPerspective [
	^ false
]

{ #category : #moving }
JunProjection >> moveBackward: aNumber [
	"Move the eyePoint to aNumber backward from the center"

	self eyePoint: self eyePoint - (self unitSightVector * aNumber)
]

{ #category : #moving }
JunProjection >> moveForward: aNumber [
	"Move the eyePoint to aNumber forward to the center"

	self eyePoint: self eyePoint + (self unitSightVector * aNumber)
]

{ #category : #moving }
JunProjection >> moveLeft: aNumber [
	"Move the eyePoint to aNumber backward from the center"

	self eyePoint: self eyePoint - (self unitRightVector * aNumber)
]

{ #category : #moving }
JunProjection >> moveRight: aNumber [
	"Move the eyePoint to aNumber backward from the center"

	self eyePoint: self eyePoint + (self unitRightVector * aNumber)
]

{ #category : #accessing }
JunProjection >> near [
	^ near
]

{ #category : #accessing }
JunProjection >> near: aNumber [
	near := aNumber asFloat
]

{ #category : #accessing }
JunProjection >> nearCenter [
	^ self eyePoint + (self unitSightVector * self near)
]

{ #category : #private }
JunProjection >> normalizeUpVector [
	self setUpVector: (self rightVector product: self sightVector) unitVector
]

{ #category : #zooming }
JunProjection >> pan [
	^ self pan: 2
]

{ #category : #zooming }
JunProjection >> pan: aNumber [
	^ self subclassResponsibility 
]

{ #category : #projection }
JunProjection >> projectOn: aRenderingContext [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunProjection >> regularHeight [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunProjection >> rightVector [
	^ self sightVector product: self upVector
]

{ #category : #accessing }
JunProjection >> rightVector: aJun3dPoint [
	self upVector: (aJun3dPoint product: self sightVector) unitVector
]

{ #category : #private }
JunProjection >> setEyePoint: aJun3dPoint [
	eyePoint := aJun3dPoint
]

{ #category : #private }
JunProjection >> setProjection [
	self
		fitDistance;
		normalizeUpVector
]

{ #category : #private }
JunProjection >> setSightPoint: aJun3dPoint [ 
	sightPoint := aJun3dPoint
]

{ #category : #private }
JunProjection >> setUpVector: aJun3dPoint [
	upVector := aJun3dPoint
]

{ #category : #private }
JunProjection >> setViewFactor: aNumber [
	viewFactor := aNumber
]

{ #category : #private }
JunProjection >> setZoomHeight: aNumber [
	^ self subclassResponsibility
]

{ #category : #moving }
JunProjection >> sightPoint [
	^ sightPoint
]

{ #category : #moving }
JunProjection >> sightPoint: a3dPoint [
	self setSightPoint: a3dPoint.
	self fitDistance.
	self normalizeUpVector
]

{ #category : #accessing }
JunProjection >> sightVector [
	^ sightPoint - eyePoint
]

{ #category : #utilities }
JunProjection >> translateTo3dLineFromPoint: aPoint [
	| from to |
	from := self translateTo3dPointFromPoint: aPoint depth: self near.
	to := self translateTo3dPointFromPoint: aPoint depth: self far.
	^ Jun3dLine from: from to: to
]

{ #category : #utilities }
JunProjection >> translateTo3dPointFromPoint: aPoint [
	^ self translateTo3dPointFromPoint: aPoint depth: self distance
]

{ #category : #utilities }
JunProjection >> translateTo3dPointFromPoint: aPoint depth: aNumber [
	^ self subclassResponsibility
]

{ #category : #utilities }
JunProjection >> translateTo3dPointInFarBoundaryPlaneFromPoint: aPoint [
	^ self translateTo3dPointFromPoint: aPoint depth: self far
]

{ #category : #utilities }
JunProjection >> translateTo3dPointInNearBoundaryPlaneFromPoint: aPoint [
	^ self translateTo3dPointFromPoint: aPoint depth: self near
]

{ #category : #utilities }
JunProjection >> translateToPointFrom3dPoint: aJun3dPoint [ 
	^self asTransformation applyTo: aJun3dPoint
]

{ #category : #accessing }
JunProjection >> unitRightVector [
	^ self rightVector unitVector
]

{ #category : #accessing }
JunProjection >> unitSightVector [
	^ self sightVector unitVector
]

{ #category : #accessing }
JunProjection >> unitUpVector [
	^ self upVector unitVector
]

{ #category : #accessing }
JunProjection >> upVector [
	^ upVector
]

{ #category : #accessing }
JunProjection >> upVector: aJun3dPoint [
	self setUpVector: aJun3dPoint.
	self normalizeUpVector
]

{ #category : #accessing }
JunProjection >> viewFactor [
	viewFactor isNil ifTrue: [ viewFactor := 50 ].
	^ viewFactor
]

{ #category : #accessing }
JunProjection >> viewFactor: aNumber [
	self setViewFactor: aNumber.
	self fitDistance.
	self normalizeUpVector
]

{ #category : #zooming }
JunProjection >> zoom [
	^ self zoom: 2
]

{ #category : #zooming }
JunProjection >> zoom: aNumber [
	^ self subclassResponsibility 
]

{ #category : #zooming }
JunProjection >> zoomHeight [
	^ self subclassResponsibility 
]

{ #category : #zooming }
JunProjection >> zoomHeight: aNumber [
	^ self subclassResponsibility 
]
