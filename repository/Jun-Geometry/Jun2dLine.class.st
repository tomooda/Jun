"
A Jun2dLine is a parametric line in two dimensional space.
x(t) = f * t + x0 
y(t) = g * t + y0

Instance Variables
	x0:		<Float>
	y0:		<Float>
	f:		<Float>
	g:		<Float>

"
Class {
	#name : #Jun2dLine,
	#superclass : #JunLine,
	#instVars : [
		'x0',
		'y0',
		'f',
		'g'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #'instance creation' }
Jun2dLine class >> between: aPoint1 and: aPoint2 [
	"Jun2dLine between: (0 , 0) and: (1 , 1)."

	^ self new
		between: aPoint1 and: aPoint2;
		yourself
]

{ #category : #comparing }
Jun2dLine >> = aLine [
	self class == aLine class
		ifFalse: [ ^ false ].
	^ ((x0 = aLine x0 and: [ y0 = aLine y0 ]) and: [ f = aLine f ]) and: [ g = aLine g ]
]

{ #category : #parameters }
Jun2dLine >> a [
	^ self g negated
]

{ #category : #functions }
Jun2dLine >> angleWithLine: aLine [
	"(0 , 0 to: 1 , 1) angleWithLine: (0 , 0 to: -1 , -1)."

	| theLine denominator numerator gamma |
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun2dLine from: aLine first to: aLine last ].
	denominator := (f squared + g squared) * (theLine f squared + theLine g squared).
	denominator := denominator sqrt.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'unexpected line parameters' ].
	numerator := f * theLine f + (g * theLine g).
	gamma := (numerator / denominator max: -1.0) min: 1.0.
	^ JunAngle fromRad: gamma arcCos
]

{ #category : #accessing }
Jun2dLine >> atT: t [
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atT: 0."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atT: 1."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atT: -1."

	^ Jun2dPoint x: f * t + x0 y: g * t + y0
]

{ #category : #accessing }
Jun2dLine >> atX: x [
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atX: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atX: -5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atX: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atX: -5."

	^ (self tAtX: x) ifNotNil: [ :t | self atT: t ]
]

{ #category : #accessing }
Jun2dLine >> atY: y [
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atY: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) atY: -5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atY: 0.5."
	"(Jun2dLine from: (0 , 0) to: (1 , 2)) atY: -5."

	(self tAtY: y) ifNotNil: [ :t | self atT: t ]
]

{ #category : #parameters }
Jun2dLine >> b [
	^self f
]

{ #category : #private }
Jun2dLine >> between: aPoint1 and: aPoint2 [
	| point1 point2 dx dy denominator |
	point1 := Jun2dPoint coerce: aPoint1.
	point2 := Jun2dPoint coerce: aPoint2.
	point1 = point2
		ifTrue: [ ^ self error: 'can not define a line' ].
	dx := point2 x - point1 x.
	dy := point2 y - point1 y.
	denominator := dx squared + dy squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	denominator := denominator sqrt.
	self setX0: (point1 x + point2 x) / 2.0.
	self setY0: (point1 y + point2 y) / 2.0.
	self setF: dy negated / denominator.
	self setG: dx / denominator
]

{ #category : #parameters }
Jun2dLine >> c [
	^ self x0 * self g - (self y0 * self f)
]

{ #category : #comparing }
Jun2dLine >> equal: aLine [
	self class == aLine class
		ifFalse: [ ^ false ].
	^ (((x0 - aLine x0) abs < self accuracy and: [ (y0 - aLine y0) abs < self accuracy ])
		and: [ (f - aLine f) abs < self accuracy ]) and: [ (g - aLine g) abs < self accuracy ]
]

{ #category : #parameters }
Jun2dLine >> f [
	^ f
]

{ #category : #private }
Jun2dLine >> from: fromPoint to: toPoint [
	| point1 point2 |
	point1 := Jun2dPoint coerce: fromPoint.
	point2 := Jun2dPoint coerce: toPoint.
	self setX0: point1 x.
	self setY0: point1 y.
	self setF: point2 x - point1 x.
	self setG: point2 y - point1 y
]

{ #category : #parameters }
Jun2dLine >> g [
	^ g
]

{ #category : #comparing }
Jun2dLine >> hash [
	^ x0 hash + y0 hash + f hash + g hash
]

{ #category : #functions }
Jun2dLine >> intersectingPointWithLine: aLine [
	"(0 , 0 to: 1 , 1) intersectingPointWithLine: (0 , 2 to: 6 , 0)."

	| t |
	t := self intersectingTWithLine: aLine.
	t isNil
		ifTrue: [ ^ nil ].
	^ self atT: t
]

{ #category : #functions }
Jun2dLine >> intersectingPointsWithPolyline: aPolyline [
	^ aPolyline intersectingPointsWithLine: self
]

{ #category : #functions }
Jun2dLine >> intersectingTWithLine: aLine [
	"(0 , 0 to: 1 , 1) intersectingPointWithLine: (0 , 2 to: 6 , 0)."

	| theLine yourF yourG denominator |
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := Jun2dLine from: aLine first to: aLine last ].
	yourF := theLine f.
	yourG := theLine g.
	denominator := yourF * g - (f * yourG).
	denominator abs < self class accuracy
		ifTrue: [ 
			"parallel"
			^ nil ].
	^ (yourF * (theLine y0 - y0) - (yourG * (theLine x0 - x0))) / denominator
]

{ #category : #testing }
Jun2dLine >> is2d [
	^ true
]

{ #category : #testing }
Jun2dLine >> lineSegmentContainsPoint: aJun2dPoint [
	^ (self containsPoint: aJun2dPoint)
		and: [ 
			| t |
			t := self tAtPoint: aJun2dPoint.
			t between: self class accuracy negated and: 1 + self class accuracy ]
]

{ #category : #functions }
Jun2dLine >> lineSegmentDistanceFromPoint: aPoint [
	"(0 , 0 to: 1 , 1) lineSegmentDistanceFromPoint: -1 , -1."

	| thePoint pointOnMe |
	thePoint := Jun2dPoint coerce: aPoint.
	pointOnMe := self lineSegmentNearestPointFromPoint: thePoint.
	^ thePoint distance: pointOnMe
]

{ #category : #functions }
Jun2dLine >> lineSegmentIntersectingPointWithLineSegment: aLine [
	"(0 , 0 to: 1 , 1) intersectingPointWithLine: (0 , 2 to: 6 , 0)."

	| intersectingPoint |
	intersectingPoint := self intersectingPointWithLine: aLine.
	^ (intersectingPoint notNil
		and: [ (self lineSegmentContainsPoint: intersectingPoint) and: [ aLine lineSegmentContainsPoint: intersectingPoint ] ])
		ifTrue: [ intersectingPoint ]
		ifFalse: [ nil ]
]

{ #category : #functions }
Jun2dLine >> lineSegmentNearestPointFromPoint: aPoint [
	"(0 , 0 to: 1 , 1) lineSegmentNearestPointFromPoint: -1 , -1."

	| thePoint denominator x y t |
	thePoint := Jun2dPoint coerce: aPoint.
	denominator := f squared + g squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	x := thePoint x - x0.
	y := thePoint y - y0.
	t := (f * x + (g * y)) / denominator.
	t < 0
		ifTrue: [ t := 0.0 ].
	t > 1
		ifTrue: [ t := 1.0 ].
	^ self atT: t
]

{ #category : #testing }
Jun2dLine >> lineSegmentStrictlyContainsPoint: aJun2dPoint [
	^ (self containsPoint: aJun2dPoint)
		and: [ 
			| t |
			t := self tAtPoint: aJun2dPoint.
			t between: self class accuracy and: 1 - self class accuracy ]
]

{ #category : #parameters }
Jun2dLine >> n [
	"Answer my normalized constant."

	| denominator |
	denominator := f squared + g squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	^ 1.0 / denominator sqrt
]

{ #category : #functions }
Jun2dLine >> nearestPointFromPoint: aPoint [
	"(0 , 0 to: 1 , 1) nearestPointFromPoint: -1 , -1."

	| thePoint denominator x y |
	thePoint := Jun2dPoint coerce: aPoint.
	denominator := f squared + g squared.
	denominator < self class accuracy
		ifTrue: [ ^ self error: 'can not define a line' ].
	x := thePoint x - x0.
	y := thePoint y - y0.
	^ self atT: (f * x + (g * y)) / denominator
]

{ #category : #functions }
Jun2dLine >> normalizedLine [
	| copy n |
	copy := self copy.
	n := self n.
	copy setF: f * n.
	copy setG: g * n.
	^ copy
]

{ #category : #private }
Jun2dLine >> on: aPoint vertical: aLine [
	| thePoint theLine |
	thePoint := Jun2dPoint coerce: aPoint.
	(aLine isKindOf: self class)
		ifTrue: [ theLine := aLine ]
		ifFalse: [ theLine := self class from: aLine first to: aLine last ].
	self setX0: thePoint x.
	self setY0: thePoint y.
	self setF: theLine g negated.
	self setG: theLine f
]

{ #category : #parameters }
Jun2dLine >> parameterArray [
	| array |
	array := Array new: 4.
	array at: 1 put: x0.
	array at: 2 put: y0.
	array at: 3 put: f.
	array at: 4 put: g.
	^ array
]

{ #category : #parameters }
Jun2dLine >> parameterMatrix [
	"(Jun2dLine from: (0 , 0) to: (1 , 1)) parameterMatrix."

	^ self notYetImplemented "^JunMatrix
		new: 2
		by: 2
		collection: self parameterArray"
]

{ #category : #private }
Jun2dLine >> setF: aNumber [ 
	f := aNumber asFloat
]

{ #category : #private }
Jun2dLine >> setG: aNumber [ 
	g := aNumber asFloat
]

{ #category : #private }
Jun2dLine >> setX0: aNumber [ 
	x0 := aNumber asFloat
]

{ #category : #private }
Jun2dLine >> setY0: aNumber [
	y0 := aNumber asFloat
]

{ #category : #accessing }
Jun2dLine >> tAtPoint: aPoint [
	| dominator x y |
	dominator := f squared + g squared.
	dominator < self class accuracy
		ifTrue: [ ^ self error: 'can''t define a line' ].
	x := aPoint x - x0.
	y := aPoint y - y0.
	^ (f * x + (g * y)) / dominator
]

{ #category : #accessing }
Jun2dLine >> tAtX: aNumber [
	f abs < self class accuracy
		ifTrue: [ ^ nil ].
	^ (aNumber - x0) / f
]

{ #category : #accessing }
Jun2dLine >> tAtY: aNumber [ 
	g abs < self class accuracy ifTrue: [^nil].
	^aNumber - y0 / g
]

{ #category : #functions }
Jun2dLine >> valueF: aPoint [
	"((-2 , -2) to: (0 , 2)) valueF: (0 , 0)."

	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self a * thePoint x + (self b * thePoint y) + self c
]

{ #category : #functions }
Jun2dLine >> whichSide: aPoint [
	"((-2 , -2) to: (0 , 2)) whichSide: (-1 , 0)."

	^ (self valueF: aPoint) sign
]

{ #category : #parameters }
Jun2dLine >> x0 [
	^ x0
]

{ #category : #parameters }
Jun2dLine >> y0 [
	^ y0
]
