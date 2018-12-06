Class {
	#name : #Jun3dPointTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
Jun3dPointTest >> testAbs1 [
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := -2.
	y := 3.
	z := 4.
	p := x _, y _, z.
	self assert: p abs equals: x abs _, y abs _, z abs
]

{ #category : #tests }
Jun3dPointTest >> testAbs2 [
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _, y _, z.
	self assert: p abs equals: x abs _, y abs _, z abs
]

{ #category : #tests }
Jun3dPointTest >> testAbs3 [
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := 2.
	y := 3.
	z := -4.
	p := x _, y _, z.
	self assert: p abs equals: x abs _, y abs _, z abs
]

{ #category : #tests }
Jun3dPointTest >> testAddition1 [
	" adding a poin to point is point with added members"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _, y1 _, z1.
	p2 := x2 _, y2 _, z2.
	self assert: p1 + p2 equals: (Jun3dPoint x: x1 + x2 y: y1 + y2 z: z1 + z2)
]

{ #category : #tests }
Jun3dPointTest >> testAddition2 [
	"adding zero makes the identity"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self assert: p + zero equals: p
]

{ #category : #tests }
Jun3dPointTest >> testAddition3 [
	"addition is exxchangeable"

	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := -2 _, 3 _, 4.
	self assert: p1 + p2 equals: p2 + p1
]

{ #category : #tests }
Jun3dPointTest >> testAddition4 [
	"addition is distributable"

	| p1 p2 p3 |
	p1 := 1 _, -2 _, 3.
	p2 := -2 _, 3 _, 4.
	p3 := 10 _, 20 _, -30.
	self assert: p1 + p2 + p3 equals: p1 + (p2 + p3)
]

{ #category : #tests }
Jun3dPointTest >> testAdditionCoerceNumberLeft [
	"coerce a number"

	| p a |
	p := 1 _, -2 _, 3.
	a := -4.
	self assert: a + p equals: (Jun3dPoint x: p x + a y: p y + a z: p z + a)
]

{ #category : #tests }
Jun3dPointTest >> testAdditionCoerceNumberRight [
	"coerce a number"

	| p a |
	p := 1 _, -2 _, 3.
	a := -4.
	self assert: p + a equals: (Jun3dPoint x: p x + a y: p y + a z: p z + a)
]

{ #category : #tests }
Jun3dPointTest >> testAdditionCoercePointLeft [
	"coerce a number"

	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := -4 @ 5.
	self assert: p2 + p1 equals: (Jun3dPoint x: p1 x + p2 x y: p1 y + p2 y z: p1 z)
]

{ #category : #tests }
Jun3dPointTest >> testAdditionCoercePointRight [
	"coerce a number"

	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := -4 @ 5.
	self assert: p1 + p2 equals: (Jun3dPoint x: p1 x + p2 x y: p1 y + p2 y z: p1 z)
]

{ #category : #tests }
Jun3dPointTest >> testAs2dPoint [
	"drops z component"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _, y _, z.
	self assert: p as2dPoint equals: x _, y
]

{ #category : #tests }
Jun3dPointTest >> testAs3dPoint [
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _ , y _ , z.
	self assert: p as3dPoint equals: x _ , y _ , z
]

{ #category : #tests }
Jun3dPointTest >> testAsArray [
	"abs of a point is the one with all abs numbers"

	| x y z p |
	x := 2.
	y := -3.
	z := 4.
	p := x _ , y _ , z.
	self
		assert: p asArray
		equals:
			{x.
			y.
			z}
]

{ #category : #tests }
Jun3dPointTest >> testAsPoint [
	self assert: (2 _ , -3 _ , 4) asPoint equals: 2.0 @ -3.0
]

{ #category : #tests }
Jun3dPointTest >> testAsPointArrays [
	self assert: (2 , -3 , 4) asPointArrays equals: {{(2.0 @ -3.0)}}
]

{ #category : #tests }
Jun3dPointTest >> testCeiling [
	"celing of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self assert: (x _, y _, z) ceiling equals: x ceiling _, y ceiling _, z ceiling
]

{ #category : #tests }
Jun3dPointTest >> testCoerce1 [
	"coerce a number"

	self assert: (Jun3dPoint coerce: -4) equals: -4 _, -4 _, -4
]

{ #category : #tests }
Jun3dPointTest >> testCoerce2 [
	"coerce a number"

	| p |
	p := -4 @ 5.
	self assert: (Jun3dPoint coerce: p) equals: -4 _, 5 _, 0
]

{ #category : #tests }
Jun3dPointTest >> testCreation1 [
	| p1 |
	p1 := Jun3dPoint x: 1 y: -2 z: 3.
	self assert: p1 x isFloat.
	self assert: p1 y isFloat.
	self assert: p1 z isFloat.
	self assert: p1 x equals: 1.0.
	self assert: p1 y equals: -2.0.
	self assert: p1 z equals: 3.0
]

{ #category : #tests }
Jun3dPointTest >> testCreation2 [
	| p1 |
	p1 := 1 _, -2 _, 3.
	self assert: p1 x isFloat.
	self assert: p1 y isFloat.
	self assert: p1 z isFloat.
	self assert: p1 x equals: 1.0.
	self assert: p1 y equals: -2.0.
	self assert: p1 z equals: 3.0
]

{ #category : #tests }
Jun3dPointTest >> testCreation3 [
	| p |
	p := Jun3dPoint x: 1.0 y: -2.0.
	self assert: p x equals: 1.0.
	self assert: p y equals: -2.0
]

{ #category : #tests }
Jun3dPointTest >> testDivision1 [
	" dividing a point over point is point with divided members"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _, y1 _, z1.
	p2 := x2 _, y2 _, z2.
	self assert: ((Jun3dPoint x: x1 // x2 y: y1 // y2 z: z1 // z2) equal: p1 // p2)
]

{ #category : #tests }
Jun3dPointTest >> testDivision3 [
	"dividing itself makes unity"

	| p |
	p := 1 _, -2 _, 3.
	self assert: (p // p) equals: Jun3dPoint unity
]

{ #category : #tests }
Jun3dPointTest >> testDivision4 [
	"dividing zero is prohibited"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self should: [ p // zero ] raise: ZeroDivide
]

{ #category : #tests }
Jun3dPointTest >> testDivision5 [
	"dividing zero makes zero"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self assert: zero // p equals: zero
]

{ #category : #tests }
Jun3dPointTest >> testDivision6 [
	"multiplication and division of the same argument makes identity"
	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := 4 _, 4 _, -1.
	self assert: p1 * p2 // p2 equals: p1
]

{ #category : #tests }
Jun3dPointTest >> testDotProduct1 [
	"dot product of 90 degrees corssing is zero"

	| r1 r2 phi theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	phi := 30 asDegrees.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 90 asDegrees.
	p1 := Jun3dPoint rho: r1 phi: phi theta: theta1.
	p2 := Jun3dPoint rho: r2 phi: phi theta: theta2.
	self assert: (p1 dotProduct: p2) abs equals: 0
]

{ #category : #tests }
Jun3dPointTest >> testDotProduct2 [
	"dot product of opposite vectors is negative of product of lengths"

	| r1 r2 phi theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	phi := 30 asDegrees.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 180 asDegrees.
	p1 := Jun3dPoint rho: r1 phi: phi theta: theta1.
	p2 := Jun3dPoint rho: r2 phi: phi theta: theta2.
	self assert: (p1 dotProduct: p2) equals: r1 * r2 negated
]

{ #category : #tests }
Jun3dPointTest >> testDotProduct3 [
	"dot product is | v1 | | v2 | cos theta"

	| r1 r2 phi theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	phi := 30 asDegrees.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun3dPoint rho: r1 phi: phi theta: theta1.
	p2 := Jun3dPoint rho: r2 phi: phi theta: theta2.
	self assert: (p1 dotProduct: p2) equals: r1 * r2 / 2
]

{ #category : #tests }
Jun3dPointTest >> testEquals1 [
	"equality permits errors within accuracy"

	| p1 delta |
	p1 := 2 _, -3 _, 4.
	delta := (p1 accuracy negated _, p1 accuracy _, p1 accuracy) / 10.
	self assert: (p1 + delta equal: p1)
]

{ #category : #tests }
Jun3dPointTest >> testEquals2 [
	"equality permits errors within accuracy"

	| p1 delta |
	p1 := 2 _, -3 _, 4.
	delta := (p1 accuracy negated _, p1 accuracy _, p1 accuracy) * 10.
	self deny: (p1 + delta equal: p1)
]

{ #category : #tests }
Jun3dPointTest >> testFloor [
	"floor of all components"
	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self assert: (x _, y _, z) floor equals: x floor _, y floor _, z floor
]

{ #category : #tests }
Jun3dPointTest >> testFraction1 [
	" dividing a point over point is point with divided members"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _ , y1 _ , z1.
	p2 := x2 _ , y2 _ , z2.
	self
		assert: ((Jun3dPoint x: x1 / x2 y: y1 / y2 z: z1 / z2) equal: p1 / p2)
]

{ #category : #tests }
Jun3dPointTest >> testFraction2 [
	"division is multiplying reciprocal"

	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := -4 _, 5 _, 6.
	self assert: p1 / p2 equals: p1 * p2 reciprocal
]

{ #category : #tests }
Jun3dPointTest >> testFraction3 [
	"dividing itself makes unity"

	| p |
	p := 1 _, -2 _, 3.
	self assert: (p / p) equals: Jun3dPoint unity
]

{ #category : #tests }
Jun3dPointTest >> testFraction4 [
	"dividing zero is prohibited"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self should: [ p / zero ] raise: ZeroDivide
]

{ #category : #tests }
Jun3dPointTest >> testFraction5 [
	"dividing zero makes zero"

	| p zero |
	p := 1 _, -2 _, 3.
	zero := Jun3dPoint zero.
	self assert: zero / p equals: zero
]

{ #category : #tests }
Jun3dPointTest >> testFraction6 [
	"multiplication and division of the same argument makes identity"

	| p1 p2 |
	p1 := 1 _, -2 _, 3.
	p2 := 4 _, 4 _, -1.
	self assert: p1 * p2 / p2 equals: p1
]

{ #category : #tests }
Jun3dPointTest >> testFromArray [
	| p |
	p := Jun3dPoint fromArray: #(1 -2 3).
	self assert: 1.0 equals: p x.
	self assert: -2.0 equals: p y.
	self assert: 3.0 equals: p z
]

{ #category : #tests }
Jun3dPointTest >> testFromNumber [
	| p |
	p := Jun3dPoint fromNumber: 3 / 2.
	self assert: p x equals: 1.5.
	self assert: p y equals: 1.5.
	self assert: p z equals: 1.5
]

{ #category : #tests }
Jun3dPointTest >> testFromPoint1 [
	| p0 p |
	p0 := 1 _ , -2 _ , 3.
	p := Jun3dPoint fromPoint: p0.
	self assert: p equals: p0
]

{ #category : #tests }
Jun3dPointTest >> testFromPoint2 [
	| p0 p |
	p0 := 1 _, -2.
	p := Jun3dPoint fromPoint: p0.
	self assert: p x equals: p0 x.
	self assert: p y equals: p0 y
]

{ #category : #tests }
Jun3dPointTest >> testFromPoint3 [
	| p0 p |
	p0 := 1 @ -2.
	p := Jun3dPoint fromPoint: p0.
	self assert: p x equals: p0 x.
	self assert: p y equals: p0 y
]

{ #category : #tests }
Jun3dPointTest >> testGrid [
	"floor of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self assert: (x _, y _, z grid: 1.0) equals: x rounded _, y rounded _, z rounded
]

{ #category : #tests }
Jun3dPointTest >> testIs2d [
	self deny: Jun3dPoint unity is2d
]

{ #category : #tests }
Jun3dPointTest >> testIs3d [
	self assert: Jun3dPoint unity is3d
]

{ #category : #tests }
Jun3dPointTest >> testIsZero1 [
	"zero is zero, of course"

	self assert: Jun3dPoint zero isZero
]

{ #category : #tests }
Jun3dPointTest >> testIsZero2 [
	"anything other than zero is not zero"

	self deny: Jun3dPoint unity isZero
]

{ #category : #tests }
Jun3dPointTest >> testLessThan1 [
	| p1 p2 |
	p1 := 2 _, -3 _, 4.
	p2 := 3 _, -2 _, 5.
	self assert: p1 < p2
]

{ #category : #tests }
Jun3dPointTest >> testLessThan2 [
	| p1 p2 |
	p1 := 2 _, -3 _, 4.
	p2 := 2 _, -2 _, 5.
	self deny: p1 < p2
]

{ #category : #tests }
Jun3dPointTest >> testLessThan3 [
	| p1 p2 |
	p1 := 2 _, -3 _, 4.
	p2 := 3 _, -3 _, 5.
	self deny: p1 < p2
]

{ #category : #tests }
Jun3dPointTest >> testLessThan4 [
	| p1 p2 |
	p1 := 2 _, -3 _, 4.
	p2 := 3 _, -4 _, 4.
	self deny: p1 < p2
]

{ #category : #tests }
Jun3dPointTest >> testMinMax1 [
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := -10 _, -10 _, -10.
	max := 10 _, 10 _, 10.
	self assert: (p1 min: max max: min) equals: p1
]

{ #category : #tests }
Jun3dPointTest >> testMinMax2 [
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := 5 _, -10 _, 6.
	max := 10 _, -5 _, 10.
	self assert: (p1 min: max max: min) equals: min x _, max y _, min z
]

{ #category : #tests }
Jun3dPointTest >> testMinMax3 [
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := -10_, -1_, -10.
	max := -5 _, 10 _, 1.
	self assert: (p1 min: max max: min) equals: max x_, min y_, max z
]

{ #category : #tests }
Jun3dPointTest >> testMinMax4 [
	| p1 min max |
	p1 := 2 _, -3 _, 4.
	min := -10_, -1_, 5.
	max := -5 _, 10 _, 10.
	self assert: (p1 min: max max: min) equals: max x _, min y _, min z
]

{ #category : #tests }
Jun3dPointTest >> testMultiplication1 [
	" multiplying a poin by point is point with multiplied members"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _, y1 _, z1.
	p2 := x2 _, y2 _, z2.
	self assert: ((Jun3dPoint x: x1 * x2 y: y1 * y2 z: z1 * z2) equal: p1 * p2)
]

{ #category : #tests }
Jun3dPointTest >> testMultiplication2 [
	"multiplying unity makes identity"

	| p1 unity |
	p1 := 1 _ , -2 _ , 3.
	unity := Jun3dPoint unity.
	self assert: p1 * unity equals: p1
]

{ #category : #tests }
Jun3dPointTest >> testMultiplication3 [
	"multiplying zero makes zero"

	| p1 zero |
	p1 := 1 _ , -2 _ , 3.
	zero := Jun3dPoint zero.
	self assert: p1 * zero equals: zero
]

{ #category : #tests }
Jun3dPointTest >> testMultiplication4 [
	"multiplication is exxchangeable"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -2 _ , 3 _ , 4.
	self assert: (p1 * p2 equal: p2 * p1)
]

{ #category : #tests }
Jun3dPointTest >> testMultiplication5 [
	"multiplication is distributable"

	| p1 p2 p3 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -2 _ , 3 _ , 4.
	p3 := 10 _ , 20 _ , -30.
	self assert: p1 * p2 * p3 equals: p1 * (p2 * p3)
]

{ #category : #tests }
Jun3dPointTest >> testMultiplicationCoerceNumberLeft [
	"coerce a number"

	| p a |
	p := 1 _ , -2 _ , 3.
	a := -4.
	self assert: a * p equals: (Jun3dPoint x: p x * a y: p y * a z: p z * a)
]

{ #category : #tests }
Jun3dPointTest >> testMultiplicationCoerceNumberRight [
	"coerce a number"

	| p a |
	p := 1 _ , -2 _ , 3.
	a := -4.
	self assert: p * a equals: (Jun3dPoint x: p x * a y: p y * a z: p z * a)
]

{ #category : #tests }
Jun3dPointTest >> testMultiplicationCoercePointLeft [
	"coerce a number"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -4 @ 5.
	self
		assert: p2 * p1
		equals: (Jun3dPoint x: p1 x * p2 x y: p1 y * p2 y z: 0)
]

{ #category : #tests }
Jun3dPointTest >> testMultiplicationCoercePointRight [
	"coerce a number"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -4 @ 5.
	self
		assert: p1 * p2
		equals: (Jun3dPoint x: p1 x * p2 x y: p1 y * p2 y z: 0)
]

{ #category : #tests }
Jun3dPointTest >> testPhi [
	| rho phi theta |
	rho := 2.
	phi := Float pi / 2.0.
	theta := 10 asDegrees.
	self assert: (Jun3dPoint rho: rho phi: phi theta: theta) phi equals: phi asRadians
]

{ #category : #tests }
Jun3dPointTest >> testProduct [
	"cross product of two vector is vertical to the both."

	| r1 r2 phi theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	phi := 30 asDegrees.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun3dPoint rho: r1 phi: phi theta: theta1.
	p2 := Jun3dPoint rho: r2 phi: phi theta: theta2.
	self assert: ((p1 product: p2) in: [ :p3 | p3 dotProduct: p1 ]) abs equals: 0.
	self assert: ((p1 product: p2) in: [ :p3 | p3 dotProduct: p2 ]) abs equals: 0
]

{ #category : #tests }
Jun3dPointTest >> testRho [
	| rho phi theta |
	rho := 2.
	phi := Float pi / 2.0.
	theta := 10 asDegrees.
	self assert: (Jun3dPoint rho: rho phi: phi theta: theta) rho equals: rho
]

{ #category : #tests }
Jun3dPointTest >> testRhoPhiTheta1 [
	| p rho phi theta |
	p := 1 _ , -2 _ , 3.
	rho := p rho.
	phi := p phi.
	theta := p theta.
	self assert: ((Jun3dPoint rho: rho phi: phi theta: theta) equal: p)
]

{ #category : #tests }
Jun3dPointTest >> testRounded [
	"round of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self
		assert: (x _ , y _ , z) rounded
		equals: x rounded _ , y rounded _ , z rounded
]

{ #category : #tests }
Jun3dPointTest >> testSubtraction1 [
	" subtracting a poin from point is point with member differences"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _ , y1 _ , z1.
	p2 := x2 _ , y2 _ , z2.
	self
		assert: p1 - p2
		equals: (Jun3dPoint x: x1 - x2 y: y1 - y2 z: z1 - z2)
]

{ #category : #tests }
Jun3dPointTest >> testSubtraction2 [
	"subtraction is adding negated"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := -4 _ , 5 _ , 6.
	self assert: p1 - p2 equals: p1 + p2 negated
]

{ #category : #tests }
Jun3dPointTest >> testSubtraction3 [
	"subtracting itself makes zero"

	| p |
	p := 1 _, -2 _, 3.
	self assert: (p - p) isZero
]

{ #category : #tests }
Jun3dPointTest >> testSubtraction4 [
	"subtracting zero makes identity"

	| p zero |
	p := 1 _ , -2 _ , 3.
	zero := Jun3dPoint zero.
	self assert: p - zero equals: p
]

{ #category : #tests }
Jun3dPointTest >> testSubtraction5 [
	"subtracting from zero makes negation"

	| p zero |
	p := 1 _ , -2 _ , 3.
	zero := Jun3dPoint zero.
	self assert: zero - p equals: -1 _ , 2 _ , -3
]

{ #category : #tests }
Jun3dPointTest >> testSubtraction6 [
	"addition and subtraction of the same argument makes identity"

	| p1 p2 |
	p1 := 1 _ , -2 _ , 3.
	p2 := 4 _ , 4 _ , -1.
	self assert: p1 + p2 - p2 equals: p1
]

{ #category : #tests }
Jun3dPointTest >> testTheta [
	| rho phi theta |
	rho := 2.
	phi := Float pi / 2.0.
	theta := 10 asDegrees.
	self assert: (Jun3dPoint rho: rho phi: phi theta: theta) theta equals: theta
]

{ #category : #tests }
Jun3dPointTest >> testTruncated [
	"truncate of all components"

	| x y z |
	x := 1.1.
	y := -2.1.
	z := 3.7.
	self
		assert: (x _ , y _ , z) truncated
		equals: x truncated _ , y truncated _ , z truncated
]

{ #category : #tests }
Jun3dPointTest >> testUnity [
	| unity |
	unity := Jun3dPoint unity.
	self assert: unity x equals: 1.0.
	self assert: unity y equals: 1.0.
	self assert: unity z equals: 1.0
]

{ #category : #tests }
Jun3dPointTest >> testVectorProduct [
	"cross product of two vector is vertical to the both."

	| r1 r2 phi theta1 theta2 p1 p2 |
	r1 := 2.0.
	r2 := 3.0.
	phi := 30 asDegrees.
	theta1 := 40 asDegrees.
	theta2 := 40 asDegrees + 60 asDegrees.
	p1 := Jun3dPoint rho: r1 phi: phi theta: theta1.
	p2 := Jun3dPoint rho: r2 phi: phi theta: theta2.
	self assert: ((p1 vectorProduct: p2) in: [ :p3 | p3 dotProduct: p1 ]) abs equals: 0.
	self assert: ((p1 vectorProduct: p2) in: [ :p3 | p3 dotProduct: p2 ]) abs equals: 0
]

{ #category : #tests }
Jun3dPointTest >> testX [
	self assert: (1 _ , 0 _ , 0) x equals: 1
]

{ #category : #tests }
Jun3dPointTest >> testY [
	self assert: (0 _ , 1 _ , 0) y equals: 1
]

{ #category : #tests }
Jun3dPointTest >> testZ [
	self assert: (0 _ , 0 _ , 1) z equals: 1
]

{ #category : #tests }
Jun3dPointTest >> testZero [
	| zero |
	zero := Jun3dPoint zero.
	self assert: zero x equals: 0.0.
	self assert: zero y equals: 0.0.
	self assert: zero z equals: 0.0
]

{ #category : #tests }
Jun3dPointTest >> testdivision1 [
	" dividing a point over point is point with divided members"

	| x1 y1 z1 x2 y2 z2 p1 p2 |
	x1 := 1.
	y1 := -2.
	z1 := 3.
	x2 := -2.
	y2 := 3.
	z2 := 4.
	p1 := x1 _ , y1 _ , z1.
	p2 := x2 _ , y2 _ , z2.
	self
		assert: ((Jun3dPoint x: x1 // x2 y: y1 // y2 z: z1 // z2) equal: p1 // p2)
]
