Class {
	#name : #Jun3dDisplayBlocElement,
	#superclass : #BlElement,
	#traits : 'TJunDisplayModel',
	#classTraits : 'TJunDisplayModel classTrait',
	#instVars : [
		'object',
		'color',
		'projection',
		'dragger',
		'form'
	],
	#category : 'Jun-Bloc'
}

{ #category : #examples }
Jun3dDisplayBlocElement class >> exampleCubeBloc [
	<gtExample>
	| cube |
	cube := Jun3dDisplayObject unitCube.
	^ Jun3dDisplayBlocElement on: cube
]

{ #category : #examples }
Jun3dDisplayBlocElement class >> exampleEarthBloc [
	<gtExample>
	| earth |
	earth := Jun3dDisplayObject earth: 10.
	^ Jun3dDisplayBlocElement on: earth
]

{ #category : #'instance creation' }
Jun3dDisplayBlocElement class >> on: aJun3dDisplayObject [
	^ self new
		object: aJun3dDisplayObject;
		fit;
		size: 500 @ 500;
		yourself
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> color [
	^ color ifNil: [ self defaultColor ]
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> color: aColor [
	color := aColor
]

{ #category : #defaults }
Jun3dDisplayBlocElement >> defaultColor [
	^ Color white
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> dragger [
	^ dragger
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> dragger: aJun3dModelDragger [
	dragger := aJun3dModelDragger
]

{ #category : #drawing }
Jun3dDisplayBlocElement >> drawOnSpartaCanvas: aCanvas [
	| innerBounds extent |
	super drawOnSpartaCanvas: aCanvas.
	self drawBorderOnSpartaCanvas: aCanvas.
	innerBounds := self innerBounds.
	extent := innerBounds extent.
	(form isNil or: [ form extent ~= extent ])
		ifTrue: [ form := Form extent: extent depth: 32 ].
	self drawOnForm: form.
	aCanvas fill
		path: innerBounds;
		paint: (aCanvas bitmap fromForm: form);
		draw
]

{ #category : #viewing }
Jun3dDisplayBlocElement >> grabPointFor: aPoint [
	^ (aPoint - (self innerBounds extent * 0.5)) * (2.0 @ -2.0)
		/ self innerBounds height
]

{ #category : #'initialize-release' }
Jun3dDisplayBlocElement >> initialize [
	super initialize.
	projection := self defaultProjection.
	self
		addEventHandlerOn: BlMouseDownEvent
		do: [ :event | dragger := self createDraggerFor: (self grabPointFor: event localPosition) ].
	self addEventHandlerOn: BlMouseUpEvent do: [ dragger := nil ].
	self
		addEventHandlerOn: BlMouseMoveEvent
		do: [ :event | 
			dragger
				ifNotNil: [ dragger to: (self grabPointFor: event localPosition).
					self invalidate ] ].
	self
		addEventHandlerOn: BlMouseWheelEvent
		do: [ :event | 
			event isScrollUp
				ifTrue: [ self
						zoomout;
						invalidate ].
			event isScrollDown
				ifTrue: [ self
						zoomin;
						invalidate ] ].
	self addEventHandlerOn: BlElementExtentChangedEvent do: [ self invalidate ].
	self addEventHandlerOn: BlSpaceResizedEvent do: [ self invalidate ]
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> innerBounds [
	^ self bounds asRectangle
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> object [
	^ object
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> object: aJun3dDisplayObject [
	object := aJun3dDisplayObject
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> projection [
	^ projection
]

{ #category : #accessing }
Jun3dDisplayBlocElement >> projection: aJunProjection [
	projection := aJunProjection
]
