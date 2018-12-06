"
JunAbstractRenderingContext is an abstract class for 3d rendering context.

"
Class {
	#name : #JunAbstractRenderingContext,
	#superclass : #Object,
	#instVars : [
		'color',
		'lineWidth',
		'pointSize',
		'presentation',
		'transformation',
		'projection',
		'lights',
		'lightStates',
		'lightIndex',
		'ambientLight',
		'backgroundColor'
	],
	#category : 'Jun-Graphics-RenderingContext'
}

{ #category : #constants }
JunAbstractRenderingContext class >> accuracy [
	^ JunGeometry accuracy
]

{ #category : #accessing }
JunAbstractRenderingContext >> alpha [
	^ color alpha
]

{ #category : #accessing }
JunAbstractRenderingContext >> alpha: aNumber [
	self color: (color alpha: aNumber)
]

{ #category : #lighting }
JunAbstractRenderingContext >> ambientLight: aColor [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunAbstractRenderingContext >> backgroundColor [
	^ backgroundColor ifNil: [ backgroundColor := Color white ]
]

{ #category : #accessing }
JunAbstractRenderingContext >> backgroundColor: aColor [
	backgroundColor := aColor
]

{ #category : #displaying }
JunAbstractRenderingContext >> clear [
	^ self subclassResponsibility
]

{ #category : #lighting }
JunAbstractRenderingContext >> clearLights [
	1 to: lightIndex do: [:index | self disableLightIndex: index].
	self resetLightIndex
]

{ #category : #accessing }
JunAbstractRenderingContext >> color [
	^ color
]

{ #category : #accessing }
JunAbstractRenderingContext >> color: aColor [
	color := aColor
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultAlpha [
	^ 1.0
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultColor [
	^ Color black
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultLineWidth [
	^ 1
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultParallelProjectionClass [
	^ JunParallelProjection
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultPerspectiveClass [
	^ JunPerspectiveProjection
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultPointSize [
	^ 1
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultProjection [
	^ JunProjection default
]

{ #category : #defaults }
JunAbstractRenderingContext >> defaultUpVector [
	^ Jun3dPoint x: 0.0 y: 0.0 z: 1.0
]

{ #category : #culling }
JunAbstractRenderingContext >> disableCullface [
	^ self subclassResponsibility
]

{ #category : #lighting }
JunAbstractRenderingContext >> disableLightIndex: anInteger [
	^ self subclassResponsibility
]

{ #category : #lighting }
JunAbstractRenderingContext >> disableLighting [
	^ self subclassResponsibility
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayLine: aCollectionOfJun3dPoint [
	aCollectionOfJun3dPoint size <= 2
		ifTrue: [ self displayLines: aCollectionOfJun3dPoint ]
		ifFalse: [ self displayLines: (Array with: aCollectionOfJun3dPoint first with: aCollectionOfJun3dPoint last) ]
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayLineLoop: aCollectionOfJun3dPoint [
	aCollectionOfJun3dPoint ifNotEmpty: [ self displayLines: (aCollectionOfJun3dPoint copyWith: aCollectionOfJun3dPoint) ]
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayLines: aCollectionOfJun3dPoint [
	^ self subclassResponsibility
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayPoint: aJun3dPoint [
	self displayPoints: (Array with: aJun3dPoint)
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayPoints: aCollectionOfJun3dPoint [
	^ self subclassResponsibility 
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayPolygon: aCollectionOfJun3dPoint [
	^ self subclassResponsibility
]

{ #category : #displaying }
JunAbstractRenderingContext >> displayPolygon: anArrayOfJun3dPoint1 normalVectors: anArrayOfJun3dPoint2 [
	^ self subclassResponsibility
]

{ #category : #culling }
JunAbstractRenderingContext >> enableCullface [
	^ self subclassResponsibility
]

{ #category : #lighting }
JunAbstractRenderingContext >> enableLighting [
	^ self subclassResponsibility
]

{ #category : #lighting }
JunAbstractRenderingContext >> getLightIndex [
	^ lightIndex := lightIndex \\ self maxLightIndex + 1
]

{ #category : #presentation }
JunAbstractRenderingContext >> hiddenlinePresentation [
	self presentation: #hiddenline
]

{ #category : #'initialize-release' }
JunAbstractRenderingContext >> initialize [
	super initialize.
	lights := Array new: self maxLightIndex + 1.
	lightStates := IdentityDictionary new.
	self projection: self defaultProjection.
	transformation := Jun3dTransformation unity.
	color := self defaultColor.
	lineWidth := self defaultLineWidth.
	pointSize := self defaultPointSize.
	self disableCullface.
	self solidPresentation.
	self resetLightIndex
]

{ #category : #accessing }
JunAbstractRenderingContext >> lineWidth [
	^ lineWidth
]

{ #category : #accessing }
JunAbstractRenderingContext >> lineWidth: aNumber [
	lineWidth := aNumber
]

{ #category : #accessing }
JunAbstractRenderingContext >> maxLightIndex [
	^ self subclassResponsibility
]

{ #category : #projecting }
JunAbstractRenderingContext >> parallelProjection: aJunParallelProjection [
	^ self subclassResponsibility
]

{ #category : #projecting }
JunAbstractRenderingContext >> perspectiveProjection: aJunParallelProjection [
	^ self subclassResponsibility
]

{ #category : #accessing }
JunAbstractRenderingContext >> pointSize [
	^ pointSize
]

{ #category : #accessing }
JunAbstractRenderingContext >> pointSize: aNumber [
	pointSize := aNumber
]

{ #category : #presentation }
JunAbstractRenderingContext >> presentation [
	^ presentation
]

{ #category : #presentation }
JunAbstractRenderingContext >> presentation: aSymbol [
	presentation := aSymbol
]

{ #category : #accessing }
JunAbstractRenderingContext >> projection [
	^ projection
]

{ #category : #projecting }
JunAbstractRenderingContext >> projection: aJunOpenGLProjection [
	aJunOpenGLProjection projectOn: self
]

{ #category : #lighting }
JunAbstractRenderingContext >> resetLightIndex [
	lightIndex := 0
]

{ #category : #accessing }
JunAbstractRenderingContext >> setProjection: aJunProjection [
	projection := aJunProjection
]

{ #category : #presentation }
JunAbstractRenderingContext >> solidPresentation [
	self presentation: #solid
]

{ #category : #presentation }
JunAbstractRenderingContext >> wireframePresentation [
	self presentation: #wireframe
]

{ #category : #'texture mapping' }
JunAbstractRenderingContext >> withTexture: aJunTexture do: aBlock [
	^ self subclassResponsibility
]
