"
JunGeometry is an abstract class of all Jun's geometry objects.

"
Class {
	#name : #JunGeometry,
	#superclass : #Object,
	#category : 'Jun-Geometry-Abstract'
}

{ #category : #'constants access' }
JunGeometry class >> accuracy [
	"JunGeometry accuracy."

	^ 1.0d-12
]

{ #category : #utilities }
JunGeometry class >> alignedBox: extentPoint withCenter: centerPoint [
	"JunGeometry alignedBox: 400 @ 300 withCenter: 100 @ 200."
	"JunGeometry alignedBox: 400 , 300 withCenter: 100 @ 200."
	"JunGeometry alignedBox: 400 , 300 , 200 withCenter: 100 @ 200."

	| aBox |
	aBox := extentPoint class zero extent: extentPoint.
	^ aBox align: aBox center with: centerPoint
]

{ #category : #utilities }
JunGeometry class >> alignedBoxWithScreenCenter: extentPoint [
	"JunGeometry alignedBoxWithScreenCenter: 400 @ 300."
	"JunGeometry alignedBoxWithScreenCenter: 400 , 300."
	"JunGeometry alignedBoxWithScreenCenter: 400 , 300 , 200."

	^ self alignedBox: extentPoint withCenter: World center
]

{ #category : #'class access' }
JunGeometry class >> angleClass [
	^ self new angleClass
]

{ #category : #'class access' }
JunGeometry class >> boundingBallClass [
	^ self new boundingBallClass
]

{ #category : #'class access' }
JunGeometry class >> boundingBoxClass [
	^ self new boundingBoxClass
]

{ #category : #'class access' }
JunGeometry class >> circleClass [
	^ self new circleClass
]

{ #category : #'constants access' }
JunGeometry class >> doublePi [
	"JunGeometry doublePi."

	^ 6.28318530717958647692528676655900576
]

{ #category : #'constants access' }
JunGeometry class >> halfPi [
	"JunGeometry halfPi."

	^ 1.57079632679489661923132169163975144
]

{ #category : #utilities }
JunGeometry class >> hemispherePoint: groundPoint center: centerPoint [
	"JunGeometry hemispherePoint: 1_,0_,0 center: 0_,0_,1."

	^ self
		hemispherePoint: groundPoint
		center: centerPoint
		on: (0 _ , 0 _ , 0 plane: 1 _ , 0 _ , 0 and: 0 _ , 1 _ , 0)
]

{ #category : #utilities }
JunGeometry class >> hemispherePoint: groundPoint center: centerPoint on: groundPlane [
	"JunGeometry hemispherePoint: 1,0,0 center: 0,0,1 on: (0,0,0 plane: 1,0,0 and: 0,1,0)."

	^ (centerPoint to: (groundPlane nearestPointFromPoint: groundPoint)) normalized
		atT: (groundPlane distanceFromPoint: centerPoint)
]

{ #category : #'class access' }
JunGeometry class >> lineClass [
	^ self new lineClass
]

{ #category : #'class access' }
JunGeometry class >> localGeometryClass [
	^ self new localGeometryClass
]

{ #category : #utilities }
JunGeometry class >> mobiusRadius: mobiusRadius normalizedTheta: normalizedTheta stripRadius: stripRadius normalizedRadius: normalizedRadius [
	"JunGeometry mobiusRadius: (2/3) normalizedTheta: 0 stripRadius: (1/3) normalizedRadius: 1."

	"
	x = (R + (r * cos(theta / 2))) * cos(theta) 
	y = (R + (r * cos(theta / 2))) * sin(theta) 
	z = r * sin(theta / 2)
	"

	| theta phi point center x y z |
	theta := JunAngle fromRad: self doublePi * normalizedTheta.
	phi := theta * 2.0 reciprocal.
	x := (mobiusRadius + (stripRadius * phi cos)) * theta cos.
	y := (mobiusRadius + (stripRadius * phi cos)) * theta sin.
	z := stripRadius * phi sin.
	x abs < self accuracy
		ifTrue: [ x := 0.0 ].
	y abs < self accuracy
		ifTrue: [ y := 0.0 ].
	z abs < self accuracy
		ifTrue: [ z := 0.0 ].
	point := x _ , y _ , z.
	x := mobiusRadius * theta cos.
	y := mobiusRadius * theta sin.
	x abs < self accuracy
		ifTrue: [ x := 0.0 ].
	y abs < self accuracy
		ifTrue: [ y := 0.0 ].
	center := x _ , y _ , 0.0.
	^ (center to: point) atT: normalizedRadius
]

{ #category : #utilities }
JunGeometry class >> permutations: sequenceableCollection [
	"JunGeometry permutations: #(1 2 3 4)."

	^ self permutations: sequenceableCollection size: sequenceableCollection size
]

{ #category : #utilities }
JunGeometry class >> permutations: sequenceableCollection size: numberOfElements [
	"JunGeometry permutations: #(1 2 3 4) size: 3."

	| howMany aCollection aStream |
	howMany := sequenceableCollection size ** numberOfElements.
	aCollection := OrderedCollection new: howMany.
	howMany timesRepeat: [ aCollection add: (OrderedCollection new: numberOfElements) ].
	(numberOfElements to: 1 by: -1)
		do: [ :n | 
			| index |
			index := 1.
			(sequenceableCollection size ** (n - 1)) asInteger
				timesRepeat: [ 
					(1 to: sequenceableCollection size)
						do: [ :i | 
							(howMany / (sequenceableCollection size ** n)) asInteger
								timesRepeat: [ 
									(aCollection at: index) addFirst: i.
									index := index + 1 ] ] ] ].
	self
		assert: [ aStream := (Array new: howMany) writeStream ]
		do: [ 
			aCollection do: [ :each | aStream nextPut: (each asArray collect: [ :index | sequenceableCollection at: index ]) ].
			aCollection := aStream contents ]
		ensure: [ aStream close ].
	^ aCollection
]

{ #category : #'constants access' }
JunGeometry class >> pi [
	"JunGeometry pi."

	^ 3.14159265358979323846264338327950288
]

{ #category : #'constants access' }
JunGeometry class >> piAsFixedPoint [
	"JunGeometry piAsFixedPoint."

	^ 3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678920903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381380119491298336733624406566430860213949463952247371907021798609487027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290212608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691s
]

{ #category : #'class access' }
JunGeometry class >> planeClass [
	^ self new planeClass
]

{ #category : #'class access' }
JunGeometry class >> pointClass [
	^ self new pointClass
]

{ #category : #'class access' }
JunGeometry class >> polygonClass [
	^ self new polygonClass
]

{ #category : #'class access' }
JunGeometry class >> polylineClass [
	^ self new polylineClass
]

{ #category : #'constants access' }
JunGeometry class >> quarterPi [
	"JunGeometry quarterPi."

	^ 0.78539816339744830961566084581987572
]

{ #category : #utilities }
JunGeometry class >> sewPoints: firstPoints withPoints: secondPoints reverseFlag: aBoolean [ 
	"JunGeometry 
		sewPoints: (Array 
				with: -1 , 0 , 0
				with: 0 , 0 , 0
				with: 1 , 0 , 0)
		withPoints: (Array 
				with: -1 , 1 , 0
				with: 0 , 1 , 0
				with: 1 , 1 , 0)
		reverseFlag: false."

	| aCollection firstTriPoints secondTriPoints |
	aCollection := OrderedCollection new: (firstPoints size - 1) * 2.
	(1 to: firstPoints size - 1) with: (2 to: firstPoints size)
		do: 
			[:firstIndex :secondIndex | 
			| firstPoint secondPoint thirdPoint forthPoint |
			firstPoint := firstPoints at: firstIndex.
			secondPoint := secondPoints at: firstIndex.
			thirdPoint := firstPoints at: secondIndex.
			forthPoint := secondPoints at: secondIndex.
			firstTriPoints := Array 
						with: firstPoint
						with: secondPoint
						with: thirdPoint.
			secondTriPoints := Array 
						with: secondPoint
						with: forthPoint
						with: thirdPoint.
			aBoolean = false 
				ifTrue: 
					[firstTriPoints := firstTriPoints reverse.
					secondTriPoints := secondTriPoints reverse].
			aCollection add: firstTriPoints.
			aCollection add: secondTriPoints].
	^aCollection
]

{ #category : #'class access' }
JunGeometry class >> sphereClass [
	^ self new sphereClass
]

{ #category : #utilities }
JunGeometry class >> torusRadius: torusRadius normalizedTheta: normalizedTheta tubeRadius: tubeRadius normalizedPhi: normalizedPhi [ 
	"JunGeometry torusRadius: (2/3) normalizedTheta: 0 tubeRadius: (1/3) normalizedPhi: 0."

	"
	x = (R + (r * cos(phi))) * cos(theta) 
	y = (R + (r * cos(phi))) * sin(theta) 
	z = r * sin(phi)
	"

	| theta phi x y z point |
	theta := JunAngle fromRad: self doublePi * normalizedTheta.
	phi := JunAngle fromRad: self doublePi * normalizedPhi.
	x := (torusRadius + (tubeRadius * phi cos)) * theta cos.
	y := (torusRadius + (tubeRadius * phi cos)) * theta sin.
	z := tubeRadius * phi sin.
	x abs < self accuracy ifTrue: [x := 0.0].
	y abs < self accuracy ifTrue: [y := 0.0].
	z abs < self accuracy ifTrue: [z := 0.0].
	point := x _, y _, z.
	^point
]

{ #category : #'class access' }
JunGeometry class >> transformationClass [
	^ self new transformationClass
]

{ #category : #'class access' }
JunGeometry class >> triangleClass [
	^ self new triangleClass
]

{ #category : #'class access' }
JunGeometry class >> trianglesClass [
	^ self new trianglesClass
]

{ #category : #comparing }
JunGeometry >> = aGeometry [
	^ self subclassResponsibility
]

{ #category : #'constants access' }
JunGeometry >> accuracy [
	^self class accuracy
]

{ #category : #'class access' }
JunGeometry >> angleClass [
	^ JunAngle
]

{ #category : #accessing }
JunGeometry >> area [
	^ 0
]

{ #category : #converting }
JunGeometry >> asArrayOfLines [
	^ Array new
]

{ #category : #converting }
JunGeometry >> asArrayOfPlanes [
	^ Array new
]

{ #category : #converting }
JunGeometry >> asArrayOfTrianglePolygons [
	^ Array new
]

{ #category : #converting }
JunGeometry >> asArrayOfTriangles [
	^ Array new
]

{ #category : #converting }
JunGeometry >> asBoundingBox [
	^ self subclassResponsibility
]

{ #category : #converting }
JunGeometry >> asGlobalGeometry [
	^ self
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dObject [
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dObject) show."

	^self subclassResponsibility
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dObjectColor: aColor [ 
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dObjectColor: ColorValue red) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dObject.
	compoundObject objectsDo: [:each | each color: nil].
	compoundObject color: aColor.
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dObjectColor: aColor halftone: halftoneValue [ 
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dObjectColor: ColorValue red halftone: 0.5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dObject.
	compoundObject objectsDo: 
			[:each | 
			each
				color: nil;
				halftone: halftoneValue].
	compoundObject color: aColor.
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dObjectWithPoints [
	^self asJunOpenGL3dObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dPolylines [
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylines) show."
	^ self notYetImplemented "
	| aBody |
	aBody := JunOpenGL3dCompoundObject new.
	self asArrayOfLines 
		do: [:aLine | aBody add: (JunOpenGL3dPolyline with: aLine first with: aLine last)].
	^aBody"
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dPolylinesColor: aColor [ 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: [:each | each color: nil].
	compoundObject color: aColor.
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dPolylinesColor: aColor halftone: halftoneValue [ 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red halftone: 0.25) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: 
			[:each | 
			each color: nil;
				halftone: halftoneValue].
	compoundObject color: aColor.
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dPolylinesColor: aColor halftone: halftoneValue lineWidth: lineWidth [ 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red halftone: 0.25 lineWidth: 5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: 
			[:each | 
			each
				paint: nil;
				halftone: halftoneValue.
			each isPolyline ifTrue: [each lineWidth: lineWidth]].
	compoundObject color: aColor.
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dPolylinesColor: aColor lineWidth: lineWidth [ 
	"((0 , 0 , 0 box: 1 , 2 , 3) asJunOpenGL3dPolylinesColor: ColorValue red lineWidth: 5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject objectsDo: 
			[:each | 
			each color: nil.
			each isPolyline ifTrue: [each lineWidth: lineWidth]].
	compoundObject color: aColor.
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asJunOpenGL3dPolylinesLineWidth: lineWidth [ 
	"((0 , 0 , 0 box: 1 , 1 , 1) asJunOpenGL3dPolylinesLineWidth: 5) show."

	| compoundObject |
	compoundObject := self asJunOpenGL3dPolylines.
	compoundObject 
		objectsDo: [:each | each isPolyline ifTrue: [each lineWidth: lineWidth]].
	^compoundObject
]

{ #category : #converting }
JunGeometry >> asLocalGeometryIn: aJunCoordinateSystem [
	| localGeometry |
	localGeometry := aJunCoordinateSystem interprete: self.
	^self class localGeometryClass geometry: localGeometry coordinateSystem: aJunCoordinateSystem
]

{ #category : #'class access' }
JunGeometry >> boundingBallClass [
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dBoundingBall].
	self is2d ifTrue: [^Jun2dBoundingBall].
	^self subclassResponsibility"
]

{ #category : #accessing }
JunGeometry >> boundingBox [
	^ self subclassResponsibility
]

{ #category : #'class access' }
JunGeometry >> boundingBoxClass [
	self is3d
		ifTrue: [ ^ Jun3dBoundingBox ].
	self is2d
		ifTrue: [ ^ Jun2dBoundingBox ].
	^ self subclassResponsibility
]

{ #category : #'class access' }
JunGeometry >> circleClass [
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dCircle].
	self is2d ifTrue: [^Jun2dCircle].
	^self subclassResponsibility"
]

{ #category : #defaults }
JunGeometry >> defaultAlpha [
	^0.25
]

{ #category : #defaults }
JunGeometry >> defaultColor [
	^ Color gray
]

{ #category : #comparing }
JunGeometry >> equal: aGeometry [
	^ self subclassResponsibility
]

{ #category : #converting }
JunGeometry >> interpretedBy: aJunCoordinateSystem [ 
	^self transform: aJunCoordinateSystem globalInvTransformation
]

{ #category : #testing }
JunGeometry >> is1d [
	^ false
]

{ #category : #testing }
JunGeometry >> is2d [
	^ false
]

{ #category : #testing }
JunGeometry >> is3d [
	^ false
]

{ #category : #testing }
JunGeometry >> isAngle [
	^ false
]

{ #category : #testing }
JunGeometry >> isBoundingBall [
	^ false
]

{ #category : #testing }
JunGeometry >> isBoundingBalls [
	^ false
]

{ #category : #testing }
JunGeometry >> isBoundingBox [
	^ false
]

{ #category : #testing }
JunGeometry >> isBoundingBoxes [
	^ false
]

{ #category : #testing }
JunGeometry >> isBoundingObject [
	^ false
]

{ #category : #testing }
JunGeometry >> isBoundingObjects [
	^ false
]

{ #category : #testing }
JunGeometry >> isCircle [
	^ false
]

{ #category : #testing }
JunGeometry >> isCircularCone [
	^ false
]

{ #category : #testing }
JunGeometry >> isCircularCylinder [
	^ false
]

{ #category : #testing }
JunGeometry >> isCompoundSurface [
	^ false
]

{ #category : #testing }
JunGeometry >> isCurve [
	^ false
]

{ #category : #testing }
JunGeometry >> isEqualNumber: firstNumber to: secondNumber [
	^ (firstNumber - secondNumber) abs < self class accuracy
]

{ #category : #testing }
JunGeometry >> isEqualPoint: firstPoint to: secondPoint [
	^ (firstPoint distance: secondPoint) < self class accuracy
]

{ #category : #testing }
JunGeometry >> isGeometry [
	^ true
]

{ #category : #testing }
JunGeometry >> isGlobalGeometry [
	^ true
]

{ #category : #testing }
JunGeometry >> isLine [
	^ false
]

{ #category : #testing }
JunGeometry >> isLines [
	^ false
]

{ #category : #testing }
JunGeometry >> isPlane [
	^ false
]

{ #category : #testing }
JunGeometry >> isPolygon [
	^ false
]

{ #category : #testing }
JunGeometry >> isPolyline [
	^ false
]

{ #category : #testing }
JunGeometry >> isPolylines [
	^ false
]

{ #category : #testing }
JunGeometry >> isSolid [
	^ false
]

{ #category : #testing }
JunGeometry >> isSphere [
	^ false
]

{ #category : #testing }
JunGeometry >> isSurface [
	^ false
]

{ #category : #testing }
JunGeometry >> isTetrahedron [
	^ false
]

{ #category : #testing }
JunGeometry >> isTopology [
	^ false
]

{ #category : #testing }
JunGeometry >> isTriangle [
	^ false
]

{ #category : #testing }
JunGeometry >> isTriangles [
	^ false
]

{ #category : #'class access' }
JunGeometry >> lineClass [
	self is3d
		ifTrue: [ ^ Jun3dLine ].
	self is2d
		ifTrue: [ ^ Jun2dLine ].
	^ self subclassResponsibility
]

{ #category : #'class access' }
JunGeometry >> localGeometryClass [
	^ self notYetImplemented "^JunLocalGeometry"
]

{ #category : #'class access' }
JunGeometry >> planeClass [
	^ JunPlane
]

{ #category : #'class access' }
JunGeometry >> pointClass [
	self is3d ifTrue: [^Jun3dPoint].
	self is2d ifTrue: [^Jun2dPoint].
	^self subclassResponsibility
]

{ #category : #'class access' }
JunGeometry >> polygonClass [
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dPolygon].
	self is2d ifTrue: [^Jun2dPolygon].
	^self subclassResponsibility"
]

{ #category : #'class access' }
JunGeometry >> polylineClass [
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dPolyline].
	self is2d ifTrue: [^Jun2dPolyline].
	^self subclassResponsibility"
]

{ #category : #printing }
JunGeometry >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #transforming }
JunGeometry >> rotatedBy: anAngle [
	^ self transform: (self transformationClass rotate: anAngle)
]

{ #category : #transforming }
JunGeometry >> rotatedByDegrees: degrees [
	^ self transform: (self transformationClass rotate: (self angleClass fromDeg: degrees))
]

{ #category : #transforming }
JunGeometry >> scaledBy: aPoint [
	^ self transform: (self transformationClass scale: aPoint)
]

{ #category : #viewing }
JunGeometry >> show [
	"(1 , 1 , 1 cylinder: 1 height: 2) show."

	^ self asJunOpenGL3dObject show
]

{ #category : #viewing }
JunGeometry >> showAt: displayPoint [
	"(1 , 1 , 1 cylinder: 1 height: 2) showAt: 200@200."

	^ self asJunOpenGL3dObject showAt: displayPoint
]

{ #category : #viewing }
JunGeometry >> showEyePoint: eyePoint [
	^ self asJunOpenGL3dObject showEyePoint: eyePoint
]

{ #category : #viewing }
JunGeometry >> showEyePoint: eyePoint sightPoint: sightPoint [
	^ self asJunOpenGL3dObject showEyePoint: eyePoint sightPoint: sightPoint
]

{ #category : #viewing }
JunGeometry >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector [
	^ self asJunOpenGL3dObject showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector
]

{ #category : #viewing }
JunGeometry >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor [
	^ self asJunOpenGL3dObject
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: viewFactor
]

{ #category : #viewing }
JunGeometry >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor in: displayRectangle [
	^ self asJunOpenGL3dObject
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: viewFactor
		in: displayRectangle
]

{ #category : #viewing }
JunGeometry >> showEyePoint: eyePoint sightPoint: sightPoint upVector: upVector viewFactor: viewFactor zoomHeight: zoomHeight in: displayRectangle [
	^ self asJunOpenGL3dObject
		showEyePoint: eyePoint
		sightPoint: sightPoint
		upVector: upVector
		viewFactor: viewFactor
		zoomHeight: zoomHeight
		in: displayRectangle
]

{ #category : #viewing }
JunGeometry >> showIn: displayRectangle [
	"(1 , 1 , 1 cylinder: 1 height: 2) showIn: (200@200 extent: 400@400)."

	^ self asJunOpenGL3dObject showIn: displayRectangle
]

{ #category : #viewing }
JunGeometry >> showProjectionTable: aDictionary [
	"(1 , 1 , 1 cylinder: 1 height: 2) 
		showProjectionTable: (Dictionary new
			add: #presentation -> #solidPresentation;
			add: #sightPoint -> (0.0d , 0.0d , 0.0d);
			add: #eyePoint -> (8.9144349065121d , 5.018580708957d , 6.2726946335082d);
			add: #shading -> #flatShading;
			add: #upVector -> (-0.29701438733281d , -0.49387349075548d , 0.81723401106801d);
			add: #viewFactor -> 10;
			add: #zoomHeight -> 3.9191837441874d;
			yourself)."

	^ self asJunOpenGL3dObject showProjectionTable: aDictionary in: nil
]

{ #category : #viewing }
JunGeometry >> showProjectionTable: aDictionary in: aRectangle [
	"(1 , 1 , 1 cylinder: 1 height: 2) 
		showProjectionTable: (Dictionary new
			add: #presentation -> #solidPresentation;
			add: #sightPoint -> (0.0d , 0.0d , 0.0d);
			add: #eyePoint -> (8.9144349065121d , 5.018580708957d , 6.2726946335082d);
			add: #shading -> #flatShading;
			add: #upVector -> (-0.29701438733281d , -0.49387349075548d , 0.81723401106801d);
			add: #viewFactor -> 10;
			add: #zoomHeight -> 3.9191837441874d;
			yourself) 
		in: (200 @ 200 extent: 400 @ 200)."

	^ self asJunOpenGL3dObject showProjectionTable: aDictionary in: aRectangle
]

{ #category : #viewing }
JunGeometry >> showWithArrows [
	"(0 , 0 box: 1 , 1) showWithArrows."

	"(0 , 0 , 0 box: 1 , 1 , 1) showWithArrows."

	^ self notYetImplemented  "| arrowObject |
	self is2d
		ifTrue: [ arrowObject := JunOpenGL3dObject xyArrows ]
		ifFalse: [ arrowObject := JunOpenGL3dObject xyzArrows ].
	^ (self asJunOpenGL3dObject asCompoundObject
		add: arrowObject;
		yourself) show"
]

{ #category : #viewing }
JunGeometry >> showWithAxes [
	"(1 , 1 , 1 cylinder: 1 height: 2) showWithAxes."

	^ self asJunOpenGL3dObject showWithAxes
]

{ #category : #viewing }
JunGeometry >> showWithTranslatedAxes [
	"(1 , 1 , 1 cylinder: 1 height: 2) showWithTranslatedAxes."

	^ self asJunOpenGL3dObject showWithTranslatedAxes
]

{ #category : #viewing }
JunGeometry >> showWithUnitArrows [
	"(0 , 0 box: 1 , 1) showWithUnitArrows."

	"(0 , 0 , 0 box: 1 , 1 , 1) showWithUnitArrows."

	^ self notYetImplemented "| arrowObject |
	self is2d
		ifTrue: [ arrowObject := JunOpenGL3dObject xyUnitArrows ]
		ifFalse: [ arrowObject := JunOpenGL3dObject xyzUnitArrows ].
	^ (self asJunOpenGL3dObject asCompoundObject
		add: arrowObject;
		yourself) show"
]

{ #category : #viewing }
JunGeometry >> showWithUnitAxes [
	"(1 , 1 , 1 cylinder: 1 height: 2) showWithUnitAxes."

	^ self asJunOpenGL3dObject showWithUnitAxes
]

{ #category : #'class access' }
JunGeometry >> sphereClass [
	^ JunSphereSurface
]

{ #category : #printing }
JunGeometry >> storeOn: aStream [ 
	
	[| aString |
	aString := self toLispList saveString.
	aStream nextPutAll: '('.
	aStream nextPutAll: self class printString.
	aStream nextPutAll: ' fromString: '.
	aString storeOn: aStream.
	aStream nextPutAll: ')'] 
			on: Error
			do: [:exception | super storeOn: aStream]
]

{ #category : #transforming }
JunGeometry >> transform: aTransformation [
	^ self subclassResponsibility
]

{ #category : #'class access' }
JunGeometry >> transformationClass [
	self is3d
		ifTrue: [ ^ Jun3dTransformation ].
	self is2d
		ifTrue: [ ^ Jun2dTransformation ].
	^ self subclassResponsibility
]

{ #category : #transforming }
JunGeometry >> translatedBy: aPoint [
	^ self transform: (self transformationClass translate: aPoint)
]

{ #category : #'class access' }
JunGeometry >> triangleClass [
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dTriangle].
	self is2d ifTrue: [^Jun2dTriangle].
	^self subclassResponsibility"
]

{ #category : #'class access' }
JunGeometry >> trianglesClass [
	^ self notYetImplemented "self is3d ifTrue: [^Jun3dTriangles].
	self is2d ifTrue: [^Jun2dTriangles].
	^self subclassResponsibility"
]

{ #category : #accessing }
JunGeometry >> volume [
	^ 0
]
