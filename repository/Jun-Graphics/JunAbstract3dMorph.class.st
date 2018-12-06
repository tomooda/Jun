Class {
	#name : #JunAbstract3dMorph,
	#superclass : #Morph,
	#traits : 'TJunDisplayModel',
	#classTraits : 'TJunDisplayModel classTrait',
	#instVars : [
		'projection',
		'dragger',
		'dirty',
		'form',
		'updateProcess'
	],
	#category : 'Jun-Graphics-Morphs'
}

{ #category : #private }
JunAbstract3dMorph >> changed [
	dirty := false.
	super changed
]

{ #category : #defaults }
JunAbstract3dMorph >> defaultColor [
	^ Color black
]

{ #category : #defaults }
JunAbstract3dMorph >> defaultExtent [
	^ 500 @ 500
]

{ #category : #private }
JunAbstract3dMorph >> delayedChanged [
	dirty := true.
	(updateProcess isNil or: [ updateProcess isTerminated ])
		ifTrue: [ self startUpdateProcess ]
]

{ #category : #accessing }
JunAbstract3dMorph >> dirty [
	^ dirty
]

{ #category : #accessing }
JunAbstract3dMorph >> dirty: aBoolean [
	dirty := aBoolean
]

{ #category : #accessing }
JunAbstract3dMorph >> dragger [
	^ dragger
]

{ #category : #accessing }
JunAbstract3dMorph >> dragger: aJun3dModelDragger [
	dragger := aJun3dModelDragger
]

{ #category : #drawing }
JunAbstract3dMorph >> drawOn: aCanvas [
	(form isNil or: [ form extent ~= self innerBounds extent ])
		ifTrue: [ form := Form extent: self innerBounds extent depth: 32 ].
	self drawOnForm: form.
	aCanvas drawImage: form at: self innerBounds origin
]

{ #category : #viewing }
JunAbstract3dMorph >> grabPointFor: aPoint [
	^ (aPoint - self innerBounds center) * (2.0 @ -2.0)
		/ self innerBounds height
]

{ #category : #'event handling' }
JunAbstract3dMorph >> handleMouseMove: aMouseEvent [
	aMouseEvent redButtonPressed
		ifTrue: [ self dragActionAt: aMouseEvent position.
			aMouseEvent wasHandled: true ]
		ifFalse: [ dragger := nil ].
	super handleMouseMove: aMouseEvent
]

{ #category : #'event handling' }
JunAbstract3dMorph >> handlesKeyDown: aKeyboardEvent [
	^ true
]

{ #category : #'event handling' }
JunAbstract3dMorph >> handlesMouseDown: aMouseEvent [
	^ true
]

{ #category : #'event handling' }
JunAbstract3dMorph >> handlesMouseWheel: anEvent [
	^ true
]

{ #category : #'initialize-release' }
JunAbstract3dMorph >> initialize [
	super initialize.
	self extent: self defaultExtent.
	projection := self defaultProjection.
	dirty := false
]

{ #category : #accessing }
JunAbstract3dMorph >> innerBounds [
	^ self bounds origin extent: self width @ self height
]

{ #category : #'event handling' }
JunAbstract3dMorph >> mouseWheel: aMouseEvent [
	((aMouseEvent respondsTo: #isUp)
		ifTrue: [ aMouseEvent isUp ]
		ifFalse: [ aMouseEvent direction = #up ])
		ifTrue: [ aMouseEvent wasHandled: true.
			self zoomin.
			^ self delayedChanged ].
	((aMouseEvent respondsTo: #isDown)
		ifTrue: [ aMouseEvent isDown ]
		ifFalse: [ aMouseEvent direction = #down ])
		ifTrue: [ aMouseEvent wasHandled: true.
			self zoomout.
			^ self delayedChanged ].
	super mouseWheel: aMouseEvent
]

{ #category : #accessing }
JunAbstract3dMorph >> object [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunAbstract3dMorph >> projection [
	^ projection
]

{ #category : #accessing }
JunAbstract3dMorph >> projection: aJunProjection [
	projection := aJunProjection
]

{ #category : #private }
JunAbstract3dMorph >> startUpdateProcess [
	updateProcess ifNotNil: [ updateProcess terminate ].
	updateProcess := [ 
	[ 
	| t0 |
	self world ifNil: [ updateProcess terminate ].
	t0 := Time millisecondClockValue.
	dirty = true
		ifTrue: [ self changed ].
	(Delay forMilliseconds: 100) wait.
	(Delay forMilliseconds: (Time millisecondClockValue - t0 min: 1000 max: 100)) wait ] repeat ]
		forkAt: Processor userBackgroundPriority
]
