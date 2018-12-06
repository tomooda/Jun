converting
asLocalGeometryIn: aJunCoordinateSystem
	| localGeometry |
	localGeometry := aJunCoordinateSystem interprete: self.
	^self class localGeometryClass geometry: localGeometry coordinateSystem: aJunCoordinateSystem