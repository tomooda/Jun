Class {
	#name : #JunMoleculeScratcherMenuMorph,
	#superclass : #Morph,
	#instVars : [
		'origin',
		'actions',
		'font',
		'arg',
		'selectionIndex'
	],
	#category : 'Jun-Chemistry-Morphs'
}

{ #category : #'instance creation' }
JunMoleculeScratcherMenuMorph class >> on: aMorph origin: aPoint arg: aJunAtom [
	| menuMorph |
	menuMorph := self new.
	menuMorph origin: aPoint.
	menuMorph arg: aJunAtom.
	menuMorph bounds: aMorph bounds.
	aMorph addMorph: menuMorph.
	^ menuMorph
]

{ #category : #'adding/removing' }
JunMoleculeScratcherMenuMorph >> addAt: aPoint label: aString selector: aSymbol [
	^ actions add: (Array with: aPoint with: aString with: aSymbol)
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> arg [
	^ arg
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> arg: aJunAtom [
	arg := aJunAtom
]

{ #category : #drawing }
JunMoleculeScratcherMenuMorph >> drawOn: aCanvas [
	aCanvas fillRectangle: self bounds color: (Color gray alpha: 0.5).
	1 to: actions size do: [ :index | 
		| triple stringExtent |
		triple := actions at: index.
		stringExtent := (font widthOfString: triple second) @ font height.
		aCanvas
			fillRectangle: (Rectangle center: triple first extent: stringExtent * 2)
			color:
				(index = selectionIndex
					ifTrue: [ Color white ]
					ifFalse: [ Color gray ]).
		aCanvas
			drawString: triple second
			at: triple first - (stringExtent / 2.0)
			font: font
			color: Color black ]
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> font [
	^ font
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> font: aFont [
	font := aFont
]

{ #category : #'event handling' }
JunMoleculeScratcherMenuMorph >> handleMouseMove: aMouseEvent [
	| oldSelectionIndex |
	oldSelectionIndex := selectionIndex.
	selectionIndex := nil.
	((aMouseEvent position - origin) r > self moveThreshhold and: [ actions notEmpty ])
		ifTrue: [ 
			selectionIndex := ((1 to: actions size)
				collect: [ :index | ((actions at: index) first - aMouseEvent position) r -> index ]) min value ].
	selectionIndex ~= oldSelectionIndex
		ifTrue: [ self changed ].
	^ super handleMouseMove: aMouseEvent
]

{ #category : #'event handling' }
JunMoleculeScratcherMenuMorph >> handlesMouseDown: aMouseEvent [
	^ true
]

{ #category : #'initialize-release' }
JunMoleculeScratcherMenuMorph >> initialize [
	super initialize.
	font := TextStyle default defaultFont.
	actions := OrderedCollection new
]

{ #category : #'event handling' }
JunMoleculeScratcherMenuMorph >> mouseDown: aMouseEvent [
	
]

{ #category : #'event handling' }
JunMoleculeScratcherMenuMorph >> mouseUp: aMouseEvent [
	selectionIndex ifNotNil: [ owner perform: (actions at: selectionIndex) third asSymbol with: arg].
	self delete
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> moveThreshhold [
	^ 10.0
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> origin [
	^ origin
]

{ #category : #accessing }
JunMoleculeScratcherMenuMorph >> origin: aPoint [
	origin := aPoint
]
