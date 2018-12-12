"
JunPoint is an abstract class for geometric objects that represent points.

"
Class {
	#name : #JunPoint,
	#superclass : #JunGeometry,
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #coercing }
JunPoint class >> coerce: anObject [
	(anObject isKindOf: self)
		ifTrue: [ ^ anObject ].
	((anObject respondsTo: #x) and: [ anObject respondsTo: #y ])
		ifTrue: [ ^ self fromPoint: anObject ].
	anObject isNumber
		ifTrue: [ ^ self fromNumber: anObject ].
	^ self fromArray: anObject
]

{ #category : #'instance creation' }
JunPoint class >> fromArray: anArray [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
JunPoint class >> fromNumber: aNumber [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
JunPoint class >> fromPoint: aPoint [
	^ self subclassResponsibility
]

{ #category : #coercing }
JunPoint class >> generality [
	^ self zero generality
]

{ #category : #utilities }
JunPoint class >> neighborhood24Points: aPoint [ 
	"JunPoint neighborhood24Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 24.
	-2 to: 2
		do: 
			[:y | 
			-2 to: 2
				do: [:x | (x = 0 and: [y = 0]) ifFalse: [aCollection add: aPoint + (x @ y)]]].
	^aCollection
]

{ #category : #utilities }
JunPoint class >> neighborhood4Points: aPoint [ 
	"JunPoint neighborhood4Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 4.
	aCollection add: aPoint + (1 @ 0).
	aCollection add: aPoint + (0 @ 1).
	aCollection add: aPoint + (-1 @ 0).
	aCollection add: aPoint + (0 @ -1).
	^aCollection
]

{ #category : #utilities }
JunPoint class >> neighborhood8Points: aPoint [
	"JunPoint neighborhood8Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 8.
	aCollection add: aPoint + (1 @ 0).
	aCollection add: aPoint + (1 @ 1).
	aCollection add: aPoint + (0 @ 1).
	aCollection add: aPoint + (-1 @ 1).
	aCollection add: aPoint + (-1 @ 0).
	aCollection add: aPoint + (-1 @ -1).
	aCollection add: aPoint + (0 @ -1).
	aCollection add: aPoint + (1 @ -1).
	^ aCollection
]

{ #category : #utilities }
JunPoint class >> neighborhoodPoints: aPoint [
	"JunPoint neighborhoodPoints: Point zero."

	^ self neighborhood8Points: aPoint
]

{ #category : #'instance creation' }
JunPoint class >> new [
	^ self shouldNotImplement
]

{ #category : #'instance creation' }
JunPoint class >> new: size [
	^ self shouldNotImplement
]

{ #category : #'constants access' }
JunPoint class >> unity [
	^ self subclassResponsibility
]

{ #category : #'constants access' }
JunPoint class >> zero [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> * aNumber [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> + aNumber [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> - aNumber [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> / aNumber [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> // aNumber [
	^ (self / aNumber) floor
]

{ #category : #comparing }
JunPoint >> < aMagnitude [
	^ self subclassResponsibility
]

{ #category : #comparing }
JunPoint >> <= aMagnitude [
	^ (self > aMagnitude) not
]

{ #category : #comparing }
JunPoint >> = aValue [
	(aValue respondsTo: #-)
		ifTrue: [ ^ (self - aValue) isZero ]
		ifFalse: [ ^ false ]
]

{ #category : #comparing }
JunPoint >> > aMagnitude [
	^ aMagnitude < self
]

{ #category : #comparing }
JunPoint >> >= aMagnitude [
	^ (self < aMagnitude) not
]

{ #category : #arithmetic }
JunPoint >> \\ aNumber [
	^ self - (self // aNumber * aNumber)
]

{ #category : #arithmetic }
JunPoint >> abs [
	^ self negative
		ifTrue: [ self negated ]
		ifFalse: [ self ]
]

{ #category : #testing }
JunPoint >> accuracy: aNumber containsPoint: aJunPoint [
	^ (self distance: (self class coerce: aJunPoint)) < aNumber
]

{ #category : #'double dispatching' }
JunPoint >> adaptToNumber: aNumber andSend: selector [
	^ (self class fromNumber: aNumber) perform: selector with: self
]

{ #category : #'double dispatching' }
JunPoint >> adaptToPoint: aPoint andSend: selector [
	^ (self class fromPoint: aPoint) perform: selector with: self
]

{ #category : #converting }
JunPoint >> alignedBoxWithCenter: centerPoint [
	"(400 , 300) alignedBoxWithCenter: (400 , 300)."
	"(400 , 300 , 200) alignedBoxWithCenter: (400 , 300 , 200)."

	^ self class alignedBox: self withCenter: centerPoint
]

{ #category : #converting }
JunPoint >> alignedBoxWithScreenCenter [
	"(400 , 300) alignedBoxWithScreenCenter."
	"(400 , 300 , 200) alignedBoxWithScreenCenter."

	^ self class alignedBoxWithScreenCenter: self
]

{ #category : #converting }
JunPoint >> alignedRectangleWithCenter: centerPoint [
	"(400 , 300) alignedRectangleWithCenter: (400 , 300)."
	"(400 , 300 , 200) alignedRectangleWithCenter: (400 , 300 , 200)."

	^ JunGeometry alignedBox: self asPoint rounded withCenter: centerPoint asPoint rounded
]

{ #category : #converting }
JunPoint >> alignedRectangleWithScreenCenter [
	"(400 , 300) alignedRectangleWithScreenCenter."
	"(400 , 300 , 200) alignedRectangleWithScreenCenter."

	^ JunGeometry alignedBoxWithScreenCenter: self asPoint rounded
]

{ #category : #functions }
JunPoint >> array: secondPoint [
	^ Array with: self with: secondPoint
]

{ #category : #functions }
JunPoint >> array: secondPoint with: thirdPoint [
	^ Array with: self with: secondPoint with: thirdPoint
]

{ #category : #functions }
JunPoint >> array: secondPoint with: thirdPoint with: forthPoint [
	^ Array
		with: self
		with: secondPoint
		with: thirdPoint
		with: forthPoint
]

{ #category : #converting }
JunPoint >> asArrayOfPoints [
	^ Array with: self
]

{ #category : #converting }
JunPoint >> asArrays [
	^ Array with: (Array with: self)
]

{ #category : #converting }
JunPoint >> asBoundingBall [
	^ self boundingBallClass origin: self corner: self
]

{ #category : #converting }
JunPoint >> asBoundingBox [
	^ self boundingBoxClass origin: self corner: self
]

{ #category : #converting }
JunPoint >> asJun3dPoint [
	^ Jun3dPoint coerce: self
]

{ #category : #converting }
JunPoint >> asJunOpenGL3dObject [
	"(1 , 1 , 1) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "| aVertex |
	aVertex := JunOpenGL3dVertex point: self.
	aVertex size: 5.
	aVertex paint: self defaultColor.
	^aVertex"
]

{ #category : #converting }
JunPoint >> asPoint [
	^ self x @ self y
]

{ #category : #converting }
JunPoint >> asPointArrays [
	^ Array with: (Array with: self asPoint)
]

{ #category : #converting }
JunPoint >> asRectangle [
	"(100 , 200 extent: 400 , 300) asRectangle."
	"(100 , 200 , 300 extent: 400 , 300 , 200) asRectangle."

	^ Rectangle origin: self asPoint corner: self asPoint
]

{ #category : #comparing }
JunPoint >> between: min and: max [
	^ self >= min and: [ self <= max ]
]

{ #category : #accessing }
JunPoint >> boundingBox [
	^ self asBoundingBox
]

{ #category : #functions }
JunPoint >> box: aPoint [ 
	^ self boundingBoxClass origin: (self min: aPoint) corner: (self max: aPoint)
]

{ #category : #'truncation and round off' }
JunPoint >> ceiling [
	^ self subclassResponsibility
]

{ #category : #functions }
JunPoint >> center: aPoint [
	| thePoint |
	thePoint := self class coerce: aPoint.
	^ self + ((thePoint - self) / 2)
]

{ #category : #coercing }
JunPoint >> coerce: anObject [
	^ self class coerce: anObject
]

{ #category : #testing }
JunPoint >> containsPoint: aJunPoint [
	^ self accuracy: self class accuracy containsPoint: aJunPoint
]

{ #category : #functions }
JunPoint >> corner: aPoint [
	^ self boundingBoxClass origin: self corner: aPoint
]

{ #category : #functions }
JunPoint >> crossProduct: aPoint [
	^ self vectorProduct: aPoint
]

{ #category : #functions }
JunPoint >> dist: aPoint [
	^ self distance: aPoint
]

{ #category : #functions }
JunPoint >> distance: aPoint [
	^ (self - aPoint) rho
]

{ #category : #functions }
JunPoint >> dotProduct: aPoint [
	^ self subclassResponsibility
]

{ #category : #functions }
JunPoint >> extent: aPoint [ 
	^ self boundingBoxClass origin: self extent: aPoint
]

{ #category : #'truncation and round off' }
JunPoint >> floor [
	^ self subclassResponsibility
]

{ #category : #functions }
JunPoint >> from: aPoint [
	"Array 
		with: ((0 , 0 , 0) from: (1 , 1 , 1))
		with: ((0 , 0) from: (1 , 1))."

	^ self lineClass from: aPoint to: self
]

{ #category : #coercing }
JunPoint >> generality [
	^ self subclassResponsibility
]

{ #category : #comparing }
JunPoint >> hash [
	^ self subclassResponsibility
]

{ #category : #functions }
JunPoint >> innerProduct: aPoint [
	^ self dotProduct: aPoint
]

{ #category : #testing }
JunPoint >> isPoint [
	^ true
]

{ #category : #testing }
JunPoint >> isZero [
	^ self subclassResponsibility
]

{ #category : #functions }
JunPoint >> length [
	^ self rho
]

{ #category : #functions }
JunPoint >> length: aNumber [
	| length scale |
	length := self length.
	length > self class accuracy
		ifTrue: [ scale := aNumber / length ]
		ifFalse: [ ^ self ].
	^ self * scale
]

{ #category : #comparing }
JunPoint >> max: aMagnitude [
	self subclassResponsibility
]

{ #category : #comparing }
JunPoint >> min: aMagnitude [
	self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> min: minValue max: maxValue [
	^ self subclassResponsibility
]

{ #category : #arithmetic }
JunPoint >> negated [
	^ self class zero - self
]

{ #category : #testing }
JunPoint >> negative [
	^ self < self class zero
]

{ #category : #functions }
JunPoint >> neighborhoodPoints [
	^ self class neighborhoodPoints: self
]

{ #category : #accessing }
JunPoint >> normalUnitVector [
	^ self unitVector
]

{ #category : #accessing }
JunPoint >> normalVector [
	^ self
]

{ #category : #functions }
JunPoint >> outerProduct: aPoint [
	^ self vectorProduct: aPoint
]

{ #category : #functions }
JunPoint >> plane: normalVector [
	"Array 
		with: ((0 , 0 , 0) plane: (1 , 0 , 0)) 
		with: ((0 , 0) plane: (1 , 0))."

	^ self planeClass on: self normalVector: normalVector
]

{ #category : #functions }
JunPoint >> plane: aPoint1 and: aPoint2 [
	"Array 
		with: ((0 , 0 , 0) plane: (1 , 0 , 0) and: (1 , 1 , 1)) 
		with: ((0 , 0) plane: (1 , 0) and: (1 , 1))."

	^ self planeClass on: self on: aPoint1 on: aPoint2
]

{ #category : #functions }
JunPoint >> polyline: firstPoint with: secondPoint [
	^ self polylineClass vertexes: (Array with: self with: firstPoint with: secondPoint)
]

{ #category : #functions }
JunPoint >> polyline: firstPoint with: secondPoint with: thirdPoint [
	^ self polylineClass
		vertexes:
			(Array
				with: self
				with: firstPoint
				with: secondPoint
				with: thirdPoint)
]

{ #category : #functions }
JunPoint >> polyline: firstPoint with: secondPoint with: thirdPoint with: forthPoint [
	^ self polylineClass
		vertexes:
			(Array with: self)
				,
					(Array
						with: firstPoint
						with: secondPoint
						with: thirdPoint
						with: forthPoint)
]

{ #category : #testing }
JunPoint >> positive [
	^ self >= self class zero
]

{ #category : #functions }
JunPoint >> product: aJun2dPoint [
	^ self vectorProduct: aJun2dPoint
]

{ #category : #arithmetic }
JunPoint >> quo: aNumber [
	^ (self / aNumber) truncated
]

{ #category : #private }
JunPoint >> quoFromInteger: anInteger [
	^ (anInteger / self) truncated
]

{ #category : #functions }
JunPoint >> r [
	^ self rho
]

{ #category : #arithmetic }
JunPoint >> reciprocal [
	^ self class unity / self
]

{ #category : #arithmetic }
JunPoint >> rem: aNumber [
	^ self - ((self quo: aNumber) * aNumber)
]

{ #category : #testing }
JunPoint >> respondsToArithmetic [
	^ true
]

{ #category : #coercing }
JunPoint >> retry: aSymbol coercing: aNumber [
	aSymbol = #=
		ifTrue: [ 
			[ 
			self generality = aNumber generality
				ifTrue: [ ^ false ] ]
				on: MessageNotUnderstood
				do: [ :ex | ^ false ] ].
	((aNumber respondsTo: #generality) not or: [ self generality > aNumber generality ])
		ifTrue: [ ^ self perform: aSymbol with: (self coerce: aNumber) ].
	self generality < aNumber generality
		ifTrue: [ ^ (aNumber coerce: self) perform: aSymbol with: aNumber ].
	^ self error: 'coercion attempt failed'
]

{ #category : #functions }
JunPoint >> rho [
	^ (self dotProduct: self) sqrt
]

{ #category : #'truncation and round off' }
JunPoint >> roundTo: aNumber [
	^ (self / aNumber) rounded * aNumber
]

{ #category : #'truncation and round off' }
JunPoint >> rounded [
	^ self subclassResponsibility
]

{ #category : #testing }
JunPoint >> sign [
	self > self class zero
		ifTrue: [ ^ 1 ].
	self < self class zero
		ifTrue: [ ^ -1 ].
	^ 0
]

{ #category : #functions }
JunPoint >> squared [
	^ self * self
]

{ #category : #testing }
JunPoint >> strictlyPositive [
	^ self > self class zero
]

{ #category : #functions }
JunPoint >> to: aPoint [
	"Array 
		with: ((0 , 0 , 0) to: (1 , 1 , 1))
		with: ((0 , 0) to: (1 , 1))."

	^ self lineClass from: self to: aPoint
]

{ #category : #transforming }
JunPoint >> transform: aTransformation [
	^ aTransformation applyToPoint: self
]

{ #category : #transforming }
JunPoint >> transformationToAlignWith: relativePoint [
	^ self transformationClass align: self with: relativePoint
]

{ #category : #transforming }
JunPoint >> transformationToRotate: anAngle [
	^ self subclassResponsibility
]

{ #category : #transforming }
JunPoint >> transformationToScale [
	^ self transformationClass scale: self
]

{ #category : #transforming }
JunPoint >> transformationToTranslate [
	^ self transformationClass translate: self
]

{ #category : #functions }
JunPoint >> triangle: aPoint1 and: aPoint2 [
	"Array
		with: ((0 , 0 , 0) triangle: (1 , 0 , 0) and: (1 , 1 , 1))
		with: ((0 , 0) triangle: (1 , 0) and: (1 , 1))."

	^ self triangleClass on: self on: aPoint1 on: aPoint2
]

{ #category : #'truncation and round off' }
JunPoint >> truncateTo: aNumber [
	^ (self quo: aNumber) * aNumber
]

{ #category : #'truncation and round off' }
JunPoint >> truncated [
	^ self subclassResponsibility
]

{ #category : #functions }
JunPoint >> unitVector [
	^ self length: 1.0
]

{ #category : #functions }
JunPoint >> vectorProduct: aPoint [
	^ self subclassResponsibility
]

{ #category : #testing }
JunPoint >> whichSideOf: bisector [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunPoint >> x [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunPoint >> y [
	^ self subclassResponsibility
]
