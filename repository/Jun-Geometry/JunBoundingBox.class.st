"
A JunBoundingBox is a cuboid region that encloses a certain geometric or display object.

"
Class {
	#name : #JunBoundingBox,
	#superclass : #JunBoundingObject,
	#instVars : [
		'origin',
		'corner'
	],
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #'instance creation' }
JunBoundingBox class >> fromObject: anObject [
	"Jun3dBoundingBox fromObject: (JunOpenGL3dObject benzene)."

	"(JunOpenGL3dCompoundObject
		with: ((Jun2dBoundingBox fromObject: (JunOpenGL3dObject benzene asPointArray collect: [:p | p x , p y]))
				asJunOpenGL3dObjectColor: ColorValue cyan alpha: 0.5)
		with: JunOpenGL3dObject benzene) show."

	"(JunOpenGL3dCompoundObject
		with: ((Jun3dBoundingBox fromObject: JunOpenGL3dObject benzene)
					asJunOpenGL3dObjectColor: ColorValue cyan alpha: 0.5)
		with: JunOpenGL3dObject benzene) show."

	| aCollection |
	aCollection := (anObject isKindOf: Collection)
		ifTrue: [ anObject asArray ]
		ifFalse: [ anObject asPointArray ].
	^ self fromPoints: aCollection
]

{ #category : #'instance creation' }
JunBoundingBox class >> fromPoints: aCollectionOfJunPoint [
	| boundingBox |
	aCollectionOfJunPoint isEmpty
		ifTrue: [ ^ self new ].
	boundingBox := self origin: aCollectionOfJunPoint first corner: aCollectionOfJunPoint first.
	2 to: aCollectionOfJunPoint size do: [ :index | boundingBox := boundingBox add: (aCollectionOfJunPoint at: index) ].
	^ boundingBox
]

{ #category : #'instance creation' }
JunBoundingBox class >> origin: aJunPoint1 corner: aJunPoint2 [
	^ self new
		origin: aJunPoint1 corner: aJunPoint2;
		yourself
]

{ #category : #'instance creation' }
JunBoundingBox class >> origin: aJunPoint1 extent: aJunPoint2 [
	^ self origin: aJunPoint1 corner: aJunPoint1 + aJunPoint2
]

{ #category : #'constants access' }
JunBoundingBox class >> unity [
	| box pointClass |
	box := self new.
	pointClass := box pointClass.
	pointClass origin: pointClass zero corner: pointClass unity
]

{ #category : #'constants access' }
JunBoundingBox class >> zero [
	| box pointClass |
	box := self new.
	pointClass := box pointClass.
	box origin: pointClass zero corner: pointClass zero.
	^ box
]

{ #category : #comparing }
JunBoundingBox >> = aBoundingBox [
	^ self class == aBoundingBox class
		and: [ self origin = aBoundingBox origin and: [ self corner = aBoundingBox corner ] ]
]

{ #category : #adding }
JunBoundingBox >> add: aJunPoint [
	(self containsPoint: aJunPoint)
		ifFalse: [ 
			origin := origin min: aJunPoint.
			corner := corner max: aJunPoint ].
	^ aJunPoint
]

{ #category : #converting }
JunBoundingBox >> asBoundingBox [
	^ self
]

{ #category : #converting }
JunBoundingBox >> asRectangle [
	^ self origin x @ self origin y corner: self corner x @ self corner y
]

{ #category : #accessing }
JunBoundingBox >> boundingBall [
	| centerPoint |
	centerPoint := self center.
	^ self boundingBallClass center: centerPoint radius: (self origin distance: centerPoint)
]

{ #category : #accessing }
JunBoundingBox >> boundingBox [
	^ self
]

{ #category : #accessing }
JunBoundingBox >> center [
	^ self origin center: self corner
]

{ #category : #testing }
JunBoundingBox >> contains: aBoundingBox [
	^ aBoundingBox origin >= self origin and: [ aBoundingBox corner <= self corner ]
]

{ #category : #testing }
JunBoundingBox >> containsPoint: aPoint [
	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self origin <= thePoint and: [ thePoint < self corner ]
]

{ #category : #accessing }
JunBoundingBox >> corner [
	^ corner
]

{ #category : #accessing }
JunBoundingBox >> corner: aJunPoint [
	corner := self pointClass coerce: aJunPoint
]

{ #category : #comparing }
JunBoundingBox >> equal: aBoundingBox [
	^ self class = aBoundingBox class
		and: [ (self origin equal: aBoundingBox origin) and: [ self corner equal: aBoundingBox corner ] ]
]

{ #category : #functions }
JunBoundingBox >> expandedBy: delta [
	(delta isKindOf: self class)
		ifTrue: [ ^ self class origin: self origin - delta origin corner: self corner + delta corner ].
	^ self class origin: self origin - delta corner: self corner + delta
]

{ #category : #accessing }
JunBoundingBox >> extent [
	^ self corner - self origin
]

{ #category : #comparing }
JunBoundingBox >> hash [
	^ origin hash bitXor: corner hash
]

{ #category : #accessing }
JunBoundingBox >> height [
	^ self corner y - self origin y
]

{ #category : #functions }
JunBoundingBox >> insetBy: delta [
	(delta isKindOf: self class)
		ifTrue: [ ^ self class origin: self origin + delta origin corner: self corner - delta corner ].
	^ self class origin: self origin + delta corner: self corner - delta
]

{ #category : #functions }
JunBoundingBox >> intersect: boundingBox [
	^ self class origin: (self origin max: boundingBox origin) corner: (self corner min: boundingBox corner)
]

{ #category : #testing }
JunBoundingBox >> intersects: aBoundingBox [
	^ self origin < aBoundingBox corner
		and: [ aBoundingBox origin < self corner and: [ self origin < self corner and: [ aBoundingBox origin < aBoundingBox corner ] ] ]
]

{ #category : #functions }
JunBoundingBox >> merge: boundingBox [
	^ self class origin: (self origin min: boundingBox origin) corner: (self corner max: boundingBox corner)
]

{ #category : #accessing }
JunBoundingBox >> origin [
	^ origin
]

{ #category : #accessing }
JunBoundingBox >> origin: aJunPoint [
	origin := self pointClass coerce: aJunPoint
]

{ #category : #accessing }
JunBoundingBox >> origin: aJunPoint1 corner: aJunPoint2 [
	self origin: aJunPoint1.
	self corner: aJunPoint2
]

{ #category : #copying }
JunBoundingBox >> postCopy [
	super postCopy.
	origin := origin copy.
	corner := corner copy
]

{ #category : #'truncation and round off' }
JunBoundingBox >> rounded [
	^ self class origin: self origin rounded corner: self corner rounded
]

{ #category : #functions }
JunBoundingBox >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self origin printString.
	aStream nextPutAll: ' box: '.
	aStream nextPutAll: self corner printString.
	aStream nextPutAll: ')'
]

{ #category : #testing }
JunBoundingBox >> touches: aBoundingBox [
	^ self origin <= aBoundingBox corner
		and: [ 
			aBoundingBox origin <= self corner
				and: [ self origin <= self corner and: [ aBoundingBox origin <= aBoundingBox corner ] ] ]
]

{ #category : #testing }
JunBoundingBox >> touchesPoint: aPoint [
	| thePoint |
	thePoint := self pointClass coerce: aPoint.
	^ self origin <= thePoint and: [ thePoint <= self corner ]
]

{ #category : #transforming }
JunBoundingBox >> transform: aTransformation [
	^ self class origin: (self origin transform: aTransformation) corner: (self corner transform: aTransformation)
]

{ #category : #'truncation and round off' }
JunBoundingBox >> truncated [
	^ self class origin: self origin truncated corner: self corner truncated
]

{ #category : #testing }
JunBoundingBox >> whichSideOf: aPlane [
	| anArray hasPlus hasMinus hasZero |
	anArray := self asPointArray collect: [ :aPoint | aPoint whichSideOf: aPlane ].
	hasPlus := anArray includes: 1.
	hasMinus := anArray includes: -1.
	(hasPlus and: [ hasMinus ])
		ifTrue: [ ^ 0 ].
	hasZero := anArray includes: 0.
	hasZero
		ifTrue: [ ^ 0 ].
	(hasMinus and: [ hasPlus not ])
		ifTrue: [ ^ -1 ].
	^ 1
]

{ #category : #accessing }
JunBoundingBox >> width [
	^ corner x - origin x
]
