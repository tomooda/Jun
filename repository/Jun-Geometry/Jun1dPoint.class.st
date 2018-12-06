Class {
	#name : #Jun1dPoint,
	#superclass : #JunPoint,
	#instVars : [
		'x'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #'instance creation' }
Jun1dPoint class >> fromArray: anArray [
	^ self x: (anArray at: 1)
]

{ #category : #'instance creation' }
Jun1dPoint class >> fromNumber: aNumber [
	^ self x: aNumber
]

{ #category : #'instance creation' }
Jun1dPoint class >> fromPoint: aPoint [
	^ self x: aPoint x
]

{ #category : #'constants access' }
Jun1dPoint class >> unity [
	"Jun2dPoint unity."

	^ self x: 1.0
]

{ #category : #'instance creation' }
Jun1dPoint class >> x: xNumber [
	^ self basicNew
		setX: xNumber;
		yourself
]

{ #category : #'constants access' }
Jun1dPoint class >> zero [
	"Jun1dPoint unity."

	^ self x: 0.0
]

{ #category : #arithmetic }
Jun1dPoint >> * aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x * aPoint x ].
	^ self retry: #* coercing: aPoint
]

{ #category : #arithmetic }
Jun1dPoint >> + aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x + aPoint x ].
	^ self retry: #+ coercing: aPoint
]

{ #category : #converting }
Jun1dPoint >> , aNumberOrJun1dPoint [
	^ Jun2dPoint
		x: self x
		y:
			(aNumberOrJun1dPoint isPoint
				ifTrue: [ aNumberOrJun1dPoint x ]
				ifFalse: [ aNumberOrJun1dPoint ])
]

{ #category : #arithmetic }
Jun1dPoint >> - aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x - aPoint x ].
	^ self retry: #- coercing: aPoint
]

{ #category : #arithmetic }
Jun1dPoint >> / aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: x / aPoint x ].
	^ self retry: #/ coercing: aPoint
]

{ #category : #comparing }
Jun1dPoint >> < aPoint [
	self class = aPoint class
		ifTrue: [ ^ x < aPoint x ].
	^ self retry: #< coercing: aPoint
]

{ #category : #comparing }
Jun1dPoint >> <= aPoint [
	self class = aPoint class
		ifTrue: [ ^ x <= aPoint x ].
	^ self retry: #<= coercing: aPoint
]

{ #category : #comparing }
Jun1dPoint >> = aPoint [
	self class = aPoint class
		ifTrue: [ ^ x = aPoint x ].
	^ self retry: #= coercing: aPoint
]

{ #category : #comparing }
Jun1dPoint >> > aPoint [
	self class = aPoint class
		ifTrue: [ ^ x > aPoint x ].
	^ self retry: #> coercing: aPoint
]

{ #category : #comparing }
Jun1dPoint >> >= aPoint [
	self class = aPoint class
		ifTrue: [ ^ x >= aPoint x ].
	^ self retry: #>= coercing: aPoint
]

{ #category : #arithmetic }
Jun1dPoint >> abs [
	^ self class x: x abs
]

{ #category : #converting }
Jun1dPoint >> as2dPoint [
	^ self , 0.0
]

{ #category : #converting }
Jun1dPoint >> as3dPoint [
	^ self , 0.0, 0.0
]

{ #category : #converting }
Jun1dPoint >> asArray [
	| array |
	array := Array new: 1.
	array at: 1 put: x.
	^ array
]

{ #category : #'truncation and round off' }
Jun1dPoint >> ceiling [
	^ self class x: x ceiling
]

{ #category : #functions }
Jun1dPoint >> dotProduct: aPoint [
	^ (self * aPoint) x
]

{ #category : #comparing }
Jun1dPoint >> equal: aPoint [
	self class == aPoint class
		ifFalse: [ ^ false ].
	^ (self x - aPoint x) abs < self accuracy
]

{ #category : #'truncation and round off' }
Jun1dPoint >> floor [
	^ self class x: x floor
]

{ #category : #coercing }
Jun1dPoint >> generality [
	^ 180
]

{ #category : #comparing }
Jun1dPoint >> hash [
	^ x hash
]

{ #category : #testing }
Jun1dPoint >> is1d [
	^ true
]

{ #category : #testing }
Jun1dPoint >> isZero [
	^ x isZero
]

{ #category : #accessing }
Jun1dPoint >> max: aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: (x max: aPoint x) ].
	^ self retry: #max: coercing: aPoint
]

{ #category : #accessing }
Jun1dPoint >> min: aPoint [
	self class = aPoint class
		ifTrue: [ ^ self class x: (x min: aPoint x) ].
	^ self retry: #min: coercing: aPoint
]

{ #category : #accessing }
Jun1dPoint >> min: minValue max: maxValue [
	| minPoint maxPoint |
	minPoint := self class coerce: minValue.
	maxPoint := self class coerce: maxValue.
	^ self class x: (maxPoint x max: (self x min: minPoint x))
]

{ #category : #'truncation and round off' }
Jun1dPoint >> rounded [
	^ self class x: x rounded
]

{ #category : #initialization }
Jun1dPoint >> setX: aNumber [
	x := aNumber asFloat
]

{ #category : #printing }
Jun1dPoint >> storeOn: aStream [
	aStream nextPutAll: '('.
	self x storeOn: aStream.
	aStream nextPutAll: ' _)'.

]

{ #category : #transforming }
Jun1dPoint >> transformationToRotate: anAngle [
	^ self shouldNotImplement
]

{ #category : #'truncation and round off' }
Jun1dPoint >> truncated [
	^ self class x: x truncated
]

{ #category : #functions }
Jun1dPoint >> vectorProduct: aJunPoint [
	^ self shouldNotImplement
]

{ #category : #testing }
Jun1dPoint >> whichSideOf: aLine [
	^ self shouldNotImplement
]

{ #category : #accessing }
Jun1dPoint >> x [
	^ x
]
