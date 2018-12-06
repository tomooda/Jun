accessing
normalVector: aJun3dPoint
	points
		ifNotNil: [ normalVectors := Array new: points size withAll: aJun3dPoint ]
		ifNil: [ normalVectors := Array with: aJun3dPoint ]