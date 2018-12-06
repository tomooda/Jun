accessing
asParallelProjection
	| height |
	height := self regularHeight.
	^ self class
		parallelProjectionEyePoint: self eyePoint
		sightPoint: self sightPoint
		upVector: self upVector
		height: height
		near: self near
		far: self far