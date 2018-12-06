accessing
normalVectors
	^ normalVectors
		ifNil: [ normalVector := Array new: points size withAll: (Jun3dPoint normalUnitVectorOfPoints: points) ]