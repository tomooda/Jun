Class {
	#name : #JunMoleculeGeometry,
	#superclass : #Object,
	#instVars : [
		'atoms',
		'bonds',
		'label'
	],
	#category : #'Jun-Chemistry-Geometry'
}

{ #category : #examples }
JunMoleculeGeometry class >> example1 [
	"JunMoleculeGeometry example1"

	| molecule |
	molecule := JunMoleculeGeometry exampleMethane.
	molecule show
]

{ #category : #examples }
JunMoleculeGeometry class >> example2 [
	"JunMoleculeGeometry example2"

	| molecule form morph angle process |
	molecule := JunMoleculeGeometry exampleMethane.
	form := Form extent: 500 @ 500 depth: 32.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	process := [ [ | projection |
	projection := JunParallelProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle) ,, angle cos) unitVector * 15
		sightPoint: 0 ,, 0 ,, 0
		upVector: 0 ,, 0 ,, 1
		height: 2.0
		near: 0.1
		far: 100.0.
	angle := (angle + 10 asDegrees) uniformed.
	form getCanvas
		in: [ :canvas | 
			canvas fillColor: Color white.
			(molecule transform: projection asTransformation)
				drawOn: canvas
				at: form extent / 2.0
				scale: form extent / 4.0
				radius: 40
				borderWidth: 1
				borderColor: Color black.
			canvas flush ].
	morph changed.
	(Delay forMilliseconds: 100) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]
]

{ #category : #examples }
JunMoleculeGeometry class >> example3 [
	"JunMoleculeGeometry example3"

	| molecule form rc morph angle process |
	molecule := JunMoleculeGeometry exampleMethane.
	rc := (form := Form extent: 500 @ 500 depth: 32) renderingContext.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	rc enableCullface.
	rc backgroundColor: Color black.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: ((Jun2dPoint rho: 1 theta: angle) ,, angle cos) unitVector * 10
		sightPoint: 0 ,, 0 ,, 0
		upVector: 0 ,, 0 ,, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle := (angle + 10 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	molecule renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 100) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]
]

{ #category : #examples }
JunMoleculeGeometry class >> example4 [
	"JunMoleculeGeometry example4"

	| molecule |
	molecule := JunMoleculeGeometry exampleT3.
	molecule show
]

{ #category : #examples }
JunMoleculeGeometry class >> example5 [
	"JunMoleculeGeometry example5"

	| molecule form rc morph angle process |
	molecule := JunMoleculeGeometry exampleT3.
	rc := (form := Form extent: 500 @ 500 depth: 32) renderingContext.
	morph := form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	rc enableCullface.
	rc backgroundColor: Color black.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: (angle sin ,, angle cos ,, 0) unitVector * 50
		sightPoint: 0 ,, 0 ,, 0
		upVector: 0 ,, 0 ,, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle := (angle + 3 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	molecule renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 10) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]
]

{ #category : #examples }
JunMoleculeGeometry class >> exampleMethane [
	<script: 'JunMoleculeGeometry exampleMethane inspect'>
	<gtExample>
	^ (self
		fromXYZ:
		'5
methane molecule (in ångströms) from https://en.wikipedia.org/wiki/XYZ_file_format
C        0.000000        0.000000        0.000000
H        0.000000        0.000000        1.089000
H        1.026719        0.000000       -0.363000
H       -0.513360       -0.889165       -0.363000
H       -0.513360        0.889165       -0.363000')
		autoBonds;
		yourself
]

{ #category : #examples }
JunMoleculeGeometry class >> exampleT3 [
	<script: 'JunMoleculeGeometry exampleT3'>
	<gtExample>
	^ (JunMoleculeGeometry
		fromXYZ:
		'35
T3
C     0.000000    0.000000    0.000000 
C     0.000000    0.000000    1.411669 
C     1.151653    0.000000    2.161477 
C     2.381560    0.003243    1.522539 
C     2.456312    0.007661    0.067447 
C     1.275977    0.001758   -0.630438 
O    -1.243602   -0.003541    2.153679 
C    -2.417048   -0.464467    1.637044 
C    -2.673968   -1.867396    1.700202 
C    -3.858320   -2.373659    1.159835 
C    -4.824411   -1.513596    0.543844 
C    -4.509808   -0.102037    0.522760 
C    -3.324956    0.403390    1.063323 
C    -6.078555   -2.102757   -0.166350 
C    -7.469876   -1.667224    0.344454 
N    -7.475107   -1.347645    1.748534 
I    -1.270637   -3.231194    2.505654 
I     4.081291   -0.187209    2.579399 
O     3.688810    0.066265   -0.514683 
I    -2.956577    2.403804    1.008228 
C    -8.617679   -2.544663   -0.085770 
O    -8.579008   -3.066469   -1.221878 
O    -9.535541   -2.696378    0.732251 
H     1.287278   -0.001844   -1.719373 
H    -0.943101   -0.001299   -0.544500 
H     1.103242   -0.002522    3.249398 
H    -4.062686   -3.442493    1.201672 
H    -5.231864    0.573576    0.066577 
H    -6.062785   -1.817707   -1.239009 
H    -6.069931   -3.208742   -0.072419 
H    -8.414727   -1.067897    2.030059 
H    -7.189268   -2.166885    2.284763 
H    -6.825033   -0.581784    1.925338 
H     3.949247    0.974453   -0.614013 
H    -7.610532   -0.663846   -0.054756')
		autoBonds;
		yourself
]

{ #category : #examples }
JunMoleculeGeometry class >> exampleT3anim [
	"JunMoleculeGeometry exampleT3anim"

	| molecule rc morph angle process |
	molecule := JunMoleculeGeometry
		fromXYZ:
			'35
T3
C     0.000000    0.000000    0.000000 
C     0.000000    0.000000    1.411669 
C     1.151653    0.000000    2.161477 
C     2.381560    0.003243    1.522539 
C     2.456312    0.007661    0.067447 
C     1.275977    0.001758   -0.630438 
O    -1.243602   -0.003541    2.153679 
C    -2.417048   -0.464467    1.637044 
C    -2.673968   -1.867396    1.700202 
C    -3.858320   -2.373659    1.159835 
C    -4.824411   -1.513596    0.543844 
C    -4.509808   -0.102037    0.522760 
C    -3.324956    0.403390    1.063323 
C    -6.078555   -2.102757   -0.166350 
C    -7.469876   -1.667224    0.344454 
N    -7.475107   -1.347645    1.748534 
I    -1.270637   -3.231194    2.505654 
I     4.081291   -0.187209    2.579399 
O     3.688810    0.066265   -0.514683 
I    -2.956577    2.403804    1.008228 
C    -8.617679   -2.544663   -0.085770 
O    -8.579008   -3.066469   -1.221878 
O    -9.535541   -2.696378    0.732251 
H     1.287278   -0.001844   -1.719373 
H    -0.943101   -0.001299   -0.544500 
H     1.103242   -0.002522    3.249398 
H    -4.062686   -3.442493    1.201672 
H    -5.231864    0.573576    0.066577 
H    -6.062785   -1.817707   -1.239009 
H    -6.069931   -3.208742   -0.072419 
H    -8.414727   -1.067897    2.030059 
H    -7.189268   -2.166885    2.284763 
H    -6.825033   -0.581784    1.925338 
H     3.949247    0.974453   -0.614013 
H    -7.610532   -0.663846   -0.054756'.
	molecule autoBonds.
	rc := (Form extent: 500 @ 500 depth: 32) renderingContext.
	morph := rc form asMorph.
	morph borderColor: Color gray.
	morph borderWidth: 3.
	morph center: World center.
	morph openInWorld.
	angle := 0 asDegrees.
	rc enableCullface.
	rc backgroundColor: Color black.
	process := [ [ | projection |
	projection := JunPerspectiveProjection
		eyePoint: (angle sin ,, angle cos ,, 0) unitVector * 50
		sightPoint: 0 ,, 0 ,, 0
		upVector: 0 ,, 0 ,, 1
		fovy: 30 asDegrees
		near: 0.1
		far: 100.0.
	angle := (angle + 3 asDegrees) uniformed.
	rc projection: projection.
	rc clear.
	rc ambientLight: Color gray.
	rc lightIndex: 0 parallel: projection eyePoint negated color: Color gray.
	molecule renderOn: rc.
	rc flush.
	morph changed.
	(Delay forMilliseconds: 10) wait ] repeat ] forkAt: Processor userBackgroundPriority.
	morph
		on: #click
		send: #value
		to: [ process terminate.
			morph delete ]
]

{ #category : #'instance creation' }
JunMoleculeGeometry class >> fromXYZ: aStringOrStream [
	"(JunMoleculeGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) inspect"

	| molecule |
	molecule := self new.
	aStringOrStream readStream
		in: [ :source | 
			| size |
			size := source nextLine trim asNumber.
			molecule label: source nextLine.
			size timesRepeat: [ molecule add: (JunAtom fromXYZLine: source nextLine) ] ].
	^ molecule
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> add: aJunAtom [
	^ self addAtom: aJunAtom
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> addAtom: aJunAtom [
	^ atoms add: aJunAtom
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> addBond: aJunBond [
	(self includesAtom: aJunBond atom1)
		ifFalse: [ ^ nil ].
	(self includesAtom: aJunBond atom2)
		ifFalse: [ ^ nil ].
	^ bonds
		add:
			aJunBond
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> addBondBetween: aJunAtom1 and: aJunAtom2 [
	| atom1 atom2 |
	atom1 := aJunAtom1 isInteger
		ifTrue: [ self at: aJunAtom1 ]
		ifFalse: [ aJunAtom1 ].
	atom2 := aJunAtom2 isInteger
		ifTrue: [ self at: aJunAtom2 ]
		ifFalse: [ aJunAtom2 ].
	(self includesAtom: atom1)
		ifFalse: [ ^ nil ].
	(self includesAtom: atom2)
		ifFalse: [ ^ nil ].
	^ bonds add: (JunBond between: atom1 and: atom2)
]

{ #category : #converting }
JunMoleculeGeometry >> asMorph [
	^ (JunSimple3dMorph on: self)
		fit;
		color: Color white;
		yourself
]

{ #category : #converting }
JunMoleculeGeometry >> asXYZString [
	^ String new: 0 streamContents: [ :stream | self printXYZOn: stream ]
]

{ #category : #accessing }
JunMoleculeGeometry >> at: anInteger [
	^ atoms at: anInteger
]

{ #category : #accessing }
JunMoleculeGeometry >> at: anInteger put: aJunAtom [
	^ atoms at: anInteger put: aJunAtom
]

{ #category : #enumerating }
JunMoleculeGeometry >> atomsDo: aBlock [
	atoms do: aBlock
]

{ #category : #computing }
JunMoleculeGeometry >> autoBonds [
	self autoBondsByCovalentRadii
]

{ #category : #computing }
JunMoleculeGeometry >> autoBondsByCovalentRadii [
	^ self autoBondsByCovalentRadiiWithTolerance: 0.45
]

{ #category : #computing }
JunMoleculeGeometry >> autoBondsByCovalentRadiiWithTolerance: aNumber [
	| b |
	b := OrderedCollection new.
	1 to: self size - 1 do: [ :i1 | 
		| atom1 radius1 |
		atom1 := self at: i1.
		radius1 := atom1 covalentRadius.
		i1 + 1 to: self size do: [ :i2 | 
			| atom2 radius2 |
			atom2 := self at: i2.
			radius2 := atom2 covalentRadius.
			radius1 + radius2 + aNumber > (atom1 position distance: atom2 position)
				ifTrue: [ b add: (JunBond between: atom1 and: atom2) ] ] ].
	bonds := b
]

{ #category : #accessing }
JunMoleculeGeometry >> bondBetween: aJunAtomOrInteger1 and: aJunAtomOrInteger2 ifAbsent: errorBlock [
	(aJunAtomOrInteger1 isInteger
		ifTrue: [ atoms at: aJunAtomOrInteger1 ifAbsent: [ nil ] ]
		ifFalse: [ aJunAtomOrInteger1 ])
		ifNotNil: [ :atom1 | 
			(aJunAtomOrInteger2 isInteger
				ifTrue: [ atoms at: aJunAtomOrInteger2 ifAbsent: [ nil ] ]
				ifFalse: [ aJunAtomOrInteger2 ])
				ifNotNil: [ :atom2 | 
					self
						bondsDo: [ :bond | 
							(bond atom1 == atom1 and: [ bond atom2 == atom2 ])
								ifTrue: [ ^ bond ].
							(bond atom2 == atom1 and: [ bond atom1 == atom2 ])
								ifTrue: [ ^ bond ] ] ] ].
	^ errorBlock value
]

{ #category : #enumerating }
JunMoleculeGeometry >> bondsDo: aBlock [
	bonds do: aBlock
]

{ #category : #accessing }
JunMoleculeGeometry >> boundingBox [
	^ atoms
		ifEmpty: [ Jun3dBoundingBox zero ]
		ifNotEmpty: [ 
			| box |
			box := atoms first boundingBox.
			2 to: atoms size do: [ :i | box := box merge: (atoms at: i) boundingBox ].
			box ]
]

{ #category : #enumerating }
JunMoleculeGeometry >> detectAtom: aBlock ifNone: errorBlock [
	self
		atomsDo: [ :atom | 
			(aBlock value: atom)
				ifTrue: [ ^ atom ] ].
	^ errorBlock value
]

{ #category : #enumerating }
JunMoleculeGeometry >> do: aBlock [
	self atomsDo: aBlock
]

{ #category : #drawing }
JunMoleculeGeometry >> drawOn: aCanvas at: aPoint scale: pixelsPerÅngströms radius: radius borderWidth: borderWidth borderColor: borderColor [
	(atoms asSortedCollection: [ :deeper :shallower | deeper position z <= shallower position z ])
		do: [ :atom | 
			atom
				drawOn: aCanvas
				at: aPoint
				scale: pixelsPerÅngströms
				radius: radius
				borderWidth: borderWidth
				borderColor: borderColor ]
]

{ #category : #drawing }
JunMoleculeGeometry >> drawQuarterVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms [
	(atoms asSortedCollection: [ :deeper :shallower | deeper position z <= shallower position z ])
		do: [ :atom | atom drawQuarterVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms ]
]

{ #category : #drawing }
JunMoleculeGeometry >> drawVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms [
	(atoms asSortedCollection: [ :deeper :shallower | deeper position z <= shallower position z ])
		do: [ :atom | atom drawVanDerWaalsOn: aCanvas at: aPoint scale: pixelsPerÅngströms ]
]

{ #category : #testing }
JunMoleculeGeometry >> includesAtom: aJunAtom [
	^ atoms includes: aJunAtom
]

{ #category : #testing }
JunMoleculeGeometry >> includesBondBetween: aJunAtomOrInteger1 and: aJunAtomOrInteger2 [
	self bondBetween: aJunAtomOrInteger1 and: aJunAtomOrInteger2 ifAbsent: [ ^ false ].
	^ true
]

{ #category : #accessing }
JunMoleculeGeometry >> indexOfAtom: aJunAtom [
	^ atoms indexOf: aJunAtom
]

{ #category : #'initialize-release' }
JunMoleculeGeometry >> initialize [
	super initialize.
	atoms := OrderedCollection new.
	bonds := OrderedCollection new
]

{ #category : #accessing }
JunMoleculeGeometry >> label [
	^ label
]

{ #category : #accessing }
JunMoleculeGeometry >> label: aStringOrNil [
	label := aStringOrNil
]

{ #category : #enumerating }
JunMoleculeGeometry >> neighborsOf: aJunAtomOrInteger do: aBlock [
	(aJunAtomOrInteger isInteger
		ifTrue: [ atoms at: aJunAtomOrInteger ifAbsent: [  ] ]
		ifFalse: [ aJunAtomOrInteger ])
		ifNotNil: [ :atom | 
			self
				bondsDo: [ :bond | 
					bond atom1 == atom
						ifTrue: [ aBlock value: bond atom2 ].
					bond atom2 == atom
						ifTrue: [ aBlock value: bond atom1 ] ] ]
]

{ #category : #accessing }
JunMoleculeGeometry >> numberOfAtoms [
	^ atoms size
]

{ #category : #accessing }
JunMoleculeGeometry >> numberOfBonds [
	^ bonds size
]

{ #category : #accessing }
JunMoleculeGeometry >> numberOfNeighborsOf: aJunAtom [
	| num |
	num := 0.
	self neighborsOf: aJunAtom do: [ :atom | num := num + 1 ].
	^ num
]

{ #category : #copying }
JunMoleculeGeometry >> postCopy [
	super postCopy.
	atoms := atoms copy.
	bonds := bonds copy
]

{ #category : #printing }
JunMoleculeGeometry >> printXYZOn: aStream [
	aStream
		nextPutAll: self size printString;
		cr;
		cr.
	self
		do: [ :atom | 
			aStream
				nextPutAll: atom symbol;
				nextPutAll: '	';
				nextPutAll: atom position x printString;
				nextPutAll: '	';
				nextPutAll: atom position y printString;
				nextPutAll: '	';
				nextPutAll: atom position z printString;
				cr ]
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> removeAtom: aJunAtom ifAbsent: errorBlock [
	atoms remove: aJunAtom ifAbsent: [ ^ errorBlock value ].
	bonds removeAllSuchThat: [ :bond | bond atom1 == aJunAtom or: [ bond atom2 == aJunAtom ] ].
	^ aJunAtom
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> removeBond: aJunBond [
	^ self removeBond: aJunBond ifAbsent: [  ]
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> removeBond: aJunBond ifAbsent: errorBlock [
	^ bonds remove: aJunBond ifAbsent: errorBlock
]

{ #category : #rendering }
JunMoleculeGeometry >> renderOn: aJunRenderingContext [
	self size > 64
		ifTrue: [ self do: [ :atom | atom renderRoughOn: aJunRenderingContext ] ]
		ifFalse: [ self do: [ :atom | atom renderOn: aJunRenderingContext ] ].
	self bondsDo: [ :bond | bond renderOn: aJunRenderingContext ]
]

{ #category : #rendering }
JunMoleculeGeometry >> renderRoughOn: aJunRenderingContext [

	self
		do: [ :atom | atom renderRoughOn: aJunRenderingContext ];
		bondsDo: [ :bond | bond renderRoughOn: aJunRenderingContext ]
]

{ #category : #'adding/removing' }
JunMoleculeGeometry >> replaceAtom: aJunAtom1 with: aJunAtom2 [
	| index |
	index := atoms indexOf: aJunAtom1.
	^ index > 0
		ifTrue: [ 
			self at: index put: aJunAtom2.
			bonds
				do: [ :bond | 
					bond atom1 == aJunAtom1
						ifTrue: [ bond atom1: aJunAtom2 ].
					bond atom2 == aJunAtom1
						ifTrue: [ bond atom2: aJunAtom2 ] ] ]
		ifFalse: [ nil ]
]

{ #category : #utilities }
JunMoleculeGeometry >> show [
	"(JunMoleculeGeometry fromXYZ: (UIManager default fileOpen: 'Please select an XYZ file' extensions: #('xyz'))) autoBonds; show"

	JunSimple3dMorph show: self label: 'molecule viewer' color: Color black
]

{ #category : #accessing }
JunMoleculeGeometry >> size [
	^ atoms size
]

{ #category : #transforming }
JunMoleculeGeometry >> transform: aJunTransformation [
	| molecule |
	molecule := self class new.
	self atomsDo: [ :atom | molecule add: (atom transform: aJunTransformation) ].
	self
		bondsDo: [ :bond | 
			| index1 index2 newBond |
			index1 := atoms indexOf: bond atom1.
			index2 := atoms indexOf: bond atom2.
			newBond := bond copy.
			newBond setAtom1: (molecule at: index1) atom2: (molecule at: index2) ].
	^ molecule
]
