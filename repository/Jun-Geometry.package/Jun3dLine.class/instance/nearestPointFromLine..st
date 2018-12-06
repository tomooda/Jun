functions
nearestPointFromLine: aJun3dLine 
	^ self notYetImplemented "| commonNormalVector plane theLineOnPlane f1 g1 x1 y1 t |
	commonNormalVector := f , g , h 
				vectorProduct: aJun3dLine f , aJun3dLine g , aJun3dLine h.
	commonNormalVector length < self class accuracy ifTrue: [^nil].
	plane := JunPlane on: self from normalVector: commonNormalVector.
	theLineOnPlane := plane projectionOfLine: aJun3dLine.
	f1 := theLineOnPlane f.
	g1 := theLineOnPlane g.
	x1 := theLineOnPlane x0.
	y1 := theLineOnPlane y0.
	t := ((x0 - x1) * g1 + ((y1 - y0) * f1)) / (f1 * g - (f * g1)).
	^self atT: t"