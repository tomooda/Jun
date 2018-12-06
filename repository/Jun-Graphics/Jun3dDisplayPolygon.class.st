"
A Jun3dDisplayPolygon is a polygon object to be rendered.

Instance Variables
	normalVector:		<Jun3dPoint>
	points:		<Array>

normalVector
	- a vector vertical to the polygon. used for shading with lights

points
	- an array of points of vertices

"
Class {
	#name : #Jun3dDisplayPolygon,
	#superclass : #Jun3dDisplayObject,
	#instVars : [
		'points',
		'normalVector',
		'normalVectors',
		'texture',
		'texturePoints'
	],
	#category : 'Jun-Graphics-Objects'
}

{ #category : #'instance creation' }
Jun3dDisplayPolygon class >> on: aJun3dPoint1 on: aJun3dPoint2 on: aJun3dPoint3 [
	^ self new setPoints: (Array with: aJun3dPoint1 with: aJun3dPoint2 with: aJun3dPoint3)
]

{ #category : #'instance creation' }
Jun3dDisplayPolygon class >> points: anArrayOfJun3dPoint [
	^ self new setPoints: anArrayOfJun3dPoint asArray
]

{ #category : #'instance creation' }
Jun3dDisplayPolygon class >> points: anArrayOfJun3dPoint color: aColor [
	^ (self points: anArrayOfJun3dPoint)
		color: aColor;
		yourself
]

{ #category : #'instance creation' }
Jun3dDisplayPolygon class >> points: anArrayOfJun3dPoint normalVector: aJun3dPoint [
	^ (self points: anArrayOfJun3dPoint)
		normalVector: aJun3dPoint;
		yourself
]

{ #category : #'instance creation' }
Jun3dDisplayPolygon class >> points: anArrayOfJun3dPoint normalVector: aJun3dPoint color: aColor [
	^ (self points: anArrayOfJun3dPoint)
		normalVector: aJun3dPoint;
		color: aColor;
		yourself
]

{ #category : #accessing }
Jun3dDisplayPolygon >> basicNormalVector [
	^ normalVector
]

{ #category : #enumerating }
Jun3dDisplayPolygon >> geometriesDo: aBlock [
	self notYetImplemented
]

{ #category : #testing }
Jun3dDisplayPolygon >> isPrimitive [
	^ true
]

{ #category : #accessing }
Jun3dDisplayPolygon >> normalVector: aJun3dPoint [
	points
		ifNotNil: [ normalVectors := Array new: points size withAll: aJun3dPoint ]
		ifNil: [ normalVectors := Array with: aJun3dPoint ]
]

{ #category : #accessing }
Jun3dDisplayPolygon >> normalVectors [
	^ normalVectors
		ifNil: [ normalVector := Array new: points size withAll: (Jun3dPoint normalUnitVectorOfPoints: points) ]
]

{ #category : #accessing }
Jun3dDisplayPolygon >> normalVectors: anArrayOfJun3dPoint [
	normalVectors := anArrayOfJun3dPoint
]

{ #category : #accessing }
Jun3dDisplayPolygon >> numberOfPolygons [
	^ 1
]

{ #category : #accessing }
Jun3dDisplayPolygon >> points [
	^ points
]

{ #category : #enumerating }
Jun3dDisplayPolygon >> pointsDo: aBlock [
	points do: aBlock
]

{ #category : #enumerating }
Jun3dDisplayPolygon >> polygonsDo: aBlock [
	aBlock value: self
]

{ #category : #rendering }
Jun3dDisplayPolygon >> renderOn: aJunRenderingContext [
	texture
		ifNotNil: [ 
			aJunRenderingContext
				withTexture: texture
				do: [ aJunRenderingContext displayPolygon: points normalVectors: self normalVectors texturePoints: texturePoints ] ]
		ifNil: [ 
			| oldColor |
			color
				ifNotNil: [ 
					oldColor := aJunRenderingContext color.
					aJunRenderingContext color: color ].
			aJunRenderingContext displayPolygon: points normalVectors: self normalVectors.
			oldColor ifNotNil: [ aJunRenderingContext color: oldColor ] ]
]

{ #category : #converting }
Jun3dDisplayPolygon >> reversed [
	| polygon |
	polygon := self copy.
	polygon setPoints: points reversed.
	normalVectors ifNotNil: [ polygon normalVectors: (normalVectors collect: #negated) ].
	^ polygon
]

{ #category : #private }
Jun3dDisplayPolygon >> setPoints: anArrayOfVertices [
	points := anArrayOfVertices
]

{ #category : #private }
Jun3dDisplayPolygon >> setTexture: aJunTexture points: anArrayOfJun2dPoint [
	texture := aJunTexture.
	texturePoints := anArrayOfJun2dPoint
]

{ #category : #accessing }
Jun3dDisplayPolygon >> texture [
	^ texture
]

{ #category : #accessing }
Jun3dDisplayPolygon >> textureBytes [
	^ textureBytes
		ifNil: [ 
			texture
				ifNotNil: [ 
					| bytes |
					bytes := ByteArray
						new: texture width * texture height
						streamContents: [ :stream | 
							1 to: texture height do: [ :y | 
								1 to: texture width do: [ :x | 
									| c |
									c := texture at: x @ y.
									stream nextPut: ((c red * 256) truncated min: 255).
									stream nextPut: ((c green * 256) truncated min: 255).
									stream nextPut: ((c blue * 256) truncated min: 255).
									stream nextPut: ((c alpha * 256) truncated min: 255) ] ] ].
					autoTextureCacheEnabled
						ifTrue: [ textureBytes := bytes ].
					bytes ] ]
]

{ #category : #transforming }
Jun3dDisplayPolygon >> transform: aJun3dTransformation [
	| polygon |
	polygon := self copy.
	polygon setPoints: (points collect: [ :p | p transform: aJun3dTransformation ]).
	normalVectors ifNotNil: [ polygon normalVectors: (normalVectors collect: [ :n | n transform: aJun3dTransformation ]) ].
	^ polygon
]
