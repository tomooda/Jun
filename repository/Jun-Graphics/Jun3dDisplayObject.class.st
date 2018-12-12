"
A Jun3dObject is a graphics object to be rendered.

Instance Variables
	bounds:		<Jun3dBoundingBox>
	color:		<Color>
	name:		<String>

bounds
	- bounding box of the object

color
	- color to be rendered

name
	- name label

"
Class {
	#name : #Jun3dDisplayObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'color',
		'bounds'
	],
	#category : 'Jun-Graphics-Objects'
}

{ #category : #'typical objects - chemical' }
Jun3dDisplayObject class >> benzene [
	"(Jun3dDisplayObject benzene) show."

	| compoundObject |
	compoundObject := Jun3dDisplayCompoundObject
		compoundFromString:
			'
   -1.1604   -0.6711   -0.0756 C
   -1.1621    0.6709   -0.0461 C
   -0.0019    1.3422    0.0296 C
    1.1596    0.6708    0.0756 C
    1.1615   -0.6712    0.0461 C
    0.0012   -1.3423   -0.0296 C
   -2.1144   -1.2230   -0.1378 H
   -2.1172    1.2228   -0.0839 H
   -0.0032    2.4459    0.0539 H
    2.1138    1.2225    0.1378 H
    2.1172   -1.2230    0.0840 H
    0.0024   -2.4459   -0.0539 H
	'.
	compoundObject name: 'benzene'.
	^ compoundObject
]

{ #category : #'typical objects - chemical' }
Jun3dDisplayObject class >> compoundFromString: aString [ 
	"(Jun3dDisplayObject compoundFromString: '
   -1.1604   -0.6711   -0.0756 C
   -1.1621    0.6709   -0.0461 C
   -0.0019    1.3422    0.0296 C
    1.1596    0.6708    0.0756 C
    1.1615   -0.6712    0.0461 C
    0.0012   -1.3423   -0.0296 C
   -2.1144   -1.2230   -0.1378 H
   -2.1172    1.2228   -0.0839 H
   -0.0032    2.4459    0.0539 H
    2.1138    1.2225    0.1378 H
    2.1172   -1.2230    0.0840 H
    0.0024   -2.4459   -0.0539 H
	') show."

	| aCollection compoundObject |
	aCollection := OrderedCollection new.
	(aString lines collect: [:line | line substrings]) do: 
			[:anArray | 
			anArray isEmpty 
				ifFalse: 
					[| aName aCenter aRadius aColor aBall anAtom |
					aName := anArray at: 4.
					aCenter := Jun3dPoint 
								fromArray: ((anArray copyFrom: 1 to: 3) collect: [:it | it asNumber]).
					aRadius := nil.
					aColor := nil.
					aName = 'C' 
						ifTrue: 
							[aRadius := 1.7.
							aColor := Color blue mixed: 0.5 with: Color white].
					aName = 'H' 
						ifTrue: 
							[aRadius := 1.2.
							aColor := Color green mixed: 0.5 with: Color white].
					aName = 'O' 
						ifTrue: 
							[aRadius := 1.52.
							aColor := Color red mixed: 0.5 with: Color white].
					aName = 'N' 
						ifTrue: 
							[aRadius := 1.55.
							aColor := Color cyan mixed: 0.5 with: Color white].
					aName = 'P' 
						ifTrue: 
							[aRadius := 1.8.
							aColor := Color magenta mixed: 0.5 with: Color white].
					aName = 'S' 
						ifTrue: 
							[aRadius := 1.8.
							aColor := Color yellow mixed: 0.5 with: Color white].
					aName = 'Cl' 
						ifTrue: 
							[aRadius := 1.75.
							aColor := Color green darker mixed: 0.5 with: Color white].
					(aRadius isNil or: [aColor isNil]) 
						ifTrue: 
							[aRadius := 1.0.
							aColor := Color gray mixed: 0.5 with: Color white].
					aBall := JunSphereSurface center: aCenter radius: aRadius.
					anAtom := Jun3dDisplayObject 
								sphere: 10
								radius: aRadius
								center: aCenter.
					anAtom objectsDo: [:each | each color: aColor].
					anAtom name: aName.
					aCollection add: aBall -> anAtom]].
	compoundObject := Jun3dDisplayCompoundObject new.
	aCollection do: 
			[:anAssociation | 
			| ballCollection atomBody |
			ballCollection := (aCollection 
						reject: [:each | each key = anAssociation key]) collect: [:each | each key].
			atomBody := Jun3dDisplayCompoundObject new.
			atomBody name: anAssociation value name.
			anAssociation value polygonsDo: 
					[:polygon | 
					(ballCollection select: 
							[:ball | 
							| points |
							points := polygon asPointArray.
							(points select: [:point | ball containsPoint: point]) size = points size]) 
						isEmpty ifTrue: [atomBody add: polygon]].
			compoundObject add: atomBody].
	compoundObject name: 'compound'.
	^compoundObject
]

{ #category : #defaults }
Jun3dDisplayObject class >> defaultColor [
	^ Color white
]

{ #category : #defaults }
Jun3dDisplayObject class >> defaultLineWidth [
	^ 1.0
]

{ #category : #defaults }
Jun3dDisplayObject class >> defaultPointSize [
	^ 1.0
]

{ #category : #defaults }
Jun3dDisplayObject class >> defaultTransformation [
	^ Jun3dTransformation unity
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> earth: degree [
	^ self sphere: degree texture: JunTexture earth
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> moon: degree [
	^ self sphere: degree texture: JunTexture moon
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphere [
	"Jun3dDisplayObject sphere show."

	^ self
		sphere: 15
		radius: 1
		longitude: 360
		latitude: 180
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphere: degree [
	"(Jun3dDisplayObject sphere: 2) show."

	^ self
		sphere: degree
		radius: 1
		longitude: 360
		latitude: 180
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphere: degree radius: radius [ 
	"(Jun3dDisplayObject sphere: 15 radius: 5) show."

	^self
		sphere: degree
		radius: radius
		longitude: 360
		latitude: 180
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphere: degrees radius: radius center: center [
	"(Jun3dDisplayObject sphere: 15 radius: 5 center: 1, 1, 1) show."

	^ (Jun3dTransformation translate: center) applyTo: (self sphere: degrees radius: radius)
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphere: degrees radius: radius longitude: logitude latitude: latitude [
	^ (self
		xyPointsAndSphere: degrees
		radius: radius
		longitude: logitude
		latitude: latitude) last
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphere: degree texture: aJunTexture [
	"(Jun3dDisplayObject sphere: 15 texture: JunTexture globe) show."

	| sphere |
	sphere := Jun3dDisplayCompoundObject new.
	0 to: 180 - 1 by: degree do: [ :latitude | 
		0 to: 360 - 1 by: degree do: [ :longitude | 
			| polygon |
			polygon := Jun3dDisplayPolygon
				points:
					(Array
						with: (Jun3dPoint rho: 2.0 phi: longitude asDegrees theta: (latitude + degree) asDegrees)
						with:
							(Jun3dPoint
								rho: 2.0
								phi: (longitude + degree) asDegrees
								theta: (latitude + degree) asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: (longitude + degree) asDegrees theta: latitude asDegrees)
						with: (Jun3dPoint rho: 2.0 phi: longitude asDegrees theta: latitude asDegrees)).
			polygon
				setTexture: aJunTexture
				points:
					(Array
						with: longitude / 360.0 ,, ((latitude + degree) / 180.0)
						with: (longitude + degree) / 360.0 ,, ((latitude + degree) / 180.0)
						with: (longitude + degree) / 360.0 ,, (latitude / 180.0)
						with: longitude / 360.0 ,, (latitude / 180.0)).
			sphere add: polygon ] ].
	^ sphere
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> sphereFrom: fromPoint to: toPoint width: widthFactor [
	^ self
		from: fromPoint
		to: toPoint
		height: widthFactor
		depth: widthFactor
		with: self xUnitSphere
]

{ #category : #'typical objects - cubes' }
Jun3dDisplayObject class >> unitCube [
	"Jun3dDisplayObject unitCube show"

	| faces |
	faces := OrderedCollection new: 6.
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 ,, 0 ,, 1
						with: 1 ,, 0 ,, 1
						with: 1 ,, 1 ,, 1
						with: 0 ,, 1 ,, 1)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 ,, 1 ,, 0
						with: 1 ,, 1 ,, 0
						with: 1 ,, 0 ,, 0
						with: 0 ,, 0 ,, 0)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 1 ,, 0 ,, 0
						with: 1 ,, 1 ,, 0
						with: 1 ,, 1 ,, 1
						with: 1 ,, 0 ,, 1)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 ,, 0 ,, 1
						with: 0 ,, 1 ,, 1
						with: 0 ,, 1 ,, 0
						with: 0 ,, 0 ,, 0)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 ,, 1 ,, 1
						with: 1 ,, 1 ,, 1
						with: 1 ,, 1 ,, 0
						with: 0 ,, 1 ,, 0)).
	faces
		add:
			(Jun3dDisplayPolygon
				points:
					(Array
						with: 0 ,, 0 ,, 0
						with: 1 ,, 0 ,, 0
						with: 1 ,, 0 ,, 1
						with: 0 ,, 0 ,, 1)).
	^ Jun3dDisplayCompoundObject components: faces
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> xUnitSphere [
	^ self sphere
		transform:
			(((Jun3dTransformation scale: 0.5 ,, 0.5 ,, 0.5)
				product: (Jun3dTransformation translate: 0 ,, 0 ,, 0.5))
				product: (Jun3dTransformation rotateY: (JunAngle fromDeg: 90)))
]

{ #category : #'typical objects - spheres' }
Jun3dDisplayObject class >> xyPointsAndSphere: degrees radius: radius longitude: longitude latitude: latitude [
	| theDegrees theRadius theLongitude theLatitude xyzBlock xyBlock numberOfPolygons pointCollections xyCollection aSphere |
	theDegrees := 1 max: (degrees min: 90).
	theRadius := 0 max: radius.
	theLongitude := 1 max: (longitude min: 360).
	theLatitude := 1 max: (latitude min: 180).
	xyzBlock := [ :r :pd :td | 
	| phi theta x y z accuracy |
	phi := pd asFloat degreesToRadians.
	theta := td asFloat degreesToRadians.
	x := r * theta sin * phi cos.
	y := r * theta sin * phi sin.
	z := r * theta cos.
	accuracy := JunGeometry accuracy.
	(x - 0.0) abs < accuracy
		ifTrue: [ x := 0.0 ].
	(y - 0.0) abs < accuracy
		ifTrue: [ y := 0.0 ].
	(z - 0.0) abs < accuracy
		ifTrue: [ z := 0.0 ].
	x ,, y ,, z ].
	xyBlock := [ :phi :theta | phi / theLongitude ,, (theta / theLatitude) ].
	numberOfPolygons := (theLongitude / theDegrees * (theLatitude / theDegrees)) rounded.
	pointCollections := OrderedCollection new: numberOfPolygons.
	xyCollection := OrderedCollection new: numberOfPolygons * 4.
	0 to: theLongitude - theDegrees by: theDegrees do: [ :phi | 
		0 to: theLatitude - theDegrees by: theDegrees do: [ :theta | 
			| pointCollection firstPoint previousPoint currentPoint |
			pointCollection := OrderedCollection new: 4.
			currentPoint := xyzBlock value: theRadius value: phi value: theta.
			pointCollection add: currentPoint.
			xyCollection add: (xyBlock value: phi value: theta).
			firstPoint := currentPoint.
			previousPoint := currentPoint.
			currentPoint := xyzBlock value: theRadius value: phi value: theta + theDegrees.
			currentPoint = previousPoint
				ifFalse: [ pointCollection add: currentPoint.
					xyCollection add: (xyBlock value: phi value: theta + theDegrees) ].
			previousPoint := currentPoint.
			currentPoint := xyzBlock
				value: theRadius
				value: phi + theDegrees
				value: theta + theDegrees.
			currentPoint = previousPoint
				ifFalse: [ pointCollection add: currentPoint.
					xyCollection add: (xyBlock value: phi + theDegrees value: theta + theDegrees) ].
			previousPoint := currentPoint.
			currentPoint := xyzBlock value: theRadius value: phi + theDegrees value: theta.
			(currentPoint = previousPoint or: [ currentPoint = firstPoint ])
				ifFalse: [ pointCollection add: currentPoint.
					xyCollection add: (xyBlock value: phi + theDegrees value: theta) ].
			previousPoint := currentPoint.
			pointCollections add: pointCollection asArray ] ].
	aSphere := Jun3dDisplayCompoundObject new.
	aSphere name: 'sphere'.
	pointCollections
		do: [ :each | 
			| polygon |
			polygon := Jun3dDisplayPolygon points: each.
			(polygon respondsTo: #normalVectors:)
				ifTrue: [ polygon normalVectors: (polygon points collect: [ :p | p unitVector ]) ].
			aSphere add: polygon ].
	aSphere objectsDo: [ :each | each color: nil ].
	aSphere color: Color white.
	^ Array with: xyCollection with: aSphere
]

{ #category : #accessing }
Jun3dDisplayObject >> alpha [
	^ color ifNotNil: [ self color alpha ]
]

{ #category : #accessing }
Jun3dDisplayObject >> alpha: aNumber [
	color := color alpha: (aNumber min: 1.0 max: 0.0)
]

{ #category : #accessing }
Jun3dDisplayObject >> area [
	| area |
	area := 0.
	self asTriangles do: [ :triangle | area := area + triangle area ].
	^ area
]

{ #category : #converting }
Jun3dDisplayObject >> asDisplayObject [
	^ self
]

{ #category : #converting }
Jun3dDisplayObject >> asGeometryArray [
	"JunOpenGL3dObject cube asGeometryArray."

	"JunOpenGL3dObject axes asGeometryArray."

	| aStream |
	aStream := WriteStream on: (Array new: 128).
	self geometriesDo: [ :geometry | aStream nextPut: geometry ].
	^ aStream contents
]

{ #category : #converting }
Jun3dDisplayObject >> asMorph [
	^ (JunSimple3dMorph on: self)
		fit;
		color: Color white;
		yourself
]

{ #category : #converting }
Jun3dDisplayObject >> asPointArray [
	| aStream |
	aStream := WriteStream on: (Array new: 128).
	self pointsDo: [ :point | aStream nextPut: point ].
	^ aStream contents
]

{ #category : #accessing }
Jun3dDisplayObject >> basicColor [
	^ color
]

{ #category : #accessing }
Jun3dDisplayObject >> basicName [
	^ name
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> boundingBox [
	^ bounds ifNil: [ bounds := self preferredBoundingBox ]
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> center [
	^ self boundingBox center
]

{ #category : #accessing }
Jun3dDisplayObject >> color [
	^ color ifNil: [ self defaultColor ]
]

{ #category : #accessing }
Jun3dDisplayObject >> color: aColor [
	color := aColor
]

{ #category : #accessing }
Jun3dDisplayObject >> color: aColor alpha: aNumber [
	color := aColor alpha: (aNumber min: 1.0 max: 0.0)
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> corner [
	^ self boundingBox corner
]

{ #category : #defaults }
Jun3dDisplayObject >> defaultColor [
	^ self class defaultColor
]

{ #category : #defaults }
Jun3dDisplayObject >> defaultLineWidth [
	^ self class defaultLineWidth
]

{ #category : #defaults }
Jun3dDisplayObject >> defaultPointSize [
	^ self class defaultPointSize
]

{ #category : #defaults }
Jun3dDisplayObject >> defaultTransformation [
	^ self class defaultTransformation
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> depth [
	^ self boundingBox depth
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> extent [
	^ self boundingBox extent
]

{ #category : #converting }
Jun3dDisplayObject >> flatten [
	^ self notYetImplemented "JunOpenGL3dCompoundObject
	| aBody |
	aBody := JunOpenGL3dCompoundObject new.
	self primitivesDo: [:aPolygon | aBody add: aPolygon].
	^aBody"
]

{ #category : #enumerating }
Jun3dDisplayObject >> geometriesDo: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
Jun3dDisplayObject >> halftone [
	^ self halftone: 0.5
]

{ #category : #accessing }
Jun3dDisplayObject >> halftone: aNumber [
]

{ #category : #testing }
Jun3dDisplayObject >> hasAlpha [
	^ self alpha < 1.0
]

{ #category : #testing }
Jun3dDisplayObject >> hasColor [
	^ color isNil
]

{ #category : #testing }
Jun3dDisplayObject >> hasName [
	^ name notNil
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> height [
	^ self boundingBox height
]

{ #category : #testing }
Jun3dDisplayObject >> isCompound [
	^ false
]

{ #category : #testing }
Jun3dDisplayObject >> isLight [
	^ self false
]

{ #category : #testing }
Jun3dDisplayObject >> isPrimitive [
	^ false
]

{ #category : #accessing }
Jun3dDisplayObject >> name [
	^ name ifNil: [ self identityHash printString ]
]

{ #category : #accessing }
Jun3dDisplayObject >> name: aString [
	name := aString
]

{ #category : #utilities }
Jun3dDisplayObject >> numberOfPolygons [
	^ self subclassResponsibility
]

{ #category : #utilities }
Jun3dDisplayObject >> numberOfPrimitives [
	| count |
	count := 0.
	self primitivesDo: [ :object | count := count + 1 ].
	^ count
]

{ #category : #enumerating }
Jun3dDisplayObject >> objectsDo: aBlock [
	aBlock value: self
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> origin [
	^ self boundingBox origin
]

{ #category : #enumerating }
Jun3dDisplayObject >> pointsDo: aBlock [
	self subclassResponsibility
]

{ #category : #enumerating }
Jun3dDisplayObject >> polygonsDo: aBlock [
	self subclassResponsibility
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> preferredBoundingBox [
	| minX minY minZ maxX maxY maxZ |
	minX := nil.
	minY := nil.
	minZ := nil.
	maxX := nil.
	maxY := nil.
	maxZ := nil.
	self
		pointsDo: [ :p | 
			minX == nil
				ifTrue: [ minX := p x ]
				ifFalse: [ minX := minX min: p x ].
			minY == nil
				ifTrue: [ minY := p y ]
				ifFalse: [ minY := minY min: p y ].
			minZ == nil
				ifTrue: [ minZ := p z ]
				ifFalse: [ minZ := minZ min: p z ].
			maxX == nil
				ifTrue: [ maxX := p x ]
				ifFalse: [ maxX := maxX max: p x ].
			maxY == nil
				ifTrue: [ maxY := p y ]
				ifFalse: [ maxY := maxY max: p y ].
			maxZ == nil
				ifTrue: [ maxZ := p z ]
				ifFalse: [ maxZ := maxZ max: p z ] ].
	minX == nil
		ifTrue: [ minX := 0 ].
	minY == nil
		ifTrue: [ minY := 0 ].
	minZ == nil
		ifTrue: [ minZ := 0 ].
	maxX == nil
		ifTrue: [ maxX := 0 ].
	maxY == nil
		ifTrue: [ maxY := 0 ].
	maxZ == nil
		ifTrue: [ maxZ := 0 ].
	^ Jun3dBoundingBox origin: minX ,, minY ,, minZ corner: maxX ,, maxY ,, maxZ
]

{ #category : #enumerating }
Jun3dDisplayObject >> primitivesDo: aBlock [
	aBlock value: self
]

{ #category : #rendering }
Jun3dDisplayObject >> renderOn: aJunRenderingContext [
	^ self subclassResponsibility
]

{ #category : #converting }
Jun3dDisplayObject >> reversed [
	^ self subclassResponsibility
]

{ #category : #transforming }
Jun3dDisplayObject >> rotatedBy: anAngle [
	^ self transform: (Jun3dTransformation rotate: anAngle)
]

{ #category : #transforming }
Jun3dDisplayObject >> scaledBy: a3dPoint [
	^ self transform: (Jun3dTransformation scale: a3dPoint)
]

{ #category : #viewing }
Jun3dDisplayObject >> show [
	^ JunSimple3dMorph show: self label: 'self printString' color: Color white
]

{ #category : #viewing }
Jun3dDisplayObject >> showAt: displayPoint [
	"JunOpenGL3dObject aoki showAt: 200@200."

	^ self
		showEyePoint: nil
		sightPoint: nil
		upVector: nil
		viewFactor: nil
		in: (displayPoint extent: 300 @ 300)
]

{ #category : #viewing }
Jun3dDisplayObject >> showColor: aColor [
	^ JunSimple3dMorph show: self label: 'self printString' color: aColor
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint [
	^ self showEyePoint: eyePoint sightPoint: nil
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint [
	^ self showEyePoint: eyePoint sightPoint: sightPoint upVector: nil
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector [
	^ self
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: nil
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector in: displayRectangle [
	^ self
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: nil
		in: displayRectangle
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor [
	^ self
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: viewFactor
		in: nil
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor in: displayRectangle [
	^ self
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: viewFactor
		zoomHeight: nil
		in: displayRectangle
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor zoomHeight: zoomHeight in: displayRectangle [
	| projection form rc window |
	projection := JunPerspectiveProjection default.
	eyePoint ifNotNil: [ projection eyePoint: eyePoint ].
	sightPoint ifNotNil: [ projection sightPoint: sightPoint ].
	upVector ifNotNil: [ projection upVector: upVector ].
	viewFactor ifNotNil: [ projection viewFactor: viewFactor ].
	zoomHeight
		ifNil: [ projection zoomHeight: (self boundingBox origin distance: self boundingBox corner) * 0.8 ]
		ifNotNil: [ projection zoomHeight: zoomHeight ].
	form := Form extent: 400 @ 400 depth: 32.
	rc := form renderingContext.
	form getCanvas fillColor: Color blue.
	rc projection: projection.
	rc clear.
	rc enableCullface.
	self renderOn: rc.
	rc flush.
	window := form asMorph openInWindow.
	displayRectangle ifNotNil: [ window bounds: displayRectangle ]
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector zoomHeight: zoomHeight [ 
	^self 
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		zoomHeight: zoomHeight
		in: nil
]

{ #category : #viewing }
Jun3dDisplayObject >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector zoomHeight: zoomHeight in: displayRectangle [
	^ self
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: nil
		zoomHeight: zoomHeight
		in: displayRectangle
]

{ #category : #viewing }
Jun3dDisplayObject >> showIn: displayRectangle [
	"JunOpenGL3dObject aoki showIn: (200@200 extent: 400@400)."

	^ self
		showEyePoint: nil
		sightPoint: nil
		upVector: nil
		viewFactor: nil
		in: displayRectangle
]

{ #category : #viewing }
Jun3dDisplayObject >> showWithAxes [
	"JunOpenGL3dObject aoki showWithAxes."

	^ self withAxes show
]

{ #category : #accessing }
Jun3dDisplayObject >> texture [
	^ nil
]

{ #category : #accessing }
Jun3dDisplayObject >> texture: aJunTexture [
	
]

{ #category : #transforming }
Jun3dDisplayObject >> transform: aTransformation [
	^ self subclassResponsibility
]

{ #category : #transforming }
Jun3dDisplayObject >> translatedBy: aJun3dPoint [
	^ self transform: (Jun3dTransformation translate: aJun3dPoint)
]

{ #category : #'bounds access' }
Jun3dDisplayObject >> width [
	^ self boundingBox width
]

{ #category : #viewing }
Jun3dDisplayObject >> withAxes [
	"JunOpenGL3dObject aoki withAxes show."

	^ self notYetImplemented "| box axes |
	box := self boundingBox merge: Jun3dPoint zero asBoundingBox.
	axes := self class xyzArrows 
				scaledBy: ((box width max: box height) max: box depth) * 1.2.
	^JunOpenGL3dCompoundObject with: self with: axes"
]
