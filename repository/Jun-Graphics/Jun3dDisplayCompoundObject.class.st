"
A Jun3dDisplayCompoundObject is a compound of objects to be rendered.
Instance Variables
	components:		<Array>

components
	- an array of display objects in the compound objects

"
Class {
	#name : #Jun3dDisplayCompoundObject,
	#superclass : #Jun3dDisplayObject,
	#instVars : [
		'components'
	],
	#category : 'Jun-Graphics-Objects'
}

{ #category : #'instance creation' }
Jun3dDisplayCompoundObject class >> color: aColor [
	^ self new
		color: aColor;
		yourself
]

{ #category : #'instance creation' }
Jun3dDisplayCompoundObject class >> components: aCollectionOfJun3dDisplayObject [
	^ self new setComponents: aCollectionOfJun3dDisplayObject asOrderedCollection
]

{ #category : #'instance creation' }
Jun3dDisplayCompoundObject class >> components: aCollectionOfJun3dDisplayObject color: aColor [
	^ (self components: aCollectionOfJun3dDisplayObject)
		color: aColor;
		yourself
]

{ #category : #adding }
Jun3dDisplayCompoundObject >> add: aJun3dDisplayObject [
	components add: aJun3dDisplayObject 
]

{ #category : #adding }
Jun3dDisplayCompoundObject >> addAll: aCollectionOfJun3dDisplayObject [
	components addAll: aCollectionOfJun3dDisplayObject
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> componentsDo: aBlock [
	components do: aBlock
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> geometriesDo: aBlock [
	components do: [ :obj | obj geometriesDo: aBlock ]
]

{ #category : #'initialize-release' }
Jun3dDisplayCompoundObject >> initialize [
	components := OrderedCollection new
]

{ #category : #testing }
Jun3dDisplayCompoundObject >> isCompound [
	^ true
]

{ #category : #utilities }
Jun3dDisplayCompoundObject >> numberOfPolygons [
	^ components inject: 0 into: [ :sum :obj | sum + obj numberOfPolygons ]
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> objectsDo: aBlock [
	super objectsDo: aBlock.
	components do: [ :obj | obj objectsDo: aBlock ]
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> pointsDo: aBlock [
	components do: [ :obj | obj pointsDo: aBlock ]
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> polygonsDo: aBlock [
	components do: [ :obj | obj polygonsDo: aBlock ]
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> primitivesDo: aBlock [
	components do: [ :obj | obj primitivesDo: aBlock ]
]

{ #category : #rendering }
Jun3dDisplayCompoundObject >> renderOn: aJunRenderingContext [
	| oldColor |
	oldColor := aJunRenderingContext color.
	color ifNotNil: [ aJunRenderingContext color: color ].
	components do: [ :obj | obj renderOn: aJunRenderingContext ].
	aJunRenderingContext color: oldColor
]

{ #category : #converting }
Jun3dDisplayCompoundObject >> reversed [
	| reversed |
	reversed := self copy.
	reversed setComponents: (components collect: [ :object | object reversed ]).
	^ reversed
]

{ #category : #private }
Jun3dDisplayCompoundObject >> setComponents: anOrderedCollection [
	components := anOrderedCollection 
]

{ #category : #transforming }
Jun3dDisplayCompoundObject >> transform: aTransformation [
	^ self copy
		setComponents: (components collect: [ :obj | obj transform: aTransformation ]);
		yourself
]

{ #category : #enumerating }
Jun3dDisplayCompoundObject >> with: aCollection componentsDo: aBlock [
	components with: aCollection do: aBlock
]
