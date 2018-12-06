"
A JunAngle represents an angle. JunAngle handles the both degrees and radians. It caches sin, cos and tan to improve performance. 

Instance Variables
	cos:		<Float>
	deg:		<Float>
	rad:		<Float>
	sin:			<Float>
	tan:			<Float>

cos
	- cos value of the angle

deg
	- the angle in degrees

rad
	- the angle in radians

sin
	- sin value of the angle

tan
	- tan value of the angle

"
Class {
	#name : #JunAngle,
	#superclass : #JunGeometry,
	#instVars : [
		'rad',
		'deg',
		'sin',
		'cos',
		'tan'
	],
	#category : 'Jun-Geometry-Basic'
}

{ #category : #coercing }
JunAngle class >> coerce: anObject [
	(anObject isKindOf: self)
		ifTrue: [ ^ anObject ].
	^ self fromRad: anObject
]

{ #category : #'instance creation' }
JunAngle class >> degrees: degrees [
	^ self fromDeg: degrees
]

{ #category : #'constants access' }
JunAngle class >> doublePi [
	"JunAngle doublePi."

	^ self fromRad: super doublePi
]

{ #category : #'instance creation' }
JunAngle class >> fromDeg: degrees [
	^ self basicNew deg: degrees
]

{ #category : #'instance creation' }
JunAngle class >> fromRad: radians [
	^ self basicNew rad: radians
]

{ #category : #coercing }
JunAngle class >> generality [
	^self zero generality
]

{ #category : #'constants access' }
JunAngle class >> halfPi [
	"JunAngle halfPi."

	^self fromRad: super halfPi
]

{ #category : #'constants access' }
JunAngle class >> pi [
	"JunAngle pi."

	^self fromRad: super pi
]

{ #category : #'constants access' }
JunAngle class >> quarterPi [
	"JunAngle quarterPi."

	^self fromRad: super quarterPi
]

{ #category : #'instance creation' }
JunAngle class >> radians: radians [
	^ self fromRad: radians
]

{ #category : #'constants access' }
JunAngle class >> unity [
	^self shouldNotImplement
]

{ #category : #'constants access' }
JunAngle class >> zero [
	^self fromRad: 0
]

{ #category : #arithmetic }
JunAngle >> * anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad * anAngle rad ].
	^ self retry: #* coercing: anAngle
]

{ #category : #arithmetic }
JunAngle >> + anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad + anAngle rad ].
	^ self retry: #+ coercing: anAngle
]

{ #category : #arithmetic }
JunAngle >> - anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad - anAngle rad ].
	^ self retry: #- coercing: anAngle
]

{ #category : #arithmetic }
JunAngle >> / anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad / anAngle rad ].
	^ self retry: #/ coercing: anAngle
]

{ #category : #arithmetic }
JunAngle >> // anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad // anAngle rad ].
	^ self retry: #// coercing: anAngle
]

{ #category : #comparing }
JunAngle >> < anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ rad < anAngle rad ].
	^ self retry: #< coercing: anAngle
]

{ #category : #comparing }
JunAngle >> <= anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ rad <= anAngle rad ].
	^ self retry: #<= coercing: anAngle
]

{ #category : #comparing }
JunAngle >> = anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ rad = anAngle rad ].
	^ self retry: #= coercing: anAngle
]

{ #category : #comparing }
JunAngle >> > anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ rad > anAngle rad ].
	^ self retry: #> coercing: anAngle
]

{ #category : #comparing }
JunAngle >> >= anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ rad >= anAngle rad ].
	^ self retry: #>= coercing: anAngle
]

{ #category : #arithmetic }
JunAngle >> \\ anAngle [
	(anAngle isKindOf: self class)
		ifTrue: [ ^ self class fromRad: rad \\ anAngle rad ].
	^ self retry: #\\ coercing: anAngle
]

{ #category : #arithmetic }
JunAngle >> abs [
	^ self class fromRad: rad abs
]

{ #category : #'double dispatching' }
JunAngle >> adaptToNumber: aNumber andSend: selector [
	^ (self class fromRad: aNumber) perform: selector with: self
]

{ #category : #converting }
JunAngle >> asAngle [
	^ self
]

{ #category : #converting }
JunAngle >> asDegrees [
	^ self
]

{ #category : #converting }
JunAngle >> asJunOpenGL3dObject [
	"(JunAngle fromDeg: 30) asJunOpenGL3dObject showWithAxes."

	^ self notYetImplemented "
	| compoundObject aBall |
	compoundObject := JunOpenGL3dCompoundObject new.
	aBall := JunOpenGL3dObject 
				pieFrom: 0
				to: self radiansToDegrees
				by: 5
				radius: 1.
	compoundObject add: aBall reversed.
	compoundObject add: aBall.
	compoundObject 
		objectsDo: [:each | each paint: self defaultColor alpha: self defaultAlpha].
	^compoundObject"
]

{ #category : #converting }
JunAngle >> asRadians [
	^ self
]

{ #category : #arithmetic }
JunAngle >> coerce: anObject [
	^ self class coerce: anObject
]

{ #category : #accessing }
JunAngle >> cos [
	cos isNil
		ifTrue: [ cos := rad cos ].
	^ cos
]

{ #category : #accessing }
JunAngle >> deg [
	deg isNil
		ifTrue: [ deg := rad radiansToDegrees ].
	^ deg
]

{ #category : #accessing }
JunAngle >> deg: degrees [
	self setDeg: degrees
]

{ #category : #accessing }
JunAngle >> degrees [
	^ self deg
]

{ #category : #accessing }
JunAngle >> degrees: degrees [
	self deg: degrees
]

{ #category : #converting }
JunAngle >> degreesToRadians [
	^ self rad
]

{ #category : #arithmetic }
JunAngle >> div: aNumber [
	^ self class fromRad: rad / aNumber
]

{ #category : #comparing }
JunAngle >> equal: anAngle [
	self class == anAngle class
		ifFalse: [ ^ false ].
	^ (self rad - anAngle rad) abs < self accuracy
]

{ #category : #arithmetic }
JunAngle >> generality [
	^ 120
]

{ #category : #comparing }
JunAngle >> hash [
	^ rad hash
]

{ #category : #'initialize-release' }
JunAngle >> initialize [
	super initialize.
	rad := deg := sin := cos := tan := nil
]

{ #category : #testing }
JunAngle >> isAngle [
	^ true
]

{ #category : #testing }
JunAngle >> isZero [
	^ rad isZero
]

{ #category : #comparing }
JunAngle >> max: anAngle [
	^ self class fromRad: (rad max: anAngle rad)
]

{ #category : #comparing }
JunAngle >> min: anAngle [
	^ self class fromRad: (rad min: anAngle rad)
]

{ #category : #arithmetic }
JunAngle >> mul: aNumber [
	^ self class fromRad: rad * aNumber
]

{ #category : #arithmetic }
JunAngle >> negated [
	^ self class fromRad: self rad negated
]

{ #category : #printing }
JunAngle >> printOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' degrees: '.
	self deg storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
JunAngle >> rad [
	^ rad
]

{ #category : #accessing }
JunAngle >> rad: radians [
	self setRad: radians
]

{ #category : #accessing }
JunAngle >> radians [
	^ self rad
]

{ #category : #accessing }
JunAngle >> radians: radians [
	self rad: radians
]

{ #category : #converting }
JunAngle >> radiansToDegrees [
	^ self deg
]

{ #category : #arithmetic }
JunAngle >> reciprocal [
	^ self class fromRad: self rad reciprocal
]

{ #category : #arithmetic }
JunAngle >> retry: aSymbol coercing: aNumber [
	aSymbol = #=
		ifTrue: [ 
			[ 
			self generality = aNumber generality
				ifTrue: [ ^ false ] ]
				on: MessageNotUnderstood
				do: [ :ex | ^ false ] ].
	((aNumber respondsTo: #generality) not or: [ self generality > aNumber generality ])
		ifTrue: [ ^ self perform: aSymbol with: (self coerce: aNumber) ].
	self generality < aNumber generality
		ifTrue: [ ^ (aNumber coerce: self) perform: aSymbol with: aNumber ].
	^ self error: 'coercion attempt failed'
]

{ #category : #private }
JunAngle >> setDeg: degrees [
	| aValue |
	aValue := degrees asFloat.
	self setRad: aValue degreesToRadians.
	deg := aValue
]

{ #category : #private }
JunAngle >> setRad: radians [ 
	rad := radians asFloat.
	deg := nil.
	sin := nil.
	cos := nil.
	tan := nil
]

{ #category : #accessing }
JunAngle >> sin [
	sin isNil
		ifTrue: [ sin := rad sin ].
	^ sin
]

{ #category : #printing }
JunAngle >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' radians: '.
	self rad storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
JunAngle >> tan [
	tan isNil
		ifTrue: [ tan := rad tan ].
	^ tan
]

{ #category : #transforming }
JunAngle >> transformationToRotate [
	^ Jun2dTransformation rotate: self
]

{ #category : #transforming }
JunAngle >> transformationToRotate: aLineOrPoint [
	^ aLineOrPoint transformationToRotate: self
]

{ #category : #transforming }
JunAngle >> transformationToRotateX [
	^ Jun3dTransformation rotateX: self
]

{ #category : #transforming }
JunAngle >> transformationToRotateY [
	^Jun3dTransformation rotateY: self
]

{ #category : #transforming }
JunAngle >> transformationToRotateZ [
	^ Jun3dTransformation rotateZ: self
]

{ #category : #converting }
JunAngle >> uniformed [
	| radians pi2 |
	pi2 := Float pi * 2.0.
	radians := rad \\ pi2.
	radians negative
		ifTrue: [ radians := pi2 + radians ].
	^ self class fromRad: radians
]
