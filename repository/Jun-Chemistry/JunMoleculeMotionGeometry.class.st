Class {
	#name : #JunMoleculeMotionGeometry,
	#superclass : #Object,
	#instVars : [
		'moleculeGeometries'
	],
	#category : 'Jun-Chemistry-Geometry'
}

{ #category : #'instance creation' }
JunMoleculeMotionGeometry class >> fromXYZ: aStringOrStream [
	"(JunMoleculeMotionGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) autoBonds; show"

	| motionMolecule |
	motionMolecule := self new.
	aStringOrStream readStream
		in: [ :source | 
			[ source atEnd ]
				whileFalse: [ 
					[ motionMolecule add: (self moleculeClass fromXYZ: source) ]
						on: Error
						do: [ :ex | 
							source atEnd
								ifFalse: [ ex pass ] ] ] ].
	^ motionMolecule
]

{ #category : #'class access' }
JunMoleculeMotionGeometry class >> moleculeClass [
	^ JunMoleculeGeometry
]

{ #category : #'adding/removing' }
JunMoleculeMotionGeometry >> add: aJunMoleculeGeometry [
	^ moleculeGeometries add: aJunMoleculeGeometry
]

{ #category : #'adding/removing' }
JunMoleculeMotionGeometry >> add: aJunMoleculeGeometry afterIndex: anInteger [
	^ moleculeGeometries add: aJunMoleculeGeometry afterIndex: anInteger
]

{ #category : #'adding/removing' }
JunMoleculeMotionGeometry >> add: aJunMoleculeGeometry beforeIndex: anInteger [
	^ moleculeGeometries add: aJunMoleculeGeometry beforeIndex: anInteger
]

{ #category : #'adding/removing' }
JunMoleculeMotionGeometry >> addAll: aCollectionOfJunMoleculeGeometry [
	aCollectionOfJunMoleculeGeometry do: [ :molecule | moleculeGeometries add: molecule ].
	^ aCollectionOfJunMoleculeGeometry
]

{ #category : #converting }
JunMoleculeMotionGeometry >> asArrayOfMoleculeGeometries [
	^ moleculeGeometries asArray
]

{ #category : #converting }
JunMoleculeMotionGeometry >> asXYZString [
	^ String new: 0 streamContents: [ :stream | self printXYZOn: stream ]
]

{ #category : #accessing }
JunMoleculeMotionGeometry >> at: anInteger [
	^ moleculeGeometries at: anInteger
]

{ #category : #enumerating }
JunMoleculeMotionGeometry >> atomsDo: aBlock [
	self do: [ :molecule | molecule do: aBlock ]
]

{ #category : #computing }
JunMoleculeMotionGeometry >> autoBonds [
	self do: [ :molecule | molecule autoBonds ]
]

{ #category : #computing }
JunMoleculeMotionGeometry >> autoBondsByCovalentRadii [
	self do: [ :molecule | molecule autoBondsByCovalentRadii ]
]

{ #category : #computing }
JunMoleculeMotionGeometry >> autoBondsByCovalentRadiiWithTolerance: aNumber [
	self do: [ :molecule | molecule autoBondsByCovalentRadiiWithTolerance: aNumber ]
]

{ #category : #accessing }
JunMoleculeMotionGeometry >> boundingBox [
	^ moleculeGeometries
		ifEmpty: [ Jun3dBoundingBox zero ]
		ifNotEmpty: [ 
			| box |
			box := moleculeGeometries first boundingBox.
			2 to: moleculeGeometries size do: [ :i | box := box merge: (moleculeGeometries at: i) boundingBox ].
			box ]
]

{ #category : #enumerating }
JunMoleculeMotionGeometry >> do: aBlock [
	moleculeGeometries do: aBlock
]

{ #category : #'initialize-release' }
JunMoleculeMotionGeometry >> initialize [
	super initialize.
	moleculeGeometries := OrderedCollection new
]

{ #category : #copying }
JunMoleculeMotionGeometry >> postCopy [
	super postCopy.
	moleculeGeometries := moleculeGeometries copy
]

{ #category : #printing }
JunMoleculeMotionGeometry >> printXYZOn: aStream [
	self do: [ :molecule | molecule printXYZOn: aStream ]
]

{ #category : #copying }
JunMoleculeMotionGeometry >> reversed [
	^ self class new addAll: moleculeGeometries reverse
]

{ #category : #utilities }
JunMoleculeMotionGeometry >> show [
	"(JunMoleculeMotionGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) autoBonds; show"

	| viewer window |
	viewer := JunSimple3dMorph new.
	viewer object: (self at: 1).
	viewer fitEyepoint.
	window := viewer openInWindowLabeled: 'molecule animation'.
	viewer color: Color black.
	[ | index |
	index := 0.
	self
		do: [ :molecule | 
			viewer object: molecule.
			viewer changed.
			window setLabel: 'molecule animation ', (index := index + 1) printString, '/', (self size printString).
			(Delay forMilliseconds: 100) wait ] ] forkAt: Processor userBackgroundPriority
]

{ #category : #accessing }
JunMoleculeMotionGeometry >> size [
	^ moleculeGeometries size
]

{ #category : #transforming }
JunMoleculeMotionGeometry >> transform: aJunTransformation [
	| motion |
	motion := self new.
	self do: [ :molecule | motion add: (molecule transform: aJunTransformation) ].
	^ motion
]

{ #category : #accessing }
JunMoleculeMotionGeometry >> vanDerWaalsBoundingBox [
	^ moleculeGeometries
		ifEmpty: [ Jun3dBoundingBox zero ]
		ifNotEmpty: [ 
			| box |
			box := moleculeGeometries first boundingBox.
			2 to: moleculeGeometries size do: [ :i | box merge: (moleculeGeometries at: i) boundingBox ].
			box ]
]
