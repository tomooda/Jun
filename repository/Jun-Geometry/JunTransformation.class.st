"
JunTransformation is an abstract class for objects that transforms geomeric objects and display objects.

"
Class {
	#name : #JunTransformation,
	#superclass : #JunGeometry,
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #'instance creation' }
JunTransformation class >> fromArray: anArray [
	"Jun2dTransformation fromArray: #(1 0 0 0 1 0 0 0 1)."
	"Jun3dTransformation fromArray: #(1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1)."

	| aTransformation |
	aTransformation := self basicNew.
	aTransformation setFromArray: anArray.
	^ aTransformation
]

{ #category : #'instance creation' }
JunTransformation class >> new: anInteger [
	^ self shouldNotImplement
]

{ #category : #utility }
JunTransformation class >> solveLinearEquations: anArrayOfArrayOfFloat [
	1 to: anArrayOfArrayOfFloat size do: [ :index | 
		| maxRowIndex maxRowValue row |
		maxRowIndex := index.
		maxRowValue := ((anArrayOfArrayOfFloat at: index) at: index) abs.
		index + 1 to: anArrayOfArrayOfFloat size do: [ :i | 
			| v |
			v := ((anArrayOfArrayOfFloat at: i) at: index) abs.
			maxRowValue < v
				ifTrue: [ 
					maxRowValue := v.
					maxRowIndex := i ] ].
		index < maxRowIndex
			ifTrue: [ 
				| t |
				t := anArrayOfArrayOfFloat at: index.
				anArrayOfArrayOfFloat at: index put: (anArrayOfArrayOfFloat at: maxRowIndex).
				anArrayOfArrayOfFloat at: maxRowIndex put: t ].
		row := anArrayOfArrayOfFloat at: index.
		maxRowValue := row at: index.
		index to: row size do: [ :i | row at: i put: (row at: i) / maxRowValue ].
		index + 1 to: anArrayOfArrayOfFloat size do: [ :i | 
			| r v |
			r := anArrayOfArrayOfFloat at: i.
			v := r at: index.
			index to: r size do: [ :c | r at: c put: (r at: c) - (v * (row at: c)) ] ] ].
	anArrayOfArrayOfFloat size to: 2 by: -1 do: [ :index | 
		| row |
		row := anArrayOfArrayOfFloat at: index.
		index - 1 to: 1 by:  -1 do: [ :i | 
			| r v |
			r := anArrayOfArrayOfFloat at: i.
			v := r at: index.
			index to: row size do: [ :c | r at: c put: (r at: c) - (v * (row at: c)) ] ] ]
]

{ #category : #'constant access' }
JunTransformation class >> unity [
	^ self subclassResponsibility
]

{ #category : #'constant access' }
JunTransformation class >> zero [
	^ self subclassResponsibility
]

{ #category : #'applying transformation' }
JunTransformation >> applyTo: anObject [
	^ anObject transform: self
]

{ #category : #'applying transformation' }
JunTransformation >> applyToPoint: aPoint [
	^ self subclassResponsibility
]

{ #category : #converting }
JunTransformation >> asArray [
	^ self subclassResponsibility
]

{ #category : #converting }
JunTransformation >> asMatrix [
	^ self subclassResponsibility
]

{ #category : #converting }
JunTransformation >> asRotationMatrix [
	^ self subclassResponsibility
]

{ #category : #converting }
JunTransformation >> asTranslation [
	^ self subclassResponsibility
]

{ #category : #comparing }
JunTransformation >> hash [
	^self asArray hash
]

{ #category : #transforming }
JunTransformation >> inverse [
	^ self class fromArray: self asMatrix inverse asFloat asArray
]

{ #category : #transforming }
JunTransformation >> product: aTransformation [
	^ self subclassResponsibility
]

{ #category : #printing }
JunTransformation >> storeOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' fromArray: '.
	self asArray storeOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #transforming }
JunTransformation >> transform: aJunTransformation [
	^ self product: aJunTransformation
]
