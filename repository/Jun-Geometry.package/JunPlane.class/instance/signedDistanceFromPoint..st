functions
signedDistanceFromPoint: aJun3dPoint
	| pointOnPlane |
	pointOnPlane := self nearestPointFromPoint: aJun3dPoint.
	^ self normalUnitVector dotProduct: pointOnPlane - aJun3dPoint