"
A Jun2dTransformation is an affine transformatio in two dimensional space.

Instance Variables
	a:		<Float>
	b:		<Float>
	c:		<Float>
	d:		<Float>
	m:		<Float>
	n:		<Float>
	p:		<Float>
	q:		<Float>
	s:		<Float>
"
Class {
	#name : #Jun2dTransformation,
	#superclass : #JunTransformation,
	#instVars : [
		'a',
		'b',
		'p',
		'c',
		'd',
		'q',
		'm',
		'n',
		's'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #'typical transformation' }
Jun2dTransformation class >> align: alignmentPoint with: relativePoint [
	^ self translate: relativePoint - alignmentPoint
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> alignPoints: anArrayOfAssociations [
	"Jun2dTransformation alignPoints: (Array
			with: 0 , 0  -> (0 , -1)
			with: 2 , 0  -> (-1 , 0)
			with: 0, -3 -> (-2, -1))."

	| assocs aTransformation solvingBlock |
	anArrayOfAssociations size < 3
		ifTrue: [ ^ self error: 'Can''t decide a transformation with less than 3 mappings.' ].
	assocs := anArrayOfAssociations copyFrom: 1 to: 3.
	aTransformation := self unity.
	solvingBlock := [ :getSelector :setSelectors | 
	| equations |
	equations := assocs
		collect: [ :assoc | Array with: assoc key x with: assoc key y with: 1.0 with: (assoc value perform: getSelector) negated ].
	self solveLinearEquations: equations.
	1 to: 3 do: [ :index | aTransformation perform: (setSelectors at: index) with: (equations at: index) last negated ] ].
	solvingBlock value: #x value: #(#setA: #setC: #setM:).
	solvingBlock value: #y value: #(#setB: #setD: #setN:).
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> alignVector: aJun2dPoint1 to: aJun2dPoint2 [
	| zero |
	zero := Jun2dPoint zero.
	^ self
		alignPoints:
			(Array
				with: aJun2dPoint1 -> aJun2dPoint1
				with:
					(aJun2dPoint1 y negated _ , aJun2dPoint1 x)
						-> (aJun2dPoint2 y negated _ , aJun2dPoint2 x)
				with: zero -> zero)
]

{ #category : #examples }
Jun2dTransformation class >> example1 [
	"Jun2dTransformation example1."

	| aTransformation |
	aTransformation := Jun2dTransformation fromArray: #(1 0 0 0 1 0 0 0 1).
	Transcript
		cr;
		show: aTransformation printString.
	Transcript
		cr;
		show: aTransformation storeString.
	^ aTransformation
]

{ #category : #examples }
Jun2dTransformation class >> example2 [
	"Jun2dTransformation example2."

	| form fromPoint toPoint tT canvas  |
	form := Form extent: 300@250 depth: 32.
	fromPoint := 50 _, 100.
	toPoint := 100 _, 50.
	tT := Jun2dTransformation translate: 100 _, 100.
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
	canvas line: (fromPoint transform: tT) asPoint to: (toPoint transform: tT) asPoint color: Color red.
	canvas flush.
	form asMorph openInWindow.
	^tT
]

{ #category : #examples }
Jun2dTransformation class >> example3 [
	"Jun2dTransformation example3."

	| form fromPoint toPoint tS canvas |
	form := Form extent: 300 @ 250 depth: 32.
	fromPoint := 50 _ , 100.
	toPoint := 100 _ , 50.
	tS := Jun2dTransformation scale: 2 _ , 2.
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
	canvas
		line: (fromPoint transform: tS) asPoint
		to: (toPoint transform: tS) asPoint
		color: Color red.
	canvas flush.
	form asMorph openInWindow.
	^ tS
]

{ #category : #examples }
Jun2dTransformation class >> example4 [
	"Jun2dTransformation example4."

	| form fromPoint toPoint tR canvas |
	form := Form extent: 300 @ 250 depth: 32.
	fromPoint := 50 _ , 100.
	toPoint := 100 _ , 50.
	tR := Jun2dTransformation rotate: (JunAngle fromDeg: 20).
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
	canvas
		line: (fromPoint transform: tR) asPoint
		to: (toPoint transform: tR) asPoint
		color: Color red.
	canvas flush.
	form asMorph openInWindow.
	^ tR
]

{ #category : #examples }
Jun2dTransformation class >> example5 [
	"Jun2dTransformation example5."

	| form fromPoint toPoint tR canvas |
	form := Form extent: 300 @ 250 depth: 32.
	fromPoint := 50 _, 100.
	toPoint := 100 _, 50.
	tR := Jun2dTransformation rotate: (JunAngle fromDeg: 20).
	canvas := form getCanvas.
	canvas fillColor: Color white.
	canvas
		line: fromPoint asPoint
		to: toPoint asPoint
		color: Color blue.
	10 to: 170 by: 10 do: [ :angle | 
		tR := Jun2dTransformation rotate: (JunAngle fromDeg: angle) around: (fromPoint center: toPoint).
		canvas
			line: (fromPoint transform: tR) asPoint
			to: (toPoint transform: tR) asPoint
			color: Color red ].
	canvas flush.
	form asMorph openInWindow.
	^ tR
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> fromOrigin: origin xAxis: xVector yAxis: yVector [
	| a b c d m n |
	yVector x abs < yVector y abs
		ifTrue: [ 
			a := yVector y / (xVector product: yVector).
			c := (a * yVector x / yVector y) negated ]
		ifFalse: [ 
			c := yVector x * (yVector product: xVector).
			a = (c * yVector y / yVector x) negated ].
	m := ((a * origin x + c) * origin y) negated.
	xVector x abs < xVector y abs
		ifTrue: [ 
			b := xVector y / (yVector product: xVector).
			d := (b * xVector x / xVector y) negated ]
		ifFalse: [ 
			d := xVector x / (xVector product: yVector).
			b := (d * xVector y / xVector x) negated ].
	n := ((b * origin x + d) * origin y) negated.
	^ self unity
		setA: a;
		setB: b;
		setC: c;
		setD: d;
		setM: m;
		setN: n;
		yourself
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> mirrorX [
	| aTransformation |
	aTransformation := self unity.
	aTransformation setA: -1.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> mirrorY [
	| aTransformation |
	aTransformation := self unity.
	aTransformation setD: -1.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> rotate: anAngle [
	"Jun2dTransformation rotate: (JunAngle fromDeg: 45)."

	^ self rotateZ: anAngle
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> rotate: anAngle around: aPoint [
	"Jun2dTransformation 
	rotate: (JunAngle fromDeg: 45) 
	around: (Jun2dPoint fromArray: #(75 75))."

	| theAngle thePoint aT aRz rT aTransformation |
	theAngle := JunAngle coerce: anAngle.
	thePoint := Jun2dPoint coerce: aPoint.
	aT := self translate: thePoint negated.
	aRz := self rotate: theAngle.
	rT := self translate: thePoint.
	aTransformation := aT product: aRz.
	aTransformation := aTransformation product: rT.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> rotateX: anAngle [
	"Jun2dTransformation rotateX: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setD: theAngle cos.
	aTransformation setQ: theAngle sin.
	aTransformation setN: theAngle sin negated.
	aTransformation setS: theAngle cos.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> rotateY: anAngle [
	"Jun2dTransformation rotateY: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setP: theAngle sin negated.
	aTransformation setM: theAngle sin.
	aTransformation setS: theAngle cos.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> rotateZ: anAngle [
	"Jun2dTransformation rotateZ: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setB: theAngle sin.
	aTransformation setC: theAngle sin negated.
	aTransformation setD: theAngle cos.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> scale: aPoint [
	"Jun2dTransformation scale: (Jun2dPoint fromArray: #(1 2))."

	| thePoint aTransformation |
	thePoint := Jun2dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setA: thePoint x.
	aTransformation setD: thePoint y.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> swapXY [
	"Jun2dTransformation transpose."

	| aTransformation |
	aTransformation := self unity.
	aTransformation setA: 0.0.
	aTransformation setB: 1.0.
	aTransformation setC: 1.0.
	aTransformation setD: 0.0.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> toOrigin: origin xAxis: xVector yAxis: yVector [
	^ self new
		setA: xVector x;
		setB: xVector y;
		setC: yVector x;
		setD: yVector y;
		setM: origin x;
		setN: origin y;
		setP: 0.0;
		setQ: 0.0;
		setS: 1.0;
		yourself
]

{ #category : #'typical transformation' }
Jun2dTransformation class >> translate: aPoint [
	"Jun2dTransformation translate: (Jun2dPoint fromArray: #(10 20))."

	| thePoint aTransformation |
	thePoint := Jun2dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setM: thePoint x.
	aTransformation setN: thePoint y.
	^ aTransformation
]

{ #category : #'constant access' }
Jun2dTransformation class >> unity [
	"Jun2dTransformation unity."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 1;
		setB: 0;
		setP: 0.
	aTransformation
		setC: 0;
		setD: 1;
		setQ: 0.
	aTransformation
		setM: 0;
		setN: 0;
		setS: 1.
	^ aTransformation
]

{ #category : #'constant access' }
Jun2dTransformation class >> zero [
	"Jun2dTransformation zero."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 0;
		setB: 0;
		setP: 0.
	aTransformation
		setC: 0;
		setD: 0;
		setQ: 0.
	aTransformation
		setM: 0;
		setN: 0;
		setS: 0.
	^ aTransformation
]

{ #category : #comparing }
Jun2dTransformation >> = aTransformation [
	self class == aTransformation class
		ifFalse: [ ^ false ].
	^ (((((((a = aTransformation a and: [ b = aTransformation b ]) and: [ p = aTransformation p ])
		and: [ c = aTransformation c ]) and: [ d = aTransformation d ]) and: [ q = aTransformation q ])
		and: [ m = aTransformation m ]) and: [ n = aTransformation n ]) and: [ s = aTransformation s ]
]

{ #category : #accessing }
Jun2dTransformation >> a [
	^ a
]

{ #category : #'applying transformation' }
Jun2dTransformation >> applyToPoint: aPoint [
	| point nx ny scale |
	point := Jun2dPoint coerce: aPoint.
	nx := point x * a + (point y * c) + m.
	ny := point x * b + (point y * d) + n.
	scale := point x * p + (point y * q) + s.
	scale isZero
		ifTrue: [ scale := self class accuracy ].
	^ Jun2dPoint x: nx / scale y: ny / scale
]

{ #category : #converting }
Jun2dTransformation >> asArray [
	| array |
	array := Array new: 9.
	array at: 1 put: a.
	array at: 2 put: b.
	array at: 3 put: p.
	array at: 4 put: c.
	array at: 5 put: d.
	array at: 6 put: q.
	array at: 7 put: m.
	array at: 8 put: n.
	array at: 9 put: s.
	^ array
]

{ #category : #converting }
Jun2dTransformation >> asMatrix [
	^ self notYetImplemented	"^JunMatrix new: 3 collection: self asArray"
]

{ #category : #converting }
Jun2dTransformation >> asRotationMatrix [
	^ self notYetImplemented "| anArray |
	anArray := Array new: 2 * 2.
	anArray at: 1 put: a.
	anArray at: 2 put: b.
	anArray at: 3 put: c.
	anArray at: 4 put: d.
	^JunMatrix new: 2 collection: anArray"
]

{ #category : #converting }
Jun2dTransformation >> asTranslation [
	^ Jun2dPoint x: m y: n
]

{ #category : #accessing }
Jun2dTransformation >> b [
	^ b
]

{ #category : #accessing }
Jun2dTransformation >> c [
	^ c
]

{ #category : #accessing }
Jun2dTransformation >> d [
	^ d
]

{ #category : #comparing }
Jun2dTransformation >> equal: aTransformation [
	self class == aTransformation class
		ifFalse: [ ^ false ].
	^ ((((((((a - aTransformation a) abs < self accuracy and: [ (b - aTransformation b) abs < self accuracy ])
		and: [ (p - aTransformation p) abs < self accuracy ]) and: [ (c - aTransformation c) abs < self accuracy ])
		and: [ (d - aTransformation d) abs < self accuracy ]) and: [ (q - aTransformation q) abs < self accuracy ])
		and: [ (m - aTransformation m) abs < self accuracy ]) and: [ (n - aTransformation n) abs < self accuracy ])
		and: [ (s - aTransformation s) abs < self accuracy ]
]

{ #category : #comparing }
Jun2dTransformation >> hash [
	^ (a + b + p + c + d + q + m + n + s) hash
]

{ #category : #testing }
Jun2dTransformation >> is2d [
	^ true
]

{ #category : #accessing }
Jun2dTransformation >> m [
	^ m
]

{ #category : #accessing }
Jun2dTransformation >> n [
	^ n
]

{ #category : #accessing }
Jun2dTransformation >> p [
	^ p
]

{ #category : #printing }
Jun2dTransformation >> printOn: aStream [
	aStream nextPutAll: self class printString.
	aStream nextPutAll: ' ('.
	a printOn: aStream.
	aStream nextPutAll: ' '.
	b printOn: aStream.
	aStream nextPutAll: ' '.
	p printOn: aStream.
	aStream nextPutAll: ' , '.
	c printOn: aStream.
	aStream nextPutAll: ' '.
	d printOn: aStream.
	aStream nextPutAll: ' '.
	q printOn: aStream.
	aStream nextPutAll: ' , '.
	m printOn: aStream.
	aStream nextPutAll: ' '.
	n printOn: aStream.
	aStream nextPutAll: ' '.
	s printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #transforming }
Jun2dTransformation >> product: aTransformation [
	"(Jun2dTransformation fromArray: #(1 0 0 0 1 0 10 20 1)) 
	product: (Jun2dTransformation fromArray: #(1 0 0 0 1 0 -10 -20 1))."

	| transformation |
	transformation := self class basicNew.
	transformation setA: a * aTransformation a + (b * aTransformation c) + (p * aTransformation m).
	transformation setB: a * aTransformation b + (b * aTransformation d) + (p * aTransformation n).
	transformation setP: a * aTransformation p + (b * aTransformation q) + (p * aTransformation s).
	transformation setC: c * aTransformation a + (d * aTransformation c) + (q * aTransformation m).
	transformation setD: c * aTransformation b + (d * aTransformation d) + (q * aTransformation n).
	transformation setQ: c * aTransformation p + (d * aTransformation q) + (q * aTransformation s).
	transformation setM: m * aTransformation a + (n * aTransformation c) + (s * aTransformation m).
	transformation setN: m * aTransformation b + (n * aTransformation d) + (s * aTransformation n).
	transformation setS: m * aTransformation p + (n * aTransformation q) + (s * aTransformation s).
	^ transformation
]

{ #category : #accessing }
Jun2dTransformation >> q [
	^ q
]

{ #category : #accessing }
Jun2dTransformation >> s [
	^ s
]

{ #category : #private }
Jun2dTransformation >> setA: aNumber [
	a := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setB: aNumber [
	b := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setC: aNumber [
	c := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setD: aNumber [
	d := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setFromArray: anArray [
	self
		setA: (anArray at: 1);
		setB: (anArray at: 2);
		setP: (anArray at: 3).
	self
		setC: (anArray at: 4);
		setD: (anArray at: 5);
		setQ: (anArray at: 6).
	self
		setM: (anArray at: 7);
		setN: (anArray at: 8);
		setS: (anArray at: 9)
]

{ #category : #private }
Jun2dTransformation >> setM: aNumber [
	m := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setN: aNumber [
	n := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setP: aNumber [
	p := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setQ: aNumber [
	q := aNumber asFloat
]

{ #category : #private }
Jun2dTransformation >> setS: aNumber [
	s := aNumber asFloat
]
