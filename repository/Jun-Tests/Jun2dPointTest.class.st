Class {
	#name : #Jun2dPointTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
Jun2dPointTest >> testAbs1 [
	"abs of a point is the one with all abs numbers"

	| x y p |
	x := -2.
	y := 3.
	p := x ,, y.
	self assert: p abs equals: x abs ,, y abs
]

{ #category : #tests }
Jun2dPointTest >> testAbs2 [
	"abs of a point is the one with all abs numbers"

	| x y p |
	x := 2.
	y := -3.
	p := x ,, y.
	self assert: p abs equals: x abs ,, y abs
]

{ #category : #tests }
Jun2dPointTest >> testAddition1 [
	" adding a poin to point is point with added members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 ,, y1.
	p2 := x2 ,, y2.
	self assert: p1 + p2 equals: (Jun2dPoint x: x1 + x2 y: y1 + y2)
]

{ #category : #tests }
Jun2dPointTest >> testAddition2 [
	"adding zero makes the identity"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self assert: p + zero equals: p
]

{ #category : #tests }
Jun2dPointTest >> testAddition3 [
	"addition is exxchangeable"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -2 ,, 3.
	self assert: p1 + p2 equals: p2 + p1
]

{ #category : #tests }
Jun2dPointTest >> testAddition4 [
	"addition is distributable"

	| p1 p2 p3 |
	p1 := 1 ,, -2.
	p2 := -2 ,, 3.
	p3 := 10 ,, 20.
	self assert: p1 + p2 + p3 equals: p1 + (p2 + p3)
]

{ #category : #tests }
Jun2dPointTest >> testAdditionCoerceNumberLeft [
	"coerce a number"

	| p a |
	p := 1 ,, -2.
	a := -4.
	self assert: a + p equals: (Jun2dPoint x: p x + a y: p y + a)
]

{ #category : #tests }
Jun2dPointTest >> testAdditionCoerceNumberRight [
	"coerce a number"

	| p a |
	p := 1 ,, -2.
	a := -4.
	self assert: p + a equals: (Jun2dPoint x: p x + a y: p y + a)
]

{ #category : #tests }
Jun2dPointTest >> testAdditionCoercePointLeft [
	"coerce a number"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -4 @ 5.
	self assert: p2 + p1 equals: (Jun2dPoint x: p1 x + p2 x y: p1 y + p2 y)
]

{ #category : #tests }
Jun2dPointTest >> testAdditionCoercePointRight [
	"coerce a number"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -4 @ 5.
	self assert: p1 + p2 equals: (Jun2dPoint x: p1 x + p2 x y: p1 y + p2 y)
]

{ #category : #tests }
Jun2dPointTest >> testAs2dPoint [
	"as is"

	| x y  p |
	x := 2.
	y := -3.
	p := x ,, y.
	self assert: p as2dPoint equals: x ,, y
]

{ #category : #tests }
Jun2dPointTest >> testAs3dPoint [
	"add z: 0"

	| x y p |
	x := 2.
	y := -3.
	p := x ,, y.
	self assert: p as3dPoint equals: x ,, y ,, 0
]

{ #category : #tests }
Jun2dPointTest >> testAsArray [
	"array of its components"

	| x y p |
	x := 2.
	y := -3.
	p := x ,, y.
	self
		assert: p asArray
		equals:
			{x.
			y}
]

{ #category : #tests }
Jun2dPointTest >> testAsPoint [
	self assert: (2 ,, -3) asPoint equals: 2.0 @ -3.0
]

{ #category : #tests }
Jun2dPointTest >> testAsPointArrays [
	self assert: (2 ,, -3) asPointArrays equals: {{(2.0 @ -3.0)}}
]

{ #category : #tests }
Jun2dPointTest >> testCeiling [
	"celing of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x ,, y) ceiling equals: x ceiling ,, y ceiling
]

{ #category : #tests }
Jun2dPointTest >> testCoerce1 [
	"coerce a number"

	self assert: (Jun2dPoint coerce: -4) equals: -4 ,, -4
]

{ #category : #tests }
Jun2dPointTest >> testCoerce2 [
	"coerce a number"

	| p |
	p := -4 @ 5.
	self assert: (Jun2dPoint coerce: p) equals: -4 ,, 5
]

{ #category : #tests }
Jun2dPointTest >> testCreation1 [
	| p1 |
	p1 := Jun2dPoint x: 1 y: -2.
	self assert: p1 x isFloat.
	self assert: p1 y isFloat.
	self assert: p1 x equals: 1.0.
	self assert: p1 y equals: -2.0
]

{ #category : #tests }
Jun2dPointTest >> testCreation2 [
	| p1 |
	p1 := 1 ,, -2.
	self assert: p1 x isFloat.
	self assert: p1 y isFloat.
	self assert: p1 x equals: 1.0.
	self assert: p1 y equals: -2.0
]

{ #category : #tests }
Jun2dPointTest >> testCreation3 [
	| p |
	p := Jun2dPoint x: 1.0 y: -2.0.
	self assert: p x equals: 1.0.
	self assert: p y equals: -2.0
]

{ #category : #tests }
Jun2dPointTest >> testDivision1 [
	" dividing a point over point is point with divided members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 ,, y1.
	p2 := x2 ,, y2.
	self assert: ((Jun2dPoint x: x1 // x2 y: y1 // y2) equal: p1 // p2)
]

{ #category : #tests }
Jun2dPointTest >> testDivision3 [
	"dividing itself makes unity"

	| p |
	p := 1 ,, -2.
	self assert: p // p equals: Jun2dPoint unity
]

{ #category : #tests }
Jun2dPointTest >> testDivision4 [
	"dividing zero is prohibited"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self should: [ p // zero ] raise: ZeroDivide
]

{ #category : #tests }
Jun2dPointTest >> testDivision5 [
	"dividing zero makes zero"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self assert: zero // p equals: zero
]

{ #category : #tests }
Jun2dPointTest >> testDivision6 [
	"multiplication and division of the same argument makes identity"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := 4 ,, 4.
	self assert: p1 * p2 // p2 equals: p1
]

{ #category : #tests }
Jun2dPointTest >> testDotProduct1 [
	"dot product of 90 degrees corssing is zero"

	| r1 r2 theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 90 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2  theta: theta2.
	self assert: (p1 dotProduct: p2) abs equals: 0
]

{ #category : #tests }
Jun2dPointTest >> testDotProduct2 [
	"dot product of opposite vectors is negative of product of lengths"

	| r1 r2 theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 180 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2 theta: theta2.
	self assert: (p1 dotProduct: p2) equals: r1 * r2 negated
]

{ #category : #tests }
Jun2dPointTest >> testDotProduct3 [
	"dot product is | v1 | | v2 | cos theta"

	| r1 r2 theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2 theta: theta2.
	self assert: (p1 dotProduct: p2) equals: r1 * r2 / 2
]

{ #category : #tests }
Jun2dPointTest >> testEquals1 [
	"equality permits errors within accuracy"

	| p1 delta |
	p1 := 2 ,, -3.
	delta := (p1 accuracy negated ,, p1 accuracy) / 10.
	self assert: (p1 + delta equal: p1)
]

{ #category : #tests }
Jun2dPointTest >> testEquals2 [
	"equality permits errors within accuracy"

	| p1 delta |
	p1 := 2 ,, -3.
	delta := (p1 accuracy negated ,, p1 accuracy) * 10.
	self deny: (p1 + delta equal: p1)
]

{ #category : #tests }
Jun2dPointTest >> testFloor [
	"floor of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x ,, y) floor equals: x floor ,, y floor
]

{ #category : #tests }
Jun2dPointTest >> testFraction1 [
	" dividing a point over point is point with divided members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 ,, y1.
	p2 := x2 ,, y2.
	self assert: ((Jun2dPoint x: x1 / x2 y: y1 / y2) equal: p1 / p2)
]

{ #category : #tests }
Jun2dPointTest >> testFraction2 [
	"division is multiplying reciprocal"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -4 ,, 5.
	self assert: p1 / p2 equals: p1 * p2 reciprocal
]

{ #category : #tests }
Jun2dPointTest >> testFraction3 [
	"dividing itself makes unity"

	| p |
	p := 1 ,, -2.
	self assert: p / p equals: Jun2dPoint unity
]

{ #category : #tests }
Jun2dPointTest >> testFraction4 [
	"dividing zero is prohibited"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self should: [ p / zero ] raise: ZeroDivide
]

{ #category : #tests }
Jun2dPointTest >> testFraction5 [
	"dividing zero makes zero"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self assert: zero / p equals: zero
]

{ #category : #tests }
Jun2dPointTest >> testFraction6 [
	"multiplication and division of the same argument makes identity"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := 4 ,, 4.
	self assert: p1 * p2 / p2 equals: p1
]

{ #category : #tests }
Jun2dPointTest >> testFromArray [
	| p |
	p := Jun2dPoint fromArray: #(1 -2).
	self assert: 1.0 equals: p x.
	self assert: -2.0 equals: p y
]

{ #category : #tests }
Jun2dPointTest >> testFromNumber [
	| p |
	p := Jun2dPoint fromNumber: 3 / 2.
	self assert: p x equals: 1.5.
	self assert: p y equals: 1.5
]

{ #category : #tests }
Jun2dPointTest >> testFromPoint1 [
	| p0 p |
	p0 := 1 ,, -2.
	p := Jun2dPoint fromPoint: p0.
	self assert: p equals: p0
]

{ #category : #tests }
Jun2dPointTest >> testFromPoint2 [
	| p0 p |
	p0 := 1 ,, -2.
	p := Jun2dPoint fromPoint: p0.
	self assert: p x equals: p0 x.
	self assert: p y equals: p0 y
]

{ #category : #tests }
Jun2dPointTest >> testFromPoint3 [
	| p0 p |
	p0 := 1 @ -2.
	p := Jun2dPoint fromPoint: p0.
	self assert: p x equals: p0 x.
	self assert: p y equals: p0 y
]

{ #category : #tests }
Jun2dPointTest >> testGrid [
	"floor of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x ,, y grid: 1.0) equals: x rounded ,, y rounded
]

{ #category : #tests }
Jun2dPointTest >> testIs2d [
	"yes, 2d"

	self assert: (2 ,, -3) is2d
]

{ #category : #tests }
Jun2dPointTest >> testIs3d [
	"not 3d"

	self deny: (2 ,, -3) is3d
]

{ #category : #tests }
Jun2dPointTest >> testIsZero1 [
	"zero is zero, of course"

	self assert: Jun2dPoint zero isZero
]

{ #category : #tests }
Jun2dPointTest >> testIsZero2 [
	"anything other than zero is not zero"

	self deny: Jun2dPoint unity isZero
]

{ #category : #tests }
Jun2dPointTest >> testLessThan1 [
	| p1 p2 |
	p1 := 2 ,, -3.
	p2 := 3 ,, -2.
	self assert: p1 < p2
]

{ #category : #tests }
Jun2dPointTest >> testLessThan2 [
	| p1 p2 |
	p1 := 2 ,, -3.
	p2 := 2 ,, -2.
	self deny: p1 < p2
]

{ #category : #tests }
Jun2dPointTest >> testLessThan3 [
	| p1 p2 |
	p1 := 2 ,, -3.
	p2 := 3 ,, -3.
	self deny: p1 < p2
]

{ #category : #tests }
Jun2dPointTest >> testMinMax1 [
	| p1 min max |
	p1 := 2 ,, -3.
	min := -10 ,, -10.
	max := 10 ,, 10.
	self assert: (p1 min: max max: min) equals: p1
]

{ #category : #tests }
Jun2dPointTest >> testMinMax2 [
	| p1 min max |
	p1 := 2 ,, -3.
	min := 5 ,, -10.
	max := 10 ,, -5.
	self assert: (p1 min: max max: min) equals: min x ,, max y
]

{ #category : #tests }
Jun2dPointTest >> testMinMax3 [
	| p1 min max |
	p1 := 2 ,, -3.
	min := -10 ,, -1.
	max := -5 ,, 10.
	self assert: (p1 min: max max: min) equals: max x ,, min y
]

{ #category : #tests }
Jun2dPointTest >> testMultiplication1 [
	" multiplying a poin by point is point with multiplied members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 ,, y1.
	p2 := x2 ,, y2.
	self assert: ((Jun2dPoint x: x1 * x2 y: y1 * y2) equal: p1 * p2)
]

{ #category : #tests }
Jun2dPointTest >> testMultiplication2 [
	"multiplying unity makes identity"

	| p1 unity |
	p1 := 1 ,, -2.
	unity := Jun2dPoint unity.
	self assert: p1 * unity equals: p1
]

{ #category : #tests }
Jun2dPointTest >> testMultiplication3 [
	"multiplying zero makes zero"

	| p1 zero |
	p1 := 1 ,, -2.
	zero := Jun2dPoint zero.
	self assert: p1 * zero equals: zero
]

{ #category : #tests }
Jun2dPointTest >> testMultiplication4 [
	"multiplication is exxchangeable"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -2 ,, 3.
	self assert: (p1 * p2 equal: p2 * p1)
]

{ #category : #tests }
Jun2dPointTest >> testMultiplication5 [
	"multiplication is distributable"

	| p1 p2 p3 |
	p1 := 1 ,, -2.
	p2 := -2 ,, 3.
	p3 := 10 ,, 20.
	self assert: p1 * p2 * p3 equals: p1 * (p2 * p3)
]

{ #category : #tests }
Jun2dPointTest >> testMultiplicationCoerceNumberLeft [
	"coerce a number"

	| p a |
	p := 1 ,, -2.
	a := -4.
	self assert: a * p equals: (Jun2dPoint x: p x * a y: p y * a)
]

{ #category : #tests }
Jun2dPointTest >> testMultiplicationCoerceNumberRight [
	"coerce a number"

	| p a |
	p := 1 ,, -2.
	a := -4.
	self assert: p * a equals: (Jun2dPoint x: p x * a y: p y * a)
]

{ #category : #tests }
Jun2dPointTest >> testMultiplicationCoercePointLeft [
	"coerce a number"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -4 @ 5.
	self assert: p2 * p1 equals: (Jun2dPoint x: p1 x * p2 x y: p1 y * p2 y)
]

{ #category : #tests }
Jun2dPointTest >> testMultiplicationCoercePointRight [
	"coerce a number"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -4 @ 5.
	self assert: p1 * p2 equals: (Jun2dPoint x: p1 x * p2 x y: p1 y * p2 y)
]

{ #category : #tests }
Jun2dPointTest >> testProduct [
	"cross product of two vector is vertical to the both."

	| r1 r2  theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2 theta: theta2.
	self assert: ((p1 product: p2)) equals: 2.0 * 3.0 * 60 asDegrees sin
]

{ #category : #tests }
Jun2dPointTest >> testRho [
	| rho theta |
	rho := 2.
	theta := 10 asDegrees.
	self assert: (Jun2dPoint rho: rho theta: theta) rho equals: rho
]

{ #category : #tests }
Jun2dPointTest >> testRhoTheta [
	| p rho theta |
	p := 1 ,, -2.
	rho := p rho.
	theta := p theta.
	self assert: ((Jun2dPoint rho: rho theta: theta) equal: p)
]

{ #category : #tests }
Jun2dPointTest >> testRounded [
	"round of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x ,, y) rounded equals: x rounded ,, y rounded
]

{ #category : #tests }
Jun2dPointTest >> testSubtraction1 [
	" subtracting a poin from point is point with member differences"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 ,, y1.
	p2 := x2 ,, y2.
	self assert: p1 - p2 equals: (Jun2dPoint x: x1 - x2 y: y1 - y2)
]

{ #category : #tests }
Jun2dPointTest >> testSubtraction2 [
	"subtraction is adding negated"

	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := -4 ,, 5.
	self assert: p1 - p2 equals: p1 + p2 negated
]

{ #category : #tests }
Jun2dPointTest >> testSubtraction3 [
	"subtracting itself makes zero"

	| p |
	p := 1 ,, -2.
	self assert: (p - p) isZero
]

{ #category : #tests }
Jun2dPointTest >> testSubtraction4 [
	"subtracting zero makes identity"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self assert: p - zero equals: p
]

{ #category : #tests }
Jun2dPointTest >> testSubtraction5 [
	"subtracting from zero makes negation"

	| p zero |
	p := 1 ,, -2.
	zero := Jun2dPoint zero.
	self assert: zero - p equals: -1 ,, 2
]

{ #category : #tests }
Jun2dPointTest >> testSubtraction6 [
	"addition and subtraction of the same argument makes identity"
	| p1 p2 |
	p1 := 1 ,, -2.
	p2 := 4 ,, 4.
	self assert: p1 + p2 - p2 equals: p1
]

{ #category : #tests }
Jun2dPointTest >> testTheta [
	| rho  theta |
	rho := 2.
	theta := 10 asDegrees.
	self assert: (Jun2dPoint rho: rho theta: theta) theta equals: theta
]

{ #category : #tests }
Jun2dPointTest >> testTruncated [
	"truncate of all components"

	| x y |
	x := 1.1.
	y := -2.1.
	self assert: (x ,, y) truncated equals: x truncated ,, y truncated
]

{ #category : #tests }
Jun2dPointTest >> testUnity [
	| unity |
	unity := Jun2dPoint unity.
	self assert: unity x equals: 1.0.
	self assert: unity y equals: 1.0
]

{ #category : #tests }
Jun2dPointTest >> testVectorProduct [
	"cross product of two vector is vertical to the both."

	| r1 r2  theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun2dPoint rho: r1 theta: theta1.
	p2 := Jun2dPoint rho: r2 theta: theta2.
	self assert: ((p1 product: p2)) equals: 2.0 * 3.0 * 60 asDegrees sin
]

{ #category : #tests }
Jun2dPointTest >> testX [
	self assert: (1 ,, 0) x equals: 1
]

{ #category : #tests }
Jun2dPointTest >> testY [
	self assert: (0 ,, 1) y equals: 1
]

{ #category : #tests }
Jun2dPointTest >> testZero [
	| zero |
	zero := Jun2dPoint zero.
	self assert: zero x equals: 0.0.
	self assert: zero y equals: 0.0
]

{ #category : #tests }
Jun2dPointTest >> testdivision1 [
	" dividing a point over point is point with divided members"

	| x1 y1 x2 y2 p1 p2 |
	x1 := 1.
	y1 := -2.
	x2 := -2.
	y2 := 3.
	p1 := x1 ,, y1.
	p2 := x2 ,, y2.
	self assert: ((Jun2dPoint x: x1 // x2 y: y1 // y2) equal: p1 // p2)
]
