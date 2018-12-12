"
A JunPerspectiveProjection is a projection that scans the scene by rays origined at your eyes. Farer objects will be rendered smaller.

Instance Variables
	fovy:		<JunAngle>
	zoomHeight:		<Float>

fovy
	- the angle that the top sight and the bottom sight makes at your eyes.

zoomHeight
	- the height of your sight frame

"
Class {
	#name : #JunPerspectiveProjection,
	#superclass : #JunProjection,
	#instVars : [
		'fovy',
		'zoomHeight'
	],
	#category : 'Jun-Graphics-Projection'
}

{ #category : #constants }
JunPerspectiveProjection class >> default [
	^ self
		eyePoint: self defaultEyePoint
		sightPoint: self defaultSightPoint
		upVector: self defaultUpVector
		fovy: self defaultFovy
		near: self defaultNear
		far: self defaultFar
]

{ #category : #defaults }
JunPerspectiveProjection class >> defaultFovy [
	^ JunAngle fromDeg: 15
]

{ #category : #'instance creation' }
JunPerspectiveProjection class >> eyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2 upVector: aJun3dPoint3 fovy: aJunAngle near: aNumber1 far: aNumber2 [
	^ self new
		setEyePoint: aJun3dPoint1
		sightPoint: aJun3dPoint2
		upVector: aJun3dPoint3
		fovy: aJunAngle
		near: aNumber1
		far: aNumber2
]

{ #category : #accessing }
JunPerspectiveProjection >> asEyeTransformation [
	^ self asParallelProjection asEyeTransformation
]

{ #category : #accessing }
JunPerspectiveProjection >> asParallelProjection [
	| height |
	height := self regularHeight.
	^ self class
		parallelProjectionEyePoint: self eyePoint
		sightPoint: self sightPoint
		upVector: self upVector
		height: height
		near: self near
		far: self far
]

{ #category : #accessing }
JunPerspectiveProjection >> asPerspective [
	^ self copy
]

{ #category : #accessing }
JunPerspectiveProjection >> asTransformation [
	| depth height xyScale |
	depth := self sightPoint distance: self eyePoint.
	height := self regularHeight.
	xyScale := height / depth / 2.0.
	^ ((Jun3dTransformation
		fromOrigin: self sightPoint
		xAxis: self unitRightVector
		yAxis: self unitUpVector
		zAxis: self unitSightVector negated)
		product: (Jun3dTransformation perspective: 0 ,, 0 ,, depth))
		product: (Jun3dTransformation scale: xyScale ,, xyScale ,, depth reciprocal negated)
]

{ #category : #accessing }
JunPerspectiveProjection >> fovy [
	^ fovy
]

{ #category : #testing }
JunPerspectiveProjection >> isPerspective [
	^ true
]

{ #category : #zoom }
JunPerspectiveProjection >> pan: factor [
	self zoom: 1 / factor
]

{ #category : #projection }
JunPerspectiveProjection >> projectOn: aJunRenderingContext [
	aJunRenderingContext perspectiveProjection: self
]

{ #category : #accessing }
JunPerspectiveProjection >> regularHeight [
	^ (self fovy / 2.0) tan * self distance * 2
]

{ #category : #private }
JunPerspectiveProjection >> setEyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2 upVector: aJun3dPoint3 fovy: aJunAngle near: aNumber1 far: aNumber2 [
	| angle |
	(aJunAngle isKindOf: JunAngle)
		ifTrue: [ angle := aJunAngle ]
		ifFalse: [ angle := JunAngle fromDeg: aJunAngle ].
	eyePoint := aJun3dPoint1.
	sightPoint := aJun3dPoint2.
	upVector := aJun3dPoint3.
	fovy := angle.
	near := aNumber1.
	far := aNumber2.
	self normalizeUpVector
]

{ #category : #private }
JunPerspectiveProjection >> setZoomHeight: aNumber [
	zoomHeight := aNumber max: 0
]

{ #category : #utilities }
JunPerspectiveProjection >> translateTo3dPointFromPoint: aPoint depth: aNumber [
	| scale forward right up |
	scale := aNumber * (self fovy div: 2) tan abs.
	forward := self unitSightVector * aNumber.
	right := self unitRightVector * (aPoint x * scale).
	up := self unitUpVector * (aPoint y * scale).
	^ self eyePoint + forward + right + up
]

{ #category : #zoom }
JunPerspectiveProjection >> zoom: factor [
	| min max |
	fovy := fovy div: factor.
	min := 0.001.
	max := 180 - min.
	fovy deg > max
		ifTrue: [ fovy := JunAngle fromDeg: max ].
	fovy deg < min
		ifTrue: [ fovy := JunAngle fromDeg: min ].
	zoomHeight := (fovy / 2) tan * self distance * 2
]

{ #category : #zoom }
JunPerspectiveProjection >> zoomHeight [
	zoomHeight isNil
		ifTrue: [ self zoom: 1 ].
	^ zoomHeight
]

{ #category : #zoom }
JunPerspectiveProjection >> zoomHeight: aNumber [
	| min max |
	self setZoomHeight: aNumber.
	fovy := JunAngle fromRad: ((self zoomHeight / 2) asFloat / self distance) arcTan * 2.
	min := 0.001.
	max := 180 - min.
	fovy deg > max
		ifTrue: [ fovy := JunAngle fromDeg: max ].
	fovy deg < min
		ifTrue: [ fovy := JunAngle fromDeg: min ]
]
