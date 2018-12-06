"
A Jun2dPoint is a point in two-dimensional space.

Instance Variables
	x:		<Float>
	y:		<Float>

"
Class {
	#name : #Jun2dPoint,
	#superclass : #JunPoint,
	#instVars : [
		'x',
		'y'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #examples }
Jun2dPoint class >> example1 [
	"Jun2dPoint example1."

	| aPoint |
	aPoint := 1 , 0.5.
	Transcript
		cr;
		show: aPoint printString.
	Transcript
		cr;
		show: aPoint storeString.
	self todo: 'asJunOpenGL3dObject'.
	"aPoint asJunOpenGL3dObject showWithUnitAxes."
	 ^ aPoint
]

{ #category : #examples }
Jun2dPoint class >> example2 [
	"Jun2dPoint example2."

	| aPolyline polylineBlock tS tT form canvas |
	aPolyline := OrderedCollection new.
	aPolyline add: 0 _, 0.
	aPolyline add: 50 _, 0.
	aPolyline add: 50 _, 50.
	aPolyline add: 0 _, 50.
	aPolyline add: 0 _, 0.
	form := Form extent: 200 @ 200 depth: 32.
	canvas := form getCanvas.
	polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
	tS := Jun2dTransformation scale: 1.5 _, 1.5.
	tT := Jun2dTransformation translate: (Jun2dPoint fromPoint: form extent // 2).
	canvas fillColor: Color white.
	polylineBlock value: (aPolyline collect: [ :p | (p transform: tT) asPoint ]) value: Color black.
	polylineBlock value: (aPolyline collect: [ :p | (p transform: (tS product: tT)) asPoint ]) value: Color red.
	canvas flush.
	form asMorph openInWindow
]

{ #category : #examples }
Jun2dPoint class >> example3 [
	"Jun2dPoint example3."

	| aPolyline polylineBlock tR tT form canvas |
	aPolyline := OrderedCollection new.
	aPolyline add: 0 _ , 0.
	aPolyline add: 50 _ , 0.
	aPolyline add: 50 _ , 50.
	aPolyline add: 0 _ , 50.
	aPolyline add: 0 _ , 0.
	form := Form extent: 200 @ 200 depth: 32.
	canvas := form getCanvas.
	polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
	tR := Jun2dTransformation rotate: (JunAngle fromDeg: 30).
	tT := Jun2dTransformation
		translate: (Jun2dPoint fromPoint: form extent // 2).
	canvas fillColor: Color white.
	polylineBlock
		value: (aPolyline collect: [ :p | (p transform: tT) asPoint ])
		value: Color black.
	polylineBlock
		value: (aPolyline collect: [ :p | (p transform: (tR product: tT)) asPoint ])
		value: Color red.
	canvas flush.
	form asMorph openInWindow
]

{ #category : #'instance creation' }
Jun2dPoint class >> fromArray: anArray [
	^ self x: (anArray at: 1) y: (anArray at: 2)
]

{ #category : #'instance creation' }
Jun2dPoint class >> fromNumber: aNumber [
	^ self x: aNumber y: aNumber
]

{ #category : #'instance creation' }
Jun2dPoint class >> fromPoint: aPoint [
	^ self x: aPoint x y: aPoint y
]

{ #category : #utilities }
Jun2dPoint class >> neighborhood24Points: aPoint [
	"Jun2dPoint neighborhood24Points: Point zero."

	| aCollection |
	aCollection := OrderedCollection new: 24.
	-2 to: 2 do: [ :y | 
		-2 to: 2 do: [ :x | 
			(x = 0 and: [ y = 0 ])
				ifFalse: [ aCollection add: aPoint + (x _ , y) ] ] ].
	^ aCollection
]

{ #category : #utilities }
Jun2dPoint class >> neighborhood4Points: aPoint [
	"Jun2dPoint neighborhood4Points: Jun2dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 4.
	aCollection add: aPoint + (1 _, 0).
	aCollection add: aPoint + (0 _, 1).
	aCollection add: aPoint + (-1 _, 0).
	aCollection add: aPoint + (0 _, -1).
	^ aCollection
]

{ #category : #utilities }
Jun2dPoint class >> neighborhood8Points: aPoint [
	"Jun2dPoint neighborhood8Points: Jun2dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 8.
	aCollection add: aPoint + (1 _, 0).
	aCollection add: aPoint + (1 _, 1).
	aCollection add: aPoint + (0 _, 1).
	aCollection add: aPoint + (-1 _, 1).
	aCollection add: aPoint + (-1 _, 0).
	aCollection add: aPoint + (-1 _, -1).
	aCollection add: aPoint + (0 _, -1).
	aCollection add: aPoint + (1 _, -1).
	^ aCollection
]

{ #category : #utilities }
Jun2dPoint class >> neighborhoodPoints: aPoint [
	"Jun2dPoint neighborhoodPoints: Jun2dPoint zero."

	^ self neighborhood8Points: aPoint
]

{ #category : #'instance creation' }
Jun2dPoint class >> rho: rho theta: theta [
	^ self x: rho * theta cos y: rho * theta sin
]

{ #category : #'constants access' }
Jun2dPoint class >> unity [
	"Jun2dPoint unity."

	^ self x: 1.0 y: 1.0
]

{ #category : #'instance creation' }
Jun2dPoint class >> x: xNumber y: yNumber [
	^ self basicNew
		setX: xNumber;
		setY: yNumber;
		yourself
]

{ #category : #'instance creation' }
Jun2dPoint class >> x: xNumber y: yNumber z: zNumber [
	^ self x: xNumber y: yNumber
]

{ #category : #'constants access' }
Jun2dPoint class >> zero [
	"Jun2dPoint unity."

	^ self x: 0.0 y: 0.0
]

{ #category : #arithmetic }
Jun2dPoint >> * aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x * aPoint x y: y * aPoint y ].
	^ self retry: #* coercing: aPoint
]

{ #category : #arithmetic }
Jun2dPoint >> + aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x + aPoint x y: y + aPoint y ].
	^ self retry: #+ coercing: aPoint
]

{ #category : #converting }
Jun2dPoint >> , aNumber [
	^ Jun3dPoint x: self x y: self y z: aNumber
]

{ #category : #arithmetic }
Jun2dPoint >> - aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x - aPoint x y: y - aPoint y ].
	^ self retry: #- coercing: aPoint
]

{ #category : #arithmetic }
Jun2dPoint >> / aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x / aPoint x y: y / aPoint y ].
	^ self retry: #/ coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> < aPoint [
	self class = aPoint class
		ifTrue: [ ^ x < aPoint x and: [ y < aPoint y ] ].
	^ self retry: #< coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> <= aPoint [
	self class = aPoint class
		ifTrue: [ ^ x <= aPoint x and: [ y <= aPoint y ] ].
	^ self retry: #<= coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> = aPoint [
	self class = aPoint class
		ifTrue: [ ^ x = aPoint x and: [ y = aPoint y ] ].
	^ self retry: #= coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> > aPoint [
	self class = aPoint class
		ifTrue: [ ^ x > aPoint x and: [ y > aPoint y ] ].
	^ self retry: #> coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> >= aPoint [
	self class = aPoint class
		ifTrue: [ ^ x >= aPoint x and: [ y >= aPoint y ] ].
	^ self retry: #>= coercing: aPoint
]

{ #category : #arithmetic }
Jun2dPoint >> abs [
	^ self class x: x abs y: y abs
]

{ #category : #functions }
Jun2dPoint >> angleBetween: aJun2dPoint1 and: aJun2dPoint2 [
	| v1 v2 r1 r2 |
	v1 := aJun2dPoint1 - self.
	v2 := aJun2dPoint2 - self.
	r1 := v1 r.
	r2 := v2 r.
	(r1 < self class accuracy or: [ r2 < self class accuracy ])
		ifTrue: [ ^ JunAngle zero ]
		ifFalse: [ 
			| sin |
			sin := ((self y asFloat + aJun2dPoint1 y asFloat) * (self x asFloat - aJun2dPoint1 x asFloat)
				+ ((aJun2dPoint1 y asFloat + aJun2dPoint2 y asFloat) * (aJun2dPoint1 x asFloat - aJun2dPoint2 x asFloat))
				+ ((aJun2dPoint2 y asFloat + self y asFloat) * (aJun2dPoint2 x asFloat - self x asFloat))) / 2 * 2.0 / r1 / r2.
			sin := (sin max: -1.0) min: 1.0.
			^ (v1 dotProduct: v2) >= 0.0
				ifTrue: [ JunAngle fromRad: sin arcSin ]
				ifFalse: [ 
					sin abs < self class accuracy
						ifTrue: [ JunAngle pi ]
						ifFalse: [ ((Float pi - sin arcSin abs) * sin sign) asRadians ] ] ]
]

{ #category : #converting }
Jun2dPoint >> as2dPoint [
	^ self
]

{ #category : #converting }
Jun2dPoint >> as3dPoint [
	^ self , 0.0
]

{ #category : #converting }
Jun2dPoint >> asArray [
	| array |
	array := Array new: 2.
	array at: 1 put: x.
	array at: 2 put: y.
	^ array
]

{ #category : #functions }
Jun2dPoint >> ball: radiusValue [ 
	^ self notYetImplemented "^Jun2dBoundingBall center: self radius: radiusValue"
]

{ #category : #functions }
Jun2dPoint >> bisector: aPoint [ 
	^ self notYetImplemented "^Jun2dLine between: self and: aPoint"
]

{ #category : #'truncation and round off' }
Jun2dPoint >> ceiling [
	^ self class x: x ceiling y: y ceiling
]

{ #category : #functions }
Jun2dPoint >> dotProduct: aPoint [
	| newPoint |
	newPoint := self * aPoint.
	^ newPoint x + newPoint y
]

{ #category : #comparing }
Jun2dPoint >> equal: aPoint [
	self class == aPoint class
		ifFalse: [ ^ false ].
	^ (self x - aPoint x) abs < self accuracy and: [ (self y - aPoint y) abs < self accuracy ]
]

{ #category : #'truncation and round off' }
Jun2dPoint >> floor [
	^ self class x: x floor y: y floor
]

{ #category : #coercing }
Jun2dPoint >> generality [
	^ 200
]

{ #category : #functions }
Jun2dPoint >> grid: aPoint [
	| newX newY |
	(aPoint isKindOf: self class)
		ifFalse: [ ^ self retry: #grid: coercing: aPoint ].
	aPoint x = 0
		ifTrue: [ newX := 0 ]
		ifFalse: [ newX := self x roundTo: aPoint x ].
	aPoint y = 0
		ifTrue: [ newY := 0 ]
		ifFalse: [ newY := self y roundTo: aPoint y ].
	^ self class x: newX y: newY
]

{ #category : #comparing }
Jun2dPoint >> hash [
	^ (x hash bitShift: 2) bitXor: y hash
]

{ #category : #testing }
Jun2dPoint >> is2d [
	^ true
]

{ #category : #testing }
Jun2dPoint >> isZero [
	^ x isZero and: [ y isZero ]
]

{ #category : #comparing }
Jun2dPoint >> max: aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: (x max: aPoint x) y: (y max: aPoint y) ].
	^ self retry: #max: coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> min: aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: (x min: aPoint x) y: (y min: aPoint y) ].
	^ self retry: #min: coercing: aPoint
]

{ #category : #comparing }
Jun2dPoint >> min: minValue max: maxValue [
	| minPoint maxPoint |
	minPoint := self class coerce: minValue.
	maxPoint := self class coerce: maxValue.
	^ self class x: (maxPoint x max: (self x min: minPoint x)) y: (maxPoint y max: (self y min: minPoint y))
]

{ #category : #functions }
Jun2dPoint >> radius: radiusValue [ 
	^ self notYetImplemented "^Jun2dCircle center: self radius: radiusValue"
]

{ #category : #'truncation and round off' }
Jun2dPoint >> rounded [
	^ self class x: x rounded y: y rounded
]

{ #category : #private }
Jun2dPoint >> setX: aNumber [
	x := aNumber asFloat
]

{ #category : #private }
Jun2dPoint >> setY: aNumber [
	y := aNumber asFloat
]

{ #category : #functions }
Jun2dPoint >> sphere: radiusValue [ 
	^JunSphereSurface center: self x _, self y , 0 radius: radiusValue
]

{ #category : #printing }
Jun2dPoint >> storeOn: aStream [
	aStream nextPutAll: '('.
	self x storeOn: aStream.
	aStream nextPutAll: ' _, '.
	self y storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #'polar coordinates' }
Jun2dPoint >> theta [
	| theta |
	x isZero
		ifTrue: [ 
			y isZero
				ifTrue: [ ^ JunAngle zero ].
			y >= 0
				ifTrue: [ ^ 0.5 * JunAngle pi ]
				ifFalse: [ ^ 1.5 * JunAngle pi ] ].
	theta := JunAngle fromRad: (y / x) arcTan.
	x >= 0
		ifTrue: [ 
			y >= 0
				ifTrue: [ ^ theta ]
				ifFalse: [ ^ 2.0 * JunAngle pi + theta ] ]
		ifFalse: [ ^ 1.0 * JunAngle pi + theta ]
]

{ #category : #transforming }
Jun2dPoint >> transformationToRotate: anAngle [ 
	^Jun2dTransformation rotate: anAngle around: self
]

{ #category : #'truncation and round off' }
Jun2dPoint >> truncated [
	^ self class x: x truncated y: y truncated
]

{ #category : #functions }
Jun2dPoint >> vectorProduct: aJun2dPoint [
	^ x * aJun2dPoint y - (y * aJun2dPoint x)
]

{ #category : #testing }
Jun2dPoint >> whichSideOf: aLine [
	^ aLine whichSide: self
]

{ #category : #accessing }
Jun2dPoint >> x [
	^ x
]

{ #category : #accessing }
Jun2dPoint >> y [
	^ y
]

{ #category : #accessing }
Jun2dPoint >> z [
	^ 0
]
