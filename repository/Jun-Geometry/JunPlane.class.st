"
A JunPlane is a flat plane in three dimensional space.
ax + by + cz + d = 0

Instance Variables
	a:		<Float>
	b:		<Float>
	c:		<Float>
	d:		<Float>
	p1:		<Jun3dPoint>
	p2:		<Jun3dPoint>
	p3:		<Jun3dPoint>
"
Class {
	#name : #JunPlane,
	#superclass : #JunSurface,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'p1',
		'p2',
		'p3'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #'instance creation' }
JunPlane class >> a: aNumber1 b: aNumber2 c: aNumber3 d: aNumber4 [
	| aPlane normalVector pa pb pc p1 p2 p3 |
	aPlane := self new.
	aPlane setA: aNumber1.
	aPlane setB: aNumber2.
	aPlane setC: aNumber3.
	aPlane setD: aNumber4.
	normalVector := aNumber1 ,, aNumber2 ,, aNumber3.
	normalVector length < self accuracy
		ifTrue: [ ^ self error: 'Invalid parameters.' ].
	pa := pb := pc := nil.
	aPlane a abs >= self accuracy
		ifTrue: [ pa := (aPlane d / aPlane a) negated ,, 0 ,, 0 ].
	aPlane b abs >= self accuracy
		ifTrue: [ pb := 0 ,, (aPlane d / aPlane b) negated ,, 0 ].
	aPlane c abs >= self accuracy
		ifTrue: [ pc := 0 ,, 0 ,, (aPlane d / aPlane c) negated ].
	pa notNil
		ifTrue: [ p1 := pa.
			pb notNil
				ifTrue: [ p2 := pb ]
				ifFalse: [ pc notNil
						ifTrue: [ p2 := pc ]
						ifFalse: [ p2 := pa x ,, 0.0 ,, 1.0 ] ] ]
		ifFalse: [ pb notNil
				ifTrue: [ p1 := pb.
					pc notNil
						ifTrue: [ p2 := pc ]
						ifFalse: [ p2 := 1.0 ,, pb y ,, 0.0 ] ]
				ifFalse: [ pc notNil
						ifTrue: [ p1 := pc.
							p2 := 1.0 ,, 0.0 ,, pc z ]
						ifFalse: [ self error: 'Invalid parameters.' ] ] ].
	p2 := p1 + (p2 - p1) unitVector.
	p3 := p1 - p2 vectorProduct: normalVector unitVector.
	aPlane setP1: p1.
	aPlane setP2: p2.
	aPlane setP3: p3.
	^ aPlane
]

{ #category : #'instance creation' }
JunPlane class >> between: aPoint1 and: aPoint2 [
	"JunPlane between: (0 , 0 , 0) and: (1 , 1 , 1)."

	| centerPoint |
	centerPoint := aPoint1 center: aPoint2.
	^ self on: centerPoint vertical: (aPoint1 to: aPoint2)
]

{ #category : #'instance creation' }
JunPlane class >> first: aPoint1 second: aPoint2 third: aPoint3 [
	^ self on: aPoint1 on: aPoint2 on: aPoint3
]

{ #category : #'instance creation' }
JunPlane class >> on: aPoint normalVector: aVector [
	"(JunPlane on: (1 , 1 , 1) normalVector: (1 , 1 , 1)) asJunOpenGL3dObject showWithAxes."
	"(JunPlane on: (1 , 1 , 0) normalVector: (-1 , -1 , 0))  asJunOpenGL3dObject showWithAxes."

	^ self on: aPoint vertical: (aPoint to: aPoint + aVector)
]

{ #category : #'instance creation' }
JunPlane class >> on: aPoint1 on: aPoint2 on: aPoint3 [
	"JunPlane on: (0 , 0 , 0) on: (0 , 1 , 0) on: (1 , 1 , 1)."

	| thePoint1 thePoint2 thePoint3 aPlane |
	thePoint1 := Jun3dPoint coerce: aPoint1.
	thePoint2 := Jun3dPoint coerce: aPoint2.
	thePoint3 := Jun3dPoint coerce: aPoint3.
	thePoint1 = thePoint2
		ifTrue: [ ^ nil ].
	thePoint1 = thePoint3
		ifTrue: [ ^ nil ].
	thePoint2 = thePoint3
		ifTrue: [ ^ nil ].
	aPlane := self new.
	aPlane setP1: thePoint1.
	aPlane setP2: thePoint2.
	aPlane setP3: thePoint3.
	thePoint2 := thePoint2 - thePoint1.
	thePoint3 := thePoint3 - thePoint1.
	aPlane setA: thePoint2 y * thePoint3 z - (thePoint2 z * thePoint3 y).
	aPlane setB: thePoint2 z * thePoint3 x - (thePoint2 x * thePoint3 z).
	aPlane setC: thePoint2 x * thePoint3 y - (thePoint2 y * thePoint3 x).
	aPlane setD: (thePoint1 x * aPlane a + (thePoint1 y * aPlane b) + (thePoint1 z * aPlane c)) negated.
	^ aPlane
]

{ #category : #'instance creation' }
JunPlane class >> on: aPoint vertical: aLine [
	"JunPlane 
		on: (0 , 0 , 0) 
		vertical: ((0 , 0 , 0) to: (1 , 1 , 1))."

	| thePoint theLine aPlane p1 firstLine threeAxes firstAxis aTransformation p2 secondLine secondAxis p3 thirdLine thirdAxis |
	thePoint := Jun3dPoint coerce: aPoint.
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	aPlane := self new.
	aPlane setP1: thePoint.
	aPlane setA: theLine f.
	aPlane setB: theLine g.
	aPlane setC: theLine h.
	aPlane
		setD: (theLine f * thePoint x + (theLine g * thePoint y) + (theLine h * thePoint z)) negated.
	aPlane a squared + aPlane b squared + aPlane c squared < self accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	p1 := thePoint.
	firstLine := theLine.
	threeAxes := Array
		with: (0 ,, 0 ,, 0 to: 1 ,, 0 ,, 0)
		with: (0 ,, 0 ,, 0 to: 0 ,, 1 ,, 0)
		with: (0 ,, 0 ,, 0 to: 0 ,, 0 ,, 1).
	firstAxis := threeAxes detect: [ :line | (firstLine isParallelWithLine: line) not ].
	aTransformation := Jun3dTransformation translate: firstAxis to.
	thePoint := nil.
	[ thePoint isNil or: [ thePoint equal: p1 ] ]
		whileTrue: [ firstLine := firstLine transform: aTransformation.
			thePoint := aPlane intersectingPointWithLine: firstLine ].
	p2 := thePoint.
	secondLine := firstLine.
	threeAxes := Array
		with: (0 ,, 0 ,, 0 to: 0 ,, 1 ,, 0)
		with: (0 ,, 0 ,, 0 to: 0 ,, 0 ,, 1)
		with: (0 ,, 0 ,, 0 to: 1 ,, 0 ,, 0).
	secondAxis := threeAxes
		detect:
			[ :line | (secondLine isParallelWithLine: line) not and: [ (line to = firstAxis to) not ] ].
	aTransformation := Jun3dTransformation translate: secondAxis to.
	thePoint := nil.
	[ thePoint isNil or: [ (thePoint equal: p2) or: [ thePoint equal: p1 ] ] ]
		whileTrue: [ secondLine := secondLine transform: aTransformation.
			thePoint := aPlane intersectingPointWithLine: secondLine ].
	p3 := thePoint.
	((p1 to: p2) isParallelWithLine: (p1 to: p3))
		ifTrue: [ thirdLine := firstLine.
			threeAxes := Array
				with: (0 ,, 0 ,, 0 to: 0 ,, 0 ,, 1)
				with: (0 ,, 0 ,, 0 to: 1 ,, 0 ,, 0)
				with: (0 ,, 0 ,, 0 to: 0 ,, 1 ,, 0).
			thirdAxis := threeAxes
				detect: [ :line | (line to = firstAxis to) not and: [ (line to = secondAxis to) not ] ].
			aTransformation := Jun3dTransformation translate: thirdAxis to.
			thePoint := nil.
			[ thePoint isNil or: [ thePoint equal: p2 ] ]
				whileTrue: [ thirdLine := thirdLine transform: aTransformation.
					thePoint := aPlane intersectingPointWithLine: thirdLine ].
			p3 := thePoint ].
	[ | normalUnitVector anotherUnitVector |
	normalUnitVector := aPlane normalUnitVector.
	anotherUnitVector := (self on: p1 on: p2 on: p3) normalUnitVector.
	(normalUnitVector equal: anotherUnitVector)
		ifTrue: [ aPlane
				setP2: p2;
				setP3: p3 ]
		ifFalse: [ aPlane
				setP2: p3;
				setP3: p2 ] ]
		on: Error
		do: [ :exception | 
			aPlane
				setP2: p2;
				setP3: p3 ].
	^ aPlane
]

{ #category : #'instance creation' }
JunPlane class >> vertexes: anArrayOfPoints [
	| size oneThirds point1 point2 point3 |
	(size := anArrayOfPoints size) < 3
		ifTrue: [ ^ nil ].
	oneThirds := (size / 3) asInteger.
	point1 := anArrayOfPoints at: 1.
	point2 := anArrayOfPoints at: 1 + oneThirds.
	point3 := anArrayOfPoints at: 1 + (oneThirds * 2).
	^ self on: point1 on: point2 on: point3
]

{ #category : #'instance creation' }
JunPlane class >> with: aJun3dPoint1 with: aJun3dPoint2 with: aJun3dPoint3 [
	^ self on: aJun3dPoint1 on: aJun3dPoint2 on: aJun3dPoint3
]

{ #category : #constants }
JunPlane class >> xy [
	"(JunPlane xy) asJunOpenGL3dObject show."

	"(JunOpenGL3dCompoundObject 
		with: JunPlane xy asJunOpenGL3dObject
		with: JunPlane yz asJunOpenGL3dObject
		with: JunPlane zx asJunOpenGL3dObject
		with: JunOpenGL3dObject xyzArrows) show."

	^ self on: 0 ,, 0 ,, 0 on: 1 ,, 0 ,, 0 on: 0 ,, 1 ,, 0
]

{ #category : #constants }
JunPlane class >> yz [
	"(JunPlane yz) asJunOpenGL3dObject show."

	"(JunOpenGL3dCompoundObject 
		with: JunPlane xy asJunOpenGL3dObject
		with: JunPlane yz asJunOpenGL3dObject
		with: JunPlane zx asJunOpenGL3dObject
		with: JunOpenGL3dObject xyzArrows) show."

	^ self on: 0 ,, 0 ,, 0 on: 0 ,, 1 ,, 0 on: 0 ,, 0 ,, 1
]

{ #category : #constants }
JunPlane class >> zx [
	"(JunPlane zx) asJunOpenGL3dObject show."

	"(JunOpenGL3dCompoundObject 
		with: JunPlane xy asJunOpenGL3dObject
		with: JunPlane yz asJunOpenGL3dObject
		with: JunPlane zx asJunOpenGL3dObject
		with: JunOpenGL3dObject xyzArrows) show."

	^ self on: 0 ,, 0 ,, 0 on: 0 ,, 0 ,, 1 on: 1 ,, 0 ,, 0
]

{ #category : #comparing }
JunPlane >> = aPlane [
	self class == aPlane class
		ifFalse: [ ^ false ].
	^ ((self a = aPlane a and: [ self b = aPlane b ]) and: [ self c = aPlane c ]) and: [ self d = aPlane d ]
]

{ #category : #parameters }
JunPlane >> a [
	^ a
]

{ #category : #functions }
JunPlane >> angleWithLine: aLine [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		angleWithLine: (0 , 0 , -2 to: 0 , 0 , 2)."

	| theLine denominator numerator gamma |
	(aLine isKindOf: Jun3dLine)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	denominator := (a squared + b squared + c squared) * (theLine f squared + theLine g squared + theLine h squared).
	denominator := denominator sqrt.
	denominator < self class accuracy
		ifTrue: [ self error: 'unexpected line or plane parameters' ].
	numerator := a * theLine f + (b * theLine g) + (c * theLine h).
	gamma := (numerator / denominator max: -1.0) min: 1.0.
	^ JunAngle fromRad: Float pi / 2.0 - gamma arcCos
]

{ #category : #functions }
JunPlane >> angleWithPlane: aPlane [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		angleWithPlane: 
			(0 , -2 , -2 plane: 0 , 2 , 0 and: 0 , 0 , 2)."

	| denominator numerator gamma |
	denominator := (a squared + b squared + c squared) * (aPlane a squared + aPlane b squared + aPlane c squared).
	denominator < self class accuracy
		ifTrue: [ self error: 'unexpected plane parameters' ].
	numerator := a * aPlane a + (b * aPlane b) + (c * aPlane c).
	gamma := (numerator / denominator sqrt max: -1.0) min: 1.0.
	^ JunAngle fromRad: gamma arcCos
]

{ #category : #functions }
JunPlane >> angleWithTriangle: aTriangle [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		angleWithTriangle: 
			(0 , -2 , -2 triangle: 0 , 2 , 0 and: 0 , 0 , 2)."

	^ self angleWithPlane: aTriangle asPlane
]

{ #category : #converting }
JunPlane >> asArrayOfPlanes [
	^ Array with: self asPlane
]

{ #category : #converting }
JunPlane >> asArrayOfTriangles [
	^ Array with: self asTriangle
]

{ #category : #converting }
JunPlane >> asArrays [
	| points |
	points := Array new: 4.
	points at: 1 put: self p1.
	points at: 2 put: self p2.
	points at: 3 put: self p3.
	points at: 4 put: self p1.
	^ Array with: points
]

{ #category : #converting }
JunPlane >> asCircle [
	^ self asTriangle asCircle
]

{ #category : #converting }
JunPlane >> asJunOpenGL3dObject [
	"(JunPlane on: 1 , 0 , 0 on: 0 , 1 , 0 on: 0 , 0 , 1) asJunOpenGL3dObject showWithAxes."

	"(JunPlane on: 1 , 1 , 0 normalVector: -1 , -1 , 0) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "| aCollection aPolygon compoundObject |
	aCollection := self asCircle trackPointsBy: 36.
	aPolygon := JunOpenGL3dPolygon vertexes: aCollection.
	compoundObject := JunOpenGL3dCompoundObject new.
	compoundObject add: ((aPolygon reversed)
				paint: (self defaultColor blendWith: ColorValue black)
					alpha: self defaultAlpha;
				yourself).
	compoundObject add: (aPolygon
				paint: self defaultColor alpha: self defaultAlpha;
				yourself).
	^compoundObject"
]

{ #category : #converting }
JunPlane >> asJunOpenGL3dObjectWithPoints [
	"(JunPlane on: 1 , 0 , 0 on: 0 , 1 , 0 on: 0 , 0 , 1) asJunOpenGL3dObjectWithPoints showWithAxes."

	^ self notYetImplemented "| compoundObject |
	compoundObject := JunOpenGL3dCompoundObject new.
	compoundObject add: self asJunOpenGL3dObject.
	compoundObject add: (self p1 asJunOpenGL3dObject paint: ColorValue red).
	compoundObject add: (self p2 asJunOpenGL3dObject paint: ColorValue green).
	compoundObject add: (self p3 asJunOpenGL3dObject paint: ColorValue blue).
	^compoundObject"
]

{ #category : #converting }
JunPlane >> asPlane [
	^ self
]

{ #category : #converting }
JunPlane >> asPointArrays [
	^ self asArrays collect: [ :array | array collect: [ :each | each asPoint ] ]
]

{ #category : #converting }
JunPlane >> asTriangle [
	^ self triangleClass on: self p1 on: self p2 on: self p3
]

{ #category : #accessing }
JunPlane >> atS: s andT: t [
	^ Jun3dPoint
		x: self x0 + (self f1 * s) + (self f2 * t)
		y: self y0 + (self g1 * s) + (self g2 * t)
		z: self z0 + (self h1 * s) + (self h2 * t)
]

{ #category : #parameters }
JunPlane >> b [
	^ b
]

{ #category : #parameters }
JunPlane >> c [
	^ c
]

{ #category : #testing }
JunPlane >> containsPoint: aPoint [
	"(JunPlane on: (-2 , -2 , 0) on: (0 , 2 , 0) on: (2 , 0 , 0)) 
	containsPoint: (0 , 0 , 1)."

	^ (self valueF: aPoint) abs < self class accuracy
]

{ #category : #parameters }
JunPlane >> d [
	^ d
]

{ #category : #functions }
JunPlane >> distanceFromPoint: aPoint [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		distanceFromPoint: 0 , 0 , 2."

	| thePoint denominator numerator |
	thePoint := Jun3dPoint coerce: aPoint.
	denominator := a squared + b squared + c squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'unexpect plane parameters' ].
	numerator := (a * thePoint x + (b * thePoint y) + (c * thePoint z) + d) squared.
	^ (numerator / denominator) sqrt
]

{ #category : #comparing }
JunPlane >> equal: aPlane [
	self class == aPlane class
		ifFalse: [ ^ false ].
	^ (((self a - aPlane a) abs < self accuracy and: [ (self b - aPlane b) abs < self accuracy ])
		and: [ (self c - aPlane c) abs < self accuracy ]) and: [ (self d - aPlane d) abs < self accuracy ]
]

{ #category : #parameters }
JunPlane >> f1 [
	^ self p2 x - self p1 x
]

{ #category : #parameters }
JunPlane >> f2 [
	^ self p3 x - self p1 x
]

{ #category : #accessing }
JunPlane >> first [
	^ self p1
]

{ #category : #functions }
JunPlane >> footOfPerpendicularFrom: aPoint [
	| fromPoint toPoint aLine |
	fromPoint := self pointClass coerce: aPoint.
	toPoint := fromPoint + self normalUnitVector.
	aLine := Jun3dLine from: aPoint to: toPoint.
	^ self intersectingPointWithLine: aLine
]

{ #category : #parameters }
JunPlane >> g1 [
	^ self p2 y - self p1 y
]

{ #category : #parameters }
JunPlane >> g2 [
	^ self p3 y - self p1 y
]

{ #category : #parameters }
JunPlane >> h1 [
	^ self p2 z - self p1 z
]

{ #category : #parameters }
JunPlane >> h2 [
	^ self p3 z - self p1 z
]

{ #category : #comparing }
JunPlane >> hash [
	^ a hash + b hash + c hash + d hash
]

{ #category : #functions }
JunPlane >> intersectingLineWithPlane: aPlane [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingLineWithPlane: 
			(0 , -2 , -2 plane: 0 , 2 , 0 and: 0 , 0 , 2)."

	| f g h denominator dc db ad x0 y0 z0 |
	f := b * aPlane c - (aPlane b * c).
	g := c * aPlane a - (aPlane c * a).
	h := a * aPlane b - (aPlane a * b).
	denominator := f squared + g squared + h squared.
	denominator < self class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	dc := d * aPlane c - (c * aPlane d).
	db := d * aPlane b - (b * aPlane d).
	ad := a * aPlane d - (d * aPlane a).
	x0 := (g * dc - (h * db)) / denominator.
	y0 := (f * dc + (h * ad)) negated / denominator.
	z0 := (f * db + (g * ad)) / denominator.
	^ Jun3dLine from: (Jun3dPoint x: x0 y: y0 z: z0) to: (Jun3dPoint x: x0 + f y: y0 + g z: z0 + h)
]

{ #category : #functions }
JunPlane >> intersectingPointWithLine: aLine [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingPointWithLine: (0 , 0 , -2 to: 0 , 0 , 2)."

	"(0 , 0 , 0 plane: 1 , 0 , 0 and: 0 , 1 , 0) 
		intersectingPointWithLine: (0 , 0 , -2 to: 0 , 0 , -1)."

	| theLine denominator thePoint numerator |
	(aLine isKindOf: Jun3dLine)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun3dLine from: aLine first to: aLine last ].
	denominator := a * theLine f + (b * theLine g) + (c * theLine h).
	denominator abs < aLine class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	numerator := (a * theLine x0 + (b * theLine y0) + (c * theLine z0) + d) negated.
	thePoint := Jun3dPoint
		x: theLine x0 + (theLine f * numerator / denominator)
		y: theLine y0 + (theLine g * numerator / denominator)
		z: theLine z0 + (theLine h * numerator / denominator).
	^ thePoint
]

{ #category : #functions }
JunPlane >> intersectingPointWithLineSegment: aLine [
	"(-2 , -2 , 0 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingPointWithLineSegment: (0 , 0 , -2 to: 0 , 0 , 2)."

	"(0 , 0 , 0 plane: 1 , 0 , 0 and: 0 , 1 , 0) 
		intersectingPointWithLineSegment: (0 , 0 , -2 to: 0 , 0 , -1)."

	| thePoint |
	thePoint := self intersectingPointWithLine: aLine.
	thePoint isNil
		ifTrue: [ ^ nil ].
	^ (aLine lineSegmentContainsPoint: thePoint)
		ifTrue: [ thePoint ]
		ifFalse: [ nil ]
]

{ #category : #functions }
JunPlane >> intersectingPointWithPlane: aPlane1 withPlane: aPlane2 [
	"(-2 , -2 , -2 plane: 0 , 2 , 0 and: 2 , 0 , 0) 
		intersectingPointWithPlane: (-2 , -2 , -2 plane: 0 , 2 , 0 and: 0 , 0 , 2)
		withPlane: (-2 , -2 , -2 plane: 2 , 0 , 0 and: 0 , 0 , 2)."

	| bc ac ab denominator dc db ad |
	bc := aPlane1 b * aPlane2 c - (aPlane2 b * aPlane1 c).
	ac := aPlane1 a * aPlane2 c - (aPlane2 a * aPlane1 c).
	ab := aPlane1 a * aPlane2 b - (aPlane2 a * aPlane1 b).
	denominator := a * bc - (b * ac) + (c * ab).
	denominator abs < self class accuracy
		ifTrue: [ 
			"parallel two planes"
			^ nil ].
	dc := aPlane1 d * aPlane2 c - (aPlane2 d * aPlane1 c).
	db := aPlane1 d * aPlane2 b - (aPlane2 d * aPlane1 b).
	ad := aPlane1 a * aPlane2 d - (aPlane2 a * aPlane1 d).
	^ Jun3dPoint
		x: (b * dc - (d * bc) - (c * db)) / denominator
		y: (d * ac - (a * dc) - (c * ad)) / denominator
		z: (b * ad + (a * db) - (d * ab)) / denominator
]

{ #category : #testing }
JunPlane >> is3d [
	^ true
]

{ #category : #functions }
JunPlane >> isParallelWithLine: aLine [
	"(0 _, 0 , 0 plane: 0 _, 1 , 0 and: 0 _, 0 , 1) 
		isParallelWithLine: (1 _, 2 , 0 to: 1 _, 1 , 1)."

	^ ((Jun3dLine from: Jun3dPoint zero to: self normalVector)
		angleWithLine: aLine) deg abs < self class accuracy
]

{ #category : #functions }
JunPlane >> isParallelWithPlane: aPlane [
	"(0 _, 0 , 0 plane: 0 _, 1 , 0 and: 0 _, 0 , 1) 
		isParallelWithPlane: (1 _, 0 , 0 plane: 1 _, 1 , 0 and: 1 _, 0 , 1)."

	^ (Jun3dLine from: Jun3dPoint zero to: self normalVector)
		isParallelWithLine: (Jun3dLine from: Jun3dPoint zero to: aPlane normalVector)
]

{ #category : #testing }
JunPlane >> isPlane [
	^ true
]

{ #category : #accessing }
JunPlane >> last [
	^ self p3
]

{ #category : #accessing }
JunPlane >> middle [
	^ self p2
]

{ #category : #parameters }
JunPlane >> n [
	"Answer my normalized constant."

	| denominator |
	denominator := a squared + b squared + c squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	^ 1.0 / denominator sqrt
]

{ #category : #parameters }
JunPlane >> n1 [
	"Answer my normalized constant."

	| denominator |
	denominator := self f1 squared + self g1 squared + self h1 squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	^ 1.0 / denominator sqrt
]

{ #category : #parameters }
JunPlane >> n2 [
	"Answer my normalized constant."

	| denominator |
	denominator := self f2 squared + self g2 squared + self h2 squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a plane' ].
	^ 1.0 / denominator sqrt
]

{ #category : #functions }
JunPlane >> nearestPointFromPoint: aJun3dPoint [
	| denominator thePoint numerator |
	denominator := a squared + b squared + c squared.
	denominator abs < self class accuracy
		ifTrue: [ ^ self error: 'Can''t define a plane' ].
	numerator := (a * aJun3dPoint x + (b * aJun3dPoint y) + (c * aJun3dPoint z) + d) negated.
	thePoint := Jun3dPoint
		x: aJun3dPoint x + (a * numerator / denominator)
		y: aJun3dPoint y + (b * numerator / denominator)
		z: aJun3dPoint z + (c * numerator / denominator).
	^ thePoint
]

{ #category : #functions }
JunPlane >> normalUnitVector [
	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalUnitVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalUnitVector."

	| n nuv |
	n := self n.
	nuv := Jun3dPoint x: a * n y: b * n z: c * n.
	^ nuv
]

{ #category : #functions }
JunPlane >> normalVector [
	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalVector."

	| nv |
	nv := Jun3dPoint x: a y: b z: c.
	^ nv
]

{ #category : #private }
JunPlane >> normalizeParameters [
	| max |
	max := (a abs max: b abs) max: c abs.
	a := a / max.
	b := b / max.
	c := c / max.
	d := d / max
]

{ #category : #functions }
JunPlane >> normalized [
	^ self normalizedPlane
]

{ #category : #functions }
JunPlane >> normalizedPlane [
	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalizedPlane."

	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalizedPlane normalVector."

	"(JunPlane on: -2 , -2 , 0 on: 2 , 0 , 0 on: -2 , 2 , 0) normalUnitVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalizedPlane."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalizedPlane normalVector."

	"(JunPlane on: 2 , 0 , 0 on: 0 , 2 , 0 on: 0 , 0 , 2) normalUnitVector."

	| copy n |
	copy := self copy.
	n := self n.
	copy setA: a * n.
	copy setB: b * n.
	copy setC: c * n.
	copy setD: d.
	^ copy
]

{ #category : #accessing }
JunPlane >> p1 [
	^ p1
]

{ #category : #accessing }
JunPlane >> p2 [
	^ p2
]

{ #category : #accessing }
JunPlane >> p3 [
	^ p3
]

{ #category : #printing }
JunPlane >> printOn: aStream [
	aStream nextPutAll: '('.
	self p1 printOn: aStream.
	aStream nextPutAll: ' plane: '.
	self p2 printOn: aStream.
	aStream nextPutAll: ' and: '.
	self p3 printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #functions }
JunPlane >> projectionOfLine: aJun3dLine [
	| from to |
	from := aJun3dLine from.
	to := aJun3dLine to.
	^ aJun3dLine class from: (self projectionOfPoint: from) to: (self projectionOfPoint: to)
]

{ #category : #functions }
JunPlane >> projectionOfPoint: aJun3dPoint [
	| denominator thePoint numerator |
	denominator := a squared + b squared + c squared.
	denominator abs < self class accuracy
		ifTrue: [ 
			self normalizeParameters.
			denominator := a squared + b squared + c squared.
			denominator abs < self class accuracy
				ifTrue: [ ^ self error: 'Can''t define a plane' ] ].
	numerator := (a * aJun3dPoint x + (b * aJun3dPoint y) + (c * aJun3dPoint z) + d) negated.
	thePoint := Jun3dPoint
		x: aJun3dPoint x + (a * numerator / denominator)
		y: aJun3dPoint y + (b * numerator / denominator)
		z: aJun3dPoint z + (c * numerator / denominator).
	^ thePoint
]

{ #category : #functions }
JunPlane >> reflectingLineWithLine: aLine [
	| intersectingPoint reflectingPoint reflectingVector |
	intersectingPoint := self intersectingPointWithLine: aLine.
	intersectingPoint isNil
		ifTrue: [ 
			reflectingPoint := aLine last.
			reflectingVector := aLine last - aLine first ]
		ifFalse: [ 
			(self containsPoint: aLine first)
				ifTrue: [ 
					| footPoint |
					footPoint := self nearestPointFromPoint: aLine last.
					reflectingPoint := aLine first.
					reflectingVector := ((aLine last to: footPoint) atT: 2) - reflectingPoint ]
				ifFalse: [ 
					| nearPoint farPoint |
					nearPoint := self nearestPointFromPoint: aLine first.
					farPoint := (nearPoint to: intersectingPoint) atT: 2.
					reflectingPoint := farPoint - (nearPoint - aLine first).
					(self whichSide: aLine first) >= 0
						ifTrue: [ reflectingVector := ((intersectingPoint to: reflectingPoint) normalized atT: aLine length) - intersectingPoint ]
						ifFalse: [ reflectingVector := ((reflectingPoint to: intersectingPoint) normalized atT: aLine length) - reflectingPoint ] ] ].
	^ aLine class from: reflectingPoint to: reflectingPoint + reflectingVector
]

{ #category : #functions }
JunPlane >> reversed [
	^ self class on: self p3 on: self p2 on: self p1
]

{ #category : #accessing }
JunPlane >> second [
	^ self p2
]

{ #category : #private }
JunPlane >> setA: aNumber [
	a := aNumber asFloat
]

{ #category : #private }
JunPlane >> setB: aNumber [
	b := aNumber asFloat
]

{ #category : #private }
JunPlane >> setC: aNumber [
	c := aNumber asFloat
]

{ #category : #private }
JunPlane >> setD: aNumber [
	d := aNumber asFloat
]

{ #category : #private }
JunPlane >> setP1: aJun3dPoint [
	p1 := Jun3dPoint coerce: aJun3dPoint
]

{ #category : #private }
JunPlane >> setP2: aJun3dPoint [
	p2 := Jun3dPoint coerce: aJun3dPoint
]

{ #category : #private }
JunPlane >> setP3: aJun3dPoint [
	p3 := Jun3dPoint coerce: aJun3dPoint
]

{ #category : #functions }
JunPlane >> signedDistanceFromPoint: aJun3dPoint [
	| pointOnPlane |
	pointOnPlane := self nearestPointFromPoint: aJun3dPoint.
	^ self normalUnitVector dotProduct: pointOnPlane - aJun3dPoint
]

{ #category : #printing }
JunPlane >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' on: '.
	self p1 storeOn: aStream.
	aStream nextPutAll: ' on: '.
	self p2 storeOn: aStream.
	aStream nextPutAll: ' on: '.
	self p3 storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
JunPlane >> third [
	^ self p3
]

{ #category : #transforming }
JunPlane >> transform: aTransformation [
	^ self class
		on: (self p1 transform: aTransformation)
		on: (self p2 transform: aTransformation)
		on: (self p3 transform: aTransformation)
]

{ #category : #functions }
JunPlane >> valueF: aPoint [
	"((-2 , -2 , 0) plane: (0 , 2 , 0) and: (2 , 0 , 0)) valueF: (0 , 0 , 2)."

	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self a * thePoint x + (self b * thePoint y) + (self c * thePoint z) + self d
]

{ #category : #functions }
JunPlane >> whichSide: aPoint [
	"(JunPlane on: (-2 , -2 , 0) on: (0 , 2 , 0) on: (2 , 0 , 0)) whichSide: (0 , 0 , 2)."

	^ (self valueF: aPoint) sign
]

{ #category : #testing }
JunPlane >> whichSideOf: aPlane [
	^ self shouldNotImplement
]

{ #category : #parameters }
JunPlane >> x0 [
	^ self p1 x
]

{ #category : #parameters }
JunPlane >> y0 [
	^ self p1 y
]

{ #category : #parameters }
JunPlane >> z0 [
	^ self p1 z
]
