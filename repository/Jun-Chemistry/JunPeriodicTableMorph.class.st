Class {
	#name : #JunPeriodicTableMorph,
	#superclass : #Morph,
	#instVars : [
		'font',
		'selectedAtom',
		'hoverAtom',
		'action',
		'maxPeriod'
	],
	#category : 'Jun-Chemistry-Morphs'
}

{ #category : #utilities }
JunPeriodicTableMorph class >> chooseAnAtomClass [
	"JunPeriodicTableMorph chooseAnAtomClass browse"
	| morph |
	morph := self new.
	morph bounds left < 0 ifTrue: [ morph left: 0 ].
	morph bounds right > World bounds right ifTrue: [ morph right: World bounds right].
	morph bounds top < 0 ifTrue: [ morph top: 0 ].
	morph bounds bottom > World bounds bottom ifTrue: [ morph bottom: World bounds bottom ].
	morph action: [ :selection | morph delete ].
	World openModal: morph.
	^ morph selectedAtom
]

{ #category : #accessing }
JunPeriodicTableMorph >> action [
	^ action
]

{ #category : #accessing }
JunPeriodicTableMorph >> action: aBlockOrNil [
	action := aBlockOrNil
]

{ #category : #operations }
JunPeriodicTableMorph >> adjustExtent [
	self extent: self initialExtent
]

{ #category : #defaults }
JunPeriodicTableMorph >> defaultMaxPeriod [
	^ (JunAtom allSubclasses collect: [ :atomClass | atomClass period ]) max
]

{ #category : #drawing }
JunPeriodicTableMorph >> drawOn: aCanvas [
	| width height |
	aCanvas
		frameAndFillRectangle: self bounds
		fillColor: (Color gray: 0.95)
		borderWidth: 1
		borderColor: Color black.
	width := self extent x / 18.0.
	height := self extent y / self maxPeriod asFloat.
	JunAtom
		allSubclassesDo: [ :atomClass | 
			| symbol |
			symbol := atomClass symbol.
			atomClass == selectedAtom
				ifTrue: [ 
					aCanvas
						fillRectangle:
							(((atomClass group - 1) * width + self bounds left) @ ((atomClass period - 1) * height + self bounds top)
								extent: width @ height)
						color: Color lightGray ].
			atomClass == hoverAtom
				ifTrue: [ 
					aCanvas
						frameRectangle:
							(((atomClass group - 1) * width + self bounds left) @ ((atomClass period - 1) * height + self bounds top)
								extent: width @ height)
						color: Color black ].
			aCanvas
				drawString: symbol
				at:
					((atomClass group - 1) * width + self bounds left + ((width - (font widthOfString: symbol)) / 2.0))
						@ ((atomClass period - 1) * height + self bounds top + ((height - font height) / 2.0))
				font: font
				color: Color black ]
]

{ #category : #accessing }
JunPeriodicTableMorph >> font [
	^ font
]

{ #category : #accessing }
JunPeriodicTableMorph >> font: aFont [
	font := aFont
]

{ #category : #'event handling' }
JunPeriodicTableMorph >> handleMouseMove: aMouseEvent [
	| group period oldAtom |
	group := (aMouseEvent position x - self bounds left) * 18 // self bounds width + 1.
	period := (aMouseEvent position y - self bounds top) * self maxPeriod // self bounds height + 1.
	oldAtom := hoverAtom.
	hoverAtom := JunAtom period: period group: group.
	oldAtom = hoverAtom
		ifFalse: [ self changed ].
	^ super handleMouseMove: aMouseEvent
]

{ #category : #'event handling' }
JunPeriodicTableMorph >> handlesMouseDown: aMouseEvent [
	^ true
]

{ #category : #accessing }
JunPeriodicTableMorph >> initialExtent [
	| width height |
	width := ((JunAtom allSubclasses collect: [ :atomClass | font widthOfString: atomClass symbol ]) max * 2) * 18.
	height := (font height * 2) * self maxPeriod.
	^ width @ height
]

{ #category : #'initialize-release' }
JunPeriodicTableMorph >> initialize [
	super initialize.
	maxPeriod := self defaultMaxPeriod.
	font := TextStyle default defaultFont.
	self adjustExtent
]

{ #category : #accessing }
JunPeriodicTableMorph >> maxPeriod [
	^ maxPeriod
]

{ #category : #accessing }
JunPeriodicTableMorph >> maxPeriod: anInteger [
	maxPeriod := anInteger
]

{ #category : #'event handling' }
JunPeriodicTableMorph >> mouseDown: aMouseEvent [
	| group period  |
	group := (aMouseEvent position x - self bounds left) * 18 // self bounds width + 1.
	period := (aMouseEvent position y - self bounds top) * self maxPeriod // self bounds height + 1.
	selectedAtom := JunAtom period: period group: group.
	self changed.
	action ifNotNil: [ action cull: selectedAtom ]
]

{ #category : #private }
JunPeriodicTableMorph >> openAsIs [
	^ self openAsIsIn: (World)
]

{ #category : #private }
JunPeriodicTableMorph >> openAsIsIn: aWorld [
	"This msg and its callees result in the window being activeOnlyOnTop.
	Play the open sound if the preference is enabled."

	self playOpenSound.
	aWorld addMorph: self.
	self activate.
	aWorld startSteppingSubmorphsOf: self.
	self announceOpened.
	World announcer
		announce:
			(WindowOpened new
				window: self;
				yourself)
]

{ #category : #private }
JunPeriodicTableMorph >> playOpenSound [
	"Play the themed sound for opening."
	
	self theme windowOpenSound play
]

{ #category : #accessing }
JunPeriodicTableMorph >> selectedAtom [
	^ selectedAtom
]

{ #category : #accessing }
JunPeriodicTableMorph >> selectedAtom: aJunAtomClass [
	selectedAtom := aJunAtomClass
]

{ #category : #private }
JunPeriodicTableMorph >> setWindowColor: aColor [
	self color: aColor
]
