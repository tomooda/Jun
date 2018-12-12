"
A Jun3dPoint is a point object in three-dimensional coordinate system. Jun3dPoint supports cartesian coordinate systam (x, y, z) as well as polar coordinate systam (rho, phi, theta), where phi and theta can be given in either JunAngle or Number (in radians).

Instance Variables
	x:		<Object>
	y:		<Object>
	z:		<Object>

x
	- x coordinate in floating point number

y
	- y coordinate in floating point number

z
	- z coordinate in floating point number

"
Class {
	#name : #Jun3dPoint,
	#superclass : #JunPoint,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #examples }
Jun3dPoint class >> example1 [
	"Jun3dPoint example1."

	| aPoint |
	aPoint := 1 ,, 0.5 ,, 0.25.
	Transcript
		cr;
		show: aPoint printString.
	Transcript
		cr;
		show: aPoint storeString.
	self todo: 'asJunOpenGL3dObject'.
	"aPoint asJunOpenGL3dObject showWithUnitAxes."
	^aPoint
]

{ #category : #examples }
Jun3dPoint class >> example2 [
	"Jun3dPoint example2."

	| aPolyline1 aPolyline2 form viewPoint tS tP tT tPT tSPT |
	aPolyline1 := OrderedCollection new.
	aPolyline1 add: 0 ,, 0 ,, 50.
	aPolyline1 add: 50 ,, 0 ,, 50.
	aPolyline1 add: 50 ,, 50 ,, 50.
	aPolyline1 add: 0 ,, 50 ,, 50.
	aPolyline1 add: 0 ,, 0 ,, 50.
	aPolyline2 := OrderedCollection new.
	aPolyline2 add: 0 ,, 0 ,, 0.
	aPolyline2 add: 50 ,, 0 ,, 0.
	aPolyline2 add: 50 ,, 50 ,, 0.
	aPolyline2 add: 0 ,, 50 ,, 0.
	aPolyline2 add: 0 ,, 0 ,, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			| polylineBlock |
			viewPoint := 25 ,, 25 ,, 150.
			tS := Jun3dTransformation scale: 1.5 ,, 1.5 ,, 1.5.
			tP := Jun3dTransformation perspective: viewPoint.
			tT := Jun3dTransformation translate: (Jun3dPoint fromPoint: form extent // 2).
			tPT := tP product: tT.
			tSPT := (tS product: tP) product: tT.
			canvas fillColor: Color white.
			polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
			polylineBlock
				value: (aPolyline2 collect: [ :p | (p transform: tPT) asPoint ])
				value: Color gray.
			aPolyline1
				with: aPolyline2
				do: [ :p1 :p2 | 
					| from to |
					from := (p1 transform: tPT) asPoint.
					to := (p2 transform: tPT) asPoint.
					canvas line: from to: to color: Color red ].
			polylineBlock
				value: (aPolyline1 collect: [ :p | (p transform: tPT) asPoint ])
				value: Color black.
			polylineBlock
				value: (aPolyline2 collect: [ :p | (p transform: tSPT) asPoint ])
				value: Color gray.
			aPolyline1
				with: aPolyline2
				do: [ :p1 :p2 | 
					| from to |
					from := (p1 transform: tSPT) asPoint.
					to := (p2 transform: tSPT) asPoint.
					canvas line: from to: to color: Color red ].
			polylineBlock
				value: (aPolyline1 collect: [ :p | (p transform: tSPT) asPoint ])
				value: Color black.
			canvas flush ].
	form asMorph openInWindow
]

{ #category : #examples }
Jun3dPoint class >> example3 [
	"Jun3dPoint example3."

	| aPolyline1 aPolyline2 form viewPoint tR tP tT tPT tRPT |
	aPolyline1 := OrderedCollection new.
	aPolyline1 add: 0 ,, 0 ,, 50.
	aPolyline1 add: 50 ,, 0 ,, 50.
	aPolyline1 add: 50 ,, 50 ,, 50.
	aPolyline1 add: 0 ,, 50 ,, 50.
	aPolyline1 add: 0 ,, 0 ,, 50.
	aPolyline2 := OrderedCollection new.
	aPolyline2 add: 0 ,, 0 ,, 0.
	aPolyline2 add: 50 ,, 0 ,, 0.
	aPolyline2 add: 50 ,, 50 ,, 0.
	aPolyline2 add: 0 ,, 50 ,, 0.
	aPolyline2 add: 0 ,, 0 ,, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			| polylineBlock |
			viewPoint := 25 ,, 25 ,, 150.
			tR := Jun3dTransformation rotate: (JunAngle fromDeg: 30).
			tP := Jun3dTransformation perspective: viewPoint.
			tT := Jun3dTransformation translate: (Jun3dPoint fromPoint: form extent // 2).
			tPT := tP product: tT.
			tRPT := (tR product: tP) product: tT.
			canvas fillColor: Color white.
			polylineBlock := [ :points :color | 1 to: points size - 1 do: [ :i | canvas line: (points at: i) to: (points at: i + 1) color: color ] ].
			polylineBlock
				value: (aPolyline2 collect: [ :p | (p transform: tPT) asPoint ])
				value: Color gray.
			aPolyline1
				with: aPolyline2
				do: [ :p1 :p2 | 
					| from to |
					from := (p1 transform: tPT) asPoint.
					to := (p2 transform: tPT) asPoint.
					canvas line: from to: to color: Color red ].
			polylineBlock
				value: (aPolyline1 collect: [ :p | (p transform: tPT) asPoint ])
				value: Color black.
			polylineBlock
				value: (aPolyline2 collect: [ :p | (p transform: tRPT) asPoint ])
				value: Color gray.
			aPolyline1
				with: aPolyline2
				do: [ :p1 :p2 | 
					| from to |
					from := (p1 transform: tRPT) asPoint.
					to := (p2 transform: tRPT) asPoint.
					canvas line: from to: to color: Color red ].
			polylineBlock
				value: (aPolyline1 collect: [ :p | (p transform: tRPT) asPoint ])
				value: Color black.
			canvas flush ].
	form asMorph openInWindow
]

{ #category : #'instance creation' }
Jun3dPoint class >> fromArray: anArray [
	^ self x: (anArray at: 1) y: (anArray at: 2) z: (anArray at: 3)
]

{ #category : #'instance creation' }
Jun3dPoint class >> fromNumber: aNumber [
	^ self x: aNumber y: aNumber z: aNumber
]

{ #category : #'instance creation' }
Jun3dPoint class >> fromPoint: aPoint [
	^ self
		x: aPoint x
		y: aPoint y
		z:
			((aPoint respondsTo: #z)
				ifTrue: [ aPoint z ]
				ifFalse: [ 0.0 ])
]

{ #category : #utilities }
Jun3dPoint class >> neighborhood124Points: aPoint [
	"Jun3dPoint neighborhood124Points: Jun3dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 24.
	-2 to: 2 do: [ :z | 
		-2 to: 2 do: [ :y | 
			-2 to: 2 do: [ :x | 
				(x = 0 and: [ y = 0 and: [ z = 0 ] ])
					ifFalse: [ aCollection add: aPoint + (x ,, y ,, z) ] ] ] ].
	^ aCollection
]

{ #category : #utilities }
Jun3dPoint class >> neighborhood26Points: aPoint [
	"Jun3dPoint neighborhood26Points: Jun3dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 9 + 8 + 9.
	aCollection add: aPoint + (0 ,, 0 ,, 1).
	aCollection add: aPoint + (1 ,, 0 ,, 1).
	aCollection add: aPoint + (1 ,, 1 ,, 1).
	aCollection add: aPoint + (0 ,, 1 ,, 1).
	aCollection add: aPoint + (-1 ,, 1 ,, 1).
	aCollection add: aPoint + (-1 ,, 0 ,, 1).
	aCollection add: aPoint + (-1 ,, -1 ,, 1).
	aCollection add: aPoint + (0 ,, -1 ,, 1).
	aCollection add: aPoint + (1 ,, -1 ,, 1).
	aCollection add: aPoint + (1 ,, 0 ,, 0).
	aCollection add: aPoint + (1 ,, 1 ,, 0).
	aCollection add: aPoint + (0 ,, 1 ,, 0).
	aCollection add: aPoint + (-1 ,, 1 ,, 0).
	aCollection add: aPoint + (-1 ,, 0 ,, 0).
	aCollection add: aPoint + (-1 ,, -1 ,, 0).
	aCollection add: aPoint + (0 ,, -1 ,, 0).
	aCollection add: aPoint + (1 ,, -1 ,, 0).
	aCollection add: aPoint + (1 ,, 0 ,, -1).
	aCollection add: aPoint + (1 ,, 1 ,, -1).
	aCollection add: aPoint + (0 ,, 1 ,, -1).
	aCollection add: aPoint + (-1 ,, 1 ,, -1).
	aCollection add: aPoint + (-1 ,, 0 ,, -1).
	aCollection add: aPoint + (-1 ,, -1 ,, -1).
	aCollection add: aPoint + (0 ,, -1 ,, -1).
	aCollection add: aPoint + (1 ,, -1 ,, -1).
	aCollection add: aPoint + (0 ,, 0 ,, -1).
	^ aCollection
]

{ #category : #utilities }
Jun3dPoint class >> neighborhood6Points: aPoint [
	"Jun3dPoint neighborhood6Points: Jun3dPoint zero."

	| aCollection |
	aCollection := OrderedCollection new: 6.
	aCollection add: aPoint + (0 ,, 0 ,, 1).
	aCollection add: aPoint + (1 ,, 0 ,, 0).
	aCollection add: aPoint + (0 ,, 1 ,, 0).
	aCollection add: aPoint + (-1 ,, 0 ,, 0).
	aCollection add: aPoint + (0 ,, -1 ,, 0).
	aCollection add: aPoint + (0 ,, 0 ,, -1).
	^ aCollection
]

{ #category : #utilities }
Jun3dPoint class >> neighborhoodPoints: aPoint [
	"Jun3dPoint neighborhoodPoints: Jun3dPoint zero."

	^ self neighborhood26Points: aPoint
]

{ #category : #'instance creation' }
Jun3dPoint class >> normalUnitVectorOfPoints: anArrayOfPoints [
	^ (self normalVectorOfPoints: anArrayOfPoints) unitVector
]

{ #category : #'instance creation' }
Jun3dPoint class >> normalVectorOfPoints: anArrayOfPoints [
	| size oneThirds point1 point2 point3 vector1 vector2 |
	(size := anArrayOfPoints size) < 3
		ifTrue: [ ^ nil ].
	oneThirds := (size / 3) asInteger.
	point1 := anArrayOfPoints at: 1.
	point2 := anArrayOfPoints at: 1 + oneThirds.
	point3 := anArrayOfPoints at: 1 + (oneThirds * 2).
	vector1 := self x: point2 x - point1 x y: point2 y - point1 y z: point2 z - point1 z.
	vector2 := self x: point3 x - point2 x y: point3 y - point2 y z: point3 z - point2 z.
	^ vector1 product: vector2
]

{ #category : #'instance creation' }
Jun3dPoint class >> rho: rho phi: phi theta: theta [
	^ self x: rho * theta sin * phi cos y: rho * theta sin * phi sin z: rho * theta cos
]

{ #category : #'constant access' }
Jun3dPoint class >> unity [
	"Jun3dPoint unity."

	^ self x: 1.0 y: 1.0 z: 1.0
]

{ #category : #'instance creation' }
Jun3dPoint class >> x: xNumber y: yNumber [
	^ self x: xNumber y: yNumber z: 0.0
]

{ #category : #'instance creation' }
Jun3dPoint class >> x: xNumber y: yNumber z: zNumber [
	^ self basicNew
		setX: xNumber;
		setY: yNumber;
		setZ: zNumber;
		yourself
]

{ #category : #'constant access' }
Jun3dPoint class >> zero [
	"Jun3dPoint zero."

	^ self x: 0.0 y: 0.0 z: 0.0
]

{ #category : #arithmetic }
Jun3dPoint >> * aPoint [
	(aPoint isKindOf: self class)
		ifTrue: [ ^ self class x: x * aPoint x y: y * aPoint y z: z * aPoint z ].
	^ self retry: #* coercing: aPoint
]

{ #category : #arithmetic }
Jun3dPoint >> + aPoint [
	(aPoint isKindOf: self class)
		ifTrue: [ ^ self class x: x + aPoint x y: y + aPoint y z: z + aPoint z ].
	^ self retry: #+ coercing: aPoint
]

{ #category : #arithmetic }
Jun3dPoint >> - aPoint [
	(aPoint isKindOf: self class)
		ifTrue: [ ^ self class x: x - aPoint x y: y - aPoint y z: z - aPoint z ].
	^ self retry: #- coercing: aPoint
]

{ #category : #arithmetic }
Jun3dPoint >> / aPoint [
	(aPoint isKindOf: self class)
		ifTrue: [ ^ self class x: x / aPoint x y: y / aPoint y z: z / aPoint z ].
	^ self retry: #/ coercing: aPoint
]

{ #category : #comparing }
Jun3dPoint >> < aPoint [
	self class = aPoint class
		ifTrue: [ ^ x < aPoint x and: [ y < aPoint y and: [ z < aPoint z ] ] ].
	^ self retry: #< coercing: aPoint
]

{ #category : #arithmetic }
Jun3dPoint >> abs [
	^ self class x: x abs y: y abs z: z abs
]

{ #category : #converting }
Jun3dPoint >> as2dPoint [
	^ self x ,, self y
]

{ #category : #converting }
Jun3dPoint >> as3dPoint [
	^ self
]

{ #category : #converting }
Jun3dPoint >> asArray [
	| array |
	array := Array new: 3.
	array at: 1 put: x.
	array at: 2 put: y.
	array at: 3 put: z.
	^ array
]

{ #category : #converting }
Jun3dPoint >> asJun3dPoint [
	^ self
]

{ #category : #functions }
Jun3dPoint >> ball: radiusValue [ 
	^ self notYetImplemented "^Jun3dBoundingBall center: self radius: radiusValue"
]

{ #category : #functions }
Jun3dPoint >> bisector: aPoint [ 
	^ self notYetImplemented "^JunPlane between: self and: aPoint"
]

{ #category : #'truncation and round off' }
Jun3dPoint >> ceiling [
	^ self class x: x ceiling y: y ceiling z: z ceiling
]

{ #category : #functions }
Jun3dPoint >> circularCone: radiusValue height: heightValue [ 
	"(1 , 1 , 1) circularCone: 1 height: 2."

	^ self notYetImplemented "^JunCircularCone 
		center: self
		radius: radiusValue
		height: heightValue"
]

{ #category : #functions }
Jun3dPoint >> circularCylinder: radiusValue height: heightValue [ 
	"(1 , 1 , 1) circularCylinder: 1 height: 2."

	^ self notYetImplemented "^JunCircularCylinder 
		center: self
		radius: radiusValue
		height: heightValue"
]

{ #category : #functions }
Jun3dPoint >> cone: radiusValue height: heightValue [
	"(1 , 1 , 1) cone: 1 height: 2."

	^ self circularCone: radiusValue height: heightValue
]

{ #category : #functions }
Jun3dPoint >> cylinder: radiusValue height: heightValue [
	"(1 , 1 , 1) cylinder: 1 height: 2."

	^ self circularCylinder: radiusValue height: heightValue
]

{ #category : #functions }
Jun3dPoint >> dotProduct: aPoint [
	| newPoint |
	newPoint := self * aPoint.
	^ newPoint x + newPoint y + newPoint z
]

{ #category : #comparing }
Jun3dPoint >> equal: aPoint [
	self class == aPoint class
		ifFalse: [ ^ false ].
	^ (self x - aPoint x) abs < self accuracy
		and: [ (self y - aPoint y) abs < self accuracy and: [ (self z - aPoint z) abs < self accuracy ] ]
]

{ #category : #'truncation and round off' }
Jun3dPoint >> floor [
	^ self class x: x floor y: y floor z: z floor
]

{ #category : #coercing }
Jun3dPoint >> generality [
	^ 220
]

{ #category : #functions }
Jun3dPoint >> grid: aPoint [
	| newX newY newZ |
	(aPoint isKindOf: self class)
		ifFalse: [ ^ self retry: #grid: coercing: aPoint ].
	aPoint x = 0
		ifTrue: [ newX := 0 ]
		ifFalse: [ newX := self x roundTo: aPoint x ].
	aPoint y = 0
		ifTrue: [ newY := 0 ]
		ifFalse: [ newY := self y roundTo: aPoint y ].
	aPoint z = 0
		ifTrue: [ newZ := 0 ]
		ifFalse: [ newZ := self z roundTo: aPoint z ].
	^ self class x: newX y: newY z: newZ
]

{ #category : #comparing }
Jun3dPoint >> hash [
	^ ((x hash bitShift: 3) bitXor: (y hash bitShift: 2)) bitXor: z hash
]

{ #category : #functions }
Jun3dPoint >> intersectingPointWithLine: aJun3dLine [ 
	^ self notYetImplemented "^(aJun3dLine containsPoint: self)
		ifTrue: [self]
		ifFalse: [nil]"
]

{ #category : #testing }
Jun3dPoint >> is3d [
	^ true
]

{ #category : #testing }
Jun3dPoint >> isZero [
	^ (x isZero and: [ y isZero ]) and: [ z isZero ]
]

{ #category : #comparing }
Jun3dPoint >> max: aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: (x max: aPoint x) y: (y max: aPoint y) z: (z max: aPoint z) ].
	^ self retry: #max: coercing: aPoint
]

{ #category : #comparing }
Jun3dPoint >> min: aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: (x min: aPoint x) y: (y min: aPoint y) z: (z min: aPoint z) ].
	^ self retry: #min: coercing: aPoint
]

{ #category : #arithmetic }
Jun3dPoint >> min: minValue max: maxValue [
	"Caution! The original Jun had the opposite semantics.
	I adopted Squeak/Pharo's semantics to keep sound polymorphism
	in the Smalltalk system. Any code that assumes the original Jun's semantics
	needs modification."

	| minPoint maxPoint |
	minPoint := self class coerce: minValue.
	maxPoint := self class coerce: maxValue.
	^ self class
		x: (maxPoint x max: (self x min: minPoint x))
		y: (maxPoint y max: (self y min: minPoint y))
		z: (maxPoint z max: (self z min: minPoint z))
]

{ #category : #'polar coordinates' }
Jun3dPoint >> phi [
	| phi |
	x isZero
		ifTrue: [ 
			y isZero
				ifTrue: [ ^ JunAngle zero ].
			y >= 0
				ifTrue: [ ^ 0.5 * JunAngle pi ]
				ifFalse: [ ^ 1.5 * JunAngle pi ] ].
	phi := JunAngle fromRad: (y asFloat / x asFloat) arcTan.
	x >= 0
		ifTrue: [ 
			y >= 0
				ifTrue: [ ^ phi ]
				ifFalse: [ ^ 2.0 * JunAngle pi + phi ] ]
		ifFalse: [ ^ 1.0 * JunAngle pi + phi ]
]

{ #category : #functions }
Jun3dPoint >> product: aPoint [
	^ self vectorProduct: aPoint
]

{ #category : #functions }
Jun3dPoint >> radius: radiusValue [ 
	^ JunSphereSurface center: self radius: radiusValue
]

{ #category : #functions }
Jun3dPoint >> radius: radiusValue normalVector: normalVector [
	^ self radius: radiusValue upVector: normalVector
]

{ #category : #functions }
Jun3dPoint >> radius: radiusValue upVector: upVector [ 
	^ self notYetImplemented "^Jun3dCircle 
		center: self
		radius: radiusValue
		upVector: upVector"
]

{ #category : #'truncation and round off' }
Jun3dPoint >> rounded [
	^ self class x: x rounded y: y rounded z: z rounded
]

{ #category : #private }
Jun3dPoint >> setX: aNumber [ 
	x := aNumber asFloat
]

{ #category : #private }
Jun3dPoint >> setY: aNumber [ 
	y := aNumber asFloat
]

{ #category : #private }
Jun3dPoint >> setZ: aNumber [ 
	z := aNumber asFloat
]

{ #category : #functions }
Jun3dPoint >> sphere: radiusValue [ 
	^ JunSphereSurface center: self radius: radiusValue
]

{ #category : #printing }
Jun3dPoint >> storeOn: aStream [
	aStream nextPutAll: '('.
	self x storeOn: aStream.
	aStream nextPutAll: ' _, '.
	self y storeOn: aStream.
	aStream nextPutAll: ' , '.
	self z storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #sweeping }
Jun3dPoint >> sweep: aJun3dPoint [
	^ self notYetImplemented "^Jun3dLine from: self to: self + aJun3dPoint"
]

{ #category : #sweeping }
Jun3dPoint >> sweepAround: aJun3dLine [ 
	^ self notYetImplemented "| center radius normalVector |
	center := aJun3dLine nearestPointFromPoint: self.
	radius := self distance: center.
	normalVector := aJun3dLine asUnitVector.
	^JunNurbsCurve
		circleCenter: center
		normalVector: normalVector
		radius: radius"
]

{ #category : #functions }
Jun3dPoint >> tetrahedron: aPoint1 and: aPoint2 and: aPoint3 [ 
	"(1 , 0 , 0) tetrahedron: (0 , 1 , 0) and: (0 , 0 , 1) and: (0 , 0 , 0)."

	^ self notYetImplemented "^JunTetrahedron 
		on: self
		on: aPoint1
		on: aPoint2
		on: aPoint3"
]

{ #category : #'polar coordinates' }
Jun3dPoint >> theta [
	| wk theta |
	wk := (x * x + (y * y)) sqrt.
	z isZero
		ifTrue: 
			[wk isZero ifTrue: [^JunAngle zero].
			^0.5 * JunAngle pi].
	theta := JunAngle fromRad: (wk asFloat / z asFloat) arcTan.
	z >= 0
		ifTrue: [^theta]
		ifFalse: [^1.0 * JunAngle pi + theta]
]

{ #category : #transformation }
Jun3dPoint >> transformationToAlignVectorWithVector: aJun3dPoint [ 
	^ Jun3dTransformation alignVector: self withVector: aJun3dPoint
]

{ #category : #transformation }
Jun3dPoint >> transformationToRotate: anAngle [
	^ Jun3dTransformation rotate: anAngle around: (self to: self + (0 ,, 0 ,, 1))
]

{ #category : #'truncation and round off' }
Jun3dPoint >> truncated [
	^ self class x: x truncated y: y truncated z: z truncated
]

{ #category : #functions }
Jun3dPoint >> vectorProduct: aPoint [
	^ self class x: y * aPoint z - (z * aPoint y) y: z * aPoint x - (x * aPoint z) z: x * aPoint y - (y * aPoint x)
]

{ #category : #testing }
Jun3dPoint >> whichSideOf: aPlane [
	^ aPlane whichSide: self
]

{ #category : #accessing }
Jun3dPoint >> x [
	^ x
]

{ #category : #accessing }
Jun3dPoint >> y [
	^ y
]

{ #category : #accessing }
Jun3dPoint >> z [
	^ z
]
