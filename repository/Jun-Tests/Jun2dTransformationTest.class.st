Class {
	#name : #Jun2dTransformationTest,
	#superclass : #JunTestCase,
	#category : 'Jun-Tests'
}

{ #category : #tests }
Jun2dTransformationTest >> testAlignPoints [
	| maps t |
	maps := Array
		with: (0 ,, 0) -> (0 ,, -1)
		with: (2 ,, 0) -> (-1 ,, 0)
		with: (0 ,, -3) -> (-2 ,, -1).
	t := Jun2dTransformation alignPoints: maps.
	maps do: [ :assoc | self assert: (assoc key transform: t) equals: assoc value ]
]

{ #category : #tests }
Jun2dTransformationTest >> testApplyToPoint [
	| t p |
	t := Jun2dTransformation scale: 2.
	p := 2 ,, -3.
	self assert: (t applyToPoint: p) equals: p * 2
]

{ #category : #tests }
Jun2dTransformationTest >> testAsArray [
	| t |
	t := (Jun2dTransformation translate: 2 ,, -3)
		product: (Jun2dTransformation rotate: 30 asDegrees).
	self assert: (t asArray in: [ :array | Jun2dTransformation fromArray: array ]) equals: t
]

{ #category : #tests }
Jun2dTransformationTest >> testAsTranslation [
	| translation transformation |
	translation := 2 ,, -3.
	transformation := Jun2dTransformation translate: translation.
	self assert: transformation asTranslation equals: translation
]

{ #category : #tests }
Jun2dTransformationTest >> testEquals [
	| zero unity |
	zero := Jun2dTransformation zero.
	unity := Jun2dTransformation unity.
	self assert: Jun2dTransformation unity = unity.
	self assert: Jun2dTransformation zero = zero.
	self deny: Jun2dTransformation unity = zero.
	self deny: Jun2dTransformation zero = unity.

]

{ #category : #tests }
Jun2dTransformationTest >> testIs2d [
	self assert: Jun2dTransformation unity is2d
]

{ #category : #tests }
Jun2dTransformationTest >> testIs3d [
	self deny: Jun2dTransformation unity is3d
]

{ #category : #tests }
Jun2dTransformationTest >> testProduct [
	| t1 t2 p |
	t1 := Jun2dTransformation translate: 2 ,, -3.
	t2 := Jun2dTransformation rotate: 30 asDegrees.
	p := 13 ,, 17.
	self
		assert: ((t1 product: t2) in: [ :t | p transform: t ])
		equals: ((p transform: t1) transform: t2)
]

{ #category : #tests }
Jun2dTransformationTest >> testSolveLinearEquation [
	"2x - 3y + 4 = 0
	 -5x + 6y -7 = 0
	=> x=1, y=2"
	| equations x y |
	equations := Array with: (Array with: 2.0 with: -3.0 with: 4.0) with: (Array with: -5.0 with: 6.0 with: -7.0).
	Jun2dTransformation solveLinearEquations: equations.
	x := equations first last negated.
	y := equations second last negated.
	self assert:  x equals: 1.0.
	self assert: y equals: 2.0.
	self assert: 2.0 * x + (-3.0 * y) + 4 equals: 0.
	self assert: -5.0 * x + (6.0 * y) - 7 equals: 0
]

{ #category : #tests }
Jun2dTransformationTest >> testToOriginXAxisYAxis [
	| o vx vy t |
	o := 1 ,, 2.
	vx := 2 ,, 3.
	vy := -3 ,, 2.
	t := Jun2dTransformation toOrigin: o xAxis: vx yAxis: vy.
	self assert: (4 ,, -5 transform: t) equals: vx * 4 + (vy * -5) + o
]

{ #category : #tests }
Jun2dTransformationTest >> testUnity [
	"unity transformation is the identity function"

	| unity |
	unity := Jun2dTransformation unity.
	self assert: (0 ,, 0 transform: unity) equals: 0 ,, 0.
	self assert: (1 ,, 0 transform: unity) equals: 1 ,, 0.
	self assert: (0 ,, 1 transform: unity) equals: 0 ,, 1.
	self assert: (1 ,, 1 transform: unity) equals: 1 ,, 1
]

{ #category : #tests }
Jun2dTransformationTest >> testZero [
	"zero transformation transforms any point to zero"

	| zero |
	zero := Jun2dTransformation zero.
	self assert: (0 ,, 0 transform: zero) equals: 0 ,, 0.
	self assert: (1 ,, 0 transform: zero) equals: 0 ,, 0.
	self assert: (0 ,, 1 transform: zero) equals: 0 ,, 0.
	self assert: (1 ,, 1 transform: zero) equals: 0 ,, 0
]
