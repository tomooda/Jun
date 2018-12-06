typical objects - spheres
xyPointsAndSphere: degrees radius: radius longitude: longitude latitude: latitude
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
	x _, y _, z ].
	xyBlock := [ :phi :theta | phi / theLongitude _, (theta / theLatitude) ].
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
				ifFalse: [ 
					pointCollection add: currentPoint.
					xyCollection add: (xyBlock value: phi value: theta + theDegrees) ].
			previousPoint := currentPoint.
			currentPoint := xyzBlock value: theRadius value: phi + theDegrees value: theta + theDegrees.
			currentPoint = previousPoint
				ifFalse: [ 
					pointCollection add: currentPoint.
					xyCollection add: (xyBlock value: phi + theDegrees value: theta + theDegrees) ].
			previousPoint := currentPoint.
			currentPoint := xyzBlock value: theRadius value: phi + theDegrees value: theta.
			(currentPoint = previousPoint or: [ currentPoint = firstPoint ])
				ifFalse: [ 
					pointCollection add: currentPoint.
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