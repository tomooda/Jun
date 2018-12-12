"
assumes that the host class provides the following methods
* changed
* projection
"
Trait {
	#name : #TJunDisplayModel,
	#category : 'Jun-Graphics-Morphs'
}

{ #category : #viewing }
TJunDisplayModel >> createDraggerFor: aPoint [
	^ Jun3dModelDragger new
		projection: self projection;
		origin: aPoint;
		yourself
]

{ #category : #defaults }
TJunDisplayModel >> defaultProjection [
	^ JunPerspectiveProjection
		eyePoint: 10 ,, 10 ,, 10
		sightPoint: 0 ,, 0 ,, 0
		upVector: 0 ,, 0 ,, 1
		fovy: 30 asDegrees
		near: -100.0
		far: 100.0
]

{ #category : #viewing }
TJunDisplayModel >> dragActionAt: aPoint [
	self dragger
		ifNil: [ self dragger: (self createDraggerFor: (self grabPointFor: aPoint)) ]
		ifNotNil: [ :dragger | 
			dragger to: (self grabPointFor: aPoint).
			self changed ]
]

{ #category : #accessing }
TJunDisplayModel >> dragger [
	^ self subclassResponsibility
]

{ #category : #accessing }
TJunDisplayModel >> dragger: aJun3dModelDragger [
	^ self subclassResponsibility
]

{ #category : #drawing }
TJunDisplayModel >> drawOnForm: aForm [
	| rc |
	rc := aForm renderingContext.
	rc
		backgroundColor: self color;
		clear;
		projection: self projection;
		enableCullface;
		enableLighting;
		enableLightIndex: 0;
		ambientLight: (Color gray: 0.6);
		lightIndex: 0 parallel: self projection sightVector color: (Color gray: 0.3);
		color: Color white.
	self object renderOn: rc.
	rc flush.
	^ aForm
]

{ #category : #operations }
TJunDisplayModel >> fit [
	self fitEyepoint.
	self fitSightpoint
]

{ #category : #operations }
TJunDisplayModel >> fitEyepoint [
	self object ifNotNil: [ :obj | self fitEyepointToBoundingBox: obj boundingBox ]
]

{ #category : #operations }
TJunDisplayModel >> fitEyepointToBoundingBox: aJun3dBoundingBox [
	self projection
		in: [ :projection | 
			projection
				eyePoint:
					(projection eyePoint - projection sightPoint) unitVector
						*
							((aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
								+ aJun3dBoundingBox depth squared) sqrt * 3.0) + projection sightPoint.
			projection
				zoomHeight:
					(aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
						+ aJun3dBoundingBox depth squared) sqrt.
			projection
				far:
					(aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
						+ aJun3dBoundingBox depth squared) sqrt * 10.0.
			projection
				near:
					(aJun3dBoundingBox width squared + aJun3dBoundingBox height squared
						+ aJun3dBoundingBox depth squared) sqrt * -10.0 ]
]

{ #category : #operations }
TJunDisplayModel >> fitSightpoint [
	self object ifNotNil: [ :obj | self fitSightpointToBoundingBox: obj boundingBox ]
]

{ #category : #operations }
TJunDisplayModel >> fitSightpointToBoundingBox: aJun3dBoundingBox [
	self projection sightPoint: aJun3dBoundingBox center
]

{ #category : #operations }
TJunDisplayModel >> fitToBoundingBox: aJun3dBoundingBox [
	self fitEyepointToBoundingBox: aJun3dBoundingBox.
	self fitSightpointToBoundingBox: aJun3dBoundingBox
]

{ #category : #viewing }
TJunDisplayModel >> grabPointFor: aPoint [
	^ self subclassResponsibility
]

{ #category : #accessing }
TJunDisplayModel >> projection [
	^ self subclassResponsibility
]

{ #category : #viewing }
TJunDisplayModel >> zoomin [
	self projection
		in: [ :projection | 
			projection
				eyePoint: (projection eyePoint - projection sightPoint) * 1.01 + projection sightPoint ]
]

{ #category : #viewing }
TJunDisplayModel >> zoomout [
	self projection
		in: [ :projection | 
			projection
				eyePoint: (projection eyePoint - projection sightPoint) / 1.01 + projection sightPoint ]
]
