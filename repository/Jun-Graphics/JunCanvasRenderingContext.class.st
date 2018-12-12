"
A JunCanvasRenderingContext is a pure smalltalk implementation of 3d rendering context using z-sorting algorithm.

Instance Variables
	blocks:		<WriteStream>
	canvas:		<Canvas>
	transformation:		<Jun3dTransformation>

blocks
	- xxxxx

canvas
	- xxxxx

transformation
	- xxxxx

"
Class {
	#name : #JunCanvasRenderingContext,
	#superclass : #JunAbstractRenderingContext,
	#instVars : [
		'canvas',
		'viewport',
		'blocks',
		'cullfaceEnabled',
		'projectionTransformation',
		'viewportTransformation',
		'totalTransformation'
	],
	#category : 'Jun-Graphics-RenderingContext'
}

{ #category : #'instance creation' }
JunCanvasRenderingContext class >> on: aCanvas viewport: aRectangle [
	^ self new
		setCanvas: aCanvas viewport: aRectangle;
		yourself
]

{ #category : #'instance creation' }
JunCanvasRenderingContext class >> onForm: aForm [
	^ self on: aForm getCanvas viewport: (0 @ 0 extent: aForm extent)
]

{ #category : #lighting }
JunCanvasRenderingContext >> ambientLight: aColor [
	ambientLight := aColor
]

{ #category : #displaying }
JunCanvasRenderingContext >> clear [
	blocks := Array new writeStream.
	canvas fillColor: self backgroundColor
]

{ #category : #private }
JunCanvasRenderingContext >> computeTotalTransformation [
	
]

{ #category : #culling }
JunCanvasRenderingContext >> cullfaceEnabled [
	^ cullfaceEnabled = true
]

{ #category : #culling }
JunCanvasRenderingContext >> cullfaceEnabled: aBoolean [
	cullfaceEnabled := aBoolean = true
]

{ #category : #culling }
JunCanvasRenderingContext >> disableCullface [
	cullfaceEnabled := false
]

{ #category : #lighting }
JunCanvasRenderingContext >> disableLightIndex: anInteger [
	
]

{ #category : #lighting }
JunCanvasRenderingContext >> disableLighting [
]

{ #category : #displaying }
JunCanvasRenderingContext >> displayLines: aCollectionOfJun3dPoint [
	| t points near far w c |
	aCollectionOfJun3dPoint ifEmpty: [ ^ self ].
	t := self totalTransformation.
	near := projection near.
	far := projection far.
	points := aCollectionOfJun3dPoint
		collect: [ :point | 
			| p |
			p := point transform: t.
			(p z between: near and: far)
				ifFalse: [ ^ self ].
			p ].
	c := color.
	w := lineWidth.
	blocks
		nextPut:
			(points collect: #z) average
				-> [1 to: points size - 1 do: [:i | | p1 p2|
			p1 := points at: i.
			p2 := points at: i+1.
			canvas line: p1 asPoint to: p2 asPoint width: w color: c] ]	

]

{ #category : #displaying }
JunCanvasRenderingContext >> displayPoint: aJun3dPoint [
	| t p |
	t := self totalTransformation.
	p := aJun3dPoint transform: t.
	((viewport containsPoint: p) and: [ p z between: projection near and: projection far ])
		ifTrue: [ 
			| c |
			c := color.
			blocks nextPut: p z -> [canvas
				fillRectangle: ((p x - (pointSize / 2.0)) @ (p y - (pointSize / 2.0)) extent: pointSize @ pointSize)
				fillStyle: c ]]
]

{ #category : #displaying }
JunCanvasRenderingContext >> displayPoints: aCollectionOfJun3dPoint [
	aCollectionOfJun3dPoint do: [ :p | self displayPoint: p ]
]

{ #category : #displaying }
JunCanvasRenderingContext >> displayPolygon: aCollectionOfJun3dPoint [
	self
		displayPolygon: aCollectionOfJun3dPoint
		normalVector: (Jun3dPoint normalUnitVectorOfPoints: aCollectionOfJun3dPoint)
]

{ #category : #displaying }
JunCanvasRenderingContext >> displayPolygon: aCollectionOfJun3dPoint normalVector: aJun3dPoint [
	| t points near far n |
	aCollectionOfJun3dPoint ifEmpty: [ ^ self ].
	t := self totalTransformation.
	near := projection near.
	far := projection far.
	points := aCollectionOfJun3dPoint
		collect: [ :point | 
			| p |
			p := point transform: t.
			(p z between: near and: far)
				ifFalse: [ ^ self ].
			p ].
	n := aJun3dPoint unitVector dotProduct: projection unitSightVector negated.
	presentation = #wireframe
		ifTrue: [ 
			| c w |
			c := color.
			w := lineWidth.
			blocks
				nextPut:
					(points collect: #z) average
						-> [ 
							1 to: points size - 1 do: [ :i | 
								| p1 p2 |
								p1 := points at: i.
								p2 := points at: i + 1.
								canvas
									line: p1 asPoint
									to: p2 asPoint
									width: w
									color: c ].
							canvas
								line: points last asPoint
								to: points first asPoint
								width: w
								color: c ] ].
	(cullfaceEnabled not or: [ n >= 0.0 ])
		ifTrue: [ 
			presentation = #solid
				ifTrue: [ 
					| c |
					c := Color h: color hue s: color saturation v: (n max: 0.5).
					blocks nextPut: (points collect: #z) average -> [ canvas drawPolygon: (points collect: #asPoint) fillStyle: c ].
					^ self ].
			presentation = #hiddenline
				ifTrue: [ 
					| bc c w |
					bc := self backgroundColor.
					c := self color.
					w := lineWidth.
					blocks
						nextPut:
							(points collect: #z) average
								-> [ 
									canvas
										drawPolygon: (points collect: #asPoint)
										color: bc
										borderWidth: w
										borderColor: c ].
					^ self ] ]
]

{ #category : #displaying }
JunCanvasRenderingContext >> displayPolygon: aCollectionOfJun3dPoint normalVectors: normalVectors [
	self displayPolygon: aCollectionOfJun3dPoint normalVector: (normalVectors) sum unitVector
]

{ #category : #culling }
JunCanvasRenderingContext >> enableCullface [
	cullfaceEnabled := true
]

{ #category : #lighting }
JunCanvasRenderingContext >> enableLightIndex: anInteger [
	
]

{ #category : #lighting }
JunCanvasRenderingContext >> enableLighting [
]

{ #category : #displaying }
JunCanvasRenderingContext >> flush [
	canvas fillColor: self backgroundColor.
	blocks contents asSortedCollection reverseDo: [ :assoc | assoc value value ]
]

{ #category : #lighting }
JunCanvasRenderingContext >> lightIndex: anInteger parallel: aJun3dPoint color: aColor [
	
]

{ #category : #accessing }
JunCanvasRenderingContext >> maxLightIndex [
	^ 4
]

{ #category : #projecting }
JunCanvasRenderingContext >> parallelProjection: aJunParallelProjection [
	| scale |
	self setProjection: aJunParallelProjection copy.
	scale := aJunParallelProjection height / 2.0.
	projectionTransformation := Jun3dTransformation
		fromOrigin: aJunParallelProjection eyePoint
		xAxis: aJunParallelProjection unitRightVector * scale
		yAxis: aJunParallelProjection unitUpVector * scale
		zAxis: aJunParallelProjection unitSightVector.
	totalTransformation := nil.
	projection := aJunParallelProjection
]

{ #category : #projecting }
JunCanvasRenderingContext >> perspectiveProjection: aJunPerspectiveProjection [
	| depth xyScale |
	self setProjection: aJunPerspectiveProjection copy.
	depth := aJunPerspectiveProjection sightPoint
		distance: aJunPerspectiveProjection eyePoint.
	xyScale := 2.0 / aJunPerspectiveProjection regularHeight.
	projectionTransformation := ((Jun3dTransformation
		fromOrigin: aJunPerspectiveProjection sightPoint
		xAxis: aJunPerspectiveProjection unitRightVector
		yAxis: aJunPerspectiveProjection unitUpVector
		zAxis: aJunPerspectiveProjection unitSightVector negated)
		product: (Jun3dTransformation perspective: 0 ,, 0 ,, depth))
		product: (Jun3dTransformation scale: xyScale ,, xyScale ,, -1).
	projectionTransformation := projectionTransformation
		product: (Jun3dTransformation translate: 0 ,, 0 ,, depth).
	totalTransformation := nil.
	projection := aJunPerspectiveProjection copy
]

{ #category : #private }
JunCanvasRenderingContext >> setCanvas: aCanvas viewport: aRectangle [
	canvas := aCanvas.
	viewport := aRectangle.
	(viewport width max: viewport height) asFloat / 2.0
		in: [ :scale | 
			viewportTransformation := (Jun3dTransformation scale: scale ,, scale negated ,, 1)
				product: (Jun3dTransformation translate: (Jun2dPoint fromPoint: aRectangle center) ,, 0) ]
]

{ #category : #private }
JunCanvasRenderingContext >> totalTransformation [
	^ totalTransformation
		ifNil: [ totalTransformation := (transformation product: projectionTransformation) product: viewportTransformation ]
]

{ #category : #'texture mapping' }
JunCanvasRenderingContext >> withTexture: aJunTexture do: aBlock [
	^ aBlock value
]
