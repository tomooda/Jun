"
A Jun3dTransformation is an affine transformation in 3d space.

Instance Variables
	a:		<Float>
	b:		<Float>
	c:		<Float>
	d:		<Float>
	e:		<Float>
	f:		<Float>
	g:		<Float>
	h:		<Float>
	i:		<Float>
	l:		<Float>
	m:		<Float>
	n:		<Float>
	p:		<Float>
	q:		<Float>
	r:		<Float>
	s:		<Float>

"
Class {
	#name : #Jun3dTransformation,
	#superclass : #JunTransformation,
	#instVars : [
		'a',
		'b',
		'c',
		'p',
		'd',
		'e',
		'f',
		'q',
		'g',
		'h',
		'i',
		'r',
		'l',
		'm',
		'n',
		's'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #'typical transformation' }
Jun3dTransformation class >> align: alignmentPoint with: relativePoint [
	^ self translate: relativePoint - alignmentPoint
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> alignPoints: anArrayOfAssociations [
	"Jun3dTransformation alignPoints: (Array
			with: 0 , 0 , 0 -> (0 , -1 , 0)
			with: 1 , 0 , 0 -> (-1 , 0 , 0)
			with: 0 , 2 , 0 -> (0 , 1 , 0)
			with: 0 , 0 , 1 -> (0 , 0 , 1))."

	| assocs aTransformation solvingBlock |
	anArrayOfAssociations size < 4
		ifTrue: [ ^ self error: 'Can''t decide a transformation with less than 4 mappings.' ].
	assocs := anArrayOfAssociations copyFrom: 1 to: 4.
	aTransformation := self unity.
	solvingBlock := [ :getSelector :setSelectors | 
	| equations |
	equations := assocs
		collect: [ :assoc | 
			Array
				with: assoc key x
				with: assoc key y
				with: assoc key z
				with: 1.0
				with: (assoc value perform: getSelector) negated ].
	self solveLinearEquations: equations.
	1 to: 4 do: [ :index | aTransformation perform: (setSelectors at: index) with: (equations at: index) last negated] ].
	solvingBlock value: #x value: #(#setA: #setD: #setG: #setL:).
	solvingBlock value: #y value: #(#setB: #setE: #setH: #setM:).
	solvingBlock value: #z value: #(#setC: #setF: #setI: #setN:).
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> alignVector: aJun3dPoint1 to: aJun3dPoint2 [
	| zero axisVector normalVector1 normalVector2 |
	(aJun3dPoint1 - aJun3dPoint2) length < aJun3dPoint2 accuracy
		ifTrue: [ ^ self unity ].
	zero := Jun3dPoint zero.
	axisVector := (aJun3dPoint1 vectorProduct: aJun3dPoint2) unitVector.
	normalVector1 := aJun3dPoint1 vectorProduct: axisVector.
	normalVector2 := aJun3dPoint2 vectorProduct: axisVector.
	^ self
		alignPoints:
			(Array
				with: aJun3dPoint1 -> aJun3dPoint2
				with: axisVector -> axisVector
				with: normalVector1 -> normalVector2
				with: zero -> zero)
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> alignVector: aJun3dPoint1 withVector: aJun3dPoint2 [
	| aTransformation |
	aTransformation := [ self alignVector: aJun3dPoint1 to: aJun3dPoint2 ] on: [ :ex | ex return: self unity ].
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> cabinet: anAngle [
	"Jun3dTransformation cabinet: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setG: theAngle cos / 2.
	aTransformation setH: theAngle sin / 2.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> cavalie: anAngle [
	"Jun3dTransformation cavalie: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setG: theAngle cos.
	aTransformation setH: theAngle sin.
	^ aTransformation
]

{ #category : #examples }
Jun3dTransformation class >> example1 [
	"Jun3dTransformation example1."

	| aTransformation |
	aTransformation := Jun3dTransformation fromArray: #(1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1).
	Transcript
		cr;
		show: aTransformation printString.
	Transcript
		cr;
		show: aTransformation storeString.
	^ aTransformation
]

{ #category : #examples }
Jun3dTransformation class >> example2 [
	"Jun3dTransformation example2."

	| fromPoint toPoint tT form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	tT := Jun3dTransformation translate: 100 _, 100 _, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			canvas line: (fromPoint transform: tT) asPoint to: (toPoint transform: tT) asPoint color: Color red.
			canvas flush ].
	form asMorph openInWindow.
	^ tT
]

{ #category : #examples }
Jun3dTransformation class >> example3 [
	"Jun3dTransformation example3."

	| fromPoint toPoint tS form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	tS := Jun3dTransformation scale: 2 _, 2 _, 0.
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			canvas line: (fromPoint transform: tS) asPoint to: (toPoint transform: tS) asPoint color: Color red.
			canvas flush ].
	form asMorph openInWindow.
	^ tS
]

{ #category : #examples }
Jun3dTransformation class >> example4 [
	"Jun3dTransformation example4."

	| fromPoint toPoint tR form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	tR := Jun3dTransformation rotate: (JunAngle fromDeg: 20).
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			canvas line: (fromPoint transform: tR) asPoint to: (toPoint transform: tR) asPoint color: Color red.
			canvas flush ].
	form asMorph openInWindow.
	^ tR
]

{ #category : #examples }
Jun3dTransformation class >> example5 [
	"Jun3dTransformation example5."

	| fromPoint toPoint aLine form |
	fromPoint := 50 _, 100 _, 0.
	toPoint := 100 _, 50 _, 0.
	aLine := Array
		with: (fromPoint center: toPoint)
		with: ((fromPoint center: toPoint) transform: (Jun3dTransformation translate: 0 _, 0 _, 100)).
	form := Form extent: 250 @ 250 depth: 32.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			canvas line: fromPoint asPoint to: toPoint asPoint color: Color blue.
			10 to: 170 by: 10 do: [ :angle | 
				| tR |
				tR := Jun3dTransformation rotate: (JunAngle fromDeg: angle) around: aLine.
				canvas line: (fromPoint transform: tR) asPoint to: (toPoint transform: tR) asPoint color: Color red ].
			canvas flush ].
	form asMorph openInWindow
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> fromOrigin: origin xAxis: xAxis yAxis: yAxis zAxis: zAxis [
	| t equations |
	t := self new.
	equations := Array new: 4.
	equations
		at: 1
		put:
			(Array
				with: origin x
				with: origin y
				with: origin z
				with: 1.0
				with: 0.0).
	equations
		at: 2
		put:
			(Array
				with: xAxis x + origin x
				with: xAxis y + origin y
				with: xAxis z + origin z
				with: 1.0
				with: -1.0).
	equations
		at: 3
		put:
			(Array
				with: yAxis x + origin x
				with: yAxis y + origin y
				with: yAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 4
		put:
			(Array
				with: zAxis x + origin x
				with: zAxis y + origin y
				with: zAxis z + origin z
				with: 1.0
				with: 0.0).
	self solveLinearEquations: equations.
	t setA: equations first last negated.
	t setD: equations second last negated.
	t setG: equations third last negated.
	t setL: equations fourth last negated.
	equations
		at: 1
		put:
			(Array
				with: origin x
				with: origin y
				with: origin z
				with: 1.0
				with: 0.0).
	equations
		at: 2
		put:
			(Array
				with: xAxis x + origin x
				with: xAxis y + origin y
				with: xAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 3
		put:
			(Array
				with: yAxis x + origin x
				with: yAxis y + origin y
				with: yAxis z + origin z
				with: 1.0
				with: -1.0).
	equations
		at: 4
		put:
			(Array
				with: zAxis x + origin x
				with: zAxis y + origin y
				with: zAxis z + origin z
				with: 1.0
				with: 0.0).
	self solveLinearEquations: equations.
	t setB: equations first last negated.
	t setE: equations second last negated.
	t setH: equations third last negated.
	t setM: equations fourth last negated.
	equations
		at: 1
		put:
			(Array
				with: origin x
				with: origin y
				with: origin z
				with: 1.0
				with: 0.0).
	equations
		at: 2
		put:
			(Array
				with: xAxis x + origin x
				with: xAxis y + origin y
				with: xAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 3
		put:
			(Array
				with: yAxis x + origin x
				with: yAxis y + origin y
				with: yAxis z + origin z
				with: 1.0
				with: 0.0).
	equations
		at: 4
		put:
			(Array
				with: zAxis x + origin x
				with: zAxis y + origin y
				with: zAxis z + origin z
				with: 1.0
				with: -1.0).
	self solveLinearEquations: equations.
	t setC: equations first last negated.
	t setF: equations second last negated.
	t setI: equations third last negated.
	t setN: equations fourth last negated.
	t setP: 0.0.
	t setQ: 0.0.
	t setR: 0.0.
	t setS: 1.0.
	^ t
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> mirrorX [
	| aTransformation |
	aTransformation := self unity.
	aTransformation setA: -1.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> mirrorY [
	| aTransformation |
	aTransformation := self unity.
	aTransformation setE: -1.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> mirrorZ [
	| aTransformation |
	aTransformation := self unity.
	aTransformation setI: -1.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> parallel: aPoint [
	"Jun3dTransformation parallel: (Jun3dPoint fromArray: #(100 100 100))."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setG: (thePoint x / thePoint z) negated.
	aTransformation setH: (thePoint y / thePoint z) negated.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> perspective: aPoint [
	"Jun3dTransformation perspective: (Jun3dPoint fromArray: #(100 100 100))."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setA: thePoint z negated.
	aTransformation setE: thePoint z negated.
	aTransformation setG: thePoint x.
	aTransformation setH: thePoint y.
	aTransformation setI: -1.
	aTransformation setR: 1.
	aTransformation setS: thePoint z negated.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> rotate: anAngle [
	"Jun3dTransformation rotate: (JunAngle fromDeg: 45)."

	^ self rotateZ: anAngle
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> rotate: anAngle around: aLine [
	"Jun3dTransformation 
		rotate: (JunAngle fromDeg: 45) 
		around: (Array 
		with: (Jun3dPoint fromArray: #(75 75 0)) 
		with: (Jun3dPoint fromArray: #(75 75 75)))."

	| theAngle firstPoint lastPoint aVector aV aL aT aRx aRy aRz rRy rRx rT aTransformation |
	theAngle := JunAngle coerce: anAngle.
	firstPoint := Jun3dPoint coerce: aLine first.
	lastPoint := Jun3dPoint coerce: aLine last.
	aVector := lastPoint - firstPoint.
	aV := (aVector y squared + aVector z squared) sqrt.
	aL := (aVector x squared + aVector y squared + aVector z squared) sqrt.
	aT := self translate: firstPoint negated.
	aRx := self unity.
	aV isZero
		ifFalse: [ 
			aRx setE: aVector z / aV.
			aRx setF: aVector y / aV.
			aRx setH: (aVector y / aV) negated.
			aRx setI: aVector z / aV ].
	aRy := self unity.
	aL isZero
		ifFalse: [ 
			aRy setA: aV / aL.
			aRy setC: aVector x / aL.
			aRy setG: (aVector x / aL) negated.
			aRy setI: aV / aL ].
	aRz := self rotate: theAngle.
	rRy := self unity.
	aL isZero
		ifFalse: [ 
			rRy setA: aV / aL.
			rRy setC: (aVector x / aL) negated.
			rRy setG: aVector x / aL.
			rRy setI: aV / aL ].
	rRx := self unity.
	aV isZero
		ifFalse: [ 
			rRx setE: aVector z / aV.
			rRx setF: (aVector y / aV) negated.
			rRx setH: aVector y / aV.
			rRx setI: aVector z / aV ].
	rT := self translate: firstPoint.
	aTransformation := aT product: aRx.
	aTransformation := aTransformation product: aRy.
	aTransformation := aTransformation product: aRz.
	aTransformation := aTransformation product: rRy.
	aTransformation := aTransformation product: rRx.
	aTransformation := aTransformation product: rT.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> rotateX: anAngle [
	"Jun3dTransformation rotateX: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setE: theAngle cos.
	aTransformation setF: theAngle sin.
	aTransformation setH: theAngle sin negated.
	aTransformation setI: theAngle cos.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> rotateY: anAngle [
	"Jun3dTransformation rotateY: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setC: theAngle sin negated.
	aTransformation setG: theAngle sin.
	aTransformation setI: theAngle cos.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> rotateZ: anAngle [
	"Jun3dTransformation rotateZ: (JunAngle fromDeg: 45)."

	| theAngle aTransformation |
	theAngle := JunAngle coerce: anAngle.
	aTransformation := self unity.
	aTransformation setA: theAngle cos.
	aTransformation setB: theAngle sin.
	aTransformation setD: theAngle sin negated.
	aTransformation setE: theAngle cos.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> scale: aPoint [
	"Jun3dTransformation scale: (Jun3dPoint fromArray: #(1 2 3))."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setA: thePoint x.
	aTransformation setE: thePoint y.
	aTransformation setI: thePoint z.
	^ aTransformation
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> toOrigin: origin xAxis: xAxis yAxis: yAxis zAxis: zAxis [
	^ self new
		setA: xAxis x;
		setB: xAxis y;
		setC: xAxis z;
		setD: yAxis x;
		setE: yAxis y;
		setF: yAxis z;
		setG: zAxis x;
		setH: zAxis y;
		setI: zAxis z;
		setL: origin x;
		setM: origin y;
		setN: origin z;
		setP: 0.0;
		setQ: 0.0;
		setR: 0.0;
		setS: 1.0;
		yourself
]

{ #category : #'typical transformation' }
Jun3dTransformation class >> translate: aPoint [
	"Jun3dTransformation translate: 10, 20, 30."

	| thePoint aTransformation |
	thePoint := Jun3dPoint coerce: aPoint.
	aTransformation := self unity.
	aTransformation setL: thePoint x.
	aTransformation setM: thePoint y.
	aTransformation setN: thePoint z.
	^ aTransformation
]

{ #category : #'constants access' }
Jun3dTransformation class >> unity [
	"Jun3dTransformation unity"

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 1;
		setB: 0;
		setC: 0;
		setP: 0.
	aTransformation
		setD: 0;
		setE: 1;
		setF: 0;
		setQ: 0.
	aTransformation
		setG: 0;
		setH: 0;
		setI: 1;
		setR: 0.
	aTransformation
		setL: 0;
		setM: 0;
		setN: 0;
		setS: 1.
	^ aTransformation
]

{ #category : #'constants access' }
Jun3dTransformation class >> zero [
	"Jun3dTransformation zero."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation
		setA: 0;
		setB: 0;
		setC: 0;
		setP: 0.
	aTransformation
		setD: 0;
		setE: 0;
		setF: 0;
		setQ: 0.
	aTransformation
		setG: 0;
		setH: 0;
		setI: 0;
		setR: 0.
	aTransformation
		setL: 0;
		setM: 0;
		setN: 0;
		setS: 0.
	^ aTransformation
]

{ #category : #comparing }
Jun3dTransformation >> = aTransformation [
	self class == aTransformation class
		ifFalse: [ ^ false ].
	^ ((((((((((((((a = aTransformation a and: [ b = aTransformation b ]) and: [ c = aTransformation c ])
		and: [ p = aTransformation p ]) and: [ d = aTransformation d ]) and: [ e = aTransformation e ])
		and: [ f = aTransformation f ]) and: [ q = aTransformation q ]) and: [ g = aTransformation g ])
		and: [ h = aTransformation h ]) and: [ i = aTransformation i ]) and: [ r = aTransformation r ])
		and: [ l = aTransformation l ]) and: [ m = aTransformation m ]) and: [ n = aTransformation n ])
		and: [ s = aTransformation s ]
]

{ #category : #accessing }
Jun3dTransformation >> a [
	^ a
]

{ #category : #'applying transformation' }
Jun3dTransformation >> applyToPoint: aPoint [
	| point nx ny nz scale |
	aPoint class == Jun3dPoint
		ifTrue: [ point := aPoint ]
		ifFalse: [ point := Jun3dPoint coerce: aPoint ].
	nx := point x * a + (point y * d) + (point z * g) + l.
	ny := point x * b + (point y * e) + (point z * h) + m.
	nz := point x * c + (point y * f) + (point z * i) + n.
	scale := point x * p + (point y * q) + (point z * r) + s.
	scale = 0.0
		ifTrue: [ scale := self class accuracy ].
	^ Jun3dPoint x: nx / scale y: ny / scale z: nz / scale
]

{ #category : #converting }
Jun3dTransformation >> asArray [
	| array |
	array := Array new: 16.
	array at: 1 put: a.
	array at: 2 put: b.
	array at: 3 put: c.
	array at: 4 put: p.
	array at: 5 put: d.
	array at: 6 put: e.
	array at: 7 put: f.
	array at: 8 put: q.
	array at: 9 put: g.
	array at: 10 put: h.
	array at: 11 put: i.
	array at: 12 put: r.
	array at: 13 put: l.
	array at: 14 put: m.
	array at: 15 put: n.
	array at: 16 put: s.
	^ array
]

{ #category : #converting }
Jun3dTransformation >> asMatrix [
	^ self notYetImplemented "^JunMatrix new: 4 collection: self asArray"
]

{ #category : #converting }
Jun3dTransformation >> asRotationMatrix [
	^ self notYetImplemented "| anArray |
	anArray := Array new: 3 * 3.
	anArray at: 1 put: a.
	anArray at: 2 put: b.
	anArray at: 3 put: c.
	anArray at: 4 put: d.
	anArray at: 5 put: e.
	anArray at: 6 put: f.
	anArray at: 7 put: g.
	anArray at: 8 put: h.
	anArray at: 9 put: i.
	^JunMatrix new: 3 collection: anArray"
]

{ #category : #converting }
Jun3dTransformation >> asTranslation [
	^ Jun3dPoint x: l y: m z: n
]

{ #category : #accessing }
Jun3dTransformation >> b [
	^ b
]

{ #category : #accessing }
Jun3dTransformation >> c [
	^ c
]

{ #category : #accessing }
Jun3dTransformation >> d [
	^ d
]

{ #category : #accessing }
Jun3dTransformation >> e [
	^ e
]

{ #category : #comparing }
Jun3dTransformation >> equal: aTransformation [
	self class == aTransformation class
		ifFalse: [ ^ false ].
	^ (((((((((((((((a - aTransformation a) abs < self accuracy and: [ (b - aTransformation b) abs < self accuracy ])
		and: [ (c - aTransformation c) abs < self accuracy ]) and: [ (p - aTransformation p) abs < self accuracy ])
		and: [ (d - aTransformation d) abs < self accuracy ]) and: [ (e - aTransformation e) abs < self accuracy ])
		and: [ (f - aTransformation f) abs < self accuracy ]) and: [ (q - aTransformation q) abs < self accuracy ])
		and: [ (g - aTransformation g) abs < self accuracy ]) and: [ (h - aTransformation h) abs < self accuracy ])
		and: [ (i - aTransformation i) abs < self accuracy ]) and: [ (r - aTransformation r) abs < self accuracy ])
		and: [ (l - aTransformation l) abs < self accuracy ]) and: [ (m - aTransformation m) abs < self accuracy ])
		and: [ (n - aTransformation n) abs < self accuracy ]) and: [ (s - aTransformation s) abs < self accuracy ]
]

{ #category : #accessing }
Jun3dTransformation >> f [
	^ f
]

{ #category : #accessing }
Jun3dTransformation >> g [
	^ g
]

{ #category : #accessing }
Jun3dTransformation >> h [
	^ h
]

{ #category : #comparing }
Jun3dTransformation >> hash [
	^ (a + b + c + p + d + e + f + q + g + h + i + r + l + m + n) hash
]

{ #category : #accessing }
Jun3dTransformation >> i [
	^ i
]

{ #category : #testing }
Jun3dTransformation >> is3d [
	^ true
]

{ #category : #accessing }
Jun3dTransformation >> l [
	^ l
]

{ #category : #accessing }
Jun3dTransformation >> m [
	^ m
]

{ #category : #accessing }
Jun3dTransformation >> n [
	^ n
]

{ #category : #accessing }
Jun3dTransformation >> p [
	^ p
]

{ #category : #printing }
Jun3dTransformation >> printOn: aStream [
	aStream nextPutAll: self class printString.
	aStream nextPutAll: ' ('.
	a printOn: aStream.
	aStream nextPutAll: ' '.
	b printOn: aStream.
	aStream nextPutAll: ' '.
	c printOn: aStream.
	aStream nextPutAll: ' '.
	p printOn: aStream.
	aStream nextPutAll: ' , '.
	d printOn: aStream.
	aStream nextPutAll: ' '.
	e printOn: aStream.
	aStream nextPutAll: ' '.
	f printOn: aStream.
	aStream nextPutAll: ' '.
	q printOn: aStream.
	aStream nextPutAll: ' , '.
	g printOn: aStream.
	aStream nextPutAll: ' '.
	h printOn: aStream.
	aStream nextPutAll: ' '.
	i printOn: aStream.
	aStream nextPutAll: ' '.
	r printOn: aStream.
	aStream nextPutAll: ' , '.
	l printOn: aStream.
	aStream nextPutAll: ' '.
	m printOn: aStream.
	aStream nextPutAll: ' '.
	n printOn: aStream.
	aStream nextPutAll: ' '.
	s printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #transforming }
Jun3dTransformation >> product: aTransformation [
	| transformation |
	transformation := self class basicNew.
	transformation
		setA: a * aTransformation a + (b * aTransformation d) + (c * aTransformation g) + (p * aTransformation l).
	transformation
		setB: a * aTransformation b + (b * aTransformation e) + (c * aTransformation h) + (p * aTransformation m).
	transformation
		setC: a * aTransformation c + (b * aTransformation f) + (c * aTransformation i) + (p * aTransformation n).
	transformation
		setP: a * aTransformation p + (b * aTransformation q) + (c * aTransformation r) + (p * aTransformation s).
	transformation
		setD: d * aTransformation a + (e * aTransformation d) + (f * aTransformation g) + (q * aTransformation l).
	transformation
		setE: d * aTransformation b + (e * aTransformation e) + (f * aTransformation h) + (q * aTransformation m).
	transformation
		setF: d * aTransformation c + (e * aTransformation f) + (f * aTransformation i) + (q * aTransformation n).
	transformation
		setQ: d * aTransformation p + (e * aTransformation q) + (f * aTransformation r) + (q * aTransformation s).
	transformation
		setG: g * aTransformation a + (h * aTransformation d) + (i * aTransformation g) + (r * aTransformation l).
	transformation
		setH: g * aTransformation b + (h * aTransformation e) + (i * aTransformation h) + (r * aTransformation m).
	transformation
		setI: g * aTransformation c + (h * aTransformation f) + (i * aTransformation i) + (r * aTransformation n).
	transformation
		setR: g * aTransformation p + (h * aTransformation q) + (i * aTransformation r) + (r * aTransformation s).
	transformation
		setL: l * aTransformation a + (m * aTransformation d) + (n * aTransformation g) + (s * aTransformation l).
	transformation
		setM: l * aTransformation b + (m * aTransformation e) + (n * aTransformation h) + (s * aTransformation m).
	transformation
		setN: l * aTransformation c + (m * aTransformation f) + (n * aTransformation i) + (s * aTransformation n).
	transformation
		setS: l * aTransformation p + (m * aTransformation q) + (n * aTransformation r) + (s * aTransformation s).
	^ transformation
]

{ #category : #accessing }
Jun3dTransformation >> q [
	^ q
]

{ #category : #accessing }
Jun3dTransformation >> r [
	^ r
]

{ #category : #functions }
Jun3dTransformation >> rotationAngle [
	^ JunAngle fromRad: ((a + e + i - 1) / 2) arcCos
]

{ #category : #functions }
Jun3dTransformation >> rotationVector [
	| denominator |
	denominator := ((((f - h) ** 2 + (c - g)) ** 2 + (b - d)) ** 2) sqrt.
	^ Jun3dPoint x: (h - f) / denominator y: (c - g) / denominator z: (d - b) / denominator
]

{ #category : #accessing }
Jun3dTransformation >> s [
	^ s
]

{ #category : #private }
Jun3dTransformation >> setA: aNumber [ 
	a := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setB: aNumber [ 
	b := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setC: aNumber [ 
	c := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setD: aNumber [ 
	d := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setE: aNumber [ 
	e := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setF: aNumber [ 
	f := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setFromArray: anArray [ 
	self
		setA: (anArray at: 1);
		setB: (anArray at: 2);
		setC: (anArray at: 3);
		setP: (anArray at: 4).
	self
		setD: (anArray at: 5);
		setE: (anArray at: 6);
		setF: (anArray at: 7);
		setQ: (anArray at: 8).
	self
		setG: (anArray at: 9);
		setH: (anArray at: 10);
		setI: (anArray at: 11);
		setR: (anArray at: 12).
	self
		setL: (anArray at: 13);
		setM: (anArray at: 14);
		setN: (anArray at: 15);
		setS: (anArray at: 16)
]

{ #category : #private }
Jun3dTransformation >> setG: aNumber [ 
	g := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setH: aNumber [ 
	h := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setI: aNumber [ 
	i := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setL: aNumber [ 
	l := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setM: aNumber [ 
	m := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setN: aNumber [ 
	n := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setP: aNumber [ 
	p := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setQ: aNumber [ 
	q := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setR: aNumber [ 
	r := aNumber asFloat
]

{ #category : #private }
Jun3dTransformation >> setS: aNumber [ 
	s := aNumber asFloat
]
