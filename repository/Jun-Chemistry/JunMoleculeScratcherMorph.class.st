Class {
	#name : #JunMoleculeScratcherMorph,
	#superclass : #Morph,
	#instVars : [
		'moleculeGeometry',
		'scale',
		'currentAtom',
		'atomBuffer',
		'bondBuffer',
		'startPoint'
	],
	#category : 'Jun-Chemistry-Morphs'
}

{ #category : #operations }
JunMoleculeScratcherMorph >> addAtomAt: aJun3dPoint [
	| atom |
	atom := self addAtomAt: aJun3dPoint from: nil.
	self changed.
	^ atom
]

{ #category : #operations }
JunMoleculeScratcherMorph >> addAtomAt: aJun3dPoint from: aJunAtomOrNil [
	| atom |
	atom := self atomAt: aJun3dPoint ifAbsent: [ atomBuffer add: (self defaultAtomClass at: aJun3dPoint asJun3dPoint) ].
	aJunAtomOrNil ifNotNil: [ self ensureBondBetween: aJunAtomOrNil and: atom ].
	self changed.
	^ atom
]

{ #category : #operations }
JunMoleculeScratcherMorph >> adjustAtom: aJunAtom [
	10
		timesRepeat: [ 
			| delta |
			delta := Jun3dPoint zero.
			moleculeGeometry
				bondsDo: [ :bond | 
					(bond atom1 == aJunAtom or: [ bond atom2 == aJunAtom ])
						ifTrue: [ 
							| peer |
							peer := bond peerOf: aJunAtom.
							delta := (aJunAtom position - peer position
								length:
									(aJunAtom covalentRadiusOfOrder: bond order) + (peer covalentRadiusOfOrder: bond order)
										- (aJunAtom position distance: peer position)) + delta ] ].
			aJunAtom position: aJunAtom position + delta ].
	self changed
]

{ #category : #accessing }
JunMoleculeScratcherMorph >> atomAt: aJun3dPoint [
	^ self atomAt: aJun3dPoint ifAbsent: [  ]
]

{ #category : #accessing }
JunMoleculeScratcherMorph >> atomAt: aJun3dPoint ifAbsent: errorBlock [
	moleculeGeometry
		atomsDo: [ :atom | 
			atom covalentRadius  / 2.0 > (atom position as2dPoint distance: aJun3dPoint as2dPoint)
				ifTrue: [ ^ atom ] ].
	atomBuffer
		do: [ :atom | 
			atom covalentRadius / 2.0 > (atom position as2dPoint distance: aJun3dPoint as2dPoint)
				ifTrue: [ ^ atom ] ].
	^ errorBlock value
]

{ #category : #accessing }
JunMoleculeScratcherMorph >> bondAt: aJun3dPoint ifAbsent: errorBlock [
	moleculeGeometry
		bondsDo: [ :bond | 
			((bond atom1 position as2dPoint + bond atom2 position as2dPoint) / 2.0 distance: aJun3dPoint as2dPoint) < 0.5
				ifTrue: [ ^ bond ] ].
	bondBuffer
		do: [ :bond | 
			((bond atom1 position as2dPoint + bond atom2 position as2dPoint) / 2.0 distance: aJun3dPoint as2dPoint) < 0.5
				ifTrue: [ ^ bond ] ].
	^ errorBlock value
]

{ #category : #operations }
JunMoleculeScratcherMorph >> changeAtom: aJunAtom [
	JunPeriodicTableMorph chooseAnAtomClass
		ifNotNil: [ :newAtomClass | 
			| newAtom numBonds |
			newAtom := newAtomClass at: aJunAtom position.
			moleculeGeometry replaceAtom: aJunAtom with: newAtom.
			numBonds := 0.
			moleculeGeometry neighborsOf: newAtom do: [ :atom | numBonds := numBonds + 1 ].
			numBonds = 1
				ifTrue: [ self adjustAtom: newAtom ]
				ifFalse: [ self changed ] ]
]

{ #category : #operations }
JunMoleculeScratcherMorph >> changeToDoubleBond: aJunBond [
	aJunBond order: 2.
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom1) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom1 ].
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom2) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom2 ].
	self changed
]

{ #category : #operations }
JunMoleculeScratcherMorph >> changeToSingleBond: aJunBond [
	aJunBond order: 1.
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom1) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom1 ].
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom2) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom2 ].
	self changed
]

{ #category : #operations }
JunMoleculeScratcherMorph >> changeToTripleBond: aJunBond [
	aJunBond order: 3.
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom1) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom1 ].
	(moleculeGeometry numberOfNeighborsOf: aJunBond atom2) = 1
		ifTrue: [ ^ self adjustAtom: aJunBond atom2 ].
	self changed
]

{ #category : #operations }
JunMoleculeScratcherMorph >> clearStroke [
	startPoint := nil.
	currentAtom := nil.
	atomBuffer removeAll.
	bondBuffer removeAll
]

{ #category : #operations }
JunMoleculeScratcherMorph >> commitAddition [
	atomBuffer do: [ :atom | moleculeGeometry addAtom: atom ].
	bondBuffer do: [ :bond | moleculeGeometry addBond: bond ]
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> continueStroke: aMouseEvent [
	| p  moleculePoint |
	p := aMouseEvent position.
	moleculePoint := self screenPointToMoleculePoint: p.
	atomBuffer removeAll.
	bondBuffer removeAll.
	self atomAt: moleculePoint ifAbsent: [ moleculePoint := self gridify: moleculePoint from: currentAtom ].
	self stopSteppingSelector: #handleMouseStillDown:.
	(moleculeGeometry includesAtom: currentAtom)
		ifFalse: [ atomBuffer add: currentAtom ].
	self addAtomAt: moleculePoint from: currentAtom.
	self changed
]

{ #category : #defaults }
JunMoleculeScratcherMorph >> defaultAtomClass [
	^ JunCarbon
]

{ #category : #drawing }
JunMoleculeScratcherMorph >> drawAtom: aJunAtom color: aColor on: aCanvas [
	| symbol font extent diameter center |
	symbol := aJunAtom symbol.
	font := TextStyle default defaultFont.
	extent := (font widthOfString: symbol) @ font height.
	diameter := ((extent x squared + extent y squared) sqrt + 2.0).
	center := self moleculePointToScreenPoint: aJunAtom position.
	aCanvas fillOval: (Rectangle center: center extent: diameter @ diameter) color: (aJunAtom color mixed: 0.5 with: Color white).
	aCanvas
		drawString: symbol
		at: center - (extent / 2.0)
		font: font
		color: aColor
]

{ #category : #drawing }
JunMoleculeScratcherMorph >> drawBond: aJunBond color: aColor on: aCanvas [
	| p1 p2 v |
	p1 := self moleculePointToScreenPoint: aJunBond atom1 position.
	p2 := self moleculePointToScreenPoint: aJunBond atom2 position.
	v := Point r: 1.0 degrees: (p2 - p1) theta radiansToDegrees + 90.0.
	1 to: aJunBond order do: [ :i | 
		| offset |
		offset := (i - (aJunBond order / 2.0)) * 4 * v.
		aCanvas
			line: p1 + offset
			to: p2 + offset
			width: 1.0
			color: aColor ]
]

{ #category : #drawing }
JunMoleculeScratcherMorph >> drawOn: aCanvas [
	aCanvas fillRectangle: self bounds color: Color white.
	bondBuffer do: [ :bond | self drawBond: bond color: Color gray on: aCanvas ].
	moleculeGeometry bondsDo: [ :bond | self drawBond: bond color: Color black on: aCanvas ].
	atomBuffer do: [ :atom | self drawAtom: atom color: Color gray on: aCanvas ].
	moleculeGeometry atomsDo: [ :atom | self drawAtom: atom color: Color black on: aCanvas ].

]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> endStroke: aMouseEvent [
	self commitAddition.
	self clearStroke.
	self changed
]

{ #category : #operations }
JunMoleculeScratcherMorph >> ensureBondBetween: aJunAtom1 and: aJunAtom2 [
	((moleculeGeometry includesBondBetween: aJunAtom1 and: aJunAtom2)
		or: [ 
			bondBuffer
				contains: [ :bond | 
					(bond atom1 == aJunAtom1 and: [ bond atom2 == aJunAtom2 ])
						or: [ bond atom1 == aJunAtom2 and: [ bond atom2 == aJunAtom1 ] ] ] ])
		ifFalse: [ bondBuffer add: (JunBond between: aJunAtom1 and: aJunAtom2) ]
]

{ #category : #private }
JunMoleculeScratcherMorph >> gridify: aJun3dPoint from: aJunAtomOrNil [
	^ aJunAtomOrNil
		ifNil: [ aJun3dPoint ]
		ifNotNil: [ 
			aJunAtomOrNil position
				+
					(Point
						r: aJunAtomOrNil covalentRadius + self defaultAtomClass covalentRadius
						degrees: ((aJun3dPoint - aJunAtomOrNil position) as2dPoint theta degrees roundTo: 30)) asJun3dPoint ]
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> handleMouseDown: aMouseEvent [
	aMouseEvent yellowButtonPressed
		ifTrue: [ ^ self yellowButtonDown: aMouseEvent ].
	aMouseEvent wasHandled: true.
	self
		startStepping: #handleMouseStillDown:
		at: Time millisecondClockValue + self mouseStillDownThreshold
		arguments: {(aMouseEvent copy resetHandlerFields)}
		stepTime: nil.
	self startStroke: aMouseEvent
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> handleMouseMove: aMouseEvent [
	aMouseEvent redButtonPressed
		ifTrue: [ 
			startPoint ifNotNil: [ self continueStroke: aMouseEvent ].
			aMouseEvent wasHandled: true ]
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> handleMouseStillDown: aMouseEvent [
	self stopSteppingSelector: #handleMouseStillDown:.
	(moleculeGeometry includesAtom: currentAtom)
		ifTrue: [ 
			(JunMoleculeScratcherMenuMorph on: self origin: startPoint arg: currentAtom)
				addAt: 0 @ -20 + startPoint label: 'delete' selector: #removeAtom:;
				addAt: -50 @ 20 + startPoint label: 'change' selector: #changeAtom:;
				addAt: 50 @ 20 + startPoint label: 'adjust' selector: #adjustAtom:;
				handleMouseDown: aMouseEvent ]
		ifFalse: [ 
			(self bondAt: (self screenPointToMoleculePoint: aMouseEvent position) ifAbsent: [  ])
				ifNotNil: [ :bond | 
					(JunMoleculeScratcherMenuMorph on: self origin: startPoint arg: bond)
						addAt: 0 @ -20 + startPoint label: 'delete' selector: #removeBond:;
						addAt: -100 @ 20 + startPoint label: 'single' selector: #changeToSingleBond:;
						addAt: 0 @ 20 + startPoint label: 'double' selector: #changeToDoubleBond:;
						addAt: 100 @ 20 + startPoint label: 'triple' selector: #changeToTripleBond:;
						handleMouseDown: aMouseEvent ] ].
	self clearStroke.
	self changed
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> handleMouseUp: aMouseEvent [
	self stopSteppingSelector: #handleMouseStillDown:.
	self endStroke: aMouseEvent.
	aMouseEvent wasHandled: true
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> handlesMouseDown: aMouseEvent [
	^ true
]

{ #category : #'initialize-release' }
JunMoleculeScratcherMorph >> initialize [
	super initialize.
	moleculeGeometry := RMapMolecule new.
	scale := 40.
	currentAtom := nil.
	atomBuffer := OrderedCollection new.
	bondBuffer := OrderedCollection new.
	startPoint := nil.
	self extent: 500 @ 500.
	self color: Color white
]

{ #category : #accessing }
JunMoleculeScratcherMorph >> moleculeGeometry [
	^ moleculeGeometry
]

{ #category : #geometry }
JunMoleculeScratcherMorph >> moleculePointToScreenPoint: aJun3dPoint [
	^ (aJun3dPoint x * scale) @ (aJun3dPoint y * scale negated) + self bounds center
]

{ #category : #geometry }
JunMoleculeScratcherMorph >> moleculeScaleToScreenScale: aNumber [
	^ aNumber * scale
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> mouseStillDownThreshold [
	^ 1000
]

{ #category : #'user interface' }
JunMoleculeScratcherMorph >> openInWindow [
	^ self openInWindowLabeled: 'Molecule Scratcher'
]

{ #category : #operations }
JunMoleculeScratcherMorph >> removeAtom: aJunAtom [
	moleculeGeometry removeAtom: aJunAtom ifAbsent: [  ].
	self changed
]

{ #category : #operations }
JunMoleculeScratcherMorph >> removeBond: aJunAtom [
	moleculeGeometry removeBond: aJunAtom ifAbsent: [  ].
	self changed
]

{ #category : #geometry }
JunMoleculeScratcherMorph >> screenPointToMoleculePoint: aPoint [
	^ ((aPoint - self bounds center) / (scale @ scale negated)) asJun3dPoint
]

{ #category : #geometry }
JunMoleculeScratcherMorph >> screenScaleToMoleculeScale: aNumber [
	^ aNumber asFloat / scale asFloat
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> startStroke: aMouseEvent [
	startPoint := aMouseEvent position.
	currentAtom := self atomAt: (self screenPointToMoleculePoint: startPoint) ifAbsent: [  ].
	currentAtom ifNil: [ currentAtom := self addAtomAt: (self screenPointToMoleculePoint: startPoint) from: nil ].
	self changed
]

{ #category : #geometry }
JunMoleculeScratcherMorph >> tailLength [
	^ 10
]

{ #category : #'event handling' }
JunMoleculeScratcherMorph >> yellowButtonDown: aMouseEvent [
	aMouseEvent wasHandled: true.
	(currentAtom := self atomAt: (self screenPointToMoleculePoint: aMouseEvent position) ifAbsent: [ nil ])
		ifNotNil: [ 
			(MenuMorph new
				add: 'delete'
					target: self
					selector: #removeAtom:
					argument: currentAtom;
				add: 'change...'
					target: self
					selector: #changeAtom:
					argument: currentAtom;
				add: 'adjust by covalent distance'
					target: self
					selector: #adjustAtom:
					argument: currentAtom;
				yourself) popUpEvent: aMouseEvent in: World.
			^ self ].
	(self bondAt: (self screenPointToMoleculePoint: aMouseEvent position) ifAbsent: [ nil ])
		ifNotNil: [ :bond | 
			(MenuMorph new
				add: 'delete'
					target: self
					selector: #removeBond:
					argument: bond;
				addLine;
				add: 'single'
					target: self
					selector: #changeToSingleBond:
					argument: bond;
				add: 'double'
					target: self
					selector: #changeToDoubleBond:
					argument: bond;
				add: 'triple'
					target: self
					selector: #changeToTripleBond:
					argument: bond;
				yourself) popUpEvent: aMouseEvent in: World.
			^ self ]
]
