instance creation
vertexes: anArrayOfPoints
	| size oneThirds point1 point2 point3 |
	(size := anArrayOfPoints size) < 3
		ifTrue: [ ^ nil ].
	oneThirds := (size / 3) asInteger.
	point1 := anArrayOfPoints at: 1.
	point2 := anArrayOfPoints at: 1 + oneThirds.
	point3 := anArrayOfPoints at: 1 + (oneThirds * 2).
	^ self on: point1 on: point2 on: point3