Class {
	#name : #Jun3dTransformationTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
Jun3dTransformationTest >> testAlignPoints [
	| maps t |
	maps := Array
		with: (0 ,, 0 ,, 0) -> (0 ,, -1 ,, 0)
		with: (1 ,, 0 ,, 0) -> (-1 ,, 0 ,, 0)
		with: (0 ,, 2 ,, 0) -> (0 ,, 1 ,, 0)
		with: (0 ,, 0 ,, 1) -> (0 ,, 0 ,, 1).
	t := Jun3dTransformation alignPoints: maps.
	maps do: [ :assoc | self assert: (assoc key transform: t) equals: assoc value ]
]

{ #category : #tests }
Jun3dTransformationTest >> testApplyToPoint [
	| t p |
	t := Jun3dTransformation scale: 2.
	p := 2 ,, -3 ,, 4.
	self assert: (t applyToPoint: p) equals: p * 2
]

{ #category : #tests }
Jun3dTransformationTest >> testAsArray [
	| t |
	t := (Jun3dTransformation translate: 2 ,, -3 ,, 4)
		product: (Jun3dTransformation rotate: 30 asDegrees).
	self assert: (t asArray in: [ :array | Jun3dTransformation fromArray: array ]) equals: t
]

{ #category : #tests }
Jun3dTransformationTest >> testAsTranslation [
	| translation transformation |
	translation := 2 ,, -3 ,, 4.
	transformation := Jun3dTransformation translate: translation.
	self assert: transformation asTranslation equals: translation
]

{ #category : #tests }
Jun3dTransformationTest >> testEquals [
	| zero unity |
	zero := Jun3dTransformation zero.
	unity := Jun3dTransformation unity.
	self assert: Jun3dTransformation unity = unity.
	self assert: Jun3dTransformation zero = zero.
	self deny: Jun3dTransformation unity = zero.
	self deny: Jun3dTransformation zero = unity.

]

{ #category : #tests }
Jun3dTransformationTest >> testFromOriginXAxisYAxisZAxis [
	| o x y z t |
	o := 0 ,, 0 ,, 20.
	x := 1 ,, 0 ,, 0.
	y := 0 ,, 1 ,, 0.
	z := 0 ,, 0 ,, 1.
	t := Jun3dTransformation
		fromOrigin: o
		xAxis: x
		yAxis: y
		zAxis: z.
	self assert: (o transform: t) equals: 0 ,, 0 ,, 0.
	self assert: (x + o transform: t) equals: 1 ,, 0 ,, 0.
	self assert: (y + o transform: t) equals: 0 ,, 1 ,, 0.
	self assert: (z + o transform: t) equals: 0 ,, 0 ,, 1
]

{ #category : #tests }
Jun3dTransformationTest >> testIs2d [
	self deny: Jun3dTransformation unity is2d
]

{ #category : #tests }
Jun3dTransformationTest >> testIs3d [
	self assert: Jun3dTransformation unity is3d
]

{ #category : #tests }
Jun3dTransformationTest >> testProduct [
	| t1 t2 p |
	t1 := Jun3dTransformation translate: 2 ,, -3 ,, 4.
	t2 := Jun3dTransformation rotate: 30 asDegrees.
	p := 13 ,, 17 ,, 19.
	self
		assert: ((t1 product: t2) in: [ :t | p transform: t ])
		equals: ((p transform: t1) transform: t2)
]

{ #category : #tests }
Jun3dTransformationTest >> testSolveLinearEquation [
	"2x - 3y + 4z -5 = 0
	 -5x + 6y -7z + 8 = 0
	 8x - 9y - z + 1 = 0
	=> x=1, y=2"
	| equations x y z |
	equations := Array with: (Array with: 2.0 with: -3.0 with: 4.0 with: -5.0) with: (Array with: -5.0 with: 6.0 with: -7.0 with: 8.0) with: (Array with: 8.0 with: -9.0 with: -1.0 with: 1.0).
	Jun2dTransformation solveLinearEquations: equations.
	x := equations first last negated.
	y := equations second last negated.
	z := equations third last negated.
	self assert: 2.0 * x + (-3.0 * y) + (4.0*z) - 5.0 equals: 0.
	self assert: -5.0 * x + (6.0 * y) + (-7.0*z) + 8.0 equals: 0.
	self assert: 8.0 * x + (-9.0 * y) + (-1.0*z) + 1.0 equals: 0
]

{ #category : #tests }
Jun3dTransformationTest >> testToOriginXAxisYAxisZAxis [
	| o vx vy vz t |
	o := 1 ,, 2.
	vx := 2 ,, 3 ,, 4.
	vy := -3 ,, 2 ,, 0.
	vz := vx product: vy.
	vy := vz product: vx.
	t := Jun3dTransformation
		toOrigin: o
		xAxis: vx
		yAxis: vy
		zAxis: vz.
	self assert: (4 ,, -5 ,, 6 transform: t) equals: vx * 4 + (vy * -5) + (vz * 6) + o
]

{ #category : #tests }
Jun3dTransformationTest >> testUnity [
	"unity transformation is the identity function"

	| unity |
	unity := Jun3dTransformation unity.
	self assert: (0 ,, 0 ,, 0 transform: unity) equals: 0 ,, 0 ,, 0.
	self assert: (1 ,, 0 ,, 0 transform: unity) equals: 1 ,, 0 ,, 0.
	self assert: (0 ,, 1 ,, 0 transform: unity) equals: 0 ,, 1 ,, 0.
	self assert: (0 ,, 0 ,, 1 transform: unity) equals: 0 ,, 0 ,, 1.
	self assert: (1 ,, 1 ,, 1 transform: unity) equals: 1 ,, 1 ,, 1
]

{ #category : #tests }
Jun3dTransformationTest >> testZero [
	"zero transformation transforms any point to zero"

	| zero |
	zero := Jun3dTransformation zero.
	self assert: (0 ,, 0 ,, 0 transform: zero) equals: 0 ,, 0 ,, 0.
	self assert: (1 ,, 0 ,, 0 transform: zero) equals: 0 ,, 0 ,, 0.
	self assert: (0 ,, 1 ,, 0 transform: zero) equals: 0 ,, 0 ,, 0.
	self assert: (0 ,, 0 ,, 1 transform: zero) equals: 0 ,, 0 ,, 0.
	self assert: (1 ,, 1 ,, 1 transform: zero) equals: 0 ,, 0 ,, 0
]
