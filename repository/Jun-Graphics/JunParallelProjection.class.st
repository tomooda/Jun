"
A JunParallelProjection is a projection that your sight scans by parallel rays.

Instance Variables
	height:		<Float>

height
	- height of the scene frame

"
Class {
	#name : #JunParallelProjection,
	#superclass : #JunProjection,
	#instVars : [
		'height'
	],
	#category : 'Jun-Graphics-Projection'
}

{ #category : #constants }
JunParallelProjection class >> default [
	^ self
		eyePoint: self defaultEyePoint
		sightPoint: self defaultSightPoint
		upVector: self defaultUpVector
		height: self defaultHeight
		near: self defaultNear
		far: self defaultFar
]

{ #category : #defaults }
JunParallelProjection class >> defaultHeight [
	^ 13.681728885883
]

{ #category : #'instance creation' }
JunParallelProjection class >> eyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2 upVector: aJun3dPoint3 height: aNumber1 near: aNumber2 far: aNumber3 [
	^ self new
		setEyePoint: aJun3dPoint1
		sightPoint: aJun3dPoint2
		upVector: aJun3dPoint3
		height: aNumber1
		near: aNumber2
		far: aNumber3
]

{ #category : #converting }
JunParallelProjection >> asEyeTransformation [
	| scale |
	scale := self height abs / 2.
	^ Jun3dTransformation
		fromOrigin: self sightPoint
		xAxis: self unitRightVector * scale
		yAxis: self unitUpVector * scale
		zAxis: self unitSightVector * scale
]

{ #category : #converting }
JunParallelProjection >> asParallelProjection [
	^ self copy
]

{ #category : #converting }
JunParallelProjection >> asPerspectiveProjection [
	| fovy |
	fovy := JunAngle fromRad: (self height / 2.0 / self distance) arcTan * 2.
	^ self class
		perspectiveEyePoint: self eyePoint
		sightPoint: self sightPoint
		upVector: self upVector
		fovy: fovy
		near: self near
		far: self far
]

{ #category : #converting }
JunParallelProjection >> asTransformation [
	"origin at the eyepoint and the depth is normalized by the distance between eyepoint and sightpoint.
	the sightpoint will be transformed into 0, 0, 1"
	| scale |
	scale := self height abs / 2.
	^ Jun3dTransformation
		fromOrigin: self eyePoint
		xAxis: self unitRightVector * scale
		yAxis: self unitUpVector * scale
		zAxis: self sightPoint - self eyePoint
]

{ #category : #accessing }
JunParallelProjection >> height [
	^ height
]

{ #category : #accessing }
JunParallelProjection >> height: aNumber [
	height := aNumber
]

{ #category : #testing }
JunParallelProjection >> isParallel [
	^ true
]

{ #category : #zooming }
JunParallelProjection >> pan: aNumber [
	height := height * aNumber asFloat
]

{ #category : #projection }
JunParallelProjection >> projectOn: aRenderingContext [
	aRenderingContext parallelProjection: self
]

{ #category : #accessing }
JunParallelProjection >> regularHeight [
	^ self height
]

{ #category : #private }
JunParallelProjection >> setEyePoint: aJun3dPoint1 sightPoint: aJun3dPoint2 upVector: aJun3dPoint3 height: aNumber1 near: aNumber2 far: aNumber3 [
	eyePoint := aJun3dPoint1.
	sightPoint := aJun3dPoint2.
	upVector := aJun3dPoint3.
	height := aNumber1.
	near := aNumber2.
	far := aNumber3.
	self normalizeUpVector
]

{ #category : #private }
JunParallelProjection >> setZoomHeight: aNumber [
	self height: aNumber
]

{ #category : #utilities }
JunParallelProjection >> translateTo3dPointFromPoint: aPoint depth: aNumber [
	| scale forward right up |
	scale := self height abs / 2.
	forward := self unitSightVector * aNumber.
	right := self unitRightVector * aPoint x * scale.
	up := self unitUpVector * aPoint y * scale.
	^ self eyePoint + forward + right + up
]

{ #category : #zooming }
JunParallelProjection >> zoom: aNumber [
	height := height / aNumber asFloat
]

{ #category : #zooming }
JunParallelProjection >> zoomHeight [
	^ self height
]

{ #category : #zooming }
JunParallelProjection >> zoomHeight: aNumber [
	self setZoomHeight: aNumber
]
