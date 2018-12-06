"
A JunLine is an abstract class of geometry objects that represent lines.

"
Class {
	#name : #JunLine,
	#superclass : #JunCurve,
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #'instance creation' }
JunLine class >> from: fromPoint to: toPoint [
	^ self new
		from: fromPoint to: toPoint;
		yourself
]

{ #category : #'instance creation' }
JunLine class >> on: aPoint vertical: aLine [
	"Jun2dLine on: (0 , 1) vertical: (Jun2dLine from: (0 , 0) to: (1 , 1))."

	^ self new
		on: aPoint vertical: aLine;
		yourself
]

{ #category : #'constants access' }
JunLine class >> unity [
	^ self new unity
]

{ #category : #'constants access' }
JunLine class >> zero [
	^ self new zero
]

{ #category : #comparing }
JunLine >> = aLine [
	self class == aLine class
		ifFalse: [ ^ false ].
	^ self first = aLine first and: [ self last = aLine last ]
]

{ #category : #functions }
JunLine >> angleWithLine: aLine [
	^ self subclassResponsibility
]

{ #category : #converting }
JunLine >> asArrayOfLines [
	^ Array with: self
]

{ #category : #converting }
JunLine >> asArrays [
	^ Array with: (Array with: self from with: self to)
]

{ #category : #converting }
JunLine >> asBoundingBall [
	^ self notYetImplemented "| centerPoint aRadius |
	centerPoint := self center.
	aRadius := centerPoint distance: self to.
	^self boundingBallClass center: self center radius: aRadius"
]

{ #category : #converting }
JunLine >> asJunOpenGL3dObject [
	"((1 , -1 , 0.5) to: (-1 , 1 , 0.5)) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "| aPolyline |
	aPolyline := JunOpenGL3dPolyline 
				vertexes: (Array with: self from with: self to).
	aPolyline lineWidth: 1.
	aPolyline paint: self defaultColor.
	^aPolyline"
]

{ #category : #converting }
JunLine >> asJunOpenGL3dObjectWithPoints [
	"((1 , -1 , 0.5) to: (-1 , 1 , 0.5)) asJunOpenGL3dObjectWithPoints showWithAxes."

	^ self notYetImplemented "| aPolyline compoundObject |
	aPolyline := JunOpenGL3dPolyline 
				vertexes: (Array with: (self atT: -0.2) with: (self atT: 1.2)).
	aPolyline lineWidth: 1.
	aPolyline paint: ColorValue green.
	compoundObject := JunOpenGL3dCompoundObject new.
	compoundObject add: aPolyline.
	compoundObject add: (self from asJunOpenGL3dObject paint: ColorValue red).
	compoundObject add: (self to asJunOpenGL3dObject paint: ColorValue blue).
	^compoundObject"
]

{ #category : #converting }
JunLine >> asNurbsCurve [
	^ self notYetImplemented "^JunNurbsCurve bezierControlPoints: (Array with: self from with: self center with: self to)"
]

{ #category : #converting }
JunLine >> asPointArrays [
	^ self asArrays collect: [ :array | array collect: [ :each | each asPoint ] ]
]

{ #category : #converting }
JunLine >> asPolyline [
	^ self polylineClass vertexes: (Array with: self from with: self to)
]

{ #category : #accessing }
JunLine >> atT: t [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunLine >> atX: x [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunLine >> atY: y [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunLine >> atZ: z [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunLine >> boundingBall [
	^ self asBoundingBall
]

{ #category : #accessing }
JunLine >> boundingBox [
	^ self asBoundingBox
]

{ #category : #testing }
JunLine >> containsPoint: aPoint [
	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ (self distanceFromPoint: thePoint) < self class accuracy
]

{ #category : #functions }
JunLine >> distanceFromPoint: aPoint [
	"Array 
		with: ((0 , 0 , 0 to: 1 , 1 , 1) distanceFromPoint: -1 , 1 , 0)
		with: ((0 , 0 to: 1 , 1) distanceFromPoint: -1 , 1)."

	| thePoint pointOnMe |
	thePoint := self pointClass coerce: aPoint.
	pointOnMe := self footOfPerpendicularFrom: thePoint.
	^ thePoint distance: pointOnMe
]

{ #category : #comparing }
JunLine >> equal: aLine [
	self class == aLine class
		ifFalse: [ ^ false ].
	^ (self first equal: aLine first) and: [ self last equal: aLine last ]
]

{ #category : #functions }
JunLine >> footOfPerpendicularFrom: aPoint [
	"Array 
		with: ((0 , 0 , 0 to: 1 , 1 , 1) footOfPerpendicularFrom: -1 , 1 , 0)
		with: ((0 , 0 to: 1 , 1) footOfPerpendicularFrom: -1 , 1)."

	^ self nearestPointFromPoint: aPoint
]

{ #category : #private }
JunLine >> from: point1 to: point2 [
	^ self subclassResponsibility
]

{ #category : #comparing }
JunLine >> hash [
	^ self first hash + self last hash
]

{ #category : #testing }
JunLine >> isLine [
	^ true
]

{ #category : #functions }
JunLine >> isNormal [
	^ (1 - self n) abs < self class accuracy
]

{ #category : #testing }
JunLine >> isParallelWithLine: aLine [
	"(0 , 0 to: 1 , 1) isParallelWithLine: (0 , 2 to: 1 , 3)."
	"(0 , 0 , 0 to: 1 , 1 , 0) isParallelWithLine: (0 , 2 , 0 to: 1 , 3 , 0)."

	| degrees |
	degrees := (self angleWithLine: aLine) deg.
	^ (0.0 - degrees) abs < self class accuracy or: [ (180.0 - degrees) abs < self class accuracy ]
]

{ #category : #accessing }
JunLine >> length [
	^ self first distance: self last
]

{ #category : #parameters }
JunLine >> n [
	^ self subclassResponsibility
]

{ #category : #functions }
JunLine >> nearestPointFromPoint: aPoint [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunLine >> normalUnitVector [
	| aLine |
	aLine := self normalizedLine.
	^ aLine to - aLine from
]

{ #category : #accessing }
JunLine >> normalVector [
	^ self to - self from
]

{ #category : #functions }
JunLine >> normalized [
	^ self normalizedLine
]

{ #category : #functions }
JunLine >> normalizedLine [
	^ self subclassResponsibility
]

{ #category : #private }
JunLine >> on: aPoint vertical: aLine [
	^ self subclassResponsibility
]

{ #category : #printing }
JunLine >> printOn: aStream [
	aStream nextPutAll: '('.
	self from printOn: aStream.
	aStream nextPutAll: ' to: '.
	self to printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #converting }
JunLine >> reversed [
	^ self class from: self to to: self from
]

{ #category : #printing }
JunLine >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' from: '.
	self from storeOn: aStream.
	aStream nextPutAll: ' to: '.
	self to storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #subdividing }
JunLine >> subdivide [
	"(((0 , 0 to: 1 , 1) subdivide) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivide) showWithArrows) wireframePresentation."

	^ self polylineClass vertexes: (Array with: self from with: self center with: self to)
]

{ #category : #subdividing }
JunLine >> subdivideLevel: levelNumber [
	"(((0 , 0 to: 1 , 1) subdivideLevel: 0) showWithArrows) wireframePresentation."
	"(((0 , 0 to: 1 , 1) subdivideLevel: 1) showWithArrows) wireframePresentation."
	"(((0 , 0 to: 1 , 1) subdivideLevel: 2) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivideLevel: 0) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivideLevel: 1) showWithArrows) wireframePresentation."
	"(((0 , 0 , 0 to: 1 , 1 , 1) subdivideLevel: 2) showWithArrows) wireframePresentation."

	| polyline |
	polyline := self asPolyline.
	levelNumber timesRepeat: [ polyline := polyline subdivide ].
	^ polyline
]

{ #category : #transforming }
JunLine >> transform: aTransformation [
	^ self class from: (self from transform: aTransformation) to: (self to transform: aTransformation)
]

{ #category : #transforming }
JunLine >> transformationToRotate: anAngle [
	^ Jun3dTransformation rotate: anAngle around: self
]

{ #category : #private }
JunLine >> unity [
	self from: self pointClass zero to: self pointClass unity
]

{ #category : #testing }
JunLine >> whichSideOf: bisector [
	^ self shouldNotImplement
]

{ #category : #private }
JunLine >> zero [
	self from: self pointClass zero to: self pointClass zero
]
