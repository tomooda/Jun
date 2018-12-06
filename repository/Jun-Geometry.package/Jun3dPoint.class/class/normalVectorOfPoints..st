instance creation
normalVectorOfPoints: anArrayOfPoints
	| size oneThirds point1 point2 point3 vector1 vector2 |
	(size := anArrayOfPoints size) < 3
		ifTrue: [ ^ nil ].
	oneThirds := (size / 3) asInteger.
	point1 := anArrayOfPoints at: 1.
	point2 := anArrayOfPoints at: 1 + oneThirds.
	point3 := anArrayOfPoints at: 1 + (oneThirds * 2).
	vector1 := self x: point2 x - point1 x y: point2 y - point1 y z: point2 z - point1 z.
	vector2 := self x: point3 x - point2 x y: point3 y - point2 y z: point3 z - point2 z.
	^ vector1 product: vector2