Class {
	#name : #JunSimple3dMorph,
	#superclass : #JunAbstract3dMorph,
	#instVars : [
		'object'
	],
	#category : 'Jun-Graphics-Morphs'
}

{ #category : #exampleEarth }
JunSimple3dMorph class >> exampleCube [
	<script: 'JunSimple3dMorph exampleCube'>
	JunSimple3dMorph show: Jun3dDisplayObject unitCube label: 'cube' color: Color white
]

{ #category : #exampleEarth }
JunSimple3dMorph class >> exampleEarth [
	<script: 'JunSimple3dMorph exampleEarth'>
	JunSimple3dMorph show: (Jun3dDisplayObject earth: 10) label: 'the Earth' color: Color black
]

{ #category : #'instance creation' }
JunSimple3dMorph class >> on: aJun3dDisplayObject [
	^ self new
		object: aJun3dDisplayObject;
		yourself
]

{ #category : #utilities }
JunSimple3dMorph class >> show: aJun3dDisplayObject [
	"JunSimple3dMorph show: Jun3dDisplayObject benzene"

	^ self show: aJun3dDisplayObject label: 'Jun3dMorph'
]

{ #category : #utilities }
JunSimple3dMorph class >> show: aJun3dDisplayObject label: aString [
	^ (self on: aJun3dDisplayObject)
		fit;
		openInWindowLabeled: aString
]

{ #category : #utilities }
JunSimple3dMorph class >> show: aJun3dDisplayObject label: aString color: aColor [
	| morph window |
	morph := (self on: aJun3dDisplayObject)
		fit;
		color: aColor;
		yourself.
	window := morph openInWindowLabeled: aString.
	morph color: aColor.
	^ window
]

{ #category : #accessing }
JunSimple3dMorph >> object [
	^ object
]

{ #category : #accessing }
JunSimple3dMorph >> object: anObject [
	object := anObject
]
